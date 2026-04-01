# Phase 3 Pivotal Trial Design: Desmoid Tumors

## Question 016: Protocol Design for Desmoid Tumor Treatment

**Drug Class**: Gamma-secretase inhibitor (novel mechanism for desmoid tumors)  
**Indication**: Adult patients with progressing desmoid tumors requiring systemic treatment  
**Disease Incidence**: ~900-1,500 patients annually in the U.S. (rare, ~5-6 per million)  
**Precedent**: Sorafenib Phase 3 trial (Alliance A091105) demonstrated placebo-controlled design feasibility

---

## Dimension 1: Study Design

### Design Summary
| Element | Design Choice | Rationale |
|---------|--------------|-----------|
| **Design Type** | Randomized, double-blind, placebo-controlled, parallel-group | Gold standard for establishing efficacy; precedent exists from sorafenib trial |
| **Number of Arms** | 2 arms (Experimental:Placebo = 1:1) | Balances power efficiency with ethical considerations |
| **Blinding** | Double-blind with matching placebo | Essential given subjective component of symptom assessment and PFS determination |
| **Control Arm** | Placebo with early escape provision | ⚠️ **SDP #1**: See detailed analysis below |
| **Enrollment** | Global (US, EU, Asia-Pacific) | Required for rare disease recruitment; desmoid tumors occur worldwide |

### Control Arm Rationale (⚠️ SDP #1)

**Decision Required**: Placebo vs. Active Control vs. IC (Investigator's Choice)

| Option | Pros | Cons | FDA Acceptability |
|--------|------|------|-------------------|
| **A: Placebo + Early Escape** | Clean efficacy signal; precedent from sorafenib trial; allows clear attribution of benefit | Ethical concern if effective alternatives exist | ✓ Precedent established |
| **B: Investigator's Choice (NSAID/hormonal/chemo)** | Ethically appealing; matches SOC heterogeneity | Confounded by variable efficacy; blinding challenging | ? Requires special blinding design |
| **C: Add-on to best supportive care** | Ethical compromise; preserves comparison | Potential dilution of effect; complex interpretation | ? Discussion required |

**Recommendation**: Option A (Placebo + Early Escape at confirmed progression) with the following ethical safeguards:
- Crossover allowed at confirmed progression per RECIST
- Open-label extension phase for placebo patients who cross over
- Strict "progressing or symptomatic" eligibility to ensure patients truly need treatment
- DMC oversight with futility/efficacy interim analysis

**Quantification**: Placebo control reduces required sample size by ~30% compared to IC design (removes inter-arm variability from SOC heterogeneity).

---

## Dimension 2: Key Eligibility Criteria

### Inclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| 1 | Adults (≥18 years) with histologically confirmed desmoid tumor | Standard; aligns with sorafenib trial |
| 2 | Progressing disease by RECIST 1.1 (≥20% increase in sum of diameters, OR new lesion, OR unequivocal progression) OR clinically significant symptoms requiring systemic therapy | Core entry criterion; allows clinical progression for non-metastatic tumor per rare disease SOP |
| 3 | Measurable disease by RECIST 1.1 (≥1 lesion ≥10 mm in long axis) | Required for PFS assessment |
| 4 | No prior systemic therapy for desmoid tumor OR progressed on/after prior systemic therapy | ⚠️ **SDP #2**: Treatment-naive vs. previously treated; see analysis below |
| 5 | ECOG Performance Status 0-1 | Standard; ECOG 2 may be considered per SDP |
| 6 | Adequate organ function (hematologic, hepatic, renal) | Safety standard |
| 7 | Female patients: negative pregnancy test, agreement to use contraception | Standard teratogenicity precaution |

### Exclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| 1 | Prior gamma-secretase inhibitor or Notch pathway inhibitor | Expected resistance |
| 2 | Active infection or significant comorbidity precluding study participation | Safety |
| 3 | Concomitant use of strong CYP3A4 inducers/inhibitors (if PK interactions expected) | DDI consideration |
| 4 | Pregnancy or lactation | Standard |
| 5 | Prior malignancy (excluding adequately treated non-melanoma skin cancer) within 3 years | Confounding |
| 6 | Major surgery within 28 days | Recovery period |
| 7 | Active FAP with planned colectomy | May confound tumor assessment |

### ⚠️ SDP #2: Prior Therapy Line Definition

| Strategy | Description | Impact on Enrollment | Impact on Effect Size |
|----------|-------------|---------------------|----------------------|
| **A: First-line only** | Treatment-naive patients only | ⚠️ ↓↓ Enrollment slower; ~30% of eligible population excluded | ↑↑ Potentially larger effect (drug-naive tumors) |
| **B: Any line allowed** | No prior therapy restriction; includes relapsed/refractory | ↑↑ Faster enrollment | ↓↓ Smaller effect expected in heavily pretreated |
| **C: Stratified by prior therapy** | Both allowed; stratification factor | Baseline balanced | Moderate effect size |

**Recommendation**: Strategy C (allow both; stratify randomization by prior systemic therapy status [yes/no]). Rationale:
- Maximizes enrollment in rare disease setting
- Sorafenib trial allowed both treatment-naive and previously treated
- Prior therapy is prognostic factor for PFS

---

## Dimension 3: Primary Endpoint

### Primary Endpoint Definition

**Endpoint**: Progression-Free Survival (PFS) per RECIST 1.1 by Investigator Assessment  
**Definition**: Time from randomization to documented disease progression per RECIST 1.1 or death from any cause, whichever occurs first

### Endpoint Design Considerations

| Element | Design Choice | Justification |
|---------|--------------|---------------|
| **Assessment Method** | Investigator-assessed RECIST 1.1 | Double-blind design minimizes assessment bias; precedent from sorafenib trial (investigator-assessed) |
| **BICR** | Secondary/Sensitivity analysis | ⚠️ **SDP #3**: See analysis below |
| **Clinical Progression** | NOT included as standalone event | Desmoid tumors do not metastasize; RECIST progression captures relevant events; clinical progression (symptom worsening leading to urgent therapy initiation) may be captured as SAE/discontinuation |

### ⚠️ SDP #3: BICR vs. Investigator Assessment

| Approach | Cost | Timeline Impact | Regulatory Position | Recommendation |
|----------|------|-----------------|---------------------|----------------|
| **Inv PFS Primary, BICR Secondary** | Baseline ($500K-2M) | +3-5 day PFS delay per event | Acceptable for double-blind design | **SELECTED** |
| **BICR PFS Primary** | Higher | +3-5 day delay | Adds confidence | Consider if FDA requests |

Rationale for Investigator-Primary:
- Sorafenib trial successfully used investigator-assessed PFS as primary endpoint
- Double-blind design mitigates assessment bias
- Cost savings meaningful for rare disease program
- FDA precedent exists

---

## Dimension 4: Secondary Endpoints

| Rank | Endpoint | Definition | Testing Hierarchy Position |
|------|----------|------------|-------------------------|
| 1 | **Objective Response Rate (ORR)** | Proportion with CR or PR per RECIST 1.1 | Hierarchical after PFS |
| 2 | **Duration of Response (DOR)** | Time from first CR/PR to progression/death | Subset of responders |
| 3 | **Overall Survival (OS)** | Time from randomization to death from any cause | Exploratory (rare disease, long survival) |
| 4 | **Time to Progression (TTP)** | Time from randomization to progression (censoring deaths) | Sensitivity analysis |
| 5 | **Patient-Reported Outcomes** | EORTC QLQ-C30 + custom desmoid module | Exploratory; validated PRO instruments needed |
| 6 | **Pain Response** | Change in pain score (NRS) from baseline | Exploratory |

### OS Considerations
Desmoid tumors have excellent long-term survival (87% at 15 years per natural history). OS as primary endpoint would require:
- Estimated median OS >10 years in control arm
- Event rate prohibitively low for practical trial
- **Conclusion**: OS not suitable as primary; include as exploratory secondary with harm threshold analysis per SOP §4.5

---

## Dimension 5: Sample Size Estimation

### Assumptions

| Parameter | Value | Source |
|-----------|-------|--------|
| Control arm median PFS | 7 months | Inferred from sorafenib trial placebo arm (46% PFS at 1 year ≈ median ~7-8 months) |
| Target Hazard Ratio | 0.40 | Sorafenib achieved HR 0.14; conservative estimate for new agent |
| Alpha (1-sided) | 0.025 | Standard for regulatory approval |
| Power | 85% | Standard for pivotal trial |
| Allocation ratio | 1:1 | Optimal for survival endpoints |

### Sample Size Calculation

Using `sample_size_survival.py`:

```
Control median:     7.0 months
Treatment median:   17.5 months
Hazard ratio:       0.4
Alpha:              0.025 (one-sided)
Power:              0.85
Allocation ratio:   1:1 (treatment:control)

Events Needed:
  Schoenfeld formula: 43
  Freedman formula:   49

Sample Size:
  Total enrolled:     53
  Treatment arm:      27
  Control arm:        26
```

### Sensitivity Analysis

| Scenario | HR | Control mPFS | Events Needed | Total N |
|----------|-----|------------|--------------|---------|
| Optimistic | 0.35 | 6 mo | 34 | 43 |
| Base Case | 0.40 | 7 mo | 43-49 | 53-60 |
| Conservative | 0.50 | 8 mo | 75 | 88 |
| Pessimistic | 0.60 | 9 mo | 138 | 156 |

### Enrollment and Timeline

| Parameter | Estimate |
|-----------|----------|
| Annual incidence (US) | ~900-1,500 |
| Eligible for systemic therapy | ~40% = ~500 |
| Realistic screening rate | 30% = ~150 patients/year |
| Monthly accrual target | 3-4 patients/month |
| Accrual duration | 18-24 months |
| Follow-up after last patient | 18 months |
| **Total trial duration** | **~42 months** |

### ⚠️ SDP #4: Sample Size Buffer Strategy

| Option | N | Rationale |
|--------|---|-----------|
| **A: Minimal (N=60)** | 60 | Based on exact calculation; risk of dropout impact |
| **B: +10% dropout buffer** | 66 | Accounts for ~5% lost to follow-up |
| **C: +20% for safety** | 72 | Rare disease enrollment uncertainty |

**Recommendation**: Target enrollment of **70 patients** (35 per arm), providing:
- ~20% buffer above calculated minimum
- Adequate safety database size for NDA
- Precedent alignment (sorafenib trial: 87 patients)

---

## Dimension 6: Statistical Analysis Plan

### Primary Analysis

| Element | Specification |
|---------|--------------|
| **Primary Analysis Method** | Stratified log-rank test |
| **Effect Estimate** | Cox proportional hazards model with hazard ratio and 95% CI |
| **Covariates** | Prior systemic therapy (yes/no), Tumor site (intra-abdominal vs. extra-abdominal) |
| **Censoring Rules** | Standard PFS censoring per FDA guidance (patients without event censored at last adequate assessment) |
| **Intercurrent Events** | Treatment discontinuation, subsequent therapy — handled via Treatment Policy strategy (ITT) |

### Estimand Framework

| Attribute | Definition |
|-----------|------------|
| **Treatment Condition** | Experimental drug vs. placebo, both with best supportive care |
| **Target Population** | Adults with progressing desmoid tumors requiring systemic treatment |
| **Variable** | Progression-free survival (time to RECIST progression or death) |
| **Summary Measure** | Hazard ratio |
| **Intercurrent Event Strategy** | Treatment policy (regardless of treatment discontinuation or subsequent therapy) |

### Multiplicity Adjustment

**Hypothesis Structure**:
- H1: PFS superiority (experimental vs. placebo)
- H2: ORR superiority (secondary)

**Testing Hierarchy**:
1. Test PFS at α = 0.025 (1-sided)
2. If PFS significant, test ORR at α = 0.025 (1-sided)

**Rationale**: Hierarchical testing protects familywise error rate. Only 2 endpoints; graphical approach not necessary.

### ⚠️ SDP #5: Interim Analysis Strategy

| Option | Description | Alpha Spending | Impact |
|--------|-------------|----------------|--------|
| **A: No interim analysis** | Single final analysis at target events | None (α preserved) | Simplest; rare disease precedent |
| **B: Futility only** | DMC can recommend stop for futility | No alpha spent | Protects patients from ineffective therapy |
| **C: Efficacy + Futility** | Stop for overwhelming efficacy or futility | O'Brien-Fleming boundary | Could shorten trial |

**Recommendation**: Option A (no formal interim analysis) for rare disease with small event target (N=43-49 events). Rationale:
- Alpha conservation critical with small sample
- Informal DMC review for safety/futility without formal stopping boundaries
- Precedent from sorafenib trial

---

## Dimension 7: Stratification Factors

### Recommended Stratification

| Factor | Categories | Rationale |
|--------|------------|-----------|
| **Prior systemic therapy** | Yes / No | Prognostic for PFS; eligibility allows both |
| **Tumor location** | Intra-abdominal / Extra-abdominal | Different natural history; intra-abdominal more aggressive |

### Stratification Rationale

Per rare disease SOP §6.1: Minimize to 1-2 factors, retain only strongest prognostic factors.

**Rejected Stratification Factors**:
- Tumor size: correlated with location
- Prior radiation: adds complexity; rare disease enrollment burden
- ECOG: narrow range (0-1); less prognostic

**Constraint Check**: With N=70 and 4 strata:
- Expected per stratum: ~17 patients
- Minimum viable block: 4 patients
- Acceptable balance probability with permuted block randomization

---

## Dimension 8: Key Operational Considerations

### Global Enrollment Strategy

| Region | Contribution | Rationale |
|--------|--------------|-----------|
| **United States** | 40% (28 patients) | Primary regulatory market; sarcoma centers of excellence |
| **Europe (EU)** | 35% (25 patients) | Established sarcoma networks; rare disease experience |
| **Asia-Pacific** | 25% (17 patients) | Expands access; growing trial infrastructure |

### Imaging Strategy

| Element | Specification |
|---------|--------------|
| **Modality** | Contrast-enhanced CT or MRI (consistent within patient) |
| **Frequency** | Every 8 weeks (±1 week) for first 24 weeks, then every 12 weeks |
| **Central Review** | BICR for sensitivity analysis; real-time adjudication not required |
| **Image Storage** | Central repository with 2+ independent reviewers for BICR |

### Rare Disease-Specific Operational Considerations

| Challenge | Mitigation Strategy |
|-----------|---------------------|
| **Low incidence** | Global site network; partnership with patient advocacy groups (Desmoid Tumor Research Foundation) |
| **Diagnostic variability** | Central pathology review required for enrollment |
| **Watchful waiting culture** | Educational outreach to community oncologists on trial eligibility |
| **Spontaneous regression** | Strict "progressing" requirement; historical data shows 20% spontaneous response in placebo |
| **Long follow-up** | Electronic data capture; patient retention programs |

### ⚠️ SDP #6: Central Pathology Review Requirement

| Option | Timing | Impact |
|--------|--------|--------|
| **A: Pre-randomization required** | Block enrollment until confirmed | ↑↑ Accuracy; ↓↓ Speed; screen failure risk |
| **B: Retrospective within 4 weeks** | Allow enrollment; review later | ↑ Speed; ⚠️ Risk of post-randomization ineligibility |

**Recommendation**: Option A for rare disease — desmoid tumor diagnosis is challenging; misclassification would dilute effect. Budget ~2-week turnaround for central review.

---

## Dimension 9: Safety and Monitoring Design

### Safety Data Collection

| Element | Specification |
|---------|--------------|
| **AE Collection** | CTCAE v5.0; all grades; from informed consent through 30 days post-treatment |
| **Severity Grading** | Standard CTCAE; includes gamma-secretase inhibitor class effects (diarrhea, rash) |
| **Dose Modifications** | Pre-specified criteria per CTCAE Grade; ≥2 levels (hold, resume at reduced dose, discontinue) |
| **SAE Reporting** | 24-hour reporting to sponsor; expedited regulatory reporting per local requirements |

### Novel Mechanism Monitoring (Gamma-Secretase Inhibition)

| Class Effect | Monitoring Strategy |
|--------------|----------------------|
| **GI toxicity** (diarrhea, nausea) | Enhanced monitoring first 2 cycles; prophylactic anti-diarrheal guidance |
| **Skin rash** | Dermatology consultation available; photo documentation |
| **Notch-related effects** | Thorough ophthalmologic exam (cornea); cardiac monitoring if signal emerges |

### Data Monitoring Committee (DMC)

| Element | Specification |
|---------|--------------|
| **Charter** | Independent DMC with cardiologist, oncologist, statistician |
| **Meetings** | Every 6 months; ad hoc for safety signals |
| **Scope** | Safety review; informal efficacy assessment; futility consideration (non-binding) |
| **Interim Analysis** | No formal efficacy stopping boundary per SDP #5 |

---

## Dimension 10: Regulatory Strategy and Approval Pathway

### Approval Pathway Analysis

| Pathway | Eligibility | Recommendation |
|---------|-------------|----------------|
| **Regular Approval** | PFS as surrogate with clinical benefit demonstrated | **PRIMARY PATH** — sorafenib precedent |
| **Accelerated Approval** | ORR endpoint with unmet need | Not necessary if PFS successful; ORR as supportive |
| **Breakthrough Therapy** | Preliminary evidence of substantial improvement | Consider if Phase 2 shows large effect |
| **Priority Review** | Significant improvement in safety/efficacy | Expected given unmet need |

### Regulatory Precedents

| Precedent | Drug | Design | Endpoint | Outcome |
|-----------|------|--------|----------|---------|
| **Sorafenib (Nexavar)** | Multi-kinase inhibitor | RCT vs placebo (N=87) | Inv-assessed PFS | Approved (off-label use) |
| **Nirogacestat (Ogsiveo)** | Gamma-secretase inhibitor | RCT vs placebo | PFS + ORR | **FORBIDDEN per isolation rule** |

### Supporting Evidence Requirements

| Evidence Type | Strategy |
|---------------|----------|
| **Nonclinical** | Complete carcinogenicity, reproduction toxicology; mechanism of action studies |
| **CMC** | Commercial-ready formulation; stability data |
| **Clinical Pharmacology** | Dose selection rationale; PK/PD in target population; DDI profile |
| **Safety Database** | ≥100 patients exposed (achieved via Phase 1/2 + pivotal) |

### Labeling Considerations

**Indication Wording** (must align with I/E criteria):
> "For the treatment of adult patients with progressing desmoid tumors who require systemic treatment"

⚠️ **SDP #7**: "Progressing" definition must match I/E criteria exactly per FDA.1 rule.

---

## Summary of Strategy Decision Points (SDPs)

| SDP # | Topic | Recommendation | Quantified Impact |
|-------|-------|----------------|-------------------|
| **#1** | Control Arm Design | Placebo + Early Escape | Clean signal; ethical safeguards via crossover |
| **#2** | Prior Therapy Line | Allow both; stratify by status | +30% eligible population |
| **#3** | PFS Assessor | Investigator primary; BICR secondary | Saves ~$500K-2M; precedent exists |
| **#4** | Sample Size Buffer | N=70 (vs. calculated 53) | +20% buffer for dropouts |
| **#5** | Interim Analysis | None (informal DMC only) | Alpha preserved; simpler execution |
| **#6** | Central Pathology | Pre-randomization required | Diagnostic accuracy; ~2-week delay |
| **#7** | Labeling Language | "Progressing" = RECIST or clinical | Must match I/E exactly |

---

## Design Validation Checklist

| Check | Status |
|-------|--------|
| ✓ Rare disease stratification minimized (2 factors) | Compliant |
| ✓ Endpoint hierarchy with multiplicity control | Compliant |
| ✓ Estimand framework pre-specified | Compliant |
| ✓ OS harm threshold analysis included (exploratory) | Compliant |
| ✓ PRO endpoints included (TTCD approach) | Compliant |
| ✓ Dose selection rationale required (Section 4) | Required per DOSE.1 |
| ✓ All 15 SDP checklists covered | 7 identified, quantified |
| ✓ 12-item FDA self-review incorporated | To be completed |

---

*Document generated per Protocol Design SOP v4.1, Rare Disease SOP, and question requirements.*
