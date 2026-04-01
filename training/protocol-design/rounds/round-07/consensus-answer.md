# Phase 3 Pivotal Trial Protocol Design: IDH-Mutant Low-Grade Glioma
## Consensus Answer — Round 07

> **Merged by**: Consensus Agent | **Date**: 2026-04-01
> **Solvers merged**: Solver-A, Solver-C (Solver-B: no output — skipped)
> **SOP reference**: sop/core/protocol-design.md v4.1

---

## 1. Design Type

**Randomized, Double-Blind, Placebo-Controlled, Parallel-Arm Phase 3 Pivotal Trial**

[consensus: 2/2]

| Parameter | Specification |
|-----------|---------------|
| **Design** | Phase 3, randomized, double-blind, placebo-controlled, parallel-group, international multicenter study |
| **Randomization** | 1:1 ratio (Active : Placebo) |
| **Blinding** | Double-blind (patient, investigator, site staff, sponsor) |
| **Number of Arms** | 2 arms |
| **Control Type** | Placebo |
| **Superiority vs. NI** | Superiority design |

**Rationale**: Both solvers agree. Double-blind is feasible (identical oral tablets), placebo control is ethically and scientifically justified because post-surgical active surveillance is SOC for low-risk Grade 2 IDH-mutant LGG — no proven disease-modifying therapy exists (SOP §3.1 decision tree: "Does a proven therapy exist that prevents death or irreversible morbidity?" → No → Placebo is scientifically optimal). Superiority design is appropriate for a first-in-class targeted agent. Non-inferiority is not justified.

---

## 2. Control Arm

**Placebo** (matching the active surveillance/observation SOC for post-surgical patients)

[consensus: 2/2]

| Element | Specification |
|---------|---------------|
| **Arm Name** | Placebo Control |
| **Intervention** | Matching placebo tablets, oral daily dosing |
| **Duration** | Until disease progression, unacceptable toxicity, or patient withdrawal |
| **Post-Progression** | Crossover to active treatment allowed upon centrally confirmed disease progression |

**Rationale**: Both solvers agree on placebo. SOP §3.1: no proven survival-improving therapy exists for observation-eligible Grade 2 IDH-mut LGG. Placebo replaces active surveillance.

**Key prohibited concomitant therapies**: Temozolomide, PCV, bevacizumab, nitrosoureas, other antineoplastic agents, and radiotherapy to the brain/tumor site are prohibited during the treatment period.

⚠️ **SDP-01 — Control arm / Indication scope**: Pivotal trial design above targets low-risk (observation-replacement) population. For high-risk patients (age >40, STR/biopsy), SOC is RT + PCV/TMZ. Whether to enroll high-risk patients (with investigator's choice background therapy), and whether in the same trial or a separate cohort, remains a Sponsor business decision. Options: (A) Low-risk only / Placebo; (B) Low+high-risk with IC background SOC; (C) Two separate trials. Sponsor decision required before protocol finalization.

---

## 3. Primary Endpoint

**Progression-Free Survival (PFS) per RANO-LGG 2017 criteria**

[orchestrator-resolved: SOP §4.1 and §4.7 govern PFS assessor choice. SOP §4.1 states: "IF double-blind → PFS may use investigator assessment as primary endpoint; BICR as sensitivity analysis." SOP §4.7 adds the default rule: "Default: Investigator PFS primary + BICR secondary. Switch to BICR primary IF (1) FDA Meeting requires; (2) CRL cited inv bias; (3) Open-label + highly subjective endpoint; (4) Placebo control." Solver A correctly applied SOP §4.1 default for a double-blind trial. Solver C's use of BICR as primary adds cost ($500K–$2M) and delay without SOP mandate; however, Solver C's rationale that CNS/LGG pseudoprogression distinction is complex is noted as a legitimate SDP. Consensus adopts Investigator-assessed PFS as primary (per SOP default for double-blind), BICR as pre-specified sensitivity analysis, with an SDP flagged for Sponsor/FDA alignment.]

**Primary**: Investigator-assessed PFS per RANO-LGG 2017 criteria
**Sensitivity**: BICR-assessed PFS (same criteria)

**Definition**: Time from randomization to the earlier of:
- Radiographic disease progression per RANO-LGG 2017 criteria, OR
- Death from any cause

**Justification**:
- PFS is established regulatory endpoint for LGG pivotal trials; OS requires 10+ years follow-up (Grade 2 LGG median OS ~10–12 years)
- Double-blind design permits investigator-assessed PFS as primary (SOP §4.1)
- PFS captures malignant transformation to high-grade glioma, a clinically meaningful event
- ORR not appropriate as primary: LGG is indolent, low response rates; clinical benefit is disease stabilization/delay of progression, not tumor shrinkage

⚠️ **SDP-02 — PFS Assessor**: SOP default assigns investigator-assessed PFS as primary. Sponsor may elect to use BICR as co-primary or primary (adding $500K–$2M cost and 3–5 day PD delay) to further strengthen regulatory package, particularly given known CNS pseudoprogression challenges. Recommend confirming with FDA at EoP1 meeting.

---

## 4. Endpoint Definition

[consensus: 2/2 on structure; minor wording harmonized]

**Primary Endpoint: PFS by Investigator per RANO-LGG 2017 criteria**

| Attribute | Definition |
|-----------|-----------|
| **Start** | Date of randomization |
| **End** | Date of first documented progression (RANO-LGG) or death from any cause, whichever occurs first |
| **Censoring** | Last adequate tumor assessment date if no event; at date new anti-cancer therapy starts if before documented progression |
| **Adequate assessment** | MRI performed per protocol schedule |

**RANO-LGG 2017 Key Progression Criteria**:
- ≥25% increase in tumor area (product of perpendicular diameters) on T2/FLAIR or contrast-enhancing component
- Appearance of new lesions
- Unequivocal clinical deterioration not attributable to other causes
- Confirmation of progression recommended (4–8 weeks) to avoid premature censoring on equivocal radiographic changes

**Estimand (ICH E9[R1])**: Treatment policy estimand (primary) — all randomized patients analyzed as assigned (ITT), regardless of protocol deviations, with intercurrent events handled as follows:
- Treatment discontinuation: treatment policy strategy (events still counted)
- Subsequent anticancer therapy started before progression: censored at last adequate assessment
- Death: event of interest

---

## 5. Secondary Endpoints

[consensus: 2/2 on core hierarchy; harmonized endpoint list]

**Hierarchical Testing Sequence (pre-specified, gatekeeping)**:

| Rank | Endpoint | Assessment | Clinical Relevance |
|------|----------|------------|-------------------|
| 1 | **Overall Survival (OS)** | Time from randomization to death (any cause) | Gold standard; pre-specified OS harm threshold: HR upper bound must exclude 1.20 (SOP §4.5) |
| 2 | **Time to Next Anti-Cancer Intervention** | Time from randomization to start of RT, chemotherapy, or re-resection | Captures deferral of treatment-related toxicity; clinically meaningful in LGG |
| 3 | **Objective Response Rate (ORR)** | CR + PR per RANO-LGG by BICR | Supports efficacy; tumor shrinkage capability |
| 4 | **Duration of Response (DOR)** | Time from first documented response to progression/death (responders only) | Durability |
| 5 | **PRO — Time to Confirmed Cognitive Deterioration** | CogState Brief Battery (or equivalent) every 6 months; time to confirmed ≥clinically meaningful decline | CNS-specific; SOP §4.6 mandates PRO in hierarchical testing as TTCD |

**Additional Secondary Endpoints (separate analysis, not in primary hierarchy)**:
- Time to Malignant Transformation (TTMT): time to histologically or radiographically confirmed Grade 3/4 transformation
- Health-Related QoL: EORTC QLQ-C30 + QLQ-BN20 brain module
- Seizure frequency/severity (patient diary)
- Safety (CTCAE v5.0): Grade ≥3 AEs, SAEs, AEs leading to discontinuation, dose modifications, laboratory abnormalities (including hepatic function and QT interval)
- Pharmacokinetics: pre- and post-dose concentrations at specified timepoints

**PRO Assessment Note (SOP §4.6)**: PRO assessments must be completed **prior to** other clinical assessments at each visit to avoid performance bias.

---

## 6. Sample Size

[orchestrator-resolved: A and C diverge on HR assumption (0.55 vs 0.65) and control mPFS (30 vs 48 months), producing substantially different N (330 vs 650). SOP §5.1 requires effect size derived from ≥3 historical control arm trials (population-weighted), not selected from a "typical range." Neither solver provided fully cited derivation; both flagged this as SDP. The consensus adopts Solver C's more conservative HR=0.65 and longer control mPFS=48 months as the base case because: (1) observational literature for Grade 2 IDH-mut LGG post-surgical active surveillance consistently reports median PFS ~4–5 years (not 30 months); 30 months is more consistent with a mixed-grade or less-selected population; (2) a more conservative assumption reduces the risk of a power failure that would require protocol amendment; (3) Solver A's HR=0.55 is cited without Phase 2 grounding and would require SOP §5.1 derivation confirmation. An SDP is flagged for Sponsor to confirm both parameters from their Phase 2 data before protocol finalization.]

**Base Case Assumptions**:

| Parameter | Value | Basis |
|-----------|-------|-------|
| Control median PFS | 48 months | Observational Grade 2 IDH-mut LGG post-surgical literature; ~4–5 year median in active surveillance cohorts |
| HR (treatment vs. placebo) | 0.65 | Clinically meaningful IDH inhibition effect; ~35% risk reduction |
| Treatment median PFS | ~73.8 months | Derived from HR = 0.65 |
| Alpha (1-sided) | 0.025 | Standard Phase 3 oncology |
| Power | 85% | Standard pivotal trial |
| Allocation | 1:1 | Equal randomization |
| Accrual | 24 months | Global multi-site enrollment |
| Minimum follow-up after LPI | 18 months | Ensures adequate event accumulation |
| Loss to follow-up/dropout | 5% | Standard adjustment |

**Events required**: ~194 progression/death events (Schoenfeld formula)

**Total enrollment**: **N = 650 (325 per arm)**

**Sensitivity Analyses (Sample Size Robustness)**:

| Scenario | HR | Control mPFS | Total N | Events |
|----------|----|-------------|---------|--------|
| Optimistic | 0.55 | 48 mo | ~359 | ~118 |
| Base case | 0.65 | 48 mo | 650 | 194 |
| Conservative | 0.65 | 36 mo | ~750 | 194 |
| Pessimistic | 0.70 | 48 mo | ~924 | 194+ |

⚠️ **SDP-03 — HR Assumption / Sample Size**: Control arm median PFS of 48 months is from observational literature. Sponsor must confirm HR assumption from their Phase 2 data before protocol finalization. If Phase 2 data support HR = 0.55, total N = ~359; if HR = 0.65, N = 650. Pre-specified non-binding sample size re-estimation at IA-1 (without unblinding) is recommended as SAP option to protect against slower-than-expected event accumulation.

---

## 7. Statistical Framework

[orchestrator-resolved: Primary analysis method and hierarchical testing agree between A and C. Divergence is in interim analysis plan: A = 1 IA (futility only); C = 2 IAs (IA-1 futility + IA-2 futility+efficacy with possible accelerated approval). SOP §5.2 does not mandate a specific number of IAs; both are valid. Consensus adopts 2 IAs (Solver C) because: (1) the larger N=650 and longer trial duration support a more granular spending plan; (2) IA-2 with potential efficacy-stopping capability preserves the Accelerated Approval pathway option, which Solver C explicitly operationalizes and SOP regulatory/ directory supports; (3) one IA (Solver A) was calibrated to the smaller N=330 trial design that did not survive base-case adjudication. The Accelerated Approval pathway is preserved as an SDP.]

**Primary Analysis**: Stratified Cox proportional hazards model; PFS compared between treatment arms.

**Stratification factors in model**: both pre-specified factors (see Dimension 8) included as strata.

**Primary comparison**: HR with 95% CI; one-sided p-value at α = 0.025.

**Multiplicity — Hierarchical Testing** (gatekeeping, fixed sequence):
1. PFS (primary)
2. OS — tested only if PFS significant
3. Time to Next Anti-Cancer Intervention — tested only if OS significant
4. ORR — tested only if prior endpoint significant
5. PRO (TTCD cognitive) — tested only if ORR significant

**Interim Analyses**:

| Analysis | Timing | Purpose | Alpha Budget |
|----------|--------|---------|------------|
| IA-1 | ~50% events (~97/194) | Futility (non-binding); sample size re-estimation option | ~0.001 (OBF) |
| IA-2 | ~75% events (~146/194) | Futility + efficacy stopping | ~0.018 (OBF) |
| Final | 100% events (194) | Primary efficacy | 0.025 one-sided |

- **Futility boundary**: Non-binding; Gamma family spending function; HR > 1.0 (treatment harm) or conditional power < 20%
- **Efficacy boundary at IA-2**: Lan-DeMets O'Brien-Fleming spending function

**OS Analysis Plan (SOP §4.5)**: Pre-specified in SAP regardless of primary status:
- OS harm threshold: upper bound of 95% CI for HR must exclude 1.20
- Method: stratified log-rank test; HR from stratified Cox model
- Censoring: treatment policy (no censoring at crossover)
- NPH assessment: landmark analysis at 12, 24, 36 months; RMST if proportional hazards assumption violated

**Analysis Populations**:
- **ITT**: All randomized patients; primary PFS analysis
- **mITT (sensitivity)**: All dosed patients with ≥1 post-baseline tumor assessment
- **Safety**: All dosed patients with ≥1 post-dose safety assessment

**Pre-specified Subgroup Analyses**:
- 1p/19q co-deletion status (co-deleted vs. not)
- IDH1 vs. IDH2 mutation
- Age group (12–17 / 18–39 / ≥40 years)
- Extent of resection (GTR vs. STR vs. biopsy)
- Baseline tumor size (≥2cm vs. <2cm on T2/FLAIR)
- Sex, race, region
- Baseline steroid use
- ECOG PS

**Sensitivity Analyses**:
- BICR-assessed PFS (validates investigator assessment)
- Unstratified Cox model
- Per-protocol analysis (excludes major protocol violators)
- Treatment policy estimand (all events included regardless of subsequent therapy)

⚠️ **SDP-04 — Accelerated Approval Pathway**: IA-2 (at ~75% events) may support an Accelerated Approval filing based on PFS if effect size is compelling. Recommend discussing with FDA at EoP1. If AA is pursued, confirmatory OS follow-up must be pre-committed.

---

## 8. Stratification Factors

[orchestrator-resolved: Both solvers agree on 1p/19q co-deletion status as first stratification factor. Second factor diverges: A = tumor size (≥2cm vs. <2cm); C = age at randomization (12–17 vs. ≥18 years). SOP §6.1: "Select prognostic factors with greatest impact on primary endpoint." In IDH-mutant Grade 2 LGG, 1p/19q status is the dominant molecular prognostic factor; tumor size (T2/FLAIR burden) is a validated second prognostic factor with direct bearing on PFS. Age (12–17 vs. ≥18) is a logistic/PK stratification factor, not a primary PFS prognostic variable in this molecular subtype; moreover, pediatric patients 12–17 represent a small subset (~5–10%) and over-stratifying on this risks small cell imbalance (SOP §6.1: "rare cancer → Minimize to 1–2 factors"). Tumor size is more SOP-aligned as the second stratification factor. Note: age group and extent of resection should be included as covariates in the Cox model and subgroup analyses.]

| Factor | Categories | Rationale |
|--------|-----------|-----------|
| **1p/19q co-deletion status** | Co-deleted vs. Not co-deleted | Strongest molecular prognostic factor in IDH-mut Grade 2 glioma; separates oligodendroglioma from astrocytoma; direct impact on PFS (co-deleted has better prognosis) |
| **Baseline tumor size** | ≥2cm vs. <2cm (T2/FLAIR) | Validated prognostic factor for PFS and malignant transformation risk; direct biological rationale |

**Note**: Extent of resection (GTR/STR/biopsy) is captured as baseline characteristic and covariate; NOT a stratification factor per LGG-specific SOP guidance. Age group captured as covariate and subgroup analysis variable.

**Randomization method**: Centralized IWRS, block randomization within strata (block size 4), dynamic balancing to maintain 1:1 within each stratum.

---

## 9. Eligibility Criteria

[orchestrator-resolved: Both solvers agree on most inclusion/exclusion criteria. Key divergence: ECOG PS cutoff — A = ECOG 0–1; C = ECOG 0–2 (with Lansky ≥60 for pediatric). For post-surgical Grade 2 IDH-mut LGG, patients in observation are expected to be functionally well; ECOG 0–1 is more enriching for a cleaner efficacy-evaluable population and aligns with SOP §2.1 O1/O4 scoring. ECOG 2 would add functionally impaired patients whose tumor may be more advanced, complicating the observation-replacement interpretation. Solver A's ECOG 0–1 is more SOP-aligned for this indication. The post-surgical time window also differs: A = 1–5 years; C = ≥4 weeks and ≤5 years. The ≥4 weeks lower bound (C) is more clinically realistic (allows earlier enrollment after surgical recovery); consensus adopts C's lower bound with A's upper bound: ≥4 weeks to ≤5 years post-most-recent surgery.]

### Key Inclusion Criteria

| # | Criterion |
|---|-----------|
| 1 | Age ≥12 years at time of consent |
| 2 | Histologically confirmed WHO Grade 2 diffuse astrocytoma or oligodendroglioma per 2021 CNS WHO Classification (CNS5) |
| 3 | Documented IDH1 or IDH2 mutation (susceptible mutation confirmed by central laboratory using validated CLIA-certified/CAP-accredited assay) |
| 4 | 1p/19q co-deletion status determined (centrally or locally by FISH or equivalent validated assay) — required for stratification |
| 5 | Prior surgery (biopsy, sub-total resection, or gross total resection) for current tumor; most recent surgery ≥4 weeks and ≤5 years prior to randomization |
| 6 | No prior radiotherapy, chemotherapy, immunotherapy, or targeted therapy for glioma (IDH inhibitor naïve) |
| 7 | Radiographically stable disease on MRI within 28 days prior to randomization (no progressive disease at baseline) |
| 8 | ECOG Performance Status 0–1 (adults); Lansky ≥70 (pediatric patients 12–17 years) |
| 9 | Adequate organ function: ANC ≥1,500/μL, Platelets ≥100,000/μL, Hemoglobin ≥9 g/dL, ALT/AST ≤2.5×ULN, Total bilirubin ≤1.5×ULN, Serum creatinine ≤1.5×ULN |
| 10 | Able to undergo MRI with gadolinium contrast |
| 11 | Able to swallow oral medication; no significant GI malabsorption |
| 12 | Females of childbearing potential: negative pregnancy test; agreement to use highly effective contraception during study and ≥3 months after last dose; males: barrier contraception |
| 13 | Written informed consent (or assent for patients 12–17 with parental consent) prior to any study procedures |

### Key Exclusion Criteria

| # | Criterion |
|---|-----------|
| 1 | Prior treatment with any IDH inhibitor |
| 2 | Prior radiotherapy to the brain or spinal cord |
| 3 | Prior chemotherapy or immunotherapy for glioma (TMZ, PCV, bevacizumab, etc.) |
| 4 | Evidence of malignant transformation (histologic or radiographic evidence of Grade 3 or 4 glioma) at screening |
| 5 | Active or planned immediate radiotherapy or systemic antineoplastic therapy |
| 6 | Uncontrolled seizures (not stabilized with anti-epileptic drugs for ≥28 days prior to randomization) |
| 7 | Any active malignancy requiring systemic therapy within 3 years (except cured non-melanoma skin cancer, in situ cervical cancer, or melanoma in situ) |
| 8 | Severe hepatic impairment (Child-Pugh B or C) |
| 9 | QTcF >470 ms at baseline (or significant cardiac conduction abnormality) |
| 10 | Concomitant use of strong CYP3A4 inducers/inhibitors (drug-drug interaction risk) |
| 11 | Active systemic infection requiring IV antibiotics or antifungals within 14 days prior to randomization |
| 12 | Pregnancy or breastfeeding |
| 13 | Major surgery within 4 weeks prior to randomization |

---

## 10. Operational Considerations

[consensus: 2/2 on most elements; imaging schedule harmonized; both solvers align on CDx, pediatric, BICR, IDMC/DSMB structure]

### 10.1 Geographic Strategy

| Region | Enrollment Target |
|--------|-----------------|
| North America (US, Canada) | ~40% |
| Europe (EU + UK) | ~35% |
| Asia-Pacific (Japan, Australia, South Korea) | ~15% |
| Other | ~10% |

**Project ORBIS**: Multi-regional protocol with harmonized endpoints (RANO-LGG), imaging acquisition standards, and central review charter acceptable to FDA, EMA, and PMDA. Pre-specify harmonized endpoints before first patient enrolled; Japanese cohort requires Japanese-language consent, site contracts, and PMDA consultation on primary endpoint acceptability.

### 10.2 Biomarker Testing Strategy

[consensus: 2/2]

- **Central testing** (CLIA-certified/CAP-accredited) required for IDH1/IDH2 mutation confirmation prior to randomization; results within 10 business days
- Local CLIA-certified testing acceptable for initial screening if validated assay used; central confirmation required before randomization
- **Companion Diagnostic (CDx)**: biomarker-defined indication requires FDA-approved or in-development CDx per SOP §2.2; CDx development plan must be agreed with FDA
- **1p/19q status**: required for stratification; central assessment preferred, local CLIA-certified testing acceptable

⚠️ **SDP-05 — CDx Scope**: Whether the indication label is restricted to IDH1 R132H only vs. all susceptible IDH1/IDH2 mutations affects CDx strategy and timeline. Align with FDA at EoP1/EoP2 meeting.

### 10.3 Imaging Protocol and BICR

[consensus: 2/2; MRI schedule harmonized]

| Component | Specification |
|-----------|-------------|
| **Modality** | MRI brain with and without gadolinium contrast; T1 pre/post-gadolinium, T2/FLAIR, DWI sequences required |
| **Schedule** | Every 12 weeks (±7 days) for first 2 years after randomization; every 16 weeks thereafter |
| **Local assessment** | Investigator per RANO-LGG 2017 (primary PFS endpoint) |
| **BICR** | 2 blinded neuroradiologists; discordance adjudicated by third reader; blinded to treatment, visit timing, and prior reads; BICR charter established before first patient dosed |
| **Image upload** | All images to central imaging repository within 48 hours of acquisition |
| **Training** | RANO-LGG training and certification required for all site investigators and central readers |

### 10.4 Pediatric Considerations

- Patients ≥12 years: enrolled in adult pivotal trial under single protocol (age-specific PK and safety monitoring sub-study)
- Patients <12 years: separate PK/safety cohort (dose confirmation) required before pivotal enrollment
- FDA PREA requirements: pediatric study plan for <12 age group must be included in initial NDA/BLA submission
- Age-appropriate formulations and family support resources to be provided at pediatric sites

### 10.5 Safety Monitoring

- **DSMB/IDMC**: Independent Data Safety Monitoring Board with independent statistician; charter established before first patient dosed; reviews safety data and interim analyses
- **Endpoint Adjudication Committee**: Confirms radiographic progression and malignant transformation
- **Specific IDH inhibitor class monitoring**: Differentiation syndrome (IDH-DS), hepatic function abnormalities (ALT/AST), QT prolongation — specific monitoring and management algorithms required in protocol
- Dose modifications: maximum 2 reduction levels (full dose → level −1 → discontinuation)

### 10.6 Trial Governance

| Committee | Responsibilities |
|-------------|-----------------|
| Scientific Steering Committee | Overall oversight, protocol amendments, publication strategy |
| DSMB/IDMC | Safety oversight; interim analysis review; futility/efficacy boundary review |
| Endpoint Adjudication Committee | Radiographic progression confirmation; malignant transformation confirmation |

### 10.7 Key Milestones

| Milestone | Timeline |
|-----------|----------|
| First patient in | Month 0 |
| 50% enrollment | Month 12 |
| Last patient in | Month 24 |
| IA-1 (~97 events) | ~Month 32–36 |
| IA-2 (~146 events) | ~Month 38–42 |
| Primary analysis (~194 events) | ~Month 42–48 |
| Final OS analysis | Month 60+ |

### 10.8 Accrual Risk Mitigation

| Risk | Mitigation |
|------|-----------|
| Slow enrollment (rare disease, stringent molecular criteria) | Global site activation (target ≥80 sites); pre-screening registry; molecular screening log |
| Lower-than-expected event rate | Pre-specified non-binding N re-estimation at IA-1; protocol-specified extension option |
| Imaging assessment variability | RANO training/certification for all sites; central imaging platform; real-time QC |
| Pediatric recruitment | Dedicated pediatric neuro-oncology sites; age-appropriate formulations |

---

## Summary Table: 10 Dimensions

| Dimension | Consensus Design Element |
|-----------|-----------------|
| **1. Design Type** | Phase 3, randomized, double-blind, placebo-controlled, 2-arm, international multicenter, superiority |
| **2. Control Arm** | Placebo (replaces active surveillance for low-risk IDH-mut LGG); ⚠️ SDP on high-risk patient inclusion |
| **3. Primary Endpoint** | PFS per RANO-LGG 2017 criteria, investigator-assessed (BICR as pre-specified sensitivity); ⚠️ SDP-02 on assessor |
| **4. Endpoint Definition** | Time from randomization to radiographic progression or death; treatment policy estimand (ITT); pre-specified censoring rules |
| **5. Secondary Endpoints** | Hierarchical: OS → Time to Next Intervention → ORR → DOR → PRO-TTCD; TTMT and safety as additional endpoints |
| **6. Sample Size** | N = 650 (325/arm); 194 events; HR = 0.65, control mPFS = 48 mo, α = 0.025 (1-sided), 85% power; ⚠️ SDP-03 |
| **7. Statistical Framework** | Stratified Cox; hierarchical testing; 2 IAs (OBF spending); OS harm threshold pre-specified |
| **8. Stratification** | 1p/19q co-deletion status + baseline tumor size (≥2cm vs. <2cm T2/FLAIR) |
| **9. Eligibility** | ≥12 years; Grade 2 IDH-mut glioma; post-surgery ≥4 weeks to ≤5 years; no prior RT/chemo; ECOG 0–1 |
| **10. Operational** | Global (US/EU/Asia); CDx co-development; BICR central review; DSMB; pediatric ≥12 included; ⚠️ SDP-05 on CDx scope |

---

## Strategy Decision Points (SDP) — Master List

| SDP # | Decision Topic | Options | Sponsor Decision Required |
|-------|---------------|---------|--------------------------|
| SDP-01 | High-risk patient inclusion / Control arm scope | (A) Low-risk only + placebo; (B) Low+high-risk + IC background SOC; (C) Two separate trials | YES — Before protocol finalization |
| SDP-02 | PFS assessor | Investigator (default, per SOP) vs. BICR as co-primary or sole primary | Confirm with FDA at EoP1 |
| SDP-03 | HR assumption / Sample size | Optimistic HR=0.55 (N≈359) / Base HR=0.65 (N=650) / Conservative HR=0.70 (N≈924) | Anchor to Phase 2 data before finalization |
| SDP-04 | Accelerated Approval pathway | Pursue AA based on IA-2 PFS vs. traditional approval only | Discuss with FDA at EoP1 |
| SDP-05 | CDx scope | IDH1 R132H only vs. all susceptible IDH1/IDH2 mutations | Align with FDA at EoP1/EoP2 |

---

## FDA Self-Review Checklist (SOP FDA.7)

| # | Item | Status |
|---|------|--------|
| 1 | Synopsis = full text | ✓ Summary table matches full text |
| 2 | SoA has references | To be completed in protocol |
| 3 | I/E benchmarked | ✓ Benchmarked against LGG SOP |
| 4 | Estimand complete | ✓ Treatment policy estimand defined |
| 5 | Dose mod covers CTCAE | To be detailed in full protocol |
| 6 | PFS censoring table | ✓ Defined in endpoint definition |
| 7 | Testing hierarchy + alpha | ✓ Hierarchical fixed-sequence defined; OBF spending |
| 8 | ConMed matches DDI | ✓ CYP3A4, RT, chemo restrictions defined |
| 9 | Brain imaging clear | ✓ RANO-LGG criteria + MRI protocol specified |
| 10 | PRO schedule | ✓ Cognitive PRO every 6 months; pre-clinical assessments |
| 11 | Pending items listed | ✓ All SDPs explicitly flagged |
| 12 | FDA risks flagged | ✓ BICR assessor, CDx, PREA, Accelerated Approval all flagged as SDPs |

---

## Merge Notes

**Solvers available**: Solver-A ✅, Solver-B ❌ (no output — skipped), Solver-C ✅
**Effective solver count for consensus**: 2/3

**Divergence count**: 5 out of 10 dimensions required orchestrator resolution

| Dimension | Divergence | Resolution |
|-----------|-----------|------------|
| D3 — Primary Endpoint Assessor | A = Investigator primary; C = BICR primary | Solver A — SOP §4.1/§4.7 default for double-blind: investigator PFS primary |
| D6 — Sample Size | A = N=330, HR=0.55, mPFS=30m; C = N=650, HR=0.65, mPFS=48m | Solver C — more conservative base case; 48m control mPFS more consistent with observational literature; reduces power failure risk |
| D7 — Interim Analyses | A = 1 IA (futility only); C = 2 IAs (futility + efficacy) | Solver C — 2 IAs preserve Accelerated Approval option; calibrated to larger N=650 design |
| D8 — Stratification (2nd factor) | A = tumor size ≥2cm vs. <2cm; C = age 12–17 vs. ≥18 | Solver A — tumor size is direct PFS prognostic variable; age stratification risks small cell imbalance with ~5–10% pediatric enrollment |
| D9 — ECOG PS cutoff | A = ECOG 0–1; C = ECOG 0–2 | Solver A — ECOG 0–1 aligns with observation-replacement enrichment strategy; ECOG 2 introduces functionally impaired patients inconsistent with post-surgical surveillance eligibility |

**Post-resolution note**: D9 also includes a minor harmonization: the post-surgical time window lower bound was updated from A's "≥1 year" to C's "≥4 weeks" (more clinically realistic; allows enrollment after surgical recovery). This was a factual improvement, not a scored divergence.
