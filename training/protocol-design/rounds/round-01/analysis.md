## Analysis: Deucravacitinib [protocol-design] — Round 01

### Difference Classification

Only Items 2, 4, 7 scored partial. No misses.

| Item | AI vs FDA | Code | Explanation | SOP Action? |
|------|-----------|------|-------------|-------------|
| 2. control_arm | AI added "double-dummy" as explicit design element; FDA Review describes it as double-blind without naming double-dummy explicitly | **ALT** | AI's answer is technically more precise — double-dummy IS the method used to blind different formulations (tablet vs capsule). FDA Review simply says "double-blind." This is presentation style, not a design disagreement. | ❌ No SOP change |
| 4. endpoint_definition | AI omitted: (1) sPGA subscale detail (erythema/induration/scaling, averaged/rounded); (2) Full sensitivity analysis cascade (LOCF, LOCF+NRI hybrid, MI FCS 1000 datasets, tipping-point) | **KNOW** | AI captured the core response definition and NRI correctly, but the full sensitivity analysis suite for psoriasis NDA submissions is not in the SOP. The sPGA scoring method (averaging/rounding subscales) is a COA detail that could improve protocol completeness. | ✅ Propose SOP rule |
| 7. stat_framework | AI stated α=0.025 for co-primaries; FDA used α=0.05 two-sided for each co-primary, with α=0.025 reserved for each secondary branch | **KNOW** | The multiplicity structure for psoriasis co-primary endpoints is: each co-primary tested at full α=0.05 two-sided (since BOTH must pass = intersection-union test, no alpha penalty). The α=0.025 split applies only to the two secondary branches (vs placebo and vs apremilast). Current SOP Rule 5.2 discusses multiplicity correction but doesn't specify the co-primary intersection-union alpha convention. | ✅ Propose SOP rule |

### Consensus Divergence Analysis

Agent A and C were highly concordant (2/2 consensus on all 10 dimensions). Minor differences:
- Agent A assumed deuc PASI75 = 55%; Agent C assumed 58%. Both reasonable.
- Agent A placed PASI 90/100/sPGA 0 before apremilast comparisons in secondary hierarchy; Agent C placed apremilast comparisons first. The FDA actual used a dual-branch approach, which both agents partially captured.
- No [no-consensus] items → no SOP ambiguity signal from this round.

### Proposed SOP Updates (pending Step 5b/5c review)

#### Rule 1: Psoriasis Sensitivity Analysis Suite
**Target**: `sop/indications/psoriasis.md` → `## Trial Design`
**Code**: KNOW
**Rule text**: IF indication == "psoriasis" (or any dermatology binary endpoint NDA): → Sensitivity analyses for co-primary binary endpoints must include: (1) NRI (primary); (2) LOCF; (3) LOCF for placebo + NRI for active (hybrid); (4) Multiple imputation (MI) using fully conditional specification (FCS), ≥1000 datasets, Rubin's rules for pooling; (5) Tipping-point analysis. All five are standard for psoriasis NDA filings.
**Grounding**: [single-case: FDA-Review-Sotyktu, Section 8.1.3 "Methods for Handling Missing Data"]

#### Rule 2: Co-Primary Intersection-Union Alpha Convention
**Target**: `sop/core/protocol-design.md` → `## Step 5: Statistical Design`
**Code**: KNOW
**Rule text**: When co-primary endpoints use an intersection-union test (BOTH must be significant for trial success), each individual co-primary is tested at the FULL significance level (e.g., α=0.05 two-sided or α=0.025 one-sided) with no alpha splitting between them. The rationale: the probability of both passing by chance = α×α, so the family-wise error rate is already controlled. Alpha splitting (e.g., Bonferroni) applies only to SECONDARY endpoint testing branches, not to co-primaries under intersection-union.
**Grounding**: Need to verify against FDA Guidance or ICH E9. This is a well-established statistical principle (Berger 1982, intersection-union test). [single-case: FDA-Review-Sotyktu, Section 8.1.3 MTP]

### Rejected Rules
None.

### Notes
- Round 01 is a warm-up case (autoimmune/psoriasis). match_score 0.70 with weighted 0.85 is a strong baseline.
- The two KNOW gaps are both in statistical methodology details — expected for the first autoimmune case.
- No REG or STAT classification needed — all gaps are knowledge-based.
- Agent B timeout: likely due to excessive intelligence gathering (was still working on "JAAD paper statistical formula" when timed out). Consider increasing timeout for future rounds, or constraining search scope.
