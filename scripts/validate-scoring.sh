#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage: validate-scoring.sh <round> [scoring_file]

Examples:
  validate-scoring.sh 10
  validate-scoring.sh round-10 /abs/path/scoring.md
USAGE
}

if [[ $# -lt 1 || $# -gt 2 ]]; then
  usage
  exit 2
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
ROUNDS_DIR="${ROOT_DIR}/training/protocol-design/rounds"

normalize_round() {
  local raw="$1"
  raw="${raw#round-}"
  raw="${raw#round/}"
  printf '%02d' "$((10#${raw}))"
}

ROUND_ID=$(normalize_round "$1")
ROUND_NAME="round-${ROUND_ID}"
ROUND_DIR="${ROUNDS_DIR}/${ROUND_NAME}"
SCORING_FILE="${2:-${ROUND_DIR}/scoring.md}"

if [[ ! -f "$SCORING_FILE" ]]; then
  jq -n \
    --arg status failed \
    --arg round "$ROUND_NAME" \
    --arg file "$SCORING_FILE" \
    --argjson errors '["SCORING_FILE_NOT_FOUND"]' \
    '{status:$status, round:$round, file:$file, errors:$errors}'
  exit 1
fi

python3 - "$ROUND_NAME" "$SCORING_FILE" <<'PY'
import json
import math
import re
import sys
from pathlib import Path

round_name = sys.argv[1]
scoring_path = Path(sys.argv[2])
text = scoring_path.read_text()

expected_dims = [
    "design_type",
    "control_arm",
    "primary_endpoint",
    "endpoint_definition",
    "secondary_endpoints",
    "sample_size",
    "stat_framework",
    "stratification",
    "eligibility",
    "operational",
]
allowed_scores = {"match", "partial", "miss", "SKIP"}
allowed_resolution = {"majority", "strict-tiebreak"}
errors = []
warnings = []
per_dimension = []

pattern = re.compile(
    r"^###\s+\d+\.\s+([a-z_]+)\n"
    r"-\s+final_score:\s+([^\n]+)\n"
    r"-\s+votes:\s+([^\n]+)\n"
    r"-\s+resolution:\s+([^\n]+)",
    re.MULTILINE,
)
for match in pattern.finditer(text):
    dim, final_score, votes, resolution = match.groups()
    per_dimension.append(
        {
            "dimension": dim.strip(),
            "final_score": final_score.strip(),
            "votes": [v.strip() for v in votes.split(",") if v.strip()],
            "resolution": resolution.strip(),
        }
    )

if len(per_dimension) != 10:
    errors.append(f"DIMENSION_COUNT_INVALID:{len(per_dimension)}")

seen_dims = [item["dimension"] for item in per_dimension]
if seen_dims != expected_dims:
    errors.append("DIMENSION_ORDER_OR_NAMES_INVALID")

for item in per_dimension:
    if item["final_score"] not in allowed_scores:
        errors.append(f"INVALID_FINAL_SCORE:{item['dimension']}:{item['final_score']}")
    if item["resolution"] not in allowed_resolution:
        errors.append(f"INVALID_RESOLUTION:{item['dimension']}:{item['resolution']}")
    if not item["votes"]:
        errors.append(f"MISSING_VOTES:{item['dimension']}")
    for vote in item["votes"]:
        if vote not in allowed_scores:
            errors.append(f"INVALID_VOTE:{item['dimension']}:{vote}")


def extract_int(label: str):
    m = re.search(rf"^-\s+{label}:\s+(\d+)\s*$", text, re.MULTILINE)
    return int(m.group(1)) if m else None


def extract_float(label: str):
    m = re.search(rf"^-\s+{label}:\s+([0-9]+(?:\.[0-9]+)?)\s*$", text, re.MULTILINE)
    return float(m.group(1)) if m else None

match_count = extract_int("match_count")
partial_count = extract_int("partial_count")
miss_count = extract_int("miss_count")
skip_count = extract_int("skip_count")
total_items = extract_int("total_items")
match_score = extract_float("match_score")
weighted_score = extract_float("weighted_score")

for key, value in {
    "match_count": match_count,
    "partial_count": partial_count,
    "miss_count": miss_count,
    "skip_count": skip_count,
    "total_items": total_items,
    "match_score": match_score,
    "weighted_score": weighted_score,
}.items():
    if value is None:
        errors.append(f"MISSING_TOTAL_FIELD:{key}")

if not errors:
    calculated = {
        "match_count": sum(1 for item in per_dimension if item["final_score"] == "match"),
        "partial_count": sum(1 for item in per_dimension if item["final_score"] == "partial"),
        "miss_count": sum(1 for item in per_dimension if item["final_score"] == "miss"),
        "skip_count": sum(1 for item in per_dimension if item["final_score"] == "SKIP"),
    }
    calculated["total_items"] = 10 - calculated["skip_count"]
    if calculated["total_items"] <= 0:
        errors.append("TOTAL_ITEMS_NON_POSITIVE")
    else:
        calculated["match_score"] = round(calculated["match_count"] / calculated["total_items"], 2)
        calculated["weighted_score"] = round(
            (calculated["match_count"] + 0.5 * calculated["partial_count"]) / calculated["total_items"], 2
        )

        for key in ("match_count", "partial_count", "miss_count", "skip_count", "total_items"):
            if calculated[key] != locals()[key]:
                errors.append(f"COUNT_MISMATCH:{key}:expected={calculated[key]}:found={locals()[key]}")

        if not math.isclose(calculated["match_score"], match_score, abs_tol=0.001):
            errors.append(
                f"SCORE_MISMATCH:match_score:expected={calculated['match_score']:.2f}:found={match_score:.2f}"
            )
        if not math.isclose(calculated["weighted_score"], weighted_score, abs_tol=0.001):
            errors.append(
                f"SCORE_MISMATCH:weighted_score:expected={calculated['weighted_score']:.2f}:found={weighted_score:.2f}"
            )

        if match_score == 1.0:
            warnings.append("MATCH_SCORE_IS_1.0_REVIEW_FOR_LEAKAGE")
        if match_score < 0.2:
            warnings.append("MATCH_SCORE_LT_0.2_VERIFY_ANSWER_SOURCE")

status = "ok" if not errors else "failed"
result = {
    "status": status,
    "round": round_name,
    "file": str(scoring_path),
    "per_dimension_count": len(per_dimension),
    "errors": errors,
    "warnings": warnings,
}
if not errors:
    result["counts"] = {
        "match_count": match_count,
        "partial_count": partial_count,
        "miss_count": miss_count,
        "skip_count": skip_count,
        "total_items": total_items,
    }
    result["scores"] = {
        "match_score": round(match_score, 2),
        "weighted_score": round(weighted_score, 2),
    }

print(json.dumps(result, ensure_ascii=False, indent=2))
sys.exit(0 if not errors else 1)
PY
