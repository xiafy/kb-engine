## My Answer: Kimmtrak [protocol-design] — Solver C

### 1. design_type
**Open-label, randomized (2:1), controlled Phase 3 pivotal trial**

Single trial (one pivotal study sufficient per oncology precedent given large effect size on OS, high unmet need, rare disease with no approved therapies, and clinically meaningful and statistically robust result). 2:1 randomization (experimental:control) to maximize patient exposure to the experimental therapy in a life-threatening disease with no approved alternatives and no established SOC. Open-label design is appropriate because: (a) the primary endpoint is OS, which is objectively measurable; (b) no feasible blinding for IV weekly infusion vs. investigator's choice therapy with different schedules; (c) OS assessment is not subject to assessor bias.

---

### 2. control_arm
**Investigator's Choice (IC) — pre-specified from the following options, selected before randomization:**

- Anti-PD-1 monotherapy: pembrolizumab 2 mg/kg Q3W or 200 mg flat dose Q3W IV (approved for cutaneous melanoma, applied off-label in uveal melanoma per NCCN 2021)
- Anti-CTLA-4 monotherapy: ipilimumab 3 mg/kg Q3W IV × 4 doses
- Anti-PD-1 + anti-CTLA-4 combination: pembrolizumab + ipilimumab per above schedules
- Chemotherapy: dacarbazine 850–1000 mg/m² IV Q3W

**Justification for IC design:**
Per SOP Core §3.1, when SOC has multiple available options, Investigator's Choice is the appropriate control design. In 2021–2022 (submission period), there was no FDA-approved therapy for metastatic uveal melanoma; NCCN recommended clinical trial participation as first preference, and off-label use of PD-1/CTLA-4 inhibitors or chemotherapy constituted the only available options. A pure placebo control would be unethical given some patients could access off-label therapy. An active control vs. a single agent would be similarly problematic given genuine uncertainty about which off-label option was superior (no head-to-head data in mUM). IC accommodates both the absence of a dominant SOC and genuine medical uncertainty. The pre-specification of the IC options list prevents cherry-picking post-randomization.

**⚠️ Strategy Decision Point:** The sponsor may consider limiting IC to PD-1 monotherapy only (simplifies trial, reduces heterogeneity) vs. the full 4-option IC (more reflective of real-world practice but increases prognostic variability). Quantification of this trade-off should be presented to the sponsor.

---

### 3. primary_endpoint
**Overall Survival (OS)**

OS is the sole primary endpoint.

**Justification:**
(1) **Objective and unbiased:** OS is the gold standard endpoint in oncology, measured without assessment bias — critical in an open-label trial. (2) **Clinically meaningful in context of dismal prognosis:** With median OS <6 months from metastatic diagnosis and no effective therapy, a clinically meaningful improvement in survival is the most relevant patient benefit. (3) **Regulatory acceptance:** In a disease with no approved therapies, single-arm ORR could support accelerated approval, but OS in a randomized trial provides the strongest evidence for traditional approval and definitive labeling. (3) **No co-primary PFS/OS needed:** OS alone as primary is acceptable given: (a) large expected effect size (HR ~0.71); (b) the rare disease context limits the ability to power co-primaries (joint power degradation); (c) PFS as sole primary would face regulatory scrutiny given the high subjectivity of progression assessment in mUM (hepatic metastases, clinical deterioration). (4) **Rapid event accumulation:** With median OS ~10 months in the control arm, sufficient death events will accrue relatively quickly despite the small population. (5) **No acceptable NI margin for OS** in an unmet need setting; RR design is scientifically and ethically appropriate.

---

### 4. endpoint_definition

**Primary Endpoint: Overall Survival (OS)**

- **Definition:** Time from randomization to date of death from any cause. Survival status will be collected every 6 weeks after treatment discontinuation up to a defined cutoff.
- ** Censoring:** Patients who are alive or lost to follow-up will be censored at the date of last known alive contact. Sensitivity analyses will include worst-case scenario and border-adjusted censoring.
- **Estimand:** The primary estimand is the *treatment policy estimand* (intent-to-treat), reflecting the effect of randomized assignment regardless of treatment discontinuation or subsequent therapy. Intercurrent events (subsequent off-label therapy, crossover, dose modifications) will be addressed via: (a) analysis under treatment policy strategy for crossover using rank-preserving structural failure time (RPSFT) models; (b) per-protocol analysis as sensitivity.

**Key Secondary Endpoint: Progression-Free Survival (PFS) by BICR**

- **Definition:** Time from randomization to first documented disease progression per RECIST v1.1 or death from any cause, whichever occurs first.
- **BICR requirement:** Because the trial is open-label AND the drug is a bispecific T-cell engager (ADC/bispecific/CAR-T exclusion per SOP Core §4.1), **BICR is required as the primary assessment method for PFS**; investigator-assessed PFS will serve as a sensitivity analysis. A blinded independent central review (BICR) committee will assess all imaging locally every 8 weeks (± 7 days) per RECIST v1.1. BICR Charter will pre-specify imaging quality standards and reconciliation procedures.
- **Estimand:** Hypothetical strategy — reflecting anti-tumor effect under ideal conditions, censoring patients at treatment discontinuation for the primary PFS analysis.

---

### 5. secondary_endpoints

1. **PFS by BICR** (key secondary; tested hierarchically after OS succeeds) — per definition above
2. **PFS by Investigator Assessment** — per RECIST v1.1; sensitivity analysis for BICR-PFS
3. **Objective Response Rate (ORR) by BICR** — proportion of patients with best overall response of CR or PR per RECIST v1.1; assessed at each tumor evaluation
4. **Duration of Response (DOR) by BICR** — time from first response (CR/PR) to disease progression or death among responders
5. **Disease Control Rate (DCR)** — proportion of patients with CR, PR, or SD ≥ 12 weeks per RECIST v1.1
6. **Overall Survival rate at 12 and 18 months** — landmark survival rates to characterize tail of curve
7. **Safety and tolerability** — AEs graded per CTCAE v5.0, serious AEs, AEs leading to discontinuation, dose modifications, and immune-related AEs (irAEs)
8. **Cytokine Release Syndrome (CRS)** — incidence, severity (ASTCT consensus grading), time to onset, management interventions, and outcome
9. **Pharmacokinetics (PK)** — serum concentrations of tebentafusp-tebn; population PK analysis
10. **Immunogenicity** — anti-drug antibody (ADA) incidence and titers; impact on PK, efficacy, and safety
11. **Patient-Reported Outcomes (PRO)** — EORTC QLQ-C30 + QLQ-Ocular38 (or OMD-29 for uveal melanoma) time to confirmed deterioration in global health status/quality of life; completed at baseline and each tumor assessment visit prior to any other study procedure
12. **Subgroup analyses** — OS and PFS by LDH (elevated vs. normal), by prior liver-directed therapy (yes/no), by site of metastasis (hepatic only vs. extrahepatic), by age (<65 vs. ≥65), by geographic region

---

### 6. sample_size

**N = 378 randomized patients (252 experimental : 126 control, 2:1)**

**Calculation basis:**

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| Control median OS | 10.0 months | Based on literature median OS ~9–10 months for off-label PD-1/CTLA-4 in mUM; dacarbazine ~10 months; meta-analysis ~9 months |
| Experimental median OS | 14.0 months | Phase 2 class-effect estimate for ImmTAC bispecific T-cell engager in mUM |
| Hazard Ratio | 0.714 | Derived from above medians (10/14) |
| Alpha (one-sided) | 0.025 | Standard for pivotal oncology trial |
| Power | 90% | Adequately powered for rare disease single trial |
| Randomization | 2:1 (exp:ctrl) | Maximizes patient exposure to experimental therapy; accounts for small population |
| Dropout rate | 5% | Conservative for IV weekly oncology trial |

**Method:** Schoenfeld formula for two-sample log-rank test, adjusted for 2:1 allocation ratio. Minimum death events required: ~247. Final analysis triggered when ≥234 death events observed. With 2:1 allocation, the effective number of events is achieved with the above N.

**Event-driven:** The primary analysis will be conducted when the required number of death events has been observed. The calendar time of the primary analysis depends on actual enrollment rate and event accumulation. Expected enrollment period: ~30–36 months at ~100–130 patients/year globally (given rare incidence ~4–5/million, HLA-A*02:01 restriction reducing eligible pool by ~50%, and limited global treatment-experienced centers). Expected total trial duration: ~4–5 years.

**⚠️ Strategy Decision Point — Sample size vs. enrollment feasibility:**
- At 2:1, the control arm (n=126) provides adequate comparator power but limits ability to detect subgroup differences in control arm outcomes.
- If enrollment proves slower than projected, the sponsor may consider: (a) adding additional international sites; (b) reducing sample size to N=330 (HR=0.714, power=85%) or (c) extending enrollment timeline with interim futility analysis at 50% info.

---

### 7. stat_framework

**Multiplicity Control:**

The statistical testing hierarchy is:
1. **Primary:** OS (one-sided α=0.025) — tested first; if significant, proceed to key secondary
2. **Key Secondary:** PFS by BICR (one-sided α=0.025, hierarchical after OS) — tested only if OS is significant
3. **Additional secondary endpoints** (ORR, DOR, DCR, PRO) — tested in a fixed sequence at α=0.025 one-sided per branch; if any endpoint fails, all subsequent endpoints are exploratory only
4. **No alpha splitting between co-primaries** — OS is the sole primary; no alpha adjustment needed

**Rationale for hierarchical (not graphical) approach:** Only 2 endpoints in the confirmatory hierarchy (OS → PFS) — hierarchical testing is simpler and appropriate for ≤2 endpoints. Graphical approach is preferred when ≥3 hypotheses require multiplicity adjustment.

**Interim Analysis (IA):**
- **Timing:** At 50% information fraction (~124 death events)
- **Purpose:** (a) Superiority early stop for overwhelming OS benefit; (b) Futility stop for insufficient efficacy signal
- **Boundary:** O'Brien-Fleming spending function; two-sided p-value boundary at IA ≈ 0.005 (one-sided ≈ 0.0025); Lan-DeMets approximation
- **Independent Data Monitoring Committee (IDMC):** Reviews unblinded IA results; sponsor remains blinded to interim efficacy data
- **No alpha reallocation from IA** — hierarchical testing preserves familywise error rate

**Sensitivity Analyses for OS:**
1. RPSFT model for crossover adjustment (experimental → control crossover, if permitted by protocol)
2. Cox proportional hazards with stratification factors as covariates (primary analysis)
3. Restricted Mean Survival Time (RMST) at 12- and 18-month landmarks (non-proportional hazards robustness)
4. Worst-case scenario censoring analysis

**Estimand Framework:**
The primary estimand (population: ITT, variable: OS, summary: HR) will be specified in the SAP using the treatment policy strategy for intercurrent events (treatment discontinuation, dose modifications, subsequent therapies). A supplementary estimand using the hypothetical strategy will serve as a sensitivity analysis.

**Software:** SAS v9.4 or R v4.x for all statistical analyses.

---

### 8. stratification

**Single stratification factor: LDH (normal vs. elevated)**

| Factor | Category | Justification |
|--------|----------|---------------|
| LDH at baseline (central lab) | Normal (≤ ULN) vs. Elevated (> ULN) | LDH is the single strongest prognostic factor in metastatic uveal melanoma; elevated LDH is consistently associated with 2–3× increased risk of death in mUM; retains only 1 factor per rare disease SOP §Rare.1 to avoid over-stratification and small-cell imbalance |

**Note:** Per rare disease SOP §Rare.1 (rare cancer <5/million incidence), stratification is minimized to 1–2 factors. LDH is the single retained factor. Other potentially prognostic variables (ECOG PS, site of metastasis, prior liver-directed therapy) will be included as covariates in the Cox model rather than stratification factors.

**Analysis:** LDH status will be included as a stratification variable in the primary OS analysis (stratified log-rank test + stratified Cox PH model). An analysis of the interaction between treatment and LDH (elevated vs. normal) will be pre-specified as an exploratory subgroup analysis.

---

### 9. eligibility

**Inclusion Criteria:**

1. **HLA-A*02:01 positivity** — documented by central laboratory assay (CPIC-recognized method, e.g., PCR-based or flow cytometry) prior to randomization. This is a mandatory companion diagnostic requirement for the drug's mechanism (gp100 peptide presented on HLA-A*02:01).

2. **Age ≥ 18 years** at signing of informed consent

3. **Histologically or cytologically confirmed uveal melanoma** with unresectable or metastatic disease
   - Metastatic disease defined by: liver metastases confirmed by imaging and/or biopsy; extrahepatic metastases allowed

4. **Treatment-naive in the metastatic setting:** No prior systemic therapy for metastatic disease; no prior regional liver-directed therapy (including but not limited to: hepatic arterial infusion, percutaneous hepatic perfusion, liver-directed embolization, radioembolization [Y-90], or ablative therapies) for metastatic disease. Prior adjuvant therapy for primary uveal melanoma is excluded if completed within 12 months of randomization.

5. **ECOG Performance Status 0 or 1** at screening

6. **Measurable disease** per RECIST v1.1 — at least one lesion that can be accurately measured in at least one dimension (longest diameter ≥10 mm for solid tumors, or ≥10 mm for lymph nodes)

7. **Adequate organ function:**
   - Hematologic: ANC ≥ 1.5 × 10⁹/L; platelets ≥ 75 × 10⁹/L; hemoglobin ≥ 9 g/dL
   - Hepatic: Total bilirubin ≤ 1.5 × ULN; AST/ALT ≤ 2.5 × ULN (or ≤ 5 × ULN if attributable to liver metastases)
   - Renal: Serum creatinine ≤ 1.5 × ULN or CrCl ≥ 50 mL/min (Cockcroft-Gault)
   - Cardiac: LVEF ≥ 50% by echocardiography or MUGA; no uncontrolled arrhythmias or NYHA Class III–IV heart failure

8. **Life expectancy ≥ 12 weeks** per investigator judgment

9. **Willing and able to comply** with study visits, treatment plan, laboratory tests, and other study procedures

**Exclusion Criteria:**

1. **Prior systemic therapy for metastatic uveal melanoma** (including anti-PD-1, anti-PD-L1, anti-CTLA-4, BRAF/MEK inhibitors, chemotherapy, or other investigational agents)

2. **Prior liver-directed therapy for metastatic disease** within 6 months of randomization (hepatic arterial infusion, embolization, radioembolization, ablation); prior liver-directed therapy >6 months prior is permitted only if there was documented disease progression after the procedure

3. **Active brain metastases** — patients with a history of brain metastases are eligible if: (a) treated with surgery or stereotactic radiosurgery ≥ 4 weeks prior to randomization; (b) no radiographic evidence of progression on MRI/CT within 28 days; (c) no ongoing neurological symptoms, require steroids, or evidence of leptomeningeal disease

4. **Active or history of autoimmune disease** — patients with controlled Type 1 diabetes, vitiligo, psoriasis, or Hashimoto's thyroiditis on stable replacement therapy are eligible

5. **History of cytokine release syndrome (CRS) or severe immune-mediated toxicity** from prior immunotherapy

6. **Uncontrolled intercurrent illness** including: active infection requiring systemic therapy; NYHA Class III–IV heart failure; COPD exacerbation; psychiatric illness/suicidal ideation

7. **Significant QT prolongation** — QTcF > 450 ms at screening; congenital long QT syndrome; on concomitant medications known to prolong QT interval

8. **Prior exposure to any ImmTAC molecule** or other T-cell redirecting bispecific therapy

9. **Active hepatitis B, hepatitis C, or HIV** — HBV DNA < 500 IU/mL on suppressive therapy permitted; HCV RNA negative or < 500 IU/mL on suppressive therapy permitted; HIV with CD4 ≥ 350 cells/µL and undetectable viral load on ART permitted

10. **Pregnancy or breastfeeding** — women of childbearing potential and male patients with partners of childbearing potential must use highly effective contraception for the duration of treatment and ≥ 6 months after last dose

11. **Major surgery or radiotherapy** within 4 weeks of randomization (except palliative radiotherapy for symptomatic metastases, which requires ≥ 2-week window)

12. **Receipt of any investigational drug** within 4 weeks or 5 half-lives (whichever is longer) prior to randomization

---

### 10. operational

**HLA-A*02:01 Testing Strategy:**
Central laboratory testing is mandatory prior to randomization. A validated PCR-based assay or flow cytometry assay will be used. HLA testing must be completed and confirmed positive before a patient can be registered/randomized. Local testing is not acceptable; a confirmatory central test is required for all patients. The CDx (companion diagnostic) will be aligned with the investigational product and FDA CDx guidance; a Biologic License Application (BLA) will include the CDx as a required diagnostic. HLA-A*02:01 prevalence in Caucasian populations is ~45%; in Asian populations ~10–15%; in Black populations ~5–10%. International sites must account for regional HLA allele frequency when planning enrollment targets.

**CRS Management and Safety Monitoring (Novel Bispecific T-Cell Engager Requirements):**
Per SOP Core §7.1 for bispecific antibodies/T-cell engagers:
- **Step-up dosing regimen:** 20 mcg Day 1 → 30 mcg Day 8 → 68 mcg Day 15 and weekly thereafter. The step-up dosing is mandatory to mitigate CRS risk and must be adhered to without exception.
- **In-hospital monitoring:** Patients must be hospitalized for observation for ≥16 hours after the first three infusions (D1, D8, D15 of the step-up period). Vital signs (temperature, BP, heart rate, oxygen saturation) monitored every 2 hours during the infusion and for ≥16 hours post-infusion.
- **CRS grading and management algorithm:** CRS will be graded per ASTCT consensus grading (Grade 1–4). Pre-specified management algorithms will include: (a) tocilizumab (anti-IL-6R) and/or siltuximab for Grade 2–4 CRS; (b) corticosteroids (methylprednisolone 1–2 mg/kg/day) for Grade 3–4 or tocilizumab-refractory CRS; (c) study drug interruption/discontinuation criteria for Grade 3–4 CRS; (d) supportive care (antipyretics, IV fluids, oxygen) for Grade 1–2.
- **CRS premedication:** Acetaminophen and diphenhydramine (or equivalent) pre-medication 30–60 minutes before each infusion.
- **Dose modification criteria:** Dose reductions in 25% increments for Grade 2 CRS events; permanent discontinuation for Grade 4 CRS or Grade 3 CRS despite tocilizumab and steroids. ≥80% of patients must maintain ≥80% of planned dose intensity per protocol.
- **IDMC safety reviews:** IDMC will review safety data (including CRS events, serious AEs, AEs of special interest) at each scheduled IA and at a minimum every 6 months during the enrollment period.

**Comparator Arm (IC) Operationalization:**
Patients randomized to the control arm will have their IC treatment selected by the investigator from the pre-specified IC options list at randomization before treatment initiation. The selected IC treatment must be documented in the CRF. Patients may switch IC options only in the event of unacceptable toxicity or disease progression requiring discontinuation. Crossover from control arm to experimental therapy is **not permitted** (to preserve the OS endpoint integrity); post-progression survival will be documented.

**Study Sites:**
Approximately 80–120 sites globally (US, EU, Australia, Japan, Canada), selected for uveal melanoma patient volume and HLA-A*02:01 testing infrastructure. Target enrollment: ~100–130 patients/year. Protocol includes a recruitment optimization plan with tiered site activation and focused recruitment in high-volume academic melanoma/ocular oncology centers.

**Imaging and BICR:**
- CT chest/abdomen/pelvis + MRI liver (or CT liver with contrast) every 8 weeks (± 7 days) per RECIST v1.1
- Brain MRI at baseline and every 24 weeks (or symptom-triggered)
- BICR: all imaging sent to a blinded independent central review committee; investigator reads are conducted locally and transmitted to BICR for independent assessment; BICR Charter specifies imaging acquisition standards, RECIST v1.1 measurement procedures, and reconciliation with investigator reads

**Data Safety Monitoring Board (DSMB/IDMC):**
Independent IDMC will conduct periodic safety reviews (annually or at IA events). A separate unblinded statistician will produce IDMC reports. Sponsor personnel remain blinded to treatment-level efficacy data during the trial. IDMC will have authority to recommend early termination for overwhelming efficacy (O'Brien-Filing boundaries) or for safety concerns (unacceptable toxicity).

**PRO Completion:**
PRO instruments (EORTC QLQ-C30 + QLQ-Ocular38) will be completed at baseline, Week 4, Week 8, and every 8 weeks thereafter until disease progression or death, prior to any other clinical assessments and prior to receiving treatment or test results.
