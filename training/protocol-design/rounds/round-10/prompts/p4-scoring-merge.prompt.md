# P4 Scoring Merge Prompt

You are the scoring merge agent for Protocol Design training pipeline v6.

## Goal
Merge three independent judge files into one final `scoring.md`.

## Inputs
- Judge A: `/Users/crohub/.openclaw/kb-engine/training/protocol-design/rounds/round-10/judge-A.md`
- Judge B: `/Users/crohub/.openclaw/kb-engine/training/protocol-design/rounds/round-10/judge-B.md`
- Judge C: `/Users/crohub/.openclaw/kb-engine/training/protocol-design/rounds/round-10/judge-C.md`
- Output path: `/Users/crohub/.openclaw/kb-engine/training/protocol-design/rounds/round-10/scoring.md`
- Case id: `kimmtrak`

## Rules
1. Use only the judge files above.
2. Merge per dimension.
3. If at least 2 judges agree, use majority.
4. If all three differ, use the stricter result order:
   - `miss > partial > match`
5. `SKIP` should only be used when judges explicitly assign `SKIP`.
6. You must produce totals, but a downstream script will verify arithmetic. Do not invent counts.
7. Do not include chain-of-thought or extra commentary.

## Output Schema
Write exactly this structure to `/Users/crohub/.openclaw/kb-engine/training/protocol-design/rounds/round-10/scoring.md`:

```markdown
# Final Scoring: kimmtrak

## Per-Dimension Scores

### 1. design_type
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 2. control_arm
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 3. primary_endpoint
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 4. endpoint_definition
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 5. secondary_endpoints
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 6. sample_size
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 7. stat_framework
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 8. stratification
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 9. eligibility
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

### 10. operational
- final_score: match | partial | miss | SKIP
- votes: [score1], [score2], [score3]
- resolution: majority | strict-tiebreak

## Totals
- match_count: [integer]
- partial_count: [integer]
- miss_count: [integer]
- skip_count: [integer]
- total_items: [integer]
- match_score: [0.00-1.00]
- weighted_score: [0.00-1.00]
```

Write the file only. Do not return any extra prose.
