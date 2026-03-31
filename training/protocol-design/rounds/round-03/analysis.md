## Analysis: Vyloy [protocol-design] — Round 03

> match_score: 1.00 | weighted_score: 1.00 | new_rules: 0

## Difference Classification
No miss or partial items after majority vote. No SOP updates needed.

## Notable Observations

### 2-Trial Design (ALT, not scored)
FDA approved Vyloy based on TWO independent pivotal trials (SPOTLIGHT + GLOW). Solvers designed a single trial. Per SOP §8.1: "Oncology: single pivotal trial is now common." The 2-trial strategy was a Sponsor choice (possibly recommended by FDA), not a mandatory requirement. SOP correctly captures current oncology norm. This is an ALT-class difference — recorded but no SOP change.

### Solver Performance
- Both Solvers (kimi + minimax) correctly identified all 10 dimensions
- Both found SPOTLIGHT/GLOW via web_search and used them as benchmarks
- Both correctly applied gastric-gejc SOP stratification (Region + Mets + Gastrectomy)
- Both correctly excluded IO from control arm (matching SPOTLIGHT/GLOW)
- Both correctly identified VENTANA CDx requirement

## Deviation Events

### SYS Deviations
- Solver A (sonnet): FailoverError — AI service overloaded, degraded to kimi
- Solver C (minimax): Timeout at 300s (no output produced). Possible cause: excessive tool calls during intelligence gathering phase exhausted time before answer compilation.

### Solver Behavior Variance
Not fully evaluable (only 2 Solvers completed). Between A (kimi) and B (minimax):
- Sample size: A=440, B=530 (divergence on power: 85% vs 90%)
- IO policy: A allows optional IO, B excludes (Orchestrator arbitrated: exclude)
- Both independently found SPOTLIGHT/GLOW as benchmarks
- No SOP consistency issues detected

### Cross-Model Patterns
- kimi: lower sample size (440, 85% power), allows optional IO
- minimax: higher sample size (530, 90% power), excludes IO strictly
- Pattern: minimax more conservative on both sample size and control arm purity
