## Consensus Answer: Kimmtrak [protocol-design] — Round 10

### 1. design_type
Open-label, randomized, parallel-group, controlled Phase 3 pivotal trial. Single pivotal study is sufficient per SOP §8.1 (rare disease, no approved therapies, large expected effect size, high unmet need). Open-label is appropriate: primary endpoint is OS (objectively measurable, not subject to assessor bias); IV weekly infusion schedule vs. heterogeneous IC renders blinding operationally impossible; CRS monitoring requirements in the experimental arm preclude masking. [orchestrator-resolved: A specifies 1:1 randomization; C specifies 2:1 (experimental:control). SOP does not mandate a specific ratio, but standard confirmatory oncology trials default to 1:1 for equal statistical efficiency; 2:1 is a Sponsor SDP requiring quantified trade-off per SOP §SDP.1. Adopt 1:1 as SOP baseline with 2:1 flagged as ⚠️ Strategy Decision Point.]

### 2. control_arm
Investigator's Choice (IC) of pre-specified systemic therapy options, selected and locked before randomization. Options: (1) Anti-PD-1 monotherapy: pembrolizumab or nivolumab; (2) Anti-CTLA-4 monotherapy: ipilimumab; (3) Anti-PD-1 + anti-CTLA-4 combination: ipilimumab + nivolumab; (4) Chemotherapy: dacarbazine or temozolomide. Rationale: SOP §3.1 decision tree — no FDA-approved SOC for metastatic uveal melanoma exists; IC with pre-specified list reflects actual practice per NCCN 2021; single-agent control would impose false equivalence among options with genuine clinical uncertainty. Crossover from IC to experimental arm not permitted to preserve OS endpoint integrity. [consensus: 2/2]

### 3. primary_endpoint
Overall Survival (OS) — Time from randomization to death from any cause. Per SOP §4.2, OS is the gold standard endpoint and tops the oncology hierarchy. Specifically appropriate here because: (1) open-label trial with bispecific T-cell engager mechanism — SOP §4.1 explicitly excludes bispecific antibodies from the investigator-PFS exemption, making PFS-primary problematic; (2) ultra-poor prognosis (median OS <6 months) makes OS feasible and clinically most meaningful; (3) objective, unbiased assessment unaffected by open-label design; (4) no validated surrogate endpoint established in mUM; (5) supports traditional approval with definitive labeling. [consensus: 2/2]

### 4. endpoint_definition
**Primary — OS**: Time from date of randomization to date of death from any cause. Patients alive or lost to follow-up censored at date of last known alive contact. Survival status collected every 6 weeks after treatment discontinuation until end of study.

**Estimand** (per SOP §4.4, all 5 attributes):
- Population: HLA-A*02:01-positive adults with unresectable/metastatic uveal melanoma, treatment-naïve in metastatic setting
- Treatment condition: Tebentafusp weekly IV vs. Investigator's Choice (pre-specified)
- Variable: Time to death from any cause
- Summary measure: Hazard ratio with 95% CI; stratified log-rank p-value
- Intercurrent event strategy: Treatment policy (all deaths counted regardless of treatment discontinuation or subsequent therapies); RPSFT sensitivity analysis for potential post-progression crossover

**Key Secondary — PFS**: Time from randomization to first documented disease progression per RECIST v1.1 (BICR-assessed) or death from any cause. Per SOP §4.1, bispecific antibodies/T-cell engagers are explicitly excluded from the investigator-PFS exemption — BICR is required as the primary PFS assessment method; investigator-assessed PFS serves as sensitivity analysis. Hypothetical estimand strategy: censor at treatment discontinuation for primary PFS analysis. [orchestrator-resolved: Both agree on OS definition and estimand framework. C adds RPSFT crossover adjustment and hypothetical estimand for PFS, which are SOP-aligned per §4.4 and §4.5. C's formulation adopted for completeness.]

### 5. secondary_endpoints
Hierarchical testing order (per SOP §5.2 — 2 confirmatory hypotheses → hierarchical testing):
1. **OS** (primary; one-sided α=0.025)
2. **PFS by BICR** (key secondary; tested hierarchically after OS succeeds; one-sided α=0.025)
3. **ORR by BICR** (RECIST v1.1; CR + PR rate)
4. **Duration of Response (DOR) by BICR** (among responders)
5. **Disease Control Rate (DCR)** (CR + PR + SD ≥12 weeks)
6. **OS rate at 12 and 18 months** (landmark survival rates)
7. **Safety and tolerability** (AEs per CTCAE v5.0; SAEs; AEs leading to discontinuation; irAEs)
8. **CRS** (incidence, ASTCT grade, time to onset, management, outcome)
9. **PK** (serum concentrations; population PK analysis)
10. **Immunogenicity** (ADA incidence and titers; impact on PK/efficacy/safety)
11. **PRO** (EORTC QLQ-C30 + QLQ-Ocular38: Time to Confirmed Deterioration in global health status/QoL; per SOP §4.6, completed prior to other assessments)
12. **Exploratory subgroups**: OS and PFS by LDH (elevated vs. normal), prior liver-directed therapy (yes/no), site of metastasis, age (<65 vs. ≥65), geographic region

Multiplicity: Endpoints 1-2 tested at full α=0.025 each via hierarchical gate; endpoints 3-12 are hierarchical/exploratory per SAP. [orchestrator-resolved: A's list is narrower; C adds PK, immunogenicity, DCR, and more subgroups — all SOP-appropriate for a novel bispecific T-cell engager. C's more complete list adopted.]

### 6. sample_size
**N ≈ 378 randomized patients (1:1: ~189 per arm)**

**Assumptions** (per SOP §5.1 — derived from ≥3 trials, population-weighted):

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| Control median OS | 10 months | Meta-analysis of off-label PD-1/CTLA-4 in mUM: ~9–10 months; dacarbazine: ~10 months; consistent across multiple cohort studies |
| Experimental median OS | ~14 months | Phase 2 ImmTAC/tebentafusp class-effect estimate |
| Hazard Ratio (target) | 0.714 | Derived from 10/14-month medians; clinically meaningful |
| One-sided alpha | 0.025 | Standard pivotal oncology trial |
| Power | 90% | Single trial in rare disease requires robust power |
| Dropout rate | 5% | Conservative for IV weekly oncology trial |

**Events required**: ~234 total deaths (event-driven design). Final analysis triggered at ≥234 death events.

**HLA-A*02:01 screening**: ~45% prevalence in Caucasian, ~10–15% in Asian, ~5–10% in Black populations → screen ~500–700 patients globally to randomize 378.

⚠️ **Strategy Decision Point**: If enrollment is slower than projected, sponsor may consider: (a) reducing N to 330 (power=85%, HR=0.714); (b) extending enrollment timeline; (c) adding international sites. [orchestrator-resolved: A assumes control median OS = 6 months (yielding N=165, 100 events) — this is inconsistent with SOP §5.1 requiring population-weighted derivation from ≥3 trials. Literature (meta-analyses and Phase 2 cohorts) consistently shows median OS ~9–10 months in mUM with IC. C's control arm assumption (10 months) is better-supported and SOP-aligned. C's sample size (N=378, 234 events) adopted.]

### 7. stat_framework
**Analysis Population**: Intent-to-treat (ITT) — all randomized patients.

**Primary Analysis**: Stratified log-rank test comparing tebentafusp vs. IC on OS, stratified by LDH status (elevated vs. normal). Cox proportional hazards model for HR estimate with LDH status as stratification covariate; additional baseline prognostic factors may be added per SAP (per SOP §5.4).

**Multiplicity** (SOP §5.2 — 2 hypotheses → hierarchical):
1. OS (one-sided α=0.025) — tested first
2. PFS by BICR (one-sided α=0.025) — tested only if OS achieves significance
3. Additional endpoints: fixed sequence, exploratory if any fails

**Interim Analysis**:
- Timing: 50% information fraction (~117 death events)
- Purpose: (a) Early stop for overwhelming OS efficacy; (b) Futility stop for insufficient efficacy signal
- Boundary: O'Brien-Fleming spending function (Lan-DeMets); IA threshold ≈ one-sided p=0.0025
- IDMC reviews unblinded IA results; sponsor remains blinded to interim efficacy data

**Sensitivity Analyses for OS** (per SOP §4.5):
1. RPSFT model for crossover adjustment
2. Cox PH with stratification factors as covariates (primary analysis)
3. RMST at 12- and 18-month landmarks (non-proportional hazards robustness)
4. Worst-case scenario censoring analysis
5. OS harm threshold: upper bound of 95% CI for HR must exclude 1.20 (pre-specified harm boundary)

**Non-Proportional Hazards**: Pre-specified testing; if violated, primary inference shifts to RMST difference with supportive HR analysis. [orchestrator-resolved: A proposes no interim analysis; C proposes IA at 50% information with O'Brien-Fleming boundaries. SOP does not prohibit IA; for a rare disease trial of ~4–5 years duration, an IA allows early stop for overwhelming efficacy or futility — both ethically and operationally justified. C's approach with IDMC oversight is more complete and SOP-aligned (SOP §7.1 IDMC requirement). C's IA framework adopted.]

### 8. stratification
Single stratification factor: **LDH status** (normal ≤ULN vs. elevated >ULN) at baseline, measured by central laboratory.

Rationale (per SOP §6.1 rare cancer rule): For cancers with <5/million incidence, minimize to 1–2 stratification factors to avoid over-stratification and small-cell imbalance. LDH is the single strongest independent prognostic factor in metastatic uveal melanoma; elevated LDH consistently associated with 2–3× increased risk of death. Liver metastasis status, ECOG PS, and prior therapy are prognostically secondary and/or correlated with LDH — included as covariates in the Cox model rather than stratification factors.

Randomization performed via IRT (IWRS) with permuted blocks within each LDH stratum. LDH status included as stratification variable in primary OS analysis (stratified log-rank + stratified Cox PH). Treatment × LDH interaction pre-specified as exploratory subgroup analysis. [consensus: 2/2]

### 9. eligibility
**Key Inclusion Criteria**:
1. HLA-A*02:01 positivity — centrally confirmed by validated CDx assay (PCR-based or flow cytometry) prior to randomization; local testing not acceptable (per SOP §2.2)
2. Age ≥18 years at informed consent
3. Histologically or cytologically confirmed unresectable or metastatic uveal melanoma
4. Treatment-naïve in the metastatic setting: no prior systemic therapy for metastatic disease; no prior regional liver-directed therapy for metastatic disease
5. ECOG Performance Status 0–1 at screening
6. Measurable disease per RECIST v1.1 (≥1 lesion ≥10 mm)
7. Adequate organ function: ANC ≥1.5×10⁹/L; platelets ≥75×10⁹/L; Hgb ≥9 g/dL; bilirubin ≤1.5×ULN; AST/ALT ≤2.5×ULN (≤5× if liver mets); creatinine ≤1.5×ULN or CrCl ≥50 mL/min; LVEF ≥50%
8. Life expectancy ≥12 weeks (per investigator judgment)

**Key Exclusion Criteria**:
1. Prior systemic therapy for metastatic uveal melanoma (anti-PD-1/L1, anti-CTLA-4, BRAF/MEK inhibitors, chemotherapy, or investigational agents)
2. Prior liver-directed therapy for metastatic disease within 6 months; therapy >6 months prior permitted only with documented progression after the procedure
3. Active brain metastases; treated/stable CNS mets eligible if: ≥4 weeks post-treatment, no radiographic progression, no ongoing neurological symptoms, no steroids
4. Active or uncontrolled autoimmune disease requiring systemic immunosuppression (controlled vitiligo, T1DM, psoriasis, Hashimoto's on stable therapy permitted)
5. Prior CRS or severe immune-mediated toxicity from prior immunotherapy
6. QTcF >450 ms at screening; congenital long QT syndrome; concomitant QT-prolonging medications
7. Prior exposure to any ImmTAC molecule or other T-cell redirecting bispecific therapy
8. Active HBV/HCV/HIV (exceptions permitted with controlled viral load and adequate CD4)
9. Pregnancy or breastfeeding; inadequate contraception
10. Major surgery or radiotherapy within 4 weeks of randomization
11. Uncontrolled intercurrent illness (active infection, NYHA III-IV heart failure, psychiatric illness with suicidality) [orchestrator-resolved: Both agree on core eligibility. C adds more operational nuance: LVEF criterion, QTcF threshold of 450 ms (vs. A's 480 ms; 450 ms is more conservative and appropriate given cardiac safety profile of T-cell engagers), HIV/HBV/HCV clarification with permissible exceptions, and adjuvant therapy washout. C's more detailed formulation adopted; QTcF 450 ms preferred over A's 480 ms per cardiac safety prudence.]

### 10. operational
**HLA-A*02:01 CDx Strategy**:
Central laboratory testing mandatory prior to randomization via validated PCR-based or flow cytometry assay; local testing not acceptable. Pre-screening permitted to assess HLA eligibility before full consent. Turnaround ≤10 business days. HLA testing from blood/buccal swab (germline). CDx BLA co-submission aligned with IND. HLA-A*02:01 prevalence varies by ethnicity (Caucasian ~45%, Asian ~10–15%, Black ~5–10%); site enrollment targets must account for regional prevalence.

**Step-Up Dosing and CRS Safety Monitoring** (per SOP §7.1 — T-cell engager requirements):
- Step-up: Day 1 20 mcg IV → Day 8 30 mcg IV → Day 15 68 mcg IV → 68 mcg weekly thereafter
- In-hospital monitoring: ≥16 hours post-infusion after first 3 doses (D1, D8, D15); vital signs every 2 hours during infusion and 16-hour observation window
- Pre-medication: Acetaminophen + diphenhydramine 30–60 minutes before each infusion
- CRS grading: ASTCT consensus criteria (Grade 1–4)
- CRS management: tocilizumab ± siltuximab for Grade 2–4; corticosteroids (methylprednisolone 1–2 mg/kg/day) for Grade 3–4 or tocilizumab-refractory; dose interruption for Grade 3–4; permanent discontinuation for Grade 4 or Grade 3 refractory to tocilizumab + steroids
- Dose intensity target: ≥80% of patients maintain ≥80% of planned dose intensity (per SOP §7.1)
- ICU-level monitoring capability required on-site for first 3 doses

**Control Arm (IC) Operationalization**:
IC selection locked in CRF prior to randomization; IC switches permitted only for unacceptable toxicity. Crossover from IC to experimental arm not permitted to preserve OS integrity; post-progression survival documented.

**Study Sites**: ~80–120 sites globally (US, EU: UK/Germany/France/Netherlands, Australia, Japan, Canada) selected for uveal melanoma patient volume and HLA CDx infrastructure. Target enrollment: ~100–130 patients/year. Tiered site activation with focused recruitment in high-volume academic melanoma/ocular oncology centers.

**Imaging**: CT chest/abdomen/pelvis + MRI liver (or CT with contrast) every 8 weeks (±7 days) per RECIST v1.1. Brain MRI at baseline and every 24 weeks. BICR charter pre-specifies imaging quality standards, RECIST v1.1 measurement procedures, and reconciliation with investigator reads.

**IDMC**: Independent committee reviews safety data (CRS, SAEs, AEs of special interest) and unblinded IA efficacy data at minimum every 6 months and at each IA event. Sponsor remains blinded to treatment-level efficacy data. IDMC charter pre-specifies authority to recommend early stop for overwhelming efficacy (O'Brien-Fleming boundaries) or unacceptable safety.

**PRO Administration**: EORTC QLQ-C30 + QLQ-Ocular38 completed at baseline, Week 4, Week 8, then every 8 weeks until PD or death; completed prior to any other clinical assessments and prior to receiving treatment or test results (per SOP §4.6).

**Statistical Analysis Timing**: Final analysis triggered at ≥234 death events. Expected study duration ~4–5 years (30–36-month enrollment + 12–18 months follow-up). [orchestrator-resolved: Both agree on core operational elements (step-up dosing, 16h monitoring, CRS management, site strategy, PRO schedule). C adds more detail on IC operationalization, BICR charter, IDMC authority, PRO timing, and regional HLA prevalence strategy. C's more complete operational plan adopted.]

---

## Merge Notes
- Solvers: A ✅, B TIMEOUT, C ✅
- Divergence count: 5/10

**Divergences resolved:**
1. **design_type** (randomization ratio): A=1:1 vs. C=2:1 → Adopted A's 1:1 (SOP default for confirmatory trials; 2:1 flagged as SDP)
2. **sample_size**: A=~165 pts/100 events vs. C=378 pts/234 events → Adopted C's (control median OS 10 mo is literature-supported per SOP §5.1; A's 6-month assumption not well-grounded)
3. **stat_framework** (IA strategy): A=no IA vs. C=IA at 50% info → Adopted C's (IA with IDMC oversight is SOP-appropriate for a 4–5 year rare disease trial)
4. **secondary_endpoints**: A=narrower list vs. C=PK/immunogenicity/DCR added → Adopted C's expanded list (SOP-appropriate for novel bispecific T-cell engager)
5. **eligibility** (QTcF threshold): A=480 ms vs. C=450 ms → Adopted C's 450 ms (more conservative; appropriate for cardiac safety in T-cell engager class)

**Full consensus (5/10):** control_arm, primary_endpoint, endpoint_definition (framework), stratification, operational (core elements)
