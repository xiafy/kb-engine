# Branch: SAP Design

> **Status**: ✅ Phase 1 complete (program.md + evaluate.md + case-config.json + config.yaml)
> **Architecture**: v5.0 (independent program.md, per framework.md skeleton)
> **Seed SOP**: sop/core/sap-design.md v1.0 (38 rules)
> **Training Design**: docs/sap-design-training-design.md (Boss confirmed 2026-03-31)

## Overview

SAP Design training teaches the Agent to produce FDA-level Statistical Analysis Plans.
Given protocol parameters (endpoints, comparator, population, design, N, stratification),
the Agent designs the HOW: analysis method, multiplicity control, interim analysis,
missing data handling, sensitivity analyses, estimand framework.

## Key Differences from Protocol Design

| Aspect | Protocol Design | SAP Design |
|--------|----------------|------------|
| Core skill | Clinical decisions | Statistical methodology |
| Input | Drug info + indication | Protocol parameters (PD output) |
| Core tool | web_search | **exec (Python/R)** |
| Difference codes | KNOW/REG/STAT/ALT/INFO | **METH/ASSUM/IMPL/ALT/INFO** |
| Convergence | match ≥ 0.70 | match ≥ 0.65 |
| Owner timeout | 300s | 360s |

## Scoring Dimensions (9)

1. Primary analysis method
2. Multiplicity control
3. Interim analysis
4. Analysis sets
5. Missing data handling
6. Subgroup analysis
7. Sensitivity analyses
8. Sample size method
9. Estimand framework

## Files

| File | Description |
|------|-------------|
| `program.md` | Complete SAP training program v1.0 |
| `evaluate.md` | 9-dimension scoring rubric with judgment examples |
| `case-config.json` | 20 cases with protocol_params_ref |
| `case-params.json` | Protocol parameters for all 20 cases |
| `config.yaml` | Branch config v2.0 (self-contained) |

## Next Steps

1. [ ] Round 1 (12-sotyktu) — baseline
2. [ ] Batch 1 (Rounds 1-5) — intensive
3. [ ] Batch 2 (Rounds 6-10) — standard
