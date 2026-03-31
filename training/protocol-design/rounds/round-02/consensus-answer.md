## Consensus Answer: Orgovyx [protocol-design] — Round 02

> Solvers: A (kimi) / B (minimax) / C (minimax)
> Consensus method: v5.0 (3/3 majority + Orchestrator arbitration)

### 1. design_type
**Phase 3, multinational, randomized (2:1), open-label, parallel-group, active-controlled superiority trial**

All 3 Solvers: open-label RCT, 2:1 (relugolix:leuprolide), parallel-group, active control. Rationale unanimous: open-label justified by injectable vs oral route difference + objective laboratory endpoint.

[consensus: 3/3]

### 2. control_arm
**Leuprolide acetate 22.5 mg 3-month depot injection (SC q12w)**

All 3 Solvers: leuprolide 3-month depot as active control. All cite single dominant SOC, no IC needed. B and A both note SDP for potential additional arms (degarelix or IC of GnRH agonists).

[consensus: 3/3]

### 3. primary_endpoint
**Sustained testosterone suppression rate — proportion of patients with castrate T (<50 ng/dL) maintained from Day 29 through Week 48**

All 3 Solvers: sustained castration rate as primary; <50 ng/dL threshold; Day 29–Week 48 window. Exact same endpoint.

[consensus: 3/3]

### 4. endpoint_definition
**Central lab LC-MS/MS; proportion with T <50 ng/dL at ALL post-Day-29 assessments through Week 48; mITT population; missing/discontinuation = failure (NRI/treatment policy); no BICR needed (objective lab)**

All 3 Solvers agree on: central lab measurement, mITT population, missing = failure, no BICR. Minor differences in detail (C specifies ±3 day assessment window; B specifies validated immunoassay as alternative to LC-MS/MS).

[consensus: 3/3]

### 5. secondary_endpoints
**Key secondary endpoints (hierarchical order):**

1. Non-inferiority of relugolix vs leuprolide on sustained suppression (NI margin -10pp)
2. Castrate T (<50 ng/dL) at Day 4 (rapid onset / no flare claim)
3. Profound castration (<20 ng/dL) at Day 15
4. PSA response at Day 15 (B: ≥80% reduction; A: ≥50% reduction; C: ≥50% at Week 24)
5. FSH suppression (A: Week 24; B: 6 months)
6. MACE composite (MI, stroke, CV death) — all 3 include
7. Testosterone recovery post-treatment — all 3 include
8. PRO: B uses FACT-P; C uses EORTC QLQ-C30; A uses QLQ-C30+PR25

NI test: [consensus: 3/3]
Day 4 rapid onset: [consensus: 3/3]
Profound castration Day 15: [consensus: 3/3]
PSA response: [consensus: 3/3 on inclusion; 2/3 on ≥50% threshold, dissent: Solver B uses ≥80%]
MACE: [consensus: 3/3]
Testosterone recovery: [consensus: 3/3]
PRO tool: [consensus: 2/3 EORTC QLQ-C30, dissent: Solver B uses FACT-P]

### 6. sample_size
**Target: ~930 patients (620:310, 2:1)**

- A: 934 (622:312) — explicitly cites HERO enrollment
- B: 459 (306:153) as minimum, notes HERO used 934 for CV safety
- C: ~930 (with 15% dropout)

Divergence on rationale: B calculates bare minimum (459) and flags 900+ as SDP for MACE; A and C both target ~930 for comprehensive safety + subgroup analyses.

[consensus: 2/3 on ~930, dissent: Solver B argues 459 sufficient for efficacy, ~930 is SDP for CV safety]

### 7. stat_framework
**Hierarchical (fixed-sequence) testing; primary superiority α=0.025 one-sided → NI (margin -10pp) → secondaries in ranked order; 1 interim analysis at ~50% information (O'Brien-Fleming)**

All 3 Solvers: hierarchical testing, one-sided α=0.025, NI as secondary, O'Brien-Fleming interim.

Differences:
- A: Farrington-Manning score test; B: same direction; C: CMH chi-square (also mentions α=0.05 two-sided)
- C: proposes 2 interim analyses (W24 + W36 with SSR); A and B: 1 interim
- All: IDMC/DSMB

[consensus: 3/3 on hierarchical + OBF interim framework; 2/3 on single interim, dissent: Solver C proposes 2 interims]

### 8. stratification
**3 stratification factors:**

| Factor | A (kimi) | B (minimax) | C (minimax) |
|--------|----------|-------------|-------------|
| Geography | ✅ Americas/EU/APAC | ✅ NA/EU/APAC-RoW | ✅ NA/EU/APAC-RoW |
| Metastatic status | ✅ Yes/No | ✅ M1/M0 | ✅ M1/M0 |
| Third factor | Age ≤75/>75 | Age <65/≥65 | ECOG 0 vs 1-2 |

Geography: [consensus: 3/3]
Metastatic status: [consensus: 3/3]
Third factor: [arbitrated: Solver C's ECOG is a stronger prognostic factor for treatment outcomes than age cutoff. Both A and B chose age but with different cutoffs (75 vs 65), suggesting uncertainty. ECOG is universally used in oncology stratification. However, prostate ADT trials historically stratify by age given the strong age-CV risk interaction. SOP §6.1 says "select prognostic factors with greatest impact on primary endpoint" — for testosterone suppression, neither age nor ECOG has strong differential impact. Per precedent (this is an ADT trial, not a cytotoxic trial), age may be more relevant for safety characterization. Adopting age as SOP-aligned for ADT context, but noting ECOG as valid alternative.]

[arbitrated: age cutoff adopted per ADT precedent, Solver B's <65/≥65 used as more standard oncology cutoff]

### 9. eligibility
**Inclusion**: Males ≥18; confirmed prostate adenocarcinoma; advanced disease requiring ≥12mo continuous ADT (biochemical relapse OR locally advanced OR metastatic); castration-sensitive; baseline T ≥150 ng/dL; ECOG 0-1

**Exclusion**: Prior ADT within 3mo / cumulative >18mo; prior orchiectomy; MACE within 6mo; QTcF >450ms; hepatic impairment (ALT/AST >3×ULN); strong CYP3A4 inducers/P-gp modulators

All 3 agree on core criteria. Additional exclusions noted by B/C but not A: brain mets, GI malabsorption, CrCl <30.

Biomarker: [consensus: 3/3 — no CDx required; T ≥150 ng/dL baseline]
Line: [consensus: 3/3 — first-line ADT, castration-sensitive]
Key exclusions: [consensus: 3/3 on MACE 6mo, prior ADT, orchiectomy]

[consensus: 3/3]

### 10. operational
**Geography**: Global multi-regional (~150-200 sites, NA + EU + Asia-Pacific)
**Biomarker testing**: Central lab testosterone LC-MS/MS at all timepoints; no CDx
**Dosing**: Relugolix 360mg load D1 → 120mg QD oral; Leuprolide 22.5mg SC q12w

All 3 agree on geography (global), central lab, dosing, no CDx. Minor variations: C includes Taiwan/Australia/SK specifically; B adds ECG core lab; A adds CV adjudication committee (B/C also mention this).

[consensus: 3/3]

---

## Summary

| Item | Score | Note |
|------|-------|------|
| 1. design_type | 3/3 | Unanimous |
| 2. control_arm | 3/3 | Unanimous |
| 3. primary_endpoint | 3/3 | Unanimous |
| 4. endpoint_definition | 3/3 | Unanimous on substance |
| 5. secondary_endpoints | 3/3 core | Minor tool/threshold divergences |
| 6. sample_size | 2/3 | B lower; A/C ~930 |
| 7. stat_framework | 3/3 framework | C wants 2 interims |
| 8. stratification | 2/3 + arbitrated | 3rd factor: age vs ECOG |
| 9. eligibility | 3/3 | Unanimous on core |
| 10. operational | 3/3 | Unanimous |
