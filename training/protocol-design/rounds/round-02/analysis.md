## Analysis: Orgovyx [protocol-design] — Round 02

> Round 02 | Case: 15-orgovyx | Branch: protocol-design
> Solvers: A (kimi) / B (minimax) / C (minimax)
> Judges: J1 (kimi) / J2 (minimax) / J3 (minimax)
> match_score: 0.50 | weighted_score: 0.65

---

## Difference Classification

| # | Item | Score | Code | Description |
|---|------|-------|------|-------------|
| 1 | design_type | partial | ALT | AI: "superiority trial"; FDA: same RCT but primary analyzed as single-arm. Both are valid; AI's framing is clinically standard, FDA used class-specific convention. |
| 4 | endpoint_definition | miss | KNOW | AI: binary proportion (T<50 at all visits, NRI). FDA: KM cumulative probability with Greenwood CI. SOP doesn't specify the KM method for ADT castration rate. |
| 7 | stat_framework | miss | KNOW | AI: superiority→NI hierarchical, α=0.025 one-sided, 1 interim. FDA: single-arm CI lower bound ≥90%, no NI, no interim. FDA explicitly rejected NI — this is an ADT-class-specific regulatory convention not captured in SOP. |
| 8 | stratification | partial | KNOW | Age cutoff wrong (<65/≥65 vs FDA ≤75/>75). The ≤75/>75 cutoff is prostate-cancer-specific (elderly population). |
| 9 | eligibility | partial | KNOW | AI missed: taxane exclusion, brain metastases exclusion. AI added: MACE 6mo, QTcF >450ms, hepatic, CYP3A4/P-gp — these are reasonable but not in FDA. |

### Summary by Code

| Code | Count | Items |
|------|-------|-------|
| KNOW | 4 | Items 4, 7, 8, 9 |
| ALT | 1 | Item 1 |
| STAT | 0 | — |
| REG | 0 | — |
| INFO | 0 | — |

---

## Rule Extraction (KNOW items → SOP candidates)

### R-NEW-1: ADT class primary analysis = single-arm threshold, not RCT superiority
**Finding**: For GnRH agonist/antagonist ADT drugs, FDA evaluates the primary endpoint as a single-arm confidence interval (KM estimate of sustained castration rate, lower bound 95% CI ≥90%), NOT as a between-arm superiority or NI comparison — even when the trial is randomized with an active comparator.

**Evidence**: FDA MultidisciplineR: "the preferred FDA approach to evaluation of GnRH analogues is to consider only whether the single investigational arm demonstrates attainment of a castrate (<50 ng/dL) testosterone level that is maintained until the end of a treatment period." FDA explicitly rejected NI design. FDA communicated that "a two-arm trial was not necessary for approval."

**Target**: `sop/indications/prostate-adt.md ## Trial Design` + `sop/indications/prostate-adt.md ## Endpoint Selection`

### R-NEW-2: ADT primary endpoint uses KM cumulative probability, not binary proportion
**Finding**: The sustained castration rate is calculated as a KM estimate of cumulative probability of maintaining T<50 ng/dL (survival-analysis methodology), with 95% CI via exponential Greenwood formula using log-log transformation. Success criterion: lower bound of 95% CI ≥90%.

**Evidence**: FDA SAP review: "the cumulative probability of testosterone suppression to < 50 ng/dL from Week 5 Day 1 (Day 29) through Week 49 Day 1 (Day 337) was estimated for each treatment group using the Kaplan-Meier method. The 95% CI for the Kaplan-Meier estimation was calculated using the exponential Greenwood formula via log-log transformation of the survival function."

**Target**: `sop/indications/prostate-adt.md ## Endpoint Selection`

### R-NEW-3: ADT stratification age cutoff = ≤75/>75 (not 65)
**Finding**: For prostate cancer ADT trials, the standard age stratification cutoff is ≤75/>75, reflecting the elderly-predominant disease and the different CV risk profile above 75.

**Evidence**: HERO trial stratification: "age (≤75 years old or >75 years old)"

**Target**: `sop/indications/prostate-adt.md ## Trial Design`

### R-NEW-4: ADT exclusion criteria should include taxane history and brain metastases
**Finding**: FDA's actual exclusion included: (1) previously treated with or expected to receive taxanes within 2 months of ADT initiation; (2) brain metastases excluded (but other metastatic sites allowed).

**Evidence**: MultidisciplineR eligibility section.

**Target**: `sop/indications/prostate-adt.md ## Eligibility Criteria`

---

## Deviation Events

### SYS Deviations
- Solver A (sonnet): 3× LiveSessionModelSwitchError (7s each). Degraded to kimi model. Root cause: subagent model switch system bug with sonnet.
- Total wasted time: ~21s + 3 retry cycles

### Solver Behavior Variance

#### SOP Consistency
- All 3 Solvers read the same prostate-adt SOP and consistently applied it: open-label RCT with active comparator, T ≥150 baseline, etc.
- All 3 Solvers consistently made the SAME error: framing as superiority/NI RCT → SOP itself is the root cause (SOP says "primary endpoint remains sustained testosterone suppression rate" but doesn't specify the single-arm threshold analysis)

#### SOP Deviations
- None. All 3 Solvers followed SOP rigorously — the SOP just doesn't contain the critical knowledge about single-arm threshold analysis.

#### Extra-SOP Actions
- Solver B (minimax): correctly noted HERO enrolled 934 "for CV safety characterization" and flagged 459 as sufficient for efficacy → this is a valuable insight about the gap between statistical sufficiency and regulatory expectations.
- Solver C (minimax): proposed 2 interim analyses including sample size re-estimation (W36) → more elaborate than FDA's no-interim approach.

#### Cross-Model Patterns
- **kimi vs minimax on sample size**: kimi targeted 934 (matching HERO exactly), minimax-B calculated bare minimum 459 then noted 900+ as SDP. Minimax-B showed more analytical thinking about why N was larger than statistically needed.
- **kimi vs minimax on exclusions**: kimi included fewer specific exclusions; both minimax solvers included more detailed drug interaction exclusions (CYP3A4/P-gp). This suggests minimax may be more conservative on safety-related I/E.
- **3rd stratification factor**: kimi chose age ≤75/>75 (correct!), minimax-B chose <65/≥65, minimax-C chose ECOG. Kimi was closest to FDA on this dimension.

---

## Grounding Notes (for Step 5c)

R-NEW-1 and R-NEW-2 need grounding check:
- Search FDA Guidance: "Developing Gonadotropin Releasing Hormone Analogs" or similar
- Check if single-arm threshold is specified in Guidance or only in case precedent
