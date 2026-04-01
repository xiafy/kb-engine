---
version: 1.1
source: Batch 2 R8 Ogsiveo (NDA217677)
rule_count: 4
---

# Desmoid Tumor (DT)

> Batch 2 审核 (2026-04-01) — 从 placeholder 升级

## Trial Design

### PFS Definition: Radiographic + Clinical Progression
IF desmoid tumor: → PFS must include both radiographic progression (RECIST v1.1) AND clinical progression. Clinical progression defined as: global health deterioration requiring emergent treatment, confirmed by **blinded independent centralized adjudication committee**. Desmoid tumors cause morbidity through local invasion, not metastasis — purely radiographic PFS misses clinically meaningful deterioration.
[grounded: single-case — Ogsiveo NDA217677, DeFi Amendment 5 added clinical progression; see also rare-disease SOP §PFS-clinical-progression]

### Disease-Specific PRO: GODDESS
IF desmoid tumor: → Include **GODDESS** (Gounder Desmoid Symptom/Impact Scale) as secondary endpoint. GODDESS is a DT-specific validated PRO measuring symptom burden and functional impact. Also include BPI-SF (pain) and EORTC QLQ-C30 (general QoL). Generic PROs alone are insufficient for DT labeling claims.
[grounded: single-case — Ogsiveo NDA217677, GODDESS as secondary endpoint]

### HR Assumption: ~0.40
IF desmoid tumor with gamma-secretase inhibitor or targeted therapy vs placebo: → Expected HR ~0.40 (large effect expected due to high unmet need + targeted mechanism). Control arm mPFS from DeFi placebo arm: ~15 months (note: spontaneous regression in ~10-20% of placebo patients may dilute treatment effect).
[grounded: single-case — Ogsiveo NDA217677, observed HR=0.29, planned HR=0.40]

### Stratification: Tumor Location Only
IF desmoid tumor: → Single stratification factor: tumor location (intra-abdominal vs extra-abdominal). Prior systemic therapy is prognostic but adding it risks over-stratification in small rare disease trials (N~120-150).
[grounded: single-case — Ogsiveo NDA217677, DeFi used tumor location only]

## SAP Design

<!-- Append rules here during training (section-append convention) -->
