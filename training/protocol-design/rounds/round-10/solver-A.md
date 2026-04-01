## My Answer: Kimmtrak [protocol-design] — Solver A

### 1. design_type
Open-label, randomized, parallel-group, controlled Phase 3 pivotal trial with 2 arms (1:1 randomization). Single pivotal trial design justified by: (1) ultra-rare disease (4-5 cases/million/year) per rare-disease SOP §Trial Design; (2) ultra-poor prognosis (median OS <6 months) with no approved therapies; (3) novel mechanism bispecific T-cell engager with compelling efficacy signal from Phase 2. No blinding feasible given IV infusion route, distinct safety profile (CRS events expected in tebentafusp arm), and open-label Investigator's Choice comparator.

⚠️ **Strategy Decision Point**: Double-blind placebo-controlled design not feasible due to: (a) ethical concerns in disease with <6 months median OS and no approved therapy; (b) operational impossibility of masking IV infusion administration schedules and CRS monitoring requirements.

### 2. control_arm
Investigator's Choice (IC) of pre-specified systemic therapy options, selected prior to randomization. Per protocol-design.md §3.1 decision tree: No established SOC exists for metastatic uveal melanoma → IC with pre-specified options including:
- Anti-PD-1 monotherapy (pembrolizumab or nivolumab)
- Anti-CTLA-4 monotherapy (ipilimumab) 
- Combination anti-CTLA-4 + anti-PD-1 (ipilimumab + nivolumab)
- Single-agent chemotherapy (dacarbazine or temozolomide)

Choice locked before randomization and documented. Rationale aligns with NCCN 2021 recommendations and global meta-analysis showing median OS ~9 months across all modalities in this population.

⚠️ **Strategy Decision Point**: IC rather than single active comparator or placebo control. Options reflect actual practice patterns in pre-approval era where no standard existed.

### 3. primary_endpoint
Overall Survival (OS) — Time from randomization to death from any cause. OS selected per protocol-design.md §4.2 hierarchy (OS > PFS > ORR) for traditional approval in a disease with:
- Ultra-poor prognosis (median <6 months)
- Objective assessment challenges (liver-dominant metastases, immune-related pseudo-progression possible with T-cell engager)
- No reliable surrogate endpoint established
- Short expected survival makes OS feasible as primary

FDA precedent for rare/poor-prognosis cancers supports OS as primary when magnitude of benefit is substantial and clinically meaningful.

### 4. endpoint_definition
**OS (Primary)**: Time from date of randomization to date of death from any cause. Patients not known to have died at data cutoff censored at last known alive date.

**Estimand Framework** (per protocol-design.md §4.4):
- Population: HLA-A*02:01-positive adults with unresectable/metastatic uveal melanoma, treatment-naïve for metastatic disease
- Treatment: Tebentafusp vs Investigator's Choice
- Variable: Time to death
- Summary measure: Hazard ratio with 95% CI
- Intercurrent event strategy: Treatment policy (all deaths counted regardless of treatment discontinuation or subsequent therapy)

**PFS (Secondary)**: Per RECIST 1.1, BICR-assessed. Time from randomization to PD or death. Required for context but not primary due to potential pseudo-progression with T-cell engager mechanism.

⚠️ **Strategy Decision Point**: PFS assessor — While open-label trial typically requires BICR for PFS, the OS primary endpoint mitigates this concern. BICR retained as secondary/sensitivity analysis per protocol-design.md §4.7.

### 5. secondary_endpoints
**Hierarchical testing order** (per protocol-design.md §5.2 for 2 hypothesis tests):
1. OS (primary)
2. ORR (BICR-assessed, RECIST 1.1)
3. DoR (Duration of Response among responders)
4. PFS (BICR-assessed)
5. OS at 12 months (landmark analysis)
6. Safety endpoints (AEs, SAEs, CRS grade/severity, ICANS)
7. PRO: Time to Confirmed Clinical Deterioration (TTCD) using EORTC QLQ-C30 + vision-specific module (per protocol-design.md §4.6)

Multiplicity handled via hierarchical testing; no alpha split required beyond preserving family-wise error rate for confirmatory claims.

### 6. sample_size
**Target enrollment**: Approximately 165 patients (provides ~100 OS events)

**Assumptions**:
- Control median OS: 6 months (per literature and disease background)
- Target HR: 0.55 (absolute improvement to ~10.9 months median OS)
- One-sided alpha: 0.025
- Power: 85%
- Accrual: 18 months
- Follow-up: 12 months after last patient
- Dropout rate: 10%

**Events required**: ~100 total deaths

**Feasibility considerations**:
- HLA-A*02:01 prevalence: ~45% of target population → need to screen ~370 patients
- Given 4-5 cases/million/year incidence, requires multi-regional enrollment (US, EU, Australia)
- Target events (~100) is within rare-disease SOP threshold where interim analysis may be omitted

⚠️ **Strategy Decision Point**: Conservative HR=0.55 assumption vs. more optimistic assumptions. Justified by: novel mechanism, ultra-poor prognosis population where large effects are historically observed with transformative therapies.

### 7. stat_framework
**Analysis Population**: Intent-to-treat (ITT)

**Primary Analysis**: Stratified log-rank test comparing tebentafusp vs IC on OS, stratified by LDH status (elevated vs. normal). Cox proportional hazards model for HR estimate with LDH status and selected baseline prognostic factors as covariates.

**Multiplicity**: Single primary endpoint (OS) — no alpha allocation required. Hierarchical testing for secondary endpoints ensures family-wise error control.

**Interim Analysis**: None planned. Per rare-disease SOP, when target events ≤50-60, interim analysis may be omitted to conserve alpha. With ~100 events, single final analysis maintains adequate power and avoids complexity in rare disease setting.

**Sensitivity Analyses** (per protocol-design.md §4.5):
- OS harm threshold: Upper bound of 95% CI for HR must exclude 1.20 (pre-specified harm boundary)
- RMST (Restricted Mean Survival Time) analysis at 12 and 24 months
- Landmark analysis at 6, 12, 18 months

**Non-Proportional Hazards**: Pre-specified testing for non-proportional hazards; if violated, primary inference shifts to RMST difference with supportive HR analysis.

### 8. stratification
Single stratification factor: **LDH status** (elevated vs. normal) at baseline.

Per rare-disease SOP §Rare Cancer Stratification Factor Minimization: For cancers with <5/million incidence, minimize to 1-2 factors, retain only the strongest prognostic factor to avoid over-stratification causing small cell imbalance.

Rationale for LDH only:
- LDH is well-established strongest independent prognostic factor in metastatic uveal melanoma
- Maintains balance on key prognostic variable without over-stratifying small trial
- Liver metastasis status highly correlated with LDH in this population (90% have liver mets)
- Other factors (ECOG, age, prior therapy) less prognostic than LDH in this setting

Randomization performed via IRT with permuted blocks within each LDH stratum.

### 9. eligibility
**Key Inclusion Criteria**:
- Age ≥18 years
- Histologically or cytologically confirmed unresectable or metastatic uveal melanoma
- HLA-A*02:01-positive (centrally confirmed via companion diagnostic assay prior to enrollment)
- Treatment-naïve in metastatic setting (no prior systemic therapy for metastatic disease)
- ECOG performance status 0-1
- Measurable disease per RECIST 1.1
- Adequate organ function: ANC ≥1500/μL, platelets ≥100,000/μL, hemoglobin ≥9 g/dL, bilirubin ≤1.5×ULN, AST/ALT ≤2.5×ULN (≤5× if liver mets), creatinine clearance ≥50 mL/min
- Life expectancy ≥3 months

**Key Exclusion Criteria**:
- Prior systemic therapy for metastatic uveal melanoma
- Prior regional liver-directed therapy (hepatic arterial embolization, chemoembolization, radioembolization, isolated hepatic perfusion, or hepatic radiation)
- Active CNS metastases (treated/stable CNS mets permitted if no steroids for ≥2 weeks)
- Active autoimmune disease requiring systemic immunosuppression
- Uncontrolled intercurrent illness (including uncontrolled infection)
- Known HIV, active hepatitis B or C
- QTc prolongation >480 ms or history of significant cardiac arrhythmia
- Pregnancy or lactation
- Live vaccine within 30 days

**Companion Diagnostic**: HLA-A*02:01 testing required via validated assay. Testing performed centrally before randomization. Patients with negative result excluded (per protocol-design.md §2.2).

⚠️ **Strategy Decision Point**: Prior liver-directed therapy exclusion — Required to ensure homogeneous population receiving first-line systemic therapy; aligns with target population specification.

### 10. operational
**HLA-A*02:01 Testing Strategy**:
- Central laboratory testing with validated assay (companion diagnostic pathway)
- Pre-screening allowed to assess eligibility before full consent
- Turnaround time: ≤10 business days
- Archival tumor tissue not required for HLA testing (germline test from blood/buccal swab)

**Safety Monitoring for Bispecific T-cell Engager** (per protocol-design.md §7.1):

1. **Step-up Dosing Regimen**:
   - Day 1: 20 mcg IV over 15-20 minutes
   - Day 8: 30 mcg IV over 15-20 minutes
   - Day 15: 68 mcg IV over 15-20 minutes
   - Then 68 mcg weekly thereafter

2. **In-Hospital Monitoring**:
   - First 3 doses: Minimum 16-hour in-hospital observation after infusion completion (per SOP requirement for T-cell engagers)
   - Subsequent doses: At minimum, 4-hour observation if no Grade ≥2 CRS in prior doses
   - ICU-level monitoring capability required on-site for first 3 doses

3. **CRS/ICANS Management**:
   - Pre-treatment: Acetaminophen + diphenhydramine prior to each dose for first 3 doses
   - CRS grading and management per ASTCT consensus criteria
   - Tocilizumab and corticosteroids available on-site for Grade ≥2 CRS
   - Dose modification rules: Hold for Grade ≥3 CRS; resume at reduced dose when ≤Grade 1 for 72 hours
   - ICANS monitoring: Neuro checks before each dose; hold for any ICANS until resolved

4. **Dose Intensity Target**: ≥80% of patients should maintain ≥80% dose intensity (per protocol-design.md §7.1)

**Regional Strategy**:
- Multi-regional enrollment: US, EU (UK, Germany, France, Netherlands), Australia
- Sites selected based on uveal melanoma referral center concentration
- Target: ~50-60 sites to enroll 165 patients over 18 months

**Data Monitoring**:
- Independent Data Monitoring Committee (IDMC) for safety oversight (no interim efficacy analysis)
- Quarterly safety reviews with adjudication of CRS events
- No formal DSMC stopping rules for efficacy (single final analysis)

**Statistical Analysis Timing**:
- Final analysis triggered when ~100 deaths observed
- Estimated study duration: 30 months (18 months accrual + 12 months follow-up)

⚠️ **Strategy Decision Point**: In-hospital monitoring duration — 16 hours selected as minimum for first 3 doses based on T-cell engager class requirement. Sponsor may extend based on emerging safety data from Phase 2.
