# Judge-C Scoring — Round 08
## Evaluator: Judge C (Claude Sonnet 4.6) | Date: 2026-04-01

---

## Pre-Scoring Analysis

**FDA Actual (NIR-DT-301 / DeFi trial, Nirogacestat NDA 217677):**
- Design: Randomized, double-blind, placebo-controlled, Phase 3, international multicenter
- Control: Placebo oral matching, 28-day cycles continuously; crossover in OLE
- Primary endpoint: PFS by **BICR** per RECIST v1.1 + clinical progression (Amendment 5)
- Secondary endpoints (key): ORR → PRO (GODDESS, BPI-SF, EORTC QLQ-C30)
- Sample size: N=118 planned (51 events); N=142 actual enrolled; N=142 randomized = 70/72
- Stat framework: ITT, stratified log-rank, hierarchical testing (PFS → ORR → PRO), single stratification factor (tumor location)
- Stratification: Single factor — tumor location (intra-abdominal vs. extra-abdominal)
- Eligibility: ≥18y, histologically confirmed DT (local pathologist), RECIST v1.1 ≥20% progression within 12 months, treatment-naïve OR recurrent/refractory, ECOG ≤2
- Operational: Global multicenter; BICR central imaging review; 150 mg BID oral continuous

**Consensus Answer Summary:**
- Design: Randomized, double-blind, placebo-controlled, Phase 3 superiority, global multicenter
- Control: Placebo + BSC
- Primary endpoint: PFS by **Investigator** (primary) + BICR as sensitivity
- Secondary: ORR → DOR → OS (harm threshold) → TTNT → TTCD-PRO
- Sample size: N=150 recommended (HR=0.50, control mPFS=15mo, 75 events target)
- Stat framework: ITT, stratified log-rank, hierarchical testing, futility-only IA at ~50% events
- Stratification: 2 factors — tumor location + prior systemic therapy
- Eligibility: ≥18y, histological confirmation (central pathology pre-randomization), RECIST ≥20% within 12 months OR clinical progression, ECOG 0–1
- Operational: Global multicenter; BICR for sensitivity; 150 mg BID (implied)

---

## Scoring Table

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | **match** | Both are randomized, double-blind, placebo-controlled, parallel-arm, Phase 3, international multicenter trials with OLE/crossover option. Consensus specifies "superiority" — FDA is also a superiority design. All macro design elements align. |
| 2 | control_arm | **match** | Both specify oral placebo (matching) with crossover permitted after PFS primary analysis or confirmed progression. Consensus explicitly calls placebo + BSC, which aligns with FDA's placebo continuous oral in 28-day cycles. Both allow crossover in OLE phase. |
| 3 | primary_endpoint | **match** | Both select PFS as the primary endpoint. Item 3 only evaluates endpoint type/name. Consensus = PFS; FDA = PFS. The BICR vs. investigator difference is Item 4's domain. |
| 4 | endpoint_definition | **partial** | Both use RECIST v1.1 and both include clinical progression as a component of PFS events (consensus: via IRC adjudication; FDA: via blinded central clinical review committee, added per Amendment 5). Assessment standard is aligned (RECIST v1.1). However, **assessor diverges**: Consensus designates **Investigator-assessed PFS** as primary with BICR as sensitivity; FDA uses **BICR** as the primary assessor. Per Item 4 rubric: "both use RECIST 1.1, but BICR vs INV = partial." |
| 5 | secondary_endpoints | **partial** | **FDA key secondary endpoints**: (1) ORR, (2) PRO composite (GODDESS, BPI-SF, EORTC QLQ-C30) — these are in the hierarchical testing chain. Consensus hits ORR ✓ and BPI-SF/EORTC QLQ-C30 PROs ✓ but misses GODDESS (disease-specific DT PRO instrument). DOR is listed by consensus but FDA treats it as descriptive/supportive rather than a key secondary in the formal testing hierarchy. OS is listed by consensus but FDA did not formally test OS (DT is rarely fatal). The key gap: consensus does not identify GODDESS as a PRO instrument (consensus names BPI-SF + EORTC QLQ-C30 but omits the GODDESS scale, which was a primary PRO measure). key_coverage for ORR = 100%; for PRO category = partial (hits 2/3 PRO instruments, misses GODDESS). Per Item 5: "遗漏任何一个关键次要终点 → 最高只能给 partial." GODDESS is a key trial-specific PRO; its omission caps the score at partial. |
| 6 | sample_size | **match** | FDA planned N=118 (actual enrolled N=142). Consensus recommends N=150. Using FDA planned N=118 as reference: deviation = |150−118|/118 = 32/118 = 27.1%. Using actual enrolled N=142: deviation = |150−142|/142 = 8/142 = 5.6%. FDA actual trial is a mid-size trial (100 ≤ N < 300), so match threshold = ±25%. Against planned N=118, deviation is 27.1% which falls in the partial range (26–50%). However, FDA actual enrolled was N=142 (5.6% — well within match). The rubric says "FDA 实际样本量" — FDA's actual enrolled N=142 is the most relevant comparator. Deviation = 5.6%, far within ±25% match threshold. **Score: match.** |
| 7 | stat_framework | **partial** | Both use: ITT population, stratified log-rank test, hierarchical testing (PFS → ORR → downstream). These core elements align. However, the consensus proposes a **futility-only interim analysis at ~50% events** (non-binding, O'Brien-Fleming spending), while FDA used a **fixed design with no formal interim analysis** (primary analysis was at 49/51 pre-specified events — this was the planned final analysis, not an interim). Per Item 7 rubric: "Fixed design (no IA) vs GSD (with IA) = partial." The consensus adds an IA that FDA did not implement. Additionally, consensus includes ICH E9(R1) estimand framework specification; FDA review does not mention formal estimand documentation. Core framework (hierarchical testing, superiority, ITT) is aligned, but the IA divergence = partial per the judgment table. |
| 8 | stratification | **partial** | FDA used **1 stratification factor**: tumor location (intra-abdominal vs. extra-abdominal). Consensus uses **2 factors**: (1) tumor location ✓ (match) and (2) prior systemic therapy (not a randomization stratification factor in actual trial). Coverage = 1 FDA factor hit out of 1 FDA factor = 100% coverage of FDA factors. However, the rubric evaluates coverage of FDA factors: AI hits 100% of FDA's factor(s) (tumor location). Extra factors added by AI do not penalize. By coverage formula: 1/1 = 100% → should be **match** (≥70%). Re-evaluating: the rubric says "覆盖率 = AI 命中的分层因子数 / FDA 分层因子总数." FDA has 1 factor; AI covers that 1 factor = 100% coverage → **match threshold met (≥70%).** Correcting score to **match**. |
| 9 | eligibility | **partial** | Sub-dimension analysis per Item 9 rubric (3 sub-dimensions: biomarker, treatment line, key exclusions): **(1) Biomarker requirement**: Neither FDA nor consensus requires a specific biomarker for enrollment (both allow all-comer DT patients without CDx requirement; CTNNB1 is exploratory in both). No biomarker divergence — this sub-dimension aligns. ✓ **(2) Treatment line**: FDA = "treatment-naïve OR recurrent/refractory" (all lines). Consensus = all lines allowed (I-6: "No prior therapy restriction — drug-naive and previously treated both eligible"). ✓ Aligned. **(3) Key exclusion criteria**: Key ECOG divergence: FDA uses ECOG ≤2; consensus uses ECOG 0–1 (stricter). This is a disease-specific eligibility difference relevant to the DT population. FDA deliberately used ECOG ≤2 (more inclusive). Additionally, FDA required **RECIST v1.1 ≥20% progression only** (no "clinical progression" qualifying entry as alternative path); consensus allows "radiographic progression OR clinical progression" as entry criterion — broader than FDA's actual I/E. These are meaningful eligibility differences in the DT-specific context. 2 of 3 sub-dimensions partially align (biomarker ✓, treatment line ✓, but ECOG and entry progression criteria diverge). Per rubric: "≥2 sub-dimensions consistent = match." However, ECOG (0-1 vs ≤2) and clinical progression as enrollment criterion are both materially different from FDA actual. Since biomarker and line both align, and the third (key exclusion/eligibility specifics) partially differs, the score is **partial** — the ECOG difference is a definitive eligibility divergence. But the rubric requires ≥2 of 3 for match: biomarker ✓, treatment line ✓ → 2/3 → **match**. However, the strict rule says "key exclusion criteria" as one sub-dimension; the ECOG divergence is under this category. ECOG ≤2 vs ECOG 0–1 is a meaningful difference (FDA was more inclusive). Applying rule B (partial/miss boundary → give partial; match/partial boundary → give partial). Score: **partial** (ECOG divergence and entry progression criteria differ from FDA actual, even though line and biomarker agree). |
| 10 | operational | **match** | Item 10 evaluates 3 sub-dimensions: geography, biomarker testing strategy, dosing regimen. **(1) Geography**: Consensus = global multicenter (US/EU/Asia-Pacific); FDA = international multicenter. ✓ Aligned. **(2) Biomarker testing**: Both mention central pathology review/confirmation. Consensus requires central pathology pre-randomization; FDA performed central review of all specimens (post-enrollment, not required for eligibility entry). Direction aligned — both use centralized tumor assessment. ✓ **(3) Dosing regimen**: Consensus does not explicitly state the dose (150 mg BID) — it references Phase 1/2 dose justification as SDP #9. FDA = 150 mg BID oral continuous. Consensus mentions "continuous oral dosing" but without specifying 150 mg BID explicitly in the design dimensions. However, the consensus identifies nirogacestat (GSI) as continuous oral therapy, aligns on the route and frequency concept. Given that the question asks about GSI design and the consensus is a prospective design exercise (dose would come from Phase 2), this sub-dimension is reasonably aligned in direction. ≥2/3 sub-dimensions clearly consistent → **match**. |

---

> **Corrected Item 8**: Coverage = 1 FDA factor covered / 1 FDA total factor = 100% → match threshold ≥70% met → **match**

---

## Summary Statistics

| Score | Items |
|-------|-------|
| match | 1 (design_type), 2 (control_arm), 3 (primary_endpoint), 6 (sample_size), 8 (stratification), 10 (operational) |
| partial | 4 (endpoint_definition), 5 (secondary_endpoints), 7 (stat_framework), 9 (eligibility) |
| miss | — |
| skip | — |

> match: 6 | partial: 4 | miss: 0 | skip: 0
> match_score: 6/(10-0) = **0.60**
> weighted_score: (6 + 4×0.5)/(10-0) = (6+2)/10 = **0.80**

---

## Key Observations for Training

1. **BICR vs. Investigator PFS (Item 4)**: The consensus correctly identified PFS as primary but chose investigator assessment as primary and BICR as sensitivity — the opposite of what FDA required. The actual trial used BICR as the primary assessor for PFS, with investigator assessment as secondary. This is a systematic SOP miscalibration: the SOP preference for investigator-primary in double-blind settings did not match FDA's actual requirement for this trial.

2. **GODDESS PRO instrument (Item 5)**: The consensus listed BPI-SF and EORTC QLQ-C30 but missed the GODDESS scale (GOunder/Desmoid Tumor Research Foundation Desmoid Symptom/Impact Scale) — a disease-specific patient-reported outcome instrument developed specifically for DT. This is a gap in rare disease–specific PRO knowledge.

3. **Interim Analysis (Item 7)**: The consensus added a futility-only IA that was not part of the actual trial. The DeFi trial used a fixed design (single primary analysis at 51 events). This was appropriate given the small N=118 and clear clinical benefit signal, but the consensus over-engineered the statistical framework.

4. **Sample Size Assumptions (Item 6)**: The consensus correctly anchored on the DeFi trial placebo arm mPFS of 15 months and landed close to the actual enrolled N (150 vs. 142). However, the actual FDA-planned N was only 118, based on HR=0.4 (not 0.50). The consensus used HR=0.50, which drove a slightly higher N but was more conservative.

5. **ECOG (Item 9)**: FDA used ECOG ≤2, which is more inclusive than the consensus ECOG 0–1. For a chronic oral therapy in a rare tumor with no approved alternative, the broader ECOG criterion increases accessibility and enrollment feasibility.

---

*Judge-C evaluation complete. Round 08 | Version: v1.0*
