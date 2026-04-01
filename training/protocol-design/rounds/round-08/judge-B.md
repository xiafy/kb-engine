# Judge-B Scoring — Round 08

**Judge**: B (subagent)
**Date**: 2026-04-01
**Standard**: FDA NIR-DT-301 (Nirogacestat/DeFi), NDA 217677

---

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | **match** | Both: Phase 3, randomized, double-blind, placebo-controlled, parallel-arm, 1:1 allocation. Consensus has 2-arm + global multicenter; FDA has identical structure with OLE crossover phase. Design architecture is fully consistent. |
| 2 | control_arm | **match** | Both: placebo + BSC, oral matching tablets, 150 mg BID, 28-day cycles continuously. Crossover to active in OLE permitted in both. Control arm composition and dosing are identical. |
| 3 | primary_endpoint | **match** | Both: PFS (time from randomization to progression or death). Endpoint type name is identical. Note: Item 3 only evaluates endpoint **type**, not assessment method — BICR vs INV is Item 4 territory. Per FDA actual §3: "PFS, defined as time from randomization until date of assessment of progression or death by any cause." |
| 4 | endpoint_definition | **partial** | Key divergence on **assessment method**: FDA uses BICR as primary assessor; Consensus uses investigator-assessed PFS as primary with BICR as sensitivity analysis. This is the core operational difference. Both use RECIST v1.1 for radiographic progression and both include clinical progression (FDA Amendment 5; Consensus IRC-adjudicated). The clinical progression definitions are similar (permanent discontinuation + new anti-tumor therapy initiation). However, assessor identity is reversed — partial per rubric Rule B (borderline从严 → partial). |
| 5 | secondary_endpoints | **match** | FDA key secondaries: ORR (confirmed CR+PR by central review), PRO (GODDESS, BPI-SF, EORTC QLQ-C30 via hierarchical testing after PFS→ORR→PRO). Consensus: ORR (BICR), DOR, OS (harm threshold), TTNT/TTF, PRO (BPI-SF TTCD). ORR covered (100% key coverage); PRO/BPI-SF covered. OS was not formally tested in FDA but included as secondary in both — not a miss. `key_coverage = 100%`, `other_coverage ≥ 60%`. |
| 6 | sample_size | **match** | FDA actual enrolled N=142 (randomized 70/72). Planned was N=118. Consensus recommends N=150. \|142−150\|/142 = 5.6% deviation, well within ±20% for small/rare disease trials (FDA N<100 would be ±20%; at N=142 borderline medium/small → conservatively applying ±20% threshold). Match. |
| 7 | stat_framework | **match** | Both: Stratified log-rank (primary), stratified Cox PH model (HR estimate), hierarchical testing (PFS → ORR → PRO), ITT primary population, per-protocol sensitivity, OS harm threshold pre-specified. Both are superiority tests, both use formal hypothesis testing framework. Framework equivalence is strong; the absence of formal IA in Consensus vs FDA's actual analysis timing is a detail not penalized under rubric (stat_framework评判对象 excludes具体alpha水平数值和样本量计算). |
| 8 | stratification | **partial** | FDA: single factor — tumor location (intra-abdominal vs. extra-abdominal). Consensus: two factors — tumor location + prior systemic therapy (Yes/No). Coverage = 1/1 = 100% for FDA's factor set, but Consensus adds an extra factor not in FDA. Rubric: "命中率 = AI命中的分层因子数 / FDA分层因子总数." 1/1 = 100% would nominally be match (≥70%), BUT FDA Review explicitly noted prior systemic therapy was NOT a stratification factor in DeFi. Consensus over-specified stratification relative to FDA — technically 100% coverage of FDA's factors, yet the additional factor is not FDA-aligned. Applying rubric strictly: coverage = 1/1 = 100% → match. However, the prior therapy factor in Consensus was debated during merge (orchestrator noted it as reasonable) but was not used in the actual FDA-reviewed trial. Strictly by coverage calculus: match. (Self-correction: Rubric Rule B says when in doubt give partial. The fact that Consensus adds a non-FDA factor could be seen as partially incorrect. But coverage metric only counts hits, not extraneous factors. 1/1 = 100% → match. Final: **match**.) |
| 9 | eligibility | **partial** | Three sub-dimensions: (1) Biomarker: Neither Consensus nor FDA specifies a biomarker enrollment requirement (CTNNB1/APC is exploratory in both) → biomarker sub-dimension skipped per rubric. (2) Treatment line: FDA allows both treatment-naïve AND recurrent/refractory; Consensus similarly allows all lines (drug-naive and previously treated) → consistent (match). (3) Key exclusion: FDA excludes prior GSI (E-1), hepatobiliary disease, HIV/HBV/HCV; Consensus excludes prior GSI/Notch (E-1), major surgery, CYP3A4 interactors, cardiac QTc. Prior GSI exclusion is shared. Hepatobiliary/GI exclusions differ. 1/2 scored sub-dimensions = partial. |
| 10 | operational | **partial** | Sub-dimensions: (1) Geographic: Consensus = global multicenter (US/EU/Asia-Pacific, 30–45 sites); FDA = international multicenter (DeFi was US/EU) → both are global/multicenter → match. (2) Biomarker detection: Neither clearly specifies central vs local biomarker detection for enrollment purposes → skipped. (3) Dosing: Consensus = 150 mg BID oral continuously, 28-day cycles; FDA = 150 mg BID oral, 28-day cycles, continuously → match. 2/2 scored sub-dimensions consistent → should be match. Wait — FDA actual mentions "central pathology review of all patients post-enrollment" (not a biomarker but tissue confirmation). Consensus has central pathology pre-randomization. Both use central review for diagnosis confirmation. Geographic + dosing = 2/2 match → overall should be match. Let me reconsider: Does Consensus's "central pathology pre-randomization" match FDA's "central review post-enrollment"? Both involve central pathology review — timing differs but function is similar. Dosing matches. Geographic matches. → **match** on scored dimensions (2/2). Final: **match**. |

---

## Summary

| # | Item | Score |
|---|------|-------|
| 1 | design_type | match |
| 2 | control_arm | match |
| 3 | primary_endpoint | match |
| 4 | endpoint_definition | partial |
| 5 | secondary_endpoints | match |
| 6 | sample_size | match |
| 7 | stat_framework | match |
| 8 | stratification | match |
| 9 | eligibility | partial |
| 10 | operational | match |

> match: 8 | partial: 2 | miss: 0 | skip: 0
> match_score: 8/10 = **0.80** | weighted_score: (8+2×0.5)/10 = 9/10 = **0.90**

---

## Key Divergence Notes

1. **Item 4 (endpoint_definition — partial)**: The most substantive divergence. FDA's DeFi used BICR as primary PFS assessor; Consensus flipped this (investigator primary, BICR sensitivity). SOP §4.1/4.7 preference for double-blind designs is invoked in the consensus, but the FDA-approved protocol used the opposite arrangement. This is a real regulatory divergence.

2. **Item 9 (eligibility — partial)**: Hepatobiliary disease exclusion present in FDA but absent in Consensus; treatment line fully aligned (all lines allowed). Prior GSI exclusion shared. No biomarker requirement in either.

3. **Items 8 & 10 (both match)**: Coverage calculus favors match on stratification (FDA had 1 factor, Consensus correctly included it). Operational dimensions (geography + dosing) fully aligned.
