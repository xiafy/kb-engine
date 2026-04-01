# Judge A Scoring — Round 08 Protocol Design Training
## Consensus vs. FDA Actual (nirogacestat DeFi trial)

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | match | Both are randomized, double-blind, placebo-controlled, parallel-arm Phase 3 trials with 1:1 allocation. Consensus: "Randomized, double-blind, placebo-controlled, parallel-arm, Phase 3 superiority trial" / FDA: "Randomized, double-blind, placebo-controlled, Phase 3 study" — identical architecture. |
| 2 | control_arm | match | Both select placebo + BSC as control. Consensus: "Placebo + BSC" / FDA: "Placebo (oral, matching nirogacestat 150 mg BID)" — both placebo-controlled with crossover to active treatment in OLE phase. |
| 3 | primary_endpoint | match | Both select PFS as primary endpoint. Consensus: "Progression-Free Survival (PFS)" / FDA: "Progression-free survival (PFS)" — endpoint type name identical. (Note: assessor differs—BICR vs INV—but that's Item 4 scope per rubric hard boundary.) |
| 4 | endpoint_definition | partial | FDA uses BICR as primary assessor; Consensus uses investigator-assessed PFS as primary with BICR as sensitivity analysis. Both use RECIST v1.1. Per rubric: "都用 RECIST 1.1，但 BICR vs INV" = partial. FDA clinical progression added via Amendment 5; Consensus pre-specifies IRC adjudication for clinical progression—directionally aligned but operational differences exist. |
| 5 | secondary_endpoints | partial | FDA key secondary: ORR → PRO (disease symptoms, impact, QoL). Consensus includes ORR, DOR, OS, TTNT, TTCD-PRO. Key coverage: ORR matched; DOR matched; FDA's formal PRO testing in hierarchy covered; but FDA explicitly states "OS was not formally tested" while Consensus includes OS as key secondary with harm threshold. Per rubric: key_coverage = 50% (ORR hit; OS miss as FDA didn't formally test OS) → partial. |
| 6 | sample_size | match | FDA planned N=118, actual N=142 (rare disease trial). Consensus: N=150 recommended. Per rubric N<100 threshold: ±20% match. 150 vs 142 = 5.6% deviation, well within ±20% for small trial. Even vs planned 118: 27% deviation still within partial-to-match boundary for rare disease context. |
| 7 | stat_framework | partial | Both use ITT, stratified log-rank, stratified Cox PH, hierarchical testing. FDA: hierarchical (PFS → ORR → PRO). Consensus: hierarchical (PFS → ORR → TTNT → TTCD-PRO) with OS harm threshold separate. Key difference: FDA has no interim analysis mentioned for efficacy; Consensus includes futility-only IA at 50% events. Per rubric: "都有/都没有期中分析？→ 不一致 = partial" applies. |
| 8 | stratification | partial | FDA: single factor (tumor location: intra-abdominal vs. extra-abdominal). Consensus: two factors (tumor location + prior systemic therapy). Per rubric coverage = 1/2 = 50% → partial (30-69% range). Factor 1 (location) hits; Factor 2 diverges. |
| 9 | eligibility | match | Both: Age ≥18, histologically confirmed DT, RECIST v1.1 progression within 12 months, treatment naive or previously treated allowed, ECOG ≤2 (Consensus 0-1 with 2 as exploratory; FDA ≤2—aligned), no prior GSI. 3/3 subdimensions consistent (biomarker: no specific requirement; line of therapy: all lines; key exclusions: prior GSI). |
| 10 | operational | partial | 3 subdimensions: (1) Geographic: both global multicenter — match; (2) Biomarker: neither has CDx requirement — match; (3) Dosing: FDA 150mg BID; Consensus does not specify exact dose (only "continuous oral dosing") — miss on dosing specifics. 2/3 = partial per rubric. |

> match: 4 | partial: 6 | miss: 0 | skip: 0
> match_score: 4/10 = 0.40 | weighted_score: (4 + 6×0.5)/10 = 0.70

---

## Key Divergence Notes

1. **PFS Assessor (Item 4)**: Solvers A+C chose investigator-assessed PFS primary based on SOP §4.1/4.7; FDA actual used BICR. This is a meaningful operational difference that affects trial cost and timeline (~$500K-$2M, 3-5 day delay per Consensus).

2. **Stratification Factors (Item 8)**: FDA used single factor; Consensus used two factors (added prior therapy). Consensus rationale: "treatment-naïve patients may have higher spontaneous regression rate"—clinically reasonable but different from FDA precedent.

3. **Interim Analysis (Item 7)**: FDA Review does not mention formal interim analysis; Consensus includes futility-only IA at 50% events. This represents a design difference though both use hierarchical testing.

4. **OS as Secondary (Item 5)**: FDA explicitly did not formally test OS; Consensus includes OS with harm threshold. This reflects evolving regulatory expectations but creates mismatch vs. actual FDA-approved design.

5. **Dose Specification (Item 10)**: Consensus omits specific dose (150mg BID), which was fixed in DeFi trial. This is a material operational gap.

---

## Summary Assessment

The Consensus answer demonstrates strong alignment with the FDA-approved DeFi trial design on core architecture (randomized double-blind placebo-controlled), control arm choice, primary endpoint type, eligibility criteria, and sample size magnitude. Key divergences are in PFS assessment methodology (investigator vs. BICR), stratification complexity, and specific operational parameters like dose specification. The differences are directionally reasonable (per SOP guidance) but create measurable gaps vs. the actual regulatory precedent.

**Scoring Confidence**: High — All comparisons trace to explicit FDA Review text and Consensus document sections.
