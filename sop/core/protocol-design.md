# Protocol Design SOP — Core Decision Process

> **Version**: v3.0 | **Source**: sop.md v2.2 three-layer split | **Rule Count**: 28
> **Loading**: Required. Use together with domains/{category}.md + indications/{indication}.md

---

## Step 1: Intelligence Gathering and Benchmarking

### 1.1 Obtain approved Protocol for the same indication before starting design
Upon receiving a Protocol design task, the first step is to obtain ≥1 full-text FDA-approved Protocol for the same indication (ClinicalTrials.gov / Drugs@FDA / client-provided). Use the approved Protocol's table of contents and design elements as the baseline for drafting.

### 1.2 Design statistics independently first, then benchmark against approved protocol
Independently select statistical methods and calculate sample size based on literature data (without looking at the statistical section of the approved Protocol). After completion, compare item by item and attribute any differences to I/E criteria differences / HR assumption differences / alpha allocation strategy differences.

### 1.3 Protocol benchmarking must cover all 11 sections; parameter differences must be attributed
When benchmarking: (1) Cover all 11 sections (Synopsis→References + Appendices); (2) Classify differences into three categories: structural/content/parameters; (3) Parameter differences must be attributed to root causes (e.g., I/E criteria→control arm prognosis→HR→sample size); reporting numeric differences alone is insufficient.

### 1.4 Strategy Decision Points — identify upfront
Multiple points in the Protocol requiring Sponsor business decisions (control arm selection, I/E breadth, regional strategy, etc.) should be flagged as "⚠️ Strategy Decision Point" early in the design process rather than making the decision on behalf of the Sponsor.

---

## Step 2: Target Population and Enrichment Strategy

### 2.1 I/E criteria optimization: 5-dimension scoring decision framework
Evaluate each I/E criterion across 5 dimensions and score:

| Dimension | Meaning | Score |
|-----------|---------|-------|
| O1 Statistical Efficacy | Increases effect size | +/0/- |
| O2 Trial Speed | Accelerates event accumulation | +/0/- |
| O3 Enrollment Feasibility | Screen failure rate | +/0/- |
| O4 Clinical Efficacy | Enriches benefiting population | +/0/- |
| O5 FDA Acceptability | Approved precedent exists | ✓/⚠️/✗ |

The trade-offs of enrichment vs. relaxation strategies must be quantified and presented as a Strategy Decision Point.

### 2.2 Biomarker-driven indications require a companion diagnostic
When an indication is restricted to a specific biomarker, the trial must include an FDA-approved or in-development companion diagnostic. Biomarker status must be centrally confirmed prior to enrollment.
→ Indication-specific testing strategy: `indications/{indication}.md`

### 2.3 Alpha allocation for predictive enrichment designs
(1) Biomarker cutoffs must be pre-defined with analytical validation; (2) If both marker+ and marker- patients are enrolled, randomization must be stratified by marker status; (3) Alpha must be pre-allocated between the enriched subgroup and the overall population; (4) Treatment × Biomarker interaction test must be pre-specified.

---

## Step 3: Control Arm Selection

### 3.1 Control arm selection decision tree

```
STEP 1: Does a proven therapy exist that prevents death or irreversible morbidity?
├─ No → Placebo control is scientifically optimal
├─ Yes → Pure placebo is unacceptable
│ ├─ SOC is clear and unique → Active control (the SOC drug)
│ ├─ SOC has multiple options → Investigator's Choice (pre-specified option list, selected before randomization)
│ └─ Grey area → Modified designs: add-on / early escape / withdrawal / limited placebo
└─ No established SOC (rare cancers, etc.) → IC (pre-specified 2-3 options including chemo + immunotherapy)
```

IF non-oncology with established SOC → Active control may lead to NI design (NI margin must be pre-specified); consider ethics.
→ Indication-specific controls: `indications/{indication}.md`

### 3.2 FDC combination products require 2 types of trials
ICS/SABA and similar FDC reliever/controller products require: (1) A large event-driven PRN trial (FDC vs. individual components), primary endpoint: time to first severe exacerbation; (2) A factorial fixed-dose trial (FDC vs. each individual component vs. placebo), satisfying the combination rule (21 CFR 300.50a).
→ FDC stratification strategy: `domains/respiratory.md`

---

## Step 4: Endpoint Selection

### 4.1 Oncology endpoint assessment approach

IF open-label (including ICC comparator):
  IF non-cytotoxic drug AND trial arm and control arm are of the same drug mechanism class AND disease progression assessment is minimally subject to subjective bias:
    → FDA may accept investigator-assessed PFS as primary endpoint (BICR as sensitivity analysis)
    → Precedent: EMBER-3/Inluriyo (oral ER antagonist vs IC of ET)
    → See `domains/oncology-solid.md ## Trial Design`
  ELSE:
    → PFS as primary endpoint requires BICR; investigator PFS as sensitivity analysis
IF double-blind → PFS may use investigator assessment as primary endpoint; BICR as sensitivity analysis.
→ Accelerated approval endpoints: `regulatory/accelerated-approval.md`

### 4.2 Oncology endpoint hierarchy
OS > PFS > ORR. Traditional approval: OS or PFS (with clinically meaningful improvement).
PFS requirements: (1) sufficiently large magnitude, (2) open-label requires independent assessment confirmation (BICR or meeting 4.1 inv-PFS exemption criteria), (3) subgroup consistency, (4) supporting endpoints such as ORR.

### 4.3 Non-oncology endpoints: follow disease-specific Guidance
Non-oncology endpoints are generally not OS/PFS/ORR. The relevant FDA Guidance must be consulted.
→ Indication-specific endpoints: `indications/{indication}.md`

### 4.4 Estimand framework must be defined at Protocol stage
The 5 attributes of the primary Estimand (treatment condition, target population, variable, summary measure, intercurrent event handling strategy) must be pre-specified. Intercurrent events (treatment discontinuation, subsequent therapies, death) must explicitly adopt one of 5 strategies.

### 4.5 OS analysis plan must be pre-specified even if not a primary endpoint
All randomized oncology trials must pre-specify in the SAP: (1) OS harm threshold (HR upper bound exclusion value, e.g., 1.20), (2) method to exclude harm, (3) interim analysis plan, (4) supplemental analyses for NPH (RMST + Landmark).

### 4.6 Oncology PRO secondary endpoints
PRO should preferably be included in hierarchical testing in the form of "Time to Confirmed Clinical Deterioration" (TTCD), using disease-specific tools (e.g., EORTC QLQ-C30 + module). Scales must undergo content validity validation with patient input; responder definition based on anchoring method; SAP must pre-lock missing data handling (≥2 sensitivity analyses). PRO must be completed prior to other clinical assessments.

---

## Step 5: Statistical Design (Protocol Level)

> Detailed SAP rules: `core/sap-design.md`. This section covers only Protocol-level statistical decisions.

### 5.1 Sample size based on clinically meaningful difference
Effect size must be based on clinically meaningful minimum differences and SOC data from the literature. Typical parameters: alpha=0.025 one-sided, power=80-90%.

| Design | Typical Effect Size |
|--------|-------------------|
| Oncology PFS | HR 0.60-0.75 |
| Oncology OS | HR 0.70-0.80 |
| Accelerated approval single-arm | N=50-200 |

### 5.2 Multiplicity correction strategy (framework)

IF number of hypothesis tests ≥3 → Prefer Graphical Approach (Bretz 2009 directed graph)
IF hypothesis tests = 2 (e.g., PFS + OS) → Hierarchical testing
→ Alpha allocation details, spending function, NI testing strategy: `core/sap-design.md`

### 5.3 Co-primary endpoints each require 90% power
Co-primary requires all endpoints to be significant; joint power = product of each endpoint's power. 80% × 80% = 64%; must be raised to ~90% to ensure joint power ≥80%.

### 5.4 Covariate adjustment
(1) Stratification randomization variables must be included in the analysis model; (2) Additional prognostic covariates may be added to increase power; (3) Must be locked in the SAP before unblinding; (4) Non-linear models must pre-declare conditional vs. unconditional treatment effects.

---

## Step 6: Stratification Factors

### 6.1 General principles
Select prognostic factors with the greatest impact on the primary endpoint, typically 2-4. Stratification variables must be included as covariates in the analysis model.

IF rare cancer (<5/million incidence) → Minimize to 1-2 factors, retain only the strongest prognostic factor; avoid over-stratification leading to small cell imbalance.

→ Indication-specific stratification factors: `indications/{indication}.md`

---

## Step 7: Safety and Monitoring Design

### 7.1 Novel biologics (ADC/bispecific antibody/T-cell engager/CAR-T)
Confirmatory trials must pre-specify: (1) Step-up dosing regimen; (2) In-hospital monitoring requirements and duration for first/first-3 doses (T-cell engagers ≥16h); (3) CRS/ICANS grading management algorithm (per ASTCT consensus); (4) Pre-treatment regimen; (5) Dose modification criteria: ≥80% of patients maintain ≥80% dose intensity.

→ Disease-specific monitoring: `indications/{indication}.md`

---

## Step 8: Approval Strategy and Operations

### 8.1 Traditional approval typically requires 2 adequate and well-controlled trials
Planning should account for 2 independent pivotal trials. Single-trial approval is an exception (e.g., Tavneos — rare disease).

→ Accelerated approval / Breakthrough strategy: `regulatory/` directory
→ Indication-specific operational conventions: `indications/{indication}.md`
