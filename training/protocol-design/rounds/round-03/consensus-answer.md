## Consensus Answer: Vyloy [protocol-design] — Round 03

> Solvers: A (kimi) / B (minimax) / C (minimax, TIMEOUT — excluded)
> Consensus: 2 Solver, divergence by Orchestrator arbitration

### 1. design_type
**Phase 3, global, multi-center, double-blind, randomized (1:1), placebo-controlled, parallel-group, add-on superiority trial**

Both Solvers: double-blind, 1:1, placebo-controlled, add-on (zolbetuximab + chemo vs placebo + chemo). Both cite SPOTLIGHT/GLOW precedent.

[consensus: 2/2]

### 2. control_arm
**Placebo + fluoropyrimidine/platinum chemotherapy (mFOLFOX6 or CAPOX per investigator choice)**

Both Solvers: placebo + chemo backbone. Both recommend chemo-only (no IO) as primary option, noting SPOTLIGHT/GLOW excluded IO. A allows optional IO per local label; B recommends against IO as Option A.

[consensus: 2/2 on placebo + chemo; minor divergence on IO: A allows optional, B excludes]
[arbitrated: Exclude IO per SPOTLIGHT/GLOW precedent — this matches the actual regulatory path. IO is flagged as SDP.]

### 3. primary_endpoint
**PFS by BICR per RECIST 1.1**

Both Solvers: PFS as primary, BICR assessment, RECIST 1.1.

[consensus: 2/2]

### 4. endpoint_definition
**Time from randomization to BICR-assessed disease progression (RECIST 1.1) or death from any cause; ITT population; stratified log-rank test; Cox PH for HR**

Both Solvers agree on: BICR, RECIST 1.1, ITT, treatment policy estimand, censoring rules.
A: tumor assessments q6w first 48w then q9w. B: detailed censoring table.

[consensus: 2/2]

### 5. secondary_endpoints
**Hierarchical: PFS → OS → ORR → DOR → PRO (EORTC QLQ-C30 + OG25/STO22)**

Both Solvers: OS as key secondary under hierarchical testing; ORR, DOR, PRO.
B includes DCR; A includes TTCD variants. Both use EORTC QLQ-C30.
B uses STO22; A uses OG25 — both are gastric-specific PRO modules.

[consensus: 2/2]

### 6. sample_size
**A: N=440 (220:220), HR 0.67, 85% power, 219 PFS events**
**B: N=530 (265:265), HR 0.65, 90% power, 227 PFS events**

Divergence on power (85% vs 90%) and HR assumption (0.67 vs 0.65).

[arbitrated: Both are reasonable. B's 90% power is more conservative and standard for pivotal trials. Adopt N≈500-530 as consensus target, HR 0.65-0.67 range.]

### 7. stat_framework
**Hierarchical testing; PFS primary α=0.025 one-sided (or 0.05 two-sided); OS as key secondary with alpha spending (OBF); interim analyses for both PFS and OS**

Both Solvers: hierarchical, OBF alpha spending.
A: 2 PFS IAs + 2 OS IAs. B: PFS final + 2 OS IAs.
Both: stratified log-rank, Cox PH.

[consensus: 2/2 on framework; minor divergence on IA count]

### 8. stratification
**3 factors: Region (Asia vs Non-Asia) + Metastatic organ sites (0-2 vs ≥3) + Prior gastrectomy (Yes vs No)**

Both Solvers: identical 3 factors, matching gastric-gejc SOP exactly. Both note ECOG not used per SOP.

[consensus: 2/2]

### 9. eligibility
**Inclusion:** ≥18; histologically confirmed gastric/GEJ adenocarcinoma; locally advanced unresectable or metastatic; CLDN18.2+ (≥75% IHC 2+/3+, VENTANA central); HER2-negative; treatment-naïve for advanced disease; ECOG 0-1; adequate organ function; measurable disease per RECIST 1.1

**Exclusion:** Gastric outlet syndrome; CNS mets; prior systemic therapy for advanced disease; prior anti-CLDN18.2 therapy; peripheral neuropathy ≥Grade 2; significant CV disease

Both Solvers highly aligned on I/E criteria. Both correctly identify CDx requirement (VENTANA CLDN18.2 assay).

[consensus: 2/2]

### 10. operational
**Geography:** Global multi-center (Asia ~50-60%, N America, Europe, LatAm)
**Biomarker testing:** Central IHC (VENTANA CLDN18 43-14A RxDx Assay) — CDx
**Dosing:** Zolbetuximab 800 mg/m² loading D1 → 600 mg/m² Q3W maintenance; Placebo matching; Chemo per CAPOX or mFOLFOX6

Both Solvers: global, central CLDN18.2 IHC, same dosing regimen.

[consensus: 2/2]

---

## Summary

| Item | Consensus | Note |
|------|-----------|------|
| 1. design_type | 2/2 | Double-blind, placebo-controlled, 1:1 |
| 2. control_arm | 2/2 + arbitrated | Chemo-only (no IO), flagged as SDP |
| 3. primary_endpoint | 2/2 | PFS BICR RECIST 1.1 |
| 4. endpoint_definition | 2/2 | Standard PFS definition |
| 5. secondary_endpoints | 2/2 | PFS → OS → ORR → DOR → PRO |
| 6. sample_size | arbitrated | N≈500-530, HR 0.65-0.67 |
| 7. stat_framework | 2/2 | Hierarchical + OBF |
| 8. stratification | 2/2 | SOP exact match |
| 9. eligibility | 2/2 | CDx + standard oncology I/E |
| 10. operational | 2/2 | Global, central CLDN18.2, standard dosing |
