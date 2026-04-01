#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<'USAGE'
Usage:
  run-v6-round.sh prepare <round> [case_selector]
  run-v6-round.sh finalize <round>
  run-v6-round.sh status <round>
USAGE
}

if [[ $# -lt 2 ]]; then
  usage
  exit 2
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
TRAINING_DIR="${ROOT_DIR}/training/protocol-design"
ROUNDS_DIR="${TRAINING_DIR}/rounds"
P0_SCRIPT="${SCRIPT_DIR}/p0-prepare.sh"
P6_SCRIPT="${SCRIPT_DIR}/p6-finalize.sh"
PROMPTS_DIR="${SCRIPT_DIR}/prompts"

normalize_round() {
  local raw="$1"
  raw="${raw#round-}"
  raw="${raw#round/}"
  printf '%02d' "$((10#${raw}))"
}

render_template() {
  local template_path="$1"
  local output_path="$2"
  python3 - "$template_path" "$output_path" <<'PY'
import json
import re
import sys
from pathlib import Path

template = Path(sys.argv[1]).read_text()
output = Path(sys.argv[2])
context = json.loads(Path(output.parent / 'render-context.json').read_text())

def replace(match):
    key = match.group(1)
    return str(context.get(key, ""))

rendered = re.sub(r"\{\{\s*([a-zA-Z0-9_]+)\s*\}\}", replace, template)
output.write_text(rendered)
PY
}

command="$1"
round_input="$2"
case_selector="${3:-}"
ROUND_ID=$(normalize_round "$round_input")
ROUND_NAME="round-${ROUND_ID}"
ROUND_DIR="${ROUNDS_DIR}/${ROUND_NAME}"
WORKSPACE_DIR="${ROUND_DIR}/workspace"
PROMPT_RENDER_DIR="${ROUND_DIR}/prompts"
MANIFEST_FILE="${ROUND_DIR}/run-manifest.json"
CASE_META_FILE="${WORKSPACE_DIR}/case-meta.json"
CONTEXT_FILE="${PROMPT_RENDER_DIR}/render-context.json"

case "$command" in
  prepare)
    "$P0_SCRIPT" "$ROUND_ID" "$case_selector"
    mkdir -p "$PROMPT_RENDER_DIR"
    python3 - "$CASE_META_FILE" "$ROUND_DIR" "$PROMPTS_DIR" "$CONTEXT_FILE" <<'PY'
import json
import sys
from pathlib import Path

case_meta = json.loads(Path(sys.argv[1]).read_text())
round_dir = Path(sys.argv[2])
prompts_dir = Path(sys.argv[3])
context_file = Path(sys.argv[4])
workspace = round_dir / 'workspace'

context = {
    'case_id': case_meta.get('case_id', ''),
    'sop_core_path': str(Path(workspace / 'sop-paths.txt').read_text().splitlines()[0]),
    'sop_domain_path': '',
    'sop_indication_path': '',
    'solver_a_path': str(round_dir / 'solver-A.md'),
    'solver_b_path': str(round_dir / 'solver-B.md'),
    'solver_c_path': str(round_dir / 'solver-C.md'),
    'fda_raw_sections_path': str(workspace / 'fda-raw-sections.md'),
    'consensus_answer_path': str(round_dir / 'consensus-answer.md'),
    'fda_actual_path': str(round_dir / 'fda-actual.md'),
    'evaluate_path': str(Path(sys.argv[1]).parents[3] / 'evaluate.md'),
    'judge_a_path': str(round_dir / 'judge-A.md'),
    'judge_b_path': str(round_dir / 'judge-B.md'),
    'judge_c_path': str(round_dir / 'judge-C.md'),
    'scoring_path': str(round_dir / 'scoring.md'),
    'analysis_output_path': str(round_dir / 'analysis.md'),
    'grounding_output_path': str(round_dir / 'grounding.md'),
    'sop_patch_output_path': str(round_dir / 'sop-patch.md'),
    'review_output_path': str(round_dir / 'review.md'),
    'output_path': '',
    'judge_id': '',
    'model_label': '',
    'grounding_inputs': '',
}

sop_paths = [line.strip() for line in (workspace / 'sop-paths.txt').read_text().splitlines() if line.strip()]
if len(sop_paths) > 1:
    context['sop_domain_path'] = sop_paths[1]
if len(sop_paths) > 2:
    context['sop_indication_path'] = sop_paths[2]

context_file.write_text(json.dumps(context, ensure_ascii=False, indent=2))
PY


    tmp_ctx=$(mktemp)
    for pair in \
      "p2-consensus.md p2-consensus.prompt.md consensus_answer_path" \
      "p3-fda-format.md p3-fda-format.prompt.md fda_actual_path" \
      "p4-scoring-merge.md p4-scoring-merge.prompt.md scoring_path" \
      "p5-analysis.md p5-analysis.prompt.md analysis_output_path"; do
      set -- $pair
      template_name="$1"
      output_name="$2"
      output_key="$3"
      jq --arg out "$(jq -r --arg key "$output_key" '.[$key]' "$CONTEXT_FILE")" '.output_path = $out' "$CONTEXT_FILE" > "$tmp_ctx"
      mv "$tmp_ctx" "$CONTEXT_FILE"
      render_template "$PROMPTS_DIR/$template_name" "$PROMPT_RENDER_DIR/$output_name"
    done

    for judge in A B C; do
      case "$judge" in
        A) model_label="kimi" ;;
        B|C) model_label="minimax" ;;
      esac
      jq --arg out "${ROUND_DIR}/judge-${judge}.md" --arg jid "$judge" --arg model "$model_label" '.output_path = $out | .judge_id = $jid | .model_label = $model' "$CONTEXT_FILE" > "$tmp_ctx"
      mv "$tmp_ctx" "$CONTEXT_FILE"
      render_template "$PROMPTS_DIR/p4-judge.md" "$PROMPT_RENDER_DIR/p4-judge-${judge}.prompt.md"
    done
    rm -f "$tmp_ctx"

    jq -n \
      --arg round "$ROUND_NAME" \
      --arg round_dir "$ROUND_DIR" \
      --arg workspace_dir "$WORKSPACE_DIR" \
      --arg prepare_report "${WORKSPACE_DIR}/prepare-report.json" \
      --arg prompt_dir "$PROMPT_RENDER_DIR" \
      --arg consensus_prompt "$PROMPT_RENDER_DIR/p2-consensus.prompt.md" \
      --arg fda_prompt "$PROMPT_RENDER_DIR/p3-fda-format.prompt.md" \
      --arg judge_a_prompt "$PROMPT_RENDER_DIR/p4-judge-A.prompt.md" \
      --arg judge_b_prompt "$PROMPT_RENDER_DIR/p4-judge-B.prompt.md" \
      --arg judge_c_prompt "$PROMPT_RENDER_DIR/p4-judge-C.prompt.md" \
      --arg scoring_prompt "$PROMPT_RENDER_DIR/p4-scoring-merge.prompt.md" \
      --arg analysis_prompt "$PROMPT_RENDER_DIR/p5-analysis.prompt.md" \
      '{round:$round, round_dir:$round_dir, workspace_dir:$workspace_dir, prepare_report:$prepare_report, prompt_dir:$prompt_dir, prompts:{p2_consensus:$consensus_prompt,p3_fda_format:$fda_prompt,p4_judge_a:$judge_a_prompt,p4_judge_b:$judge_b_prompt,p4_judge_c:$judge_c_prompt,p4_scoring_merge:$scoring_prompt,p5_analysis:$analysis_prompt}}' \
      > "$MANIFEST_FILE"
    cat "$MANIFEST_FILE"
    ;;
  finalize)
    "$P6_SCRIPT" "$ROUND_ID"
    ;;
  status)
    jq -n \
      --arg round "$ROUND_NAME" \
      --argjson workspace_exists "$(test -d "$WORKSPACE_DIR" && echo true || echo false)" \
      --argjson has_consensus "$(test -f "${ROUND_DIR}/consensus-answer.md" && echo true || echo false)" \
      --argjson has_fda_actual "$(test -f "${ROUND_DIR}/fda-actual.md" && echo true || echo false)" \
      --argjson has_scoring "$(test -f "${ROUND_DIR}/scoring.md" && echo true || echo false)" \
      --argjson has_analysis "$(test -f "${ROUND_DIR}/analysis.md" && echo true || echo false)" \
      --argjson has_finalize_report "$(test -f "${ROUND_DIR}/finalize-report.json" && echo true || echo false)" \
      '{round:$round, workspace_exists:$workspace_exists, has_consensus:$has_consensus, has_fda_actual:$has_fda_actual, has_scoring:$has_scoring, has_analysis:$has_analysis, has_finalize_report:$has_finalize_report}'
    ;;
  *)
    usage
    exit 2
    ;;
esac
