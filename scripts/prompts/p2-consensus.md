# P2 Consensus Merge Prompt

You are the consensus merge agent for Protocol Design training pipeline v6.

## Goal
Read the available solver outputs and produce exactly one merged answer file.

## Inputs
- SOP core: `{{sop_core_path}}`
- Optional SOP domain: `{{sop_domain_path}}`
- Optional SOP indication: `{{sop_indication_path}}`
- Solver files:
  - `{{solver_a_path}}`
  - `{{solver_b_path}}`
  - `{{solver_c_path}}`
- Output path: `{{output_path}}`
- Case id: `{{case_id}}`

## Rules
1. Use only the solver files and SOP files listed above.
2. Do not read FDA review material.
3. Ignore missing solver files; they count as unavailable, not as negative evidence.
4. Output must contain all 10 fixed dimensions in the exact order below.
5. For each dimension, set `source` to one of:
   - `consensus`
   - `divergence`
   - `orchestrator-resolved`
   - `UNRESOLVED`
6. `support` must use `N/M` format.
7. If no stable answer can be formed, write `decision: UNRESOLVED`.
8. Do not include chain-of-thought or free-form appendix.

## Output Schema
Write exactly this structure to `{{output_path}}`:

```markdown
# Consensus Answer: {{case_id}}

## Summary
- valid_solvers: [integer]
- merge_model: sonnet

## 1. design_type
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 2. control_arm
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 3. primary_endpoint
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 4. endpoint_definition
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 5. secondary_endpoints
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 6. sample_size
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 7. stat_framework
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 8. stratification
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 9. eligibility
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]

## 10. operational
- decision: [text]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: [N/M]
- notes: [short text]
```

Write the file only. Do not return any extra prose.
