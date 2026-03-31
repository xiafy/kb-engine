# evaluate.md — SAP Design Scoring Rubric

> **Version**: v1.0 | **Date**: 2026-03-31 | **Branch**: sap-design
> **Basis**: docs/sap-design-training-design.md §V + three-judge calibration design
> **Purpose**: Score AI SAP design answers against FDA-approved statistical analysis plans

---

## Scoring Principles

1. **Evaluate match quality, not document completeness** — the AI answer may be technically superior to the FDA plan, but if it differs, it scores `partial` or `miss`
2. **FDA Statistical Review is the ground truth** — specifically the approved analysis plan as described by the FDA statistical reviewer
3. **Methodological equivalence counts as match** — OBF ≈ Lan-DeMets OBF; Hierarchical ≈ Fixed-Sequence; stratified log-rank ≈ stratified Cox for primary method
4. **Quantitative dimensions require numerical comparison** — alpha values, IA timing, coverage rates must be computed, not just described
5. **Reasonable divergence gets partial** — if direction is correct but specific implementation differs, give `partial` not `miss`

---

## Calibration Rules (Judges Must Read Before Scoring)

### Rule A: "Methodologically equivalent" definition

> Two methods are **equivalent** if they address the same statistical problem, make the same distributional assumptions, and yield the same or nearly identical inference under typical conditions.

- ✅ Equivalent: OBF spending ≈ Lan-DeMets OBF; stratified log-rank ≈ Cox with stratification; Clopper-Pearson ≈ exact binomial CI
- ✅ Equivalent: Hierarchical testing ≈ Fixed-sequence testing ≈ Graphical approach (gatekeeping) when same testing order
- ❌ Not equivalent: MMRM ≠ LOCF (different assumptions); GSD ≠ fixed design (different alpha control); MAR ≠ MNAR imputation

### Rule B: Boundary cases — use conservative direction

- Between `match` and `partial` → give `partial`
- Between `partial` and `miss` → give `partial`
- When genuinely uncertain after applying the rubric → give `partial`

### Rule C: Independence principle

Each dimension's score must be independent of other dimensions. Do not inflate Dimension 2 because Dimension 1 scored well.

### Rule D: "What this dimension evaluates" takes priority over intuition

If your intuition conflicts with the dimension definition, follow the definition. Each dimension's "Evaluation Object" and "Hard Boundaries" are non-negotiable.

### Rule E: Judgment examples take precedence

When a judgment example exactly matches the situation → apply that example score directly without independent reasoning.

### Rule F: Single-arm trials

For single-arm (accelerated approval) cases: Dimensions 2 (multiplicity_control) and 3 (interim_analysis) are typically `skip`. Dimension 4 (analysis_sets) evaluates the single-arm primary efficacy population.

### Rule G: Quote requirement

Every scored dimension's `rationale` must quote the specific FDA Review text that supports the ground truth answer. If no direct quote is available, mark `[inferred from: {section}]`.

---

## 9 Scoring Dimensions

---

### Dimension 1: Primary Analysis Method (`primary_analysis_method`)

**Evaluation Object**: The statistical method chosen for the primary endpoint analysis — method family, model type, and key parameters (stratification, covariates, distributional assumptions).

**Not evaluated here**: Endpoint type itself (given input), sample size (Dim 8), estimand (Dim 9), analysis set (Dim 4).

| Score | Standard |
|-------|----------|
| `match` | Method family AND key parameters consistent (stratified log-rank + Cox with same strat factors; MMRM with same covariance; exact binomial CI for single-arm) |
| `partial` | Same method family, different parameters (unstratified vs stratified; Cox with different covariates; MMRM vs ANCOVA; Wald CI vs Clopper-Pearson) |
| `miss` | Different method family entirely (log-rank vs Wilcoxon; MMRM vs LOCF; CMH vs log-rank) |
| `skip` | Primary endpoint type non-standard; method cannot be determined |

**Single-arm rule**: Evaluate whether correct exact method was selected (Clopper-Pearson vs Wilson vs Wald for binary).

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: stratified log-rank + Cox PH (all 3 strat factors) / FDA: same | `match` | Method and parameters identical |
| AI: unstratified log-rank + Cox PH / FDA: stratified log-rank + Cox PH | `partial` | Same family, stratification missing |
| AI: MMRM with UN covariance / FDA: MMRM with CS covariance | `partial` | Same method, different covariance structure |
| AI: LOCF-based ANCOVA / FDA: MMRM (MAR) | `miss` | Fundamental assumption difference |
| AI: Clopper-Pearson 95% CI / FDA: same (single-arm ORR) | `match` | Exact method consistent |
| AI: Wald CI for ORR / FDA: Clopper-Pearson CI | `partial` | Both CI methods for binary; Wald approximate vs CP exact |

---

### Dimension 2: Multiplicity Control (`multiplicity_control`)

**Evaluation Object**: Alpha allocation strategy — strategy family, alpha values per endpoint, recycling rules, testing sequence gates.

**Not evaluated here**: IA count (Dim 3), whether endpoints were met.

| Score | Standard |
|-------|----------|
| `match` | Strategy family consistent AND alpha allocation direction consistent (alpha values within ±0.01; recycling rule present if FDA has it) |
| `partial` | Strategy family consistent but alpha values differ >0.01; OR family consistent but recycling missing; OR testing order differs |
| `miss` | Strategy family fundamentally different (Hierarchical vs Bonferroni); OR multiplicity completely ignored when FDA has formal control |
| `skip` | Single primary with no key secondaries in multiplicity control |

**Single-arm rule**: Typically `skip` unless multiple cohorts have formal inferential goals.

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: Fixed-sequence PFS→OS hierarchical / FDA: same | `match` | Strategy and order identical |
| AI: Graphical testing, PFS 50%+OS 50% / FDA: Hierarchical PFS→OS | `match` | Both closed testing; direction consistent (Rule A) |
| AI: Alpha split PFS α=0.01+OS α=0.04 with recycling / FDA: same | `match` | Values and recycling identical |
| AI: PFS α=0.025+OS α=0.025 / FDA: PFS α=0.01+OS α=0.04 | `partial` | Both alpha-split, values meaningfully different |
| AI: Bonferroni 0.0125 each / FDA: Hierarchical testing | `miss` | Independent vs sequential — fundamentally different |
| AI: No multiplicity / FDA: Hierarchical PFS→OS→DOR | `miss` | Complete omission |

**Hard boundary**: Bonferroni where FDA uses sequential/hierarchical (or vice versa) is always `miss`.

---

### Dimension 3: Interim Analysis (`interim_analysis`)

**Evaluation Object**: IA count, information fraction timing, alpha spending function, futility boundary.

**Not evaluated here**: Specific critical z-values, DMC charter, adaptive design features.

| Score | Standard |
|-------|----------|
| `match` | IA count identical AND spending function family consistent AND timing within ±10% IF |
| `partial` | IA count identical but function differs (OBF vs Pocock); OR timing >10% IF; OR futility mismatch |
| `miss` | IA count differs by ≥1; OR fixed design vs GSD mismatch |
| `skip` | Both AI and FDA have no IA (fixed design confirmed) |

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: 1 IA at 50% IF, OBF / FDA: 1 IA at 50% IF, Lan-DeMets OBF | `match` | Count, timing, family all consistent |
| AI: 1 IA at 50% IF, OBF / FDA: 1 IA at 60% IF, OBF | `partial` | Timing difference at boundary |
| AI: 1 IA at 50%, Pocock / FDA: 1 IA at 75%, OBF | `partial` | Count consistent, function and timing differ |
| AI: No IA / FDA: 1 IA at 75% IF | `miss` | Fixed vs GSD is fundamental |
| AI: 2 IAs / FDA: No IA | `miss` | Fundamental design mismatch |

**Hard boundary**: Presence vs absence of IA is always `miss`.

---

### Dimension 4: Analysis Sets (`analysis_sets`)

**Evaluation Object**: Primary analysis set selection (ITT/FAS/mITT/PP) for primary efficacy analysis.

**Not evaluated here**: Secondary analysis set definitions, safety population, PK population.

| Score | Standard |
|-------|----------|
| `match` | Primary analysis set type matches (ITT≈FAS for superiority; PP for NI primary) |
| `partial` | Adjacent but not identical (FAS vs mITT); OR NI trial uses ITT as primary when PP should be primary |
| `miss` | Fundamentally different (PP vs ITT for superiority; single-arm efficacy population misspecified >20%) |
| `skip` | Cannot be determined from protocol parameters |

**NI trial rule**: PP must be primary in NI trials. AI uses only ITT → max `partial`. AI completely omits PP → `miss`.

**Single-arm rule**: Evaluate whether FDA-defined primary efficacy population was correctly identified.

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: ITT (all randomized) / FDA: FAS (all randomized ≥1 dose) | `match` | Both all-randomized type |
| AI: mITT (≥1 dose + ≥1 post-baseline) / FDA: FAS (all randomized) | `partial` | Both ITT philosophy, mITT has extra exclusions |
| AI: PP for superiority primary / FDA: ITT for superiority | `miss` | PP as primary in superiority is fundamental error |
| AI: ITT only for NI trial / FDA: PP primary + ITT sensitivity | `partial` | NI requires PP primary; ITT-only misses this |
| AI: Cohort 1 all (N=75) / FDA: Restricted efficacy (N=71) | `partial` | Right cohort, wrong restriction |

---

### Dimension 5: Missing Data Handling (`missing_data`)

**Evaluation Object**: Missing data strategy — assumed mechanism, primary handling method, sensitivity analysis plan.

**Not evaluated here**: Missing data rates, data collection procedures, analysis set exclusions (Dim 4).

| Score | Standard |
|-------|----------|
| `match` | Primary method family consistent AND ≥1 sensitivity method family consistent |
| `partial` | Primary consistent but no sensitivity match; OR primary adjacent (MI-MAR vs MMRM-MAR) with some overlap |
| `miss` | Primary assumes fundamentally different mechanism (MCAR vs MAR); OR no missing data strategy at all |
| `skip` | FDA explicitly notes missing data negligible (<2%) |

**Method family definitions**:
- TTE: KM with censoring rules = MAR assumption → "TTE-censoring" family
- Continuous: MMRM (MAR) vs ANCOVA-complete-cases (MCAR) → different families
- Binary: Complete case (MCAR) vs NRI/BOCF/MI (various)

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: KM censoring + RMST + MI sensitivity / FDA: KM censoring + tipping point | `match` | Primary consistent; sufficient sensitivity overlap |
| AI: MMRM (MAR) + ANCOVA complete case / FDA: MMRM (MAR) + pattern mixture | `partial` | Primary consistent; sensitivity methods differ |
| AI: LOCF primary / FDA: MMRM (MAR) primary | `miss` | LOCF=MCAR vs MMRM=MAR — fundamental difference |
| AI: No missing data discussion / FDA: MMRM + 2 sensitivities | `miss` | Complete omission |

**Hard boundary**: MCAR primary (LOCF/complete-case for continuous) vs MAR primary (MMRM) is always `miss`.

---

### Dimension 6: Subgroup Analysis (`subgroup_analysis`)

**Evaluation Object**: Coverage of pre-specified subgroup list.

**Not evaluated here**: Subgroup analysis results, post-hoc analyses.

**Coverage**: `AI matching subgroups / FDA pre-specified total`

| Score | Standard |
|-------|----------|
| `match` | Coverage ≥ 70% |
| `partial` | Coverage 30–69% |
| `miss` | Coverage < 30% OR all stratification factors omitted |
| `skip` | FDA Review explicitly states no pre-specified subgroups |

**Mandatory rule**: Omitting ANY stratification factor → max `partial`.

**"Match" definition**: Clinical meaning the same. "ECOG 0 vs 1-2" ≈ "ECOG 0 vs ≥1" = match.

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| FDA: 8 subgroups; AI: 7 match (88%) | `match` | Coverage ≥ 70% |
| FDA: 10 subgroups; AI: 5 match (50%), all strat factors covered | `partial` | Coverage 50%, within 30-69% |
| FDA: 10 subgroups; AI: 2 match (20%) | `miss` | Coverage < 30% |
| AI: No subgroup analysis at all | `miss` | Required element of SAP |

---

### Dimension 7: Sensitivity Analyses (`sensitivity_analyses`)

**Evaluation Object**: Sensitivity analysis plan for the primary analysis (robustness).

**Not evaluated here**: Missing data sensitivities (Dim 5), post-hoc analyses.

| Score | Standard |
|-------|----------|
| `match` | ≥2 sensitivity analyses AND ≥1 method family consistent with FDA |
| `partial` | Has sensitivities but all differ from FDA; OR only 1 sensitivity analysis |
| `miss` | No sensitivity analyses specified |
| `skip` | FDA explicitly states no pre-specified sensitivities (extremely rare) |

**Common types**: PP analysis, crossover adjustment (RPSFT), alternative censoring, BICR vs investigator, RMST, excluding major deviations.

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: PP + crossover (RPSFT) / FDA: PP + crossover (RPSFT) + alt censoring | `match` | 2+ analyses, PP family matches |
| AI: PP + RMST / FDA: crossover + alt censoring | `partial` | 2 analyses but neither matches FDA |
| AI: Only PP analysis (1) / FDA: 3 sensitivities | `partial` | Insufficient breadth |
| AI: No sensitivities / FDA: PP + crossover | `miss` | Complete omission |

**Hard boundary**: Do not double-count Dim 5 missing data sensitivities. Only non-missing-data sensitivities count here.

---

### Dimension 8: Sample Size Method (`sample_size_method`)

**Evaluation Object**: The statistical method used to calculate sample size AND key assumptions driving the calculation. **Does NOT re-evaluate the N itself** (N is a fixed protocol input).

**Not evaluated here**: The N number, administrative assumptions (screen failure, accrual timeline).

| Score | Standard |
|-------|----------|
| `match` | Method family consistent (Schoenfeld ≈ events-based; exact binomial ≈ Simon) AND key assumptions direction consistent (HR within ±0.05; control median within ±20%; power same) |
| `partial` | Method consistent but assumptions differ (HR diff >0.05; control median diff >20%); OR method different but same family |
| `miss` | Method family different (events-based vs fixed-N; no calculation method specified) |
| `skip` | Single-arm with no formal power calculation (descriptive only, confirmed by FDA) |

**Key assumptions** (all must be checked):
- Hazard ratio (HR) or effect size
- Control arm median (for TTE)
- Power level (80% vs 90%)
- Alpha level (one-sided 0.025)
- Dropout rate assumption

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: Schoenfeld formula, HR=0.70, control mPFS=6mo, 90% power / FDA: same | `match` | Method and assumptions identical |
| AI: Schoenfeld, HR=0.70, 90% power / FDA: Schoenfeld, HR=0.75, 90% power | `partial` | Same method, HR differs by 0.05 (boundary) |
| AI: Schoenfeld, HR=0.70, 80% power / FDA: Schoenfeld, HR=0.70, 90% power | `partial` | Same method, power level differs |
| AI: "N was based on clinical judgment" / FDA: Schoenfeld with explicit assumptions | `miss` | No formal method |
| AI: Simon two-stage design / FDA: Single-stage exact binomial | `partial` | Both binary endpoint methods, different design framework |

**Hard boundary**: If no calculation method is specified → always `miss`.

---

### Dimension 9: Estimand Framework (`estimand_framework`)

**Evaluation Object**: Whether ICH E9(R1) estimand was defined — 5 attributes + intercurrent event (IE) handling strategies.

**Not evaluated here**: The endpoint type itself (given), analysis method (Dim 1).

| Score | Standard |
|-------|----------|
| `match` | All 5 attributes defined AND IE strategies consistent with FDA (treatment policy for subsequent therapy; composite for death in PFS; same handling for discontinuation) |
| `partial` | Estimand described but incomplete (missing 1-2 attributes); OR IE strategies differ for ≥1 event type |
| `miss` | No estimand framework; OR IE strategies fundamentally different (treatment policy vs hypothetical for the same IE) |
| `skip` | N/A — estimand should always be evaluated (mark [implicit-estimand] for pre-2021 cases) |

**Pre-2021 rule**: FDA Reviews before 2021 may not explicitly state an estimand. Extract the implicit estimand from censoring rules and analysis approach. Mark as `[implicit-estimand]` but still score.

**5 attributes**:
1. Target population
2. Treatment condition
3. Variable (endpoint)
4. Intercurrent event handling strategy
5. Summary measure (HR, rate difference, RMST)

**Judgment Examples**:

| Scenario | Score | Rationale |
|----------|-------|-----------|
| AI: All 5 attributes + treatment policy for subsequent therapy / FDA: same | `match` | Complete and consistent |
| AI: 4/5 attributes (missing summary measure) + IE strategies consistent | `partial` | Incomplete but direction correct |
| AI: Lists IE strategies but no formal estimand structure / FDA: full E9(R1) | `partial` | Substance present but framework incomplete |
| AI: No estimand discussion / FDA: Full E9(R1) framework | `miss` | Complete omission |
| AI: Hypothetical strategy for treatment discontinuation / FDA: treatment policy | `miss` | Fundamental strategy difference for same IE |
| AI: Implicit estimand extracted from censoring rules [implicit-estimand] / FDA: [implicit-estimand] pre-2021 | `match` | Both implicit; IE handling consistent |

---

## Scoring Formula

```
match_count = count(score == "match")
partial_count = count(score == "partial")
miss_count = count(score == "miss")
skip_count = count(score == "skip")
total_items = 9 - skip_count

match_score = match_count / total_items  (2 decimal places)
weighted_score = (match_count * 1.0 + partial_count * 0.5) / total_items  (2 decimal places)
```

**Primary metric**: `match_score` (strict match rate, for convergence)
**Auxiliary metric**: `weighted_score` (partial = half credit, for progress tracking)

---

## Single-Arm / Accelerated Approval Special Handling

When `regulatory_pathway` includes "Accelerated Approval":

| Dimension | Adjustment |
|-----------|-----------|
| `multiplicity_control` | → `skip` (typically no formal multiplicity) |
| `interim_analysis` | → `skip` (single-arm typically no IA) |
| `analysis_sets` | Evaluate primary efficacy population identification |
| `sample_size_method` | Evaluate descriptive/exact method selection |
| `estimand_framework` | Still evaluate (even single-arm should define estimand) |

**Applicable total items reduces to 7** (skip 2).

---

## Scoring Discipline

1. **No self-leniency** — if your answer differs from FDA, score by match degree, not by quality
2. **Cite source text** — every rationale must reference specific FDA Review text
3. **When uncertain, score conservatively** — `partial` over `match`
4. **Maintain consistency** — same divergence type gets same score across cases
5. **Judgment examples first** — if a table example matches, apply it directly
6. **Classify before scoring** — first confirm "which dimension does this difference belong to?"
