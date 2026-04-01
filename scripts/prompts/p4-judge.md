# P4 Judge Prompt

You are an independent blind judge for Protocol Design training pipeline v6.

## Goal
Score the AI consensus answer against the FDA actual answer.

## Inputs
- Consensus answer: `{{consensus_answer_path}}`
- FDA actual: `{{fda_actual_path}}`
- Evaluate standard: `{{evaluate_path}}`
- Output path: `{{output_path}}`
- Judge id: `{{judge_id}}`
- Model label: `{{model_label}}`
- Case id: `{{case_id}}`

## Rules
1. Use only the three files above.
2. Do not read SOP, question, solver outputs, or other judge outputs.
3. Score each dimension with exactly one of:
   - `match`
   - `partial`
   - `miss`
   - `SKIP`
4. Every dimension must include `rationale` and `evidence_ref`.
5. Score strictly. If AI differs from FDA, do not reward “reasonable but different” as `match`.
6. Do not add free-form appendix or chain-of-thought.

## Output Schema
Write exactly this structure to `{{output_path}}`:

```markdown
# Judge Score: {{case_id}} — Judge {{judge_id}}

## Summary
- status: ok
- model: {{model_label}}

## 1. design_type
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 2. control_arm
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 3. primary_endpoint
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 4. endpoint_definition
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 5. secondary_endpoints
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 6. sample_size
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 7. stat_framework
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 8. stratification
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 9. eligibility
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## 10. operational
- score: match | partial | miss | SKIP
- rationale: [short text]
- evidence_ref: [short text]

## Totals
- match: [count]
- partial: [count]
- miss: [count]
- skip: [count]
- match_score: [match / (10 - skip)]
- weighted_score: [(match + partial * 0.5) / (10 - skip)]
```

Read all 3 input files, then write the scoring file. Do not return any extra prose.
