#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: p6-finalize.sh <round>

Environment:
  P6_RESULTS_FILE   Override results.tsv path
  P6_ENABLE_GIT=1   Enable git/gh workflow (default: disabled)
  P6_TIMESTAMP      Override timestamp (default: current local time)
USAGE
}

if [[ $# -ne 1 ]]; then
  usage
  exit 2
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
TRAINING_DIR="${ROOT_DIR}/training/protocol-design"
ROUNDS_DIR="${TRAINING_DIR}/rounds"
RESULTS_FILE="${P6_RESULTS_FILE:-${TRAINING_DIR}/results.tsv}"
VALIDATE_SCORING="${SCRIPT_DIR}/validate-scoring.sh"
ENABLE_GIT="${P6_ENABLE_GIT:-0}"
TIMESTAMP="${P6_TIMESTAMP:-$(date '+%Y-%m-%d %H:%M:%S')}"

normalize_round() {
  local raw="$1"
  raw="${raw#round-}"
  raw="${raw#round/}"
  printf '%02d' "$((10#${raw}))"
}

ROUND_ID=$(normalize_round "$1")
ROUND_NAME="round-${ROUND_ID}"
ROUND_DIR="${ROUNDS_DIR}/${ROUND_NAME}"
WORKSPACE_DIR="${ROUND_DIR}/workspace"
CASE_META_FILE="${WORKSPACE_DIR}/case-meta.json"
SCORING_FILE="${ROUND_DIR}/scoring.md"
ANALYSIS_FILE="${ROUND_DIR}/analysis.md"
FINALIZE_REPORT="${ROUND_DIR}/finalize-report.json"

mkdir -p "$ROUND_DIR"

errors='[]'
warnings='[]'
status='ok'
git_completed=false
results_appended=false
convergence_signal='continue'

append_error() {
  local current="$1"
  local message="$2"
  jq -cn --argjson arr "$current" --arg msg "$message" '$arr + [$msg]'
}

if [[ ! -f "$CASE_META_FILE" ]]; then
  errors=$(append_error "$errors" "CASE_META_NOT_FOUND")
fi
if [[ ! -f "$SCORING_FILE" ]]; then
  errors=$(append_error "$errors" "SCORING_FILE_NOT_FOUND")
fi
if [[ ! -f "$ANALYSIS_FILE" ]]; then
  errors=$(append_error "$errors" "ANALYSIS_FILE_NOT_FOUND")
fi
if [[ ! -x "$VALIDATE_SCORING" ]]; then
  errors=$(append_error "$errors" "VALIDATE_SCORING_MISSING")
fi

if [[ "$errors" != '[]' ]]; then
  status='failed'
  jq -n \
    --arg status "$status" \
    --arg round "$ROUND_NAME" \
    --argjson results_appended "$results_appended" \
    --argjson git_completed "$git_completed" \
    --arg convergence_signal "$convergence_signal" \
    --argjson errors "$errors" \
    --argjson warnings "$warnings" \
    '{status:$status, round:$round, results_appended:$results_appended, git_completed:$git_completed, convergence_signal:$convergence_signal, errors:$errors, warnings:$warnings}' \
    > "$FINALIZE_REPORT"
  cat "$FINALIZE_REPORT"
  exit 1
fi

scoring_validation=$("$VALIDATE_SCORING" "$ROUND_ID" "$SCORING_FILE") || {
  errors=$(append_error "$errors" "SCORING_SCHEMA_ERROR")
  status='failed'
  jq -n \
    --arg status "$status" \
    --arg round "$ROUND_NAME" \
    --argjson results_appended "$results_appended" \
    --argjson git_completed "$git_completed" \
    --arg convergence_signal "$convergence_signal" \
    --argjson scoring_validation "$scoring_validation" \
    --argjson errors "$errors" \
    --argjson warnings "$warnings" \
    '{status:$status, round:$round, results_appended:$results_appended, git_completed:$git_completed, convergence_signal:$convergence_signal, scoring_validation:$scoring_validation, errors:$errors, warnings:$warnings}' \
    > "$FINALIZE_REPORT"
  cat "$FINALIZE_REPORT"
  exit 1
}

python_payload=$(python3 - "$CASE_META_FILE" "$ANALYSIS_FILE" "$RESULTS_FILE" "$ROUND_ID" "$TIMESTAMP" <<'PY'
import csv
import json
import re
import sys
from pathlib import Path

case_meta_path = Path(sys.argv[1])
analysis_path = Path(sys.argv[2])
results_path = Path(sys.argv[3])
round_id = str(int(sys.argv[4]))
timestamp = sys.argv[5]

case_meta = json.loads(case_meta_path.read_text())
analysis = analysis_path.read_text()

question_path = case_meta.get("question_path", "")
case_num = ""
m = re.search(r"/(\d+)-[^/]+\.md$", question_path)
if m:
    case_num = m.group(1)
else:
    case_num = round_id

regulatory = (case_meta.get("regulatory") or "").strip().lower()
reg_path = (case_meta.get("regulatory_pathway") or "").strip().lower()
pathway = "accelerated" if ("accelerated" in regulatory or "accelerated" in reg_path) else "regular"

new_rules = 0
m_new = re.search(r"^-\s+new_rules_proposed:\s+(\d+)\s*$", analysis, re.MULTILINE)
if m_new:
    new_rules = int(m_new.group(1))
else:
    new_rules = len(re.findall(r"^###\s+R-NEW-\d+", analysis, re.MULTILINE))
    if new_rules == 0:
        new_rules = len(re.findall(r"^###\s+Rule\s+\d+", analysis, re.MULTILINE))

notes = ""
m_notes = re.search(r"^-\s+notes:\s+(.+)\s*$", analysis, re.MULTILINE)
if m_notes:
    notes = m_notes.group(1).strip()

summary_codes = []
for code, count in re.findall(r"\|\s*(KNOW|REG|STAT|ALT|INFO)\s*\|\s*(\d+)\s*\|", analysis):
    count_i = int(count)
    if count_i > 0:
        summary_codes.append(f"{code}:{count_i}")
if not summary_codes:
    m_delta = re.search(r"^-\s+delta_codes:\s+(.+)\s*$", analysis, re.MULTILINE)
    if m_delta:
        raw = [part.strip() for part in m_delta.group(1).split(",") if part.strip()]
        for part in raw:
            summary_codes.append(part)
if not summary_codes:
    summary_codes.append("none")

delta_codes = ",".join(summary_codes)

sop_total = 0
sop_paths_file = case_meta_path.parent / "sop-paths.txt"
if sop_paths_file.exists():
    for line in sop_paths_file.read_text().splitlines():
        path = Path(line.strip())
        if not line.strip() or not path.exists():
            continue
        head = "\n".join(path.read_text().splitlines()[:8])
        m_rule = re.search(r"rule_count:\s*(\d+)", head, re.IGNORECASE)
        if not m_rule:
            m_rule = re.search(r"Rule Count[^0-9]*(\d+)", head, re.IGNORECASE)
        if m_rule:
            sop_total += int(m_rule.group(1))

rows = []
if results_path.exists():
    with results_path.open() as fh:
        for line in fh:
            if not line.strip() or line.startswith("#"):
                continue
            rows.append(line.rstrip("\n"))

recent_scores = []
recent_rules = []
for row in rows[-5:]:
    parts = row.split("\t")
    if parts[0] == "round":
        continue
    try:
        recent_scores.append(float(parts[5]))
        recent_rules.append(int(parts[12]))
    except Exception:
        pass

payload = {
    "round": round_id,
    "branch": "protocol-design",
    "case_id": case_num,
    "drug_name": case_meta.get("drug_name", ""),
    "pathway": pathway,
    "new_rules": new_rules,
    "sop_total": sop_total,
    "delta_codes": delta_codes,
    "notes": notes,
    "timestamp": timestamp,
    "recent_scores": recent_scores,
    "recent_rules": recent_rules,
}
print(json.dumps(payload, ensure_ascii=False))
PY
)

match_count=$(jq -r '.counts.match_count' <<<"$scoring_validation")
partial_count=$(jq -r '.counts.partial_count' <<<"$scoring_validation")
miss_count=$(jq -r '.counts.miss_count' <<<"$scoring_validation")
skip_count=$(jq -r '.counts.skip_count' <<<"$scoring_validation")
total_items=$(jq -r '.counts.total_items' <<<"$scoring_validation")
match_score=$(jq -r '.scores.match_score' <<<"$scoring_validation")
weighted_score=$(jq -r '.scores.weighted_score' <<<"$scoring_validation")

round_value=$(jq -r '.round' <<<"$python_payload")
branch=$(jq -r '.branch' <<<"$python_payload")
case_id=$(jq -r '.case_id' <<<"$python_payload")
drug_name=$(jq -r '.drug_name' <<<"$python_payload")
pathway=$(jq -r '.pathway' <<<"$python_payload")
new_rules=$(jq -r '.new_rules' <<<"$python_payload")
sop_total=$(jq -r '.sop_total' <<<"$python_payload")
delta_codes=$(jq -r '.delta_codes' <<<"$python_payload")
notes=$(jq -r '.notes' <<<"$python_payload")
recent_scores=$(jq -c '.recent_scores' <<<"$python_payload")
recent_rules=$(jq -c '.recent_rules' <<<"$python_payload")

if [[ ! -f "$RESULTS_FILE" ]]; then
  mkdir -p "$(dirname "$RESULTS_FILE")"
  cat > "$RESULTS_FILE" <<'EOF2'
round	branch	case_id	drug_name	pathway	match_score	weighted_score	match_count	partial_count	miss_count	skip_count	total_items	new_rules	sop_total	delta_codes	notes	timestamp
EOF2
fi

printf '%s\t%s\t%s\t%s\t%s\t%.2f\t%.2f\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
  "$round_value" "$branch" "$case_id" "$drug_name" "$pathway" "$match_score" "$weighted_score" \
  "$match_count" "$partial_count" "$miss_count" "$skip_count" "$total_items" "$new_rules" "$sop_total" \
  "$delta_codes" "$notes" "$TIMESTAMP" >> "$RESULTS_FILE"
results_appended=true

convergence_signal=$(python3 - "$recent_scores" "$recent_rules" "$match_score" "$new_rules" <<'PY'
import json
import sys
recent_scores = json.loads(sys.argv[1])
recent_rules = json.loads(sys.argv[2])
current_score = float(sys.argv[3])
current_rules = int(sys.argv[4])
all_scores = (recent_scores + [current_score])[-5:]
all_rules = (recent_rules + [current_rules])[-5:]
if len(all_scores) >= 3 and all(s >= 0.70 for s in all_scores[-3:]) and all(r <= 1 for r in all_rules[-3:]):
    print('converged')
elif len(all_rules) >= 5 and all(r == 0 for r in all_rules[-5:]):
    print('converged')
elif len(all_scores) >= 5 and all_scores[-1] < all_scores[-2] < all_scores[-3]:
    print('divergence-alert')
elif len(all_rules) >= 3 and all(r >= 4 for r in all_rules[-3:]):
    print('divergence-alert')
else:
    print('continue')
PY
)

if [[ "$ENABLE_GIT" == "1" ]]; then
  branch_name="train/pd-round-${ROUND_ID}"
  commit_msg="round-${ROUND_ID}: +${new_rules} rules, match ${match_score}"
  git -C "$ROOT_DIR" checkout -b "$branch_name"
  git -C "$ROOT_DIR" add training/protocol-design results.tsv sop docs scripts 2>/dev/null || git -C "$ROOT_DIR" add -A
  git -C "$ROOT_DIR" commit -m "$commit_msg"
  if command -v gh >/dev/null 2>&1; then
    gh -R "$ROOT_DIR" pr create --base main --title "$commit_msg" >/dev/null
  else
    warnings=$(append_error "$warnings" "GH_NOT_AVAILABLE_GIT_STEP_PARTIAL")
  fi
  git_completed=true
else
  warnings=$(append_error "$warnings" "GIT_STEP_SKIPPED")
fi

if [[ "$notes" == "" ]]; then
  warnings=$(append_error "$warnings" "ANALYSIS_NOTES_MISSING")
fi

jq -n \
  --arg status "$status" \
  --arg round "$ROUND_NAME" \
  --arg results_file "$RESULTS_FILE" \
  --arg convergence_signal "$convergence_signal" \
  --argjson results_appended "$results_appended" \
  --argjson git_completed "$git_completed" \
  --argjson scoring_validation "$scoring_validation" \
  --argjson errors "$errors" \
  --argjson warnings "$warnings" \
  --argjson row_payload "$python_payload" \
  '{status:$status, round:$round, results_file:$results_file, convergence_signal:$convergence_signal, results_appended:$results_appended, git_completed:$git_completed, scoring_validation:$scoring_validation, row_payload:$row_payload, errors:$errors, warnings:$warnings}' \
  > "$FINALIZE_REPORT"

cat "$FINALIZE_REPORT"
