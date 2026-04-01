# Judge-B Scoring — Round 07

**Judge:** Model-B (high reasoning bar) | **Date:** 2026-04-01
**Scoring basis:** AI consensus answer vs. FDA INDIGO (AG881-C-004, NDA218784) actual

---

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | `match` | Both: Phase 3, randomized, double-blind, placebo-controlled, 1:1 parallel superiority. INDIGO is global multicenter. [FDA: "Phase 3, global, multicenter, randomized, double-blind, placebo-controlled study"] |
| 2 | control_arm | `match` | Both: placebo orally QD with crossover to active treatment upon centrally confirmed radiographic PD. [FDA: "vorasidenib-matched placebo orally QD... allowed to cross over to receive vorasidenib upon centrally confirmed radiographic PD by BIRC"] |
| 3 | primary_endpoint | `match` | Both: PFS as primary endpoint type. Item 3 scope is endpoint type name only; BICR vs INV assessor is Item 4. [FDA: "BIRC-assessed progression-free survival (PFS) per modified RANO-LGG"]; [Consensus: "PFS per RANO-LGG 2017 criteria"] |
| 4 | endpoint_definition | `partial` | Both use RANO-LGG 2017 criteria — evaluation standard consistent. Critical divergence: FDA uses BIRC as primary assessment (with 2-reader double-read + adjudication), while consensus uses investigator assessment as primary (BICR as sensitivity). The assessment method is a core Item 4 sub-dimension. [FDA: "centrally confirmed radiographic PD by modified RANO-LGG assessed by the BIRC"] |
| 5 | secondary_endpoints | `partial` | Key secondary: FDA = TTNI (Time to Next Intervention); Consensus = OS. Both mention "Time to Next Anti-Cancer Intervention" (partial), but OS ≠ TTNI as key secondary. Other secondaries: both cover ORR, DOR, OS, safety. Consensus misses TGR and HRQOL (FACT-Br). Key coverage = 0/1 (0%), other coverage ≈ 4/6. Per rubric: key_coverage < 50% → partial. [FDA key secondary: TTNI; additional: TGR, OR, OS, HRQOL, investigator PFS] |
| 6 | sample_size | `miss` | FDA actual: N=331, 164 events, mPFS placebo=18mo, HR=0.6. Consensus: N=650, 194 events, mPFS placebo=48mo, HR=0.65. Deviation = |650−331|/331 = **96%**, far exceeding 60% threshold for miss in a large trial (≥300). Consensus assumed a much longer control arm median PFS (48mo vs FDA's 18mo), driving a dramatically larger N. [FDA: "331 patients randomized... median PFS of 18 months in the placebo arm"] |
| 7 | stat_framework | `match` | Both: group sequential design, hierarchical fixed-sequence testing, OBF/Lan-DeMets alpha spending, stratified Cox model. FDA has 3 looks vs consensus 2 — spending function family difference is a detail per rubric precedent ("GSD with OBF = GSD with Lan-DeMets = match"). [FDA: "3-look group-sequential design... Gamma family (−24) for efficacy boundaries"]; [Consensus: "2 IAs (OBF spending)"] |
| 8 | stratification | `match` | Both: 1p/19q co-deletion status + baseline tumor size (≥2cm vs. <2cm). Coverage = 2/2 = 100% ≥70%. [FDA: "Local 1p19q status: co-deleted or not co-deleted... Baseline tumor size per local assessment: longest diameter ≥2 cm or <2 cm"] |
| 9 | eligibility | `match` | Key sub-dimensions: (1) Biomarker: both require IDH1/IDH2 mutation confirmation — match; (2) Treatment line: both prohibit prior chemo/RT — match; (3) Key exclusion: both exclude prior anticancer therapy, require stable disease. ≥2/3 sub-dimensions align. [FDA: "Grade 2 oligodendroglioma or astrocytoma... IDH1 or IDH2 mutation... No other prior anticancer therapy... At least 1 prior surgery (most recent surgery ≥1 year and ≤5 years before randomization)"] |
| 10 | operational | `partial` | Sub-dimensions: (1) Geographic: both global multicenter — match; (2) Biomarker testing: both central BIRC — match; (3) Dosing: FDA = 28-day cycles, 50mg F1 → 40mg F2; Consensus = continuous daily QD, no dose reduction levels specified in design description. Both are oral daily, but schedule (continuous vs 28-day cycles) and dose levels differ — partial. = 2/3 sub-dimensions match, reaching ≥2 threshold → partial per rubric. |

---

> **match: 4 | partial: 4 | miss: 2 | skip: 0**
> **match_score: 4/10 = 0.40**
> **weighted_score: (4+4×0.5)/10 = 6/10 = 0.60**

---

## Key Divergences Summary

| # | Divergence | Impact |
|---|-----------|--------|
| 4 | BIRC primary (FDA) vs Investigator primary (Consensus) | Regulatory-grade central review is standard in CNS trials; INDIGO used double-read BIRC with adjudication — consensus understated the rigor |
| 5 | OS as key secondary (Consensus) vs TTNI as key secondary (FDA) | TTNI directly captures deferral of treatment burden — clinically meaningful and regulatorily aligned for LGG observation-replacement indication |
| 6 | Control arm mPFS: 18mo (FDA) vs 48mo (Consensus) | Largest deviation. Consensus literature assumption not grounded in actual INDIGO Phase 2 data; FDA's 18mo aligns with actual trial performance |
| 10 | 28-day cycle dosing with dose reduction (FDA) vs continuous daily QD (Consensus) | Dosing schedule difference; INDIGO required a dose reduction from 50mg to 40mg mid-trial — consensus did not capture this operational detail |
