#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: p0-prepare.sh <round> [case_selector]

Examples:
  p0-prepare.sh 10
  p0-prepare.sh round-10 kimmtrak
  p0-prepare.sh 10 BLA761228
USAGE
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
  usage
  exit 2
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
TRAINING_DIR="${ROOT_DIR}/training/protocol-design"
CASE_CONFIG="${TRAINING_DIR}/case-config.json"
QUESTIONS_DIR="${TRAINING_DIR}/questions"
ROUNDS_DIR="${TRAINING_DIR}/rounds"
SOP_DIR="${ROOT_DIR}/sop"
SHARED_ROOT=$(cd "${ROOT_DIR}/.." && pwd)

round_input="$1"
case_selector="${2:-}"

normalize_round() {
  local raw="$1"
  raw="${raw#round-}"
  raw="${raw#round/}"
  printf '%02d' "$((10#${raw}))"
}

frontmatter_value() {
  local file="$1"
  local key="$2"
  awk -v key="$key" '
    BEGIN { in_fm = 0 }
    /^---$/ {
      if (!in_fm) { in_fm = 1; next }
      exit
    }
    in_fm && $0 ~ ("^" key ":") {
      sub("^" key ":[[:space:]]*", "")
      print
      exit
    }
  ' "$file"
}

json_array() {
  jq -n --arg value "$1" '[ $value ]'
}

write_report() {
  local status="$1"
  local docsearch_hit="$2"
  local fallback_used="$3"
  local errors_json="$4"
  local warnings_json="$5"
  jq -n \
    --arg status "$status" \
    --arg case_id "${CASE_ID:-unknown}" \
    --arg round "${ROUND_NAME:-unknown}" \
    --argjson docsearch_hit "$docsearch_hit" \
    --argjson fallback_used "$fallback_used" \
    --argjson errors "$errors_json" \
    --argjson warnings "$warnings_json" \
    '{status:$status, case_id:$case_id, round:$round, docsearch_hit:$docsearch_hit, fallback_used:$fallback_used, errors:$errors, warnings:$warnings}' \
    > "${PREPARE_REPORT}"
}

ROUND_ID=$(normalize_round "$round_input")
ROUND_NAME="round-${ROUND_ID}"
ROUND_DIR="${ROUNDS_DIR}/${ROUND_NAME}"
WORKSPACE_DIR="${ROUND_DIR}/workspace"
PREPARE_REPORT="${WORKSPACE_DIR}/prepare-report.json"
mkdir -p "$WORKSPACE_DIR"

if [[ ! -f "$CASE_CONFIG" ]]; then
  echo "Missing case config: $CASE_CONFIG" >&2
  exit 1
fi

jq_filter='.[] | select(.id == $round or .id == $selector or ((.drug // "") | ascii_downcase) == ($selector | ascii_downcase) or ((.generic // "") | ascii_downcase) == ($selector | ascii_downcase) or (((.path // "") | ascii_downcase) | contains(($selector | ascii_downcase)))) | .'
selector_for_jq="${case_selector:-$ROUND_ID}"
case_json=$(jq -c --arg round "$ROUND_ID" --arg selector "$selector_for_jq" "$jq_filter" "$CASE_CONFIG" | head -n 1)

if [[ -z "$case_json" ]]; then
  err=$(json_array "CASE_NOT_FOUND")
  warn='[]'
  write_report "blocked" false false "$err" "$warn"
  echo "No case matched round=${ROUND_ID} selector=${selector_for_jq}" >&2
  exit 1
fi

CASE_ID=$(jq -r '.drug | ascii_downcase' <<<"$case_json")
DRUG_NAME=$(jq -r '.drug' <<<"$case_json")
GENERIC_NAME=$(jq -r '.generic // ""' <<<"$case_json")
CASE_PATH=$(jq -r '.path' <<<"$case_json")
DOMAIN=$(jq -r '.domain // empty' <<<"$case_json")
INDICATION=$(jq -r '.indication // empty' <<<"$case_json")
REGULATORY=$(jq -r '.regulatory // empty' <<<"$case_json")
DATA_QUALITY=$(jq -r '.data_quality // empty' <<<"$case_json")

question_file=$(find "$QUESTIONS_DIR" -maxdepth 1 -type f -name "${ROUND_ID}-*.md" | head -n 1)
if [[ -z "$question_file" ]]; then
  err=$(json_array "QUESTION_NOT_FOUND")
  warn='[]'
  write_report "blocked" false false "$err" "$warn"
  echo "Question file not found for round ${ROUND_ID}" >&2
  exit 1
fi

QUESTION_COPY="${WORKSPACE_DIR}/question.md"
cp "$question_file" "$QUESTION_COPY"

APP_NUMBER=$(frontmatter_value "$question_file" app_number || true)
ANSWER_SOURCE=$(frontmatter_value "$question_file" answer_source || true)
REGULATORY_PATHWAY=$(frontmatter_value "$question_file" regulatory_pathway || true)

resolve_answer_source() {
  local raw="$1"
  local candidate=""
  local dir
  local base
  if [[ -z "$raw" ]]; then
    return 1
  fi
  if [[ -f "${SHARED_ROOT}/${raw}" ]]; then
    candidate="${SHARED_ROOT}/${raw}"
  elif [[ -f "${ROOT_DIR}/${raw}" ]]; then
    candidate="${ROOT_DIR}/${raw}"
  elif [[ -f "$raw" ]]; then
    candidate="$raw"
  else
    return 1
  fi
  dir=$(cd "$(dirname "$candidate")" && pwd)
  base=$(basename "$candidate")
  printf '%s/%s\n' "$dir" "$base"
}

FDA_SOURCE_PATH=""
if ! FDA_SOURCE_PATH=$(resolve_answer_source "$ANSWER_SOURCE"); then
  fallback_guess="${SHARED_ROOT}/shared/data/fda-reviews/md/${CASE_PATH}/MultidisciplineR.md"
  if [[ -f "$fallback_guess" ]]; then
    FDA_SOURCE_PATH="$fallback_guess"
  fi
fi

if [[ -z "$FDA_SOURCE_PATH" || ! -f "$FDA_SOURCE_PATH" ]]; then
  err=$(json_array "FDA_REVIEW_NOT_FOUND")
  warn='[]'
  write_report "blocked" false false "$err" "$warn"
  echo "FDA review markdown not found for ${DRUG_NAME}" >&2
  exit 1
fi

SOP_PATHS_FILE="${WORKSPACE_DIR}/sop-paths.txt"
: > "$SOP_PATHS_FILE"

echo "${SOP_DIR}/core/protocol-design.md" >> "$SOP_PATHS_FILE"
[[ -n "$DOMAIN" && -f "${SOP_DIR}/domains/${DOMAIN}.md" ]] && echo "${SOP_DIR}/domains/${DOMAIN}.md" >> "$SOP_PATHS_FILE"
[[ -n "$INDICATION" && -f "${SOP_DIR}/indications/${INDICATION}.md" ]] && echo "${SOP_DIR}/indications/${INDICATION}.md" >> "$SOP_PATHS_FILE"
[[ -n "$REGULATORY" && -f "${SOP_DIR}/regulatory/${REGULATORY}.md" ]] && echo "${SOP_DIR}/regulatory/${REGULATORY}.md" >> "$SOP_PATHS_FILE"

CASE_META_FILE="${WORKSPACE_DIR}/case-meta.json"
jq -n \
  --arg round "$ROUND_NAME" \
  --arg case_id "$CASE_ID" \
  --arg drug_name "$DRUG_NAME" \
  --arg generic_name "$GENERIC_NAME" \
  --arg pathway "protocol-design" \
  --arg nda_bla_id "${APP_NUMBER:-N/A}" \
  --arg regulatory_pathway "${REGULATORY_PATHWAY:-N/A}" \
  --arg fda_review_path "$FDA_SOURCE_PATH" \
  --arg question_path "$question_file" \
  --arg domain "${DOMAIN:-}" \
  --arg indication "${INDICATION:-}" \
  --arg regulatory "${REGULATORY:-}" \
  --arg data_quality "${DATA_QUALITY:-}" \
  '{round:$round, case_id:$case_id, drug_name:$drug_name, generic_name:$generic_name, pathway:$pathway, nda_bla_id:$nda_bla_id, regulatory_pathway:$regulatory_pathway, fda_review_path:$fda_review_path, question_path:$question_path, domain:$domain, indication:$indication, regulatory:$regulatory, data_quality:$data_quality}' \
  > "$CASE_META_FILE"

FDA_RAW_FILE="${WORKSPACE_DIR}/fda-raw-sections.md"
TMP_SECTIONS=$(mktemp)
trap 'rm -f "$TMP_SECTIONS"' EXIT

DOCSEARCH="python3 ${SHARED_ROOT}/shared/docsearch/docsearch.py"

docsearch_hit=false
fallback_used=false
if $DOCSEARCH info >/dev/null 2>&1 && [[ -n "$APP_NUMBER" ]]; then
  queries=(
    "trial design"
    "control arm"
    "sample size"
    "efficacy endpoints"
    "inclusion exclusion"
    "statistical analysis"
  )
  for query in "${queries[@]}"; do
    if output=$($DOCSEARCH section "$APP_NUMBER" "$query" --context full -f text 2>/dev/null) && [[ -n "${output// }" ]]; then
      {
        printf '## Section: %s\n' "$query"
        printf '%s\n\n' "$output"
      } >> "$TMP_SECTIONS"
    fi
  done
  if [[ -s "$TMP_SECTIONS" ]]; then
    docsearch_hit=true
  fi
fi

if [[ "$docsearch_hit" == false ]]; then
  fallback_used=true
  {
    printf '## Section: full-review-fallback\n'
    cat "$FDA_SOURCE_PATH"
    printf '\n'
  } > "$TMP_SECTIONS"
fi

cat > "$FDA_RAW_FILE" <<EOF2
# FDA Raw Sections: ${CASE_ID}

## Source
- nda_bla_id: ${APP_NUMBER:-N/A}
- retrieval_mode: $( [[ "$docsearch_hit" == true ]] && printf 'docsearch' || printf 'fallback-read' )
- source_path: ${FDA_SOURCE_PATH}

EOF2
cat "$TMP_SECTIONS" >> "$FDA_RAW_FILE"

warnings='[]'
if [[ "$fallback_used" == true ]]; then
  warnings=$(jq -n '["DOCSEARCH_FALLBACK_USED"]')
fi
write_report "ok" "$docsearch_hit" "$fallback_used" '[]' "$warnings"

echo "Prepared ${ROUND_NAME} for ${DRUG_NAME}" >&2
