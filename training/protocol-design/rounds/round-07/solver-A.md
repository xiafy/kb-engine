# Phase 3 Pivotal Trial Protocol Design: IDH-mutant Low-Grade Glioma

## Study Overview

**Study Title**: A Phase 3, Randomized, Double-Blind, Placebo-Controlled Study of an Oral IDH1/IDH2 Inhibitor in Adult and Pediatric Patients with Grade 2 Astrocytoma or Oligodendroglioma with an IDH1 or IDH2 Mutation Following Surgery

**Indication**: Treatment of adult and pediatric patients ≥12 years of age with Grade 2 astrocytoma or oligodendroglioma with a susceptible IDH1 or IDH2 mutation following surgery (biopsy, sub-total resection, or gross total resection)

**Setting**: Post-surgical observation-replacing; adjuvant setting following initial surgery for newly diagnosed or recurrent Grade 2 IDH-mutant glioma

---

## 1. Design Type

### 1.1 Core Design Parameters

| Parameter | Specification |
|-----------|---------------|
| **Design** | Phase 3, randomized, double-blind, placebo-controlled, parallel-group, international multicenter study |
| **Randomization** | 1:1 ratio (Active : Placebo) |
| **Blinding** | Double-blind (patient, investigator, sponsor) |
| **Number of Arms** | 2 arms (Experimental arm: IDH inhibitor; Control arm: Placebo) |
| **Control Type** | Placebo (ethical given post-surgical observation is standard of care for low-risk patients) |

### 1.2 Design Justification

**Rationale for Placebo Control**: Per SOP §3.1 Control Arm Decision Tree, placebo control is scientifically and ethically acceptable because:
1. For low-risk Grade 2 IDH-mutant LGG (age ≤40 years, gross total resection), the standard of care is **active observation** with serial MRI monitoring — not immediate active therapy
2. No approved targeted therapies exist specifically for IDH-mutant LGG
3. Immediate radiotherapy and chemotherapy are reserved for high-risk features (age >40, subtotal resection, large tumor, neurological deficits) and carry substantial neurotoxicity risks

**Rationale for Double-Blind Design**: 
- LGG progression assessment involves radiographic evaluation (RANO criteria) which has subjective components
- Double-blind design minimizes assessment bias for PFS endpoint
- Precedent established in neuro-oncology trials for indolent tumors

### 1.3 Crossover Provision

⚠️ **Strategy Decision Point**: Patients on placebo arm may cross over to active treatment upon centrally confirmed disease progression per RANO criteria, or earlier if confirmed malignant transformation to Grade 3/4 glioma.

---

## 2. Control Arm

### 2.1 Control Arm Specification

| Element | Specification |
|---------|---------------|
| **Arm Name** | Placebo Control |
| **Intervention** | Matching placebo tablets, oral daily dosing |
| **Duration** | Until disease progression, unacceptable toxicity, or patient withdrawal |
| **Post-Progression** | Crossover to active treatment allowed |

### 2.2 Standard of Care Context

| Risk Category | Current SOC | Trial Positioning |
|---------------|-------------|-------------------|
| **Low-risk** (≤40 years, GTR) | Active observation with serial MRI | Placebo replaces observation |
| **High-risk** (>40 years or STR/biopsy) | RT + chemotherapy (PCV or TMZ) | Consider protocol amendment or separate cohort; high-risk patients require active therapy |

⚠️ **Strategy Decision Point**: Sponsor must decide whether to:
- **Option A**: Enroll only low-risk patients (post-surgical observation-eligible) — most conservative, aligns with pure observation replacement paradigm
- **Option B**: Enroll both low- and high-risk patients; high-risk patients may receive background SOC (RT ± chemo) per investigator choice — increases enrollment feasibility but complicates interpretation
- **Option C**: Two separate cohorts with different control strategies — larger trial, enables subgroup-specific labeling

### 2.3 Rescue Therapy

- Radiotherapy or chemotherapy permitted after progression per local standard of care
- Crossover to open-label active treatment available for placebo arm patients after centrally confirmed progression

---

## 3. Primary Endpoint

### 3.1 Endpoint Selection

| Endpoint | Progression-Free Survival (PFS) |
|----------|--------------------------------|
| **Assessment** | Investigator-assessed per RANO LGG criteria (2017), with Blinded Independent Central Review (BICR) as sensitivity analysis |
| **Rationale** | PFS is the established endpoint for LGG trials; reflects time to disease progression or death; aligns with natural history of IDH-mutant LGG where malignant transformation is a key clinical milestone |

### 3.2 Endpoint Justification

Per SOP §4.1 Oncology Endpoint Assessment:
- **Double-blind trial** → PFS may use investigator assessment as primary; BICR as sensitivity analysis
- LGG is assessed by **radiographic imaging** (RANO criteria), minimizing subjective bias inherent in blinded designs
- PFS captures malignant transformation to high-grade glioma, a clinically meaningful event with median time of 2.7-5.4 years

**Why Not OS?**
- Median OS for Grade 2 LGG is 10-12 years — too prolonged for practical trial completion
- Crossover dilutes OS treatment effect
- PFS is accepted by FDA for LGG based on RANO criteria validation

**Why Not ORR?**
- LGGs are indolent tumors with low response rates by traditional RECIST/RANO criteria
- ORR does not capture the clinical benefit of delaying progression/malignant transformation

---

## 4. Endpoint Definition

### 4.1 Primary Endpoint: PFS

**Definition**: Time from randomization to the earlier of:
- Disease progression per RANO LGG criteria (2017), OR
- Death from any cause

**Censoring Rules** (pre-specified in SAP):
- Patients without progression/death at data cutoff: censored at last adequate tumor assessment
- Patients starting new antineoplastic therapy before progression: censored at last adequate tumor assessment before new therapy
- Patients lost to follow-up: censored at last adequate tumor assessment

### 4.2 RANO LGG Criteria (2017) Key Elements

| Component | Specification |
|-----------|---------------|
| **Measurable Disease** | Bidimensionally measurable disease on MRI with contrast-enhancing or T2/FLAIR components |
| **Progression Criteria** | ≥25% increase in tumor area (product of perpendicular diameters) on T2/FLAIR or contrast-enhancing component; OR significant clinical deterioration not attributable to comorbidities |
| **Assessment Schedule** | MRI every 12 weeks for first 2 years, then every 16 weeks |
| **Confirmation** | Confirmation of progression recommended (4-8 weeks) to avoid premature censoring |

### 4.3 Estimand Framework (ICH E9[R1])

| Attribute | Specification |
|-----------|---------------|
| **Treatment Condition** | IDH inhibitor vs Placebo, both continued until progression or unacceptable toxicity |
| **Target Population** | Adults and pediatric patients ≥12 years with Grade 2 IDH-mutant astrocytoma or oligodendroglioma post-surgery |
| **Variable** | PFS as defined above |
| **Summary Measure** | Hazard Ratio from Cox proportional hazards model |
| **Intercurrent Events** | Treatment discontinuation: treatment policy strategy; Subsequent anticancer therapy: treatment policy strategy (censored at last adequate assessment if pre-progression); Death: event of interest |

---

## 5. Secondary Endpoints

### 5.1 Efficacy Endpoints (Hierarchical Testing)

| Rank | Endpoint | Assessment | Clinical Relevance |
|------|----------|------------|-------------------|
| 1 | **Overall Survival (OS)** | Time from randomization to death | Gold standard for malignant gliomas; accounts for malignant transformation impact |
| 2 | **Time to Malignant Transformation (TTMT)** | Time from randomization to histologically confirmed Grade 3/4 transformation or radiographic progression meeting HGG criteria | Captures the key disease-defining event in IDH-mutant LGG natural history |
| 3 | **Objective Response Rate (ORR)** | CR + PR per RANO LGG criteria by BICR | Demonstrates tumor shrinkage capability |
| 4 | **Duration of Response (DOR)** | Time from first documented response to progression/death | Measures durability of responses |
| 5 | **Time to First Seizure/Deterioration** | Patient-reported or physician-documented | Captures symptomatic benefit |

### 5.2 Patient-Reported Outcomes (PROs)

| Endpoint | Instrument | Schedule |
|----------|------------|----------|
| **Health-Related QoL** | EORTC QLQ-C30 + QLQ-BN20 brain module | Prior to clinical assessments at each visit |
| **Time to Confirmed Deterioration (TTCD)** | EORTC QLQ-C30 global health status; ≥10-point decline | Pre-specified as key PRO endpoint |
| **Neurocognitive Function** | CogState or equivalent battery | Baseline, every 6 months |
| **Seizure Frequency** | Patient diary | Continuous |

**PRO Assessment Note**: Per SOP §4.6, PRO assessments must be completed **prior to** other clinical assessments to avoid bias.

### 5.3 Safety Endpoints

- Adverse events (CTCAE v5.0)
- Laboratory abnormalities
- Seizure frequency/severity
- Hepatic function (IDH inhibitors may affect liver enzymes)
- Long-term safety (growth/development in pediatric patients, secondary malignancies)

---

## 6. Sample Size

### 6.1 Sample Size Calculation

**Base Case Assumptions**:
| Parameter | Value | Source/Justification |
|-----------|-------|---------------------|
| Control median PFS | 30 months | Natural history: malignant transformation median 2.7-5.4 years; PFS shorter than OS; estimated from literature |
| Target Hazard Ratio | 0.55 | Clinically meaningful 45% risk reduction; aggressive tumors may respond better to targeted therapy |
| Treatment median PFS | 54.5 months | Derived from HR = 0.55 |
| Alpha (1-sided) | 0.025 | Standard for Phase 3 oncology |
| Power | 85% | Standard for pivotal trials |
| Randomization ratio | 1:1 | Equal allocation |

**Calculated Sample Size**:
```
Events needed: 101
Total enrolled: 248 (124 per arm)
```

### 6.2 Enrollment Projections

| Parameter | Value |
|-----------|-------|
| **Accrual period** | 24 months |
| **Follow-up after last patient** | 18 months |
| **Total trial duration** | 42 months (3.5 years) |
| **Monthly accrual rate** | ~10-11 patients/month |
| **Expected events at analysis** | 101 |

### 6.3 Sensitivity Analysis (Sample Size Robustness)

| Scenario | HR | Control PFS | N Required | Events |
|----------|-----|-------------|------------|--------|
| Optimistic | 0.50 | 36 mo | 190 | 75 |
| Base case | 0.55 | 30 mo | 248 | 101 |
| Conservative | 0.60 | 30 mo | 329 | 138 |
| Pessimistic | 0.65 | 24 mo | 450 | 194 |

### 6.4 Sample Size Rounding

**Target Enrollment**: **N = 330** (165 per arm)
- Accounts for 5% loss to follow-up/dropout
- Provides cushion for lower-than-expected event rate
- Enables adequate power for key subgroup analyses

---

## 7. Statistical Framework

### 7.1 Primary Analysis

**Method**: Stratified Cox proportional hazards model comparing PFS between treatment arms

**Stratification Factors** (included as strata in model):
1. 1p/19q co-deletion status (co-deleted vs non-co-deleted)
2. Baseline tumor size (≥2cm vs <2cm on T2/FLAIR)

**Primary Comparison**: Two-sided test at α = 0.05 (or one-sided α = 0.025); HR with 95% CI

### 7.2 Multiplicity Adjustment

**Hierarchical Testing Sequence** (gatekeeping procedure):
1. PFS (primary endpoint)
2. OS (key secondary) — tested only if PFS is significant
3. TTMT — tested only if OS is significant
4. ORR — tested only if TTMT is significant
5. PRO endpoints — tested only if ORR is significant

**Interim Analysis**:
- **Timing**: One interim analysis at ~60% of planned events (~61 events)
- **Purpose**: Futility assessment only (not for efficacy/superiority stopping)
- **Boundary**: Lan-DeMets O'Brien-Fleming spending function (α spent conservatively)
- **Stopping Rule**: HR > 1.0 (treatment harm) or HR > 0.95 with conditional power <30%

### 7.3 Subgroup Analyses (Pre-specified)

| Subgroup | Rationale |
|----------|-----------|
| 1p/19q co-deletion status | Defines molecular subtypes (astrocytoma vs oligodendroglioma); different prognosis |
| Age (pediatric 12-17 vs adult ≥18) | Pediatric enrollment strategy; pharmacokinetic differences |
| ECOG PS (0 vs 1) | Performance status may affect outcomes |
| Prior surgery type (GTR vs STR vs biopsy) | Extent of resection affects natural history |
| Tumor size (≥2cm vs <2cm) | Stratification factor |
| IDH1 vs IDH2 mutation | Different mutation types may respond differently |

**Consistency Requirement**: Treatment effect should be directionally consistent across major subgroups (1p/19q status, age groups)

### 7.4 Sensitivity Analyses

| Analysis | Purpose |
|----------|---------|
| BICR-assessed PFS | Validates investigator assessment |
| Unstratified Cox model | Assesses impact of stratification |
| Excluding early scans (<6 weeks) | Mitigates immortal time bias |
| Treatment policy estimand | Includes all post-baseline events |
| Per-protocol analysis | Excludes major protocol violators |

### 7.5 OS Analysis Plan (Per SOP §4.5)

Pre-specified in SAP even though not primary:
- **OS Harm Threshold**: Upper bound of 95% CI for HR must exclude 1.20
- **Method**: Stratified log-rank test with HR from Cox model
- **Censoring**: Treatment policy (no censoring at crossover)
- **NPH Assessment**: Landmark analysis at 12, 24, 36 months; RMST if proportional hazards assumption violated

---

## 8. Stratification

### 8.1 Stratification Factors

Per SOP §6.1 and indication-specific rules, **2 stratification factors** are specified:

| Factor | Categories | Rationale |
|--------|------------|-----------|
| **1p/19q co-deletion** | Co-deleted vs Non-co-deleted | Strongest molecular prognostic factor in IDH-mutant gliomas; separates oligodendroglioma from astrocytoma subtypes |
| **Tumor size** | ≥2cm vs <2cm (T2/FLAIR) | Major prognostic factor for PFS and malignant transformation risk |

**Note**: Extent of resection (GTR vs STR vs biopsy) is **NOT** used as a stratification factor per LGG-specific SOP guidance, though it will be captured and analyzed as a covariate.

### 8.2 Randomization Method

- Centralized interactive web response system (IWRS)
- Block randomization within each stratum (block size 4)
- Dynamic balancing to maintain 1:1 ratio within strata

### 8.3 Stratification Variable Handling in Analysis

- Both stratification factors **must** be included as covariates in the Cox proportional hazards model
- If randomization stratification factors are misspecified or missing, the actual factors used for randomization (from IWRS) take precedence

---

## 9. Eligibility Criteria

### 9.1 Key Inclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| 1 | Histologically confirmed WHO Grade 2 diffuse glioma (astrocytoma or oligodendroglioma) per 2021 CNS5 classification | Ensures appropriate disease population |
| 2 | **IDH1 or IDH2 mutation** (susceptible mutation per central lab) | Target population for IDH inhibitor; biomarker-defined indication |
| 3 | **Post-surgical status**: Prior biopsy, sub-total resection (STR), or gross total resection (GTR) | Observation-replacement indication |
| 4 | **Time window**: Surgery ≥1 year and ≤5 years prior to enrollment | Per SOP §2.1: Ensures clinical stability for observation-replacement; excludes rapidly progressive disease |
| 5 | **Age**: ≥12 years (adults and adolescents) | Pediatric enrollment per pediatric investigation plan; oral agent suitable for this age range |
| 6 | **Measurable or non-measurable disease** present on MRI | Non-measurable disease (e.g., diffuse T2 hyperintensity without clear mass) permitted given LGG characteristics |
| 7 | **ECOG PS** 0-1 | Standard performance status for outpatient oral therapy |
| 8 | **Adequate organ function**: Hepatic (bilirubin ≤1.5x ULN), Renal (CrCl ≥60 mL/min), Hematologic | Safety for oral therapy |
| 9 | **IDH inhibitor naïve** | Required for efficacy assessment |
| 10 | **CNS imaging capacity**: Able to undergo MRI with and without contrast | Essential for endpoint assessment |

### 9.2 Key Exclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| 1 | **Prior radiotherapy** for glioma | Confounds efficacy assessment; RT is SOC for high-risk but excluded to focus on observation-replacement population |
| 2 | **Prior systemic chemotherapy** (PCV, temozolomide, or other) for glioma | Excludes non-naïve patients |
| 3 | **Active or planned immediate radiotherapy or chemotherapy** | Must be in observation window |
| 4 | **High-grade glioma (Grade 3/4) or malignant transformation** at screening | Excludes progressed disease |
| 5 | **History of other malignancy** within 3 years (except cured non-melanoma skin cancer, in situ cervical cancer) | Confounds safety/efficacy |
| 6 | **Uncontrolled seizures** or increasing seizure frequency | Marker of disease progression; safety concern |
| 7 | **Severe hepatic impairment** (Child-Pugh B or C) | Safety for hepatically metabolized drug |
| 8 | **Concomitant use of strong CYP3A4 inducers/inhibitors** | Drug-drug interaction risk |
| 9 | **Pregnancy or breastfeeding** | Teratogenicity concern |
| 10 | **Inability to swallow oral medication** or significant GI malabsorption | Dosing feasibility |

### 9.3 I/E Scoring Framework (Per SOP §2.1)

| Criterion | O1 Stat Efficacy | O2 Trial Speed | O3 Enrollment | O4 Clinical Efficacy | O5 FDA Acceptability | Score |
|-----------|-----------------|---------------|---------------|-------------------|---------------------|-------|
| 1-5 year post-surgery window | + | + | + | + | ✓ | 5/5 |
| Prior RT exclusion | + | + | - | + | ✓ | 4/5 |
| ECOG 0-1 | + | + | 0 | + | ✓ | 4/5 |
| IDH inhibitor naïve | + | + | 0 | + | ✓ | 4/5 |

---

## 10. Operational Considerations

### 10.1 Geographic Strategy

| Region | Rationale | Enrollment Target |
|--------|-----------|-----------------|
| **North America (US, Canada)** | Primary regulatory market; high LGG prevalence | 40% (~132 patients) |
| **Europe (EU+UK)** | Project Orbis collaboration opportunity; molecular testing infrastructure | 35% (~116 patients) |
| **Asia-Pacific (Japan, Australia, South Korea)** | Regulatory requirements; epidemiologic diversity | 15% (~50 patients) |
| **Other** | Global representation | 10% (~32 patients) |

**Pediatric Strategy** (patients 12-17 years):
- Pediatric patients ≥12 years may be enrolled directly in adult protocol per SOP §Pan-tumor Pediatric Strategy
- Separate pediatric PK/safety cohort for patients <12 years (if pursued separately)
- Weight-based dosing required for pediatric patients

### 10.2 Biomarker Testing Strategy

| Phase | Testing Approach | Details |
|-------|-----------------|---------|
| **Screening** | **Central prospective IDH1/IDH2 testing** | CLIA-certified/CAP-accredited laboratory; NGS or PCR-based; results within 10 business days |
| **Tissue requirements** | Archival tissue or fresh biopsy | Minimum tissue requirements specified; local testing acceptable for screening with central confirmation |
| **Retrospective confirmation** | Central confirmation of all randomized patients | Quality control; verification of assay concordance |
| **CDx development** | Companion diagnostic co-development required | Per SOP §2.2: Biomarker-driven indication requires FDA-approved or in-development CDx |

**1p/19q Testing**: Required for stratification and subtype classification (co-deleted = oligodendroglioma; non-co-deleted = astrocytoma); central assessment recommended but local CLIA-certified testing acceptable.

### 10.3 Imaging and Central Review

| Component | Specification |
|-----------|-------------|
| **Modality** | MRI brain with and without gadolinium contrast; T1, T2, FLAIR sequences |
| **Local assessment** | Investigator assessment per RANO LGG 2017 criteria (primary) |
| **BICR** | Blinded Independent Central Review by 2 neuroradiologists with adjudication for discordance (sensitivity analysis) |
| **Schedule** | Every 12 weeks (±7 days) for first 2 years; every 16 weeks thereafter |
| **Image collection** | All images uploaded to central imaging repository within 48 hours |

### 10.4 Trial Governance

| Committee | Responsibilities |
|-------------|-----------------|
| ** steering committee** | Overall trial oversight; protocol amendments; publication strategy |
| **Independent Data Monitoring Committee (IDMC)** | Safety oversight; interim analysis review; futility assessment |
| **Endpoint Adjudication Committee** | Radiographic progression confirmation; malignant transformation confirmation |

### 10.5 Key Study Milestones

| Milestone | Timeline |
|-----------|----------|
| First patient in | Month 0 |
| 25% enrollment | Month 6 |
| 50% enrollment | Month 12 |
| Last patient in | Month 24 |
| Interim analysis | Month 36 (projected 60% events) |
| Primary analysis | Month 42 (projected 101 events) |
| Final OS analysis | Month 60+ (mature OS data) |

### 10.6 Risk Mitigation

| Risk | Mitigation Strategy |
|------|---------------------|
| **Slow enrollment** | Broaden to high-risk patients with investigator's choice background therapy (per SDP); expand geographic sites |
| **Lower than expected event rate** | Extend follow-up; increase sample size if needed (pre-specified adaptive design option) |
| **Assessment variability** | RANO training for all sites; central imaging platform; real-time imaging QC |
| **Pediatric recruitment** | Dedicated pediatric sites; age-appropriate formulations; family support resources |

---

## Summary Table: 10 Dimensions

| Dimension | Design Element |
|-----------|----------------|
| **1. Design Type** | Phase 3, randomized, double-blind, placebo-controlled, 2-arm, international multicenter |
| **2. Control Arm** | Placebo (replaces active observation for low-risk IDH-mutant LGG); ⚠️ SDP on high-risk patient inclusion strategy |
| **3. Primary Endpoint** | PFS per RANO LGG 2017 criteria (investigator-assessed; BICR as sensitivity) |
| **4. Endpoint Definition** | Time to progression (radiographic/clinical) or death; Estimand framework pre-specified |
| **5. Secondary Endpoints** | OS (key secondary), TTMT, ORR, DOR, PROs (QoL, cognition, seizure control) |
| **6. Sample Size** | N = 330 (165/arm); 101 events required; HR = 0.55, α=0.025 (1-sided), 85% power |
| **7. Statistical Framework** | Stratified Cox model; hierarchical testing (PFS → OS → TTMT → ORR → PRO); one interim (futility only) |
| **8. Stratification** | 1p/19q co-deletion + tumor size (≥2cm vs <2cm) |
| **9. Eligibility** | Post-surgical (1-5 years) Grade 2 IDH-mutant glioma; no prior RT/chemo; ≥12 years; ECOG 0-1 |
| **10. Operational** | Global enrollment (US/EU/Asia); CDx co-development; pediatric 12+ included; BICR imaging; IDMC oversight |

---

## Strategy Decision Points (SDPs) Summary

| SDP # | Decision Topic | Options Presented | Sponsor Decision Required |
|-------|---------------|-------------------|--------------------------|
| SDP-01 | High-risk patient inclusion | A: Low-risk only; B: Low+high-risk with background SOC; C: Two separate cohorts | YES — Before protocol finalization |
| SDP-02 | Crossover timing | Early crossover at first radiographic change vs confirmed progression | RECOMMENDED — Confirmed progression |
| SDP-03 | Pediatric expansion | Include 12-17 years in main trial vs separate pediatric study | YES — Before IND submission |
| SDP-04 | Interim analysis purpose | Futility only vs potential superiority stopping | RECOMMENDED — Futility only |
| SDP-05 | PRO hierarchy position | Include PRO in hierarchical testing vs separate analysis | YES — Regulatory alignment needed |

---

*Protocol Design Generated per: SOP Core Protocol Design v4.1, Oncology Solid v1.1, LGG Indication v1.0*
