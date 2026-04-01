# Phase 3 Pivotal Trial Design — IDH-Mutant Grade 2 Low-Grade Glioma (Post-Surgical Adjuvant/Observational-Replacement Setting)

> **Author**: Protocol Design Agent (solver-C) | **Date**: 2026-04-01
> **Task**: Design Phase 3 pivotal RCT for IDH-mutant Grade 2 astrocytoma/oligodendroglioma, post-surgical setting
> **Information Isolation**: No vorasidenib/voranigo/AG-881/NDA218784 data accessed

---

## 1. Design Type

**Randomized, Double-Blind, Placebo-Controlled, Parallel-Arm Phase 3 Pivotal Trial**

**Rationale**:
- Double-blind is feasible and preferred: both arms receive identical tablets; no subjective assessment bias concern.
- Placebo control is scientifically and ethically justified because the SOC for post-surgical Grade 2 IDH-mut LGG without high-risk features is **active surveillance** (serial MRI). A placebo arm matching this SOC is a valid comparator.
- Parallel two-arm design (treatment vs. placebo) is the standard regulatory pathway for a first-in-class IDH inhibitor in this setting; single-arm would be insufficient for a traditional approval.
- Superiority design is appropriate; non-inferiority would require a very large margin and is not justified given the favorable safety profile expected for a targeted oral agent in this indolent disease.

**Blinding**: Double-blind; patients, investigators, site staff, and sponsor personnel are blinded. Unblinding allowed only for medical emergencies or SUSARs requiring knowledge of study treatment.

**Number of arms**: 2 (treatment vs. placebo)

**Trial phase**: Phase 3

**Multi-site**: Multi-regional (US, EU, Japan, rest of world)

---

## 2. Control Arm

**Placebo** (matching the active surveillance/observation SOC for eligible post-surgical patients)

**Rationale**:
- Per SOP Step 3.1 decision tree: "Does a proven therapy exist that prevents death or irreversible morbidity?" For low-risk Grade 2 IDH-mut LGG post-GTR, the answer is **no** — active surveillance is standard, not a disease-modifying therapy. Therefore placebo is scientifically optimal.
- For high-risk patients (age >40, STR/biopsy), SOC is RT + PCV/TMZ. ⚠️ **SDP**: Does the pivotal trial target low-risk (observation-replacement) or high-risk (adjuvant) patients? This determines control arm: placebo vs. IC (RT + TMZ or PCV). Both are scientifically defensible but require separate trials or a pre-planned stratified analysis with separate hypotheses.

**Concomitant care restrictions**: 
- Temozolomide, procarbazine, lomustine, vincristine, and other chemotherapies prohibited
- Radiotherapy to the brain/tumor site prohibited
- Corticosteroids permitted for symptom management per protocol-specified criteria
- Anti-epileptic drugs permitted with protocol-specified restrictions
- Steroid use must be documented at baseline and monitored as a covariate

---

## 3. Primary Endpoint

**Progression-Free Survival (PFS) assessed by Blinded Independent Central Review (BICR)**

**Definition**: Time from randomization to documented disease progression per Response Assessment in Neuro-Oncology (RANO) criteria for LGG, or death from any cause, whichever occurs first.

**Justification**:
- PFS is the standard primary endpoint for randomized oncology adjuvant/observation-replacement trials where OS would require 10+ years of follow-up.
- BICR is used because: (1) this is a double-blind trial (BICR not required by SOP 4.1 default rule, but BICR is best practice in CNS tumors due to the known difficulty of distinguishing true progression from pseudoprogression on MRI; (2) ensures regulatory acceptability across all regions including Japan and EU).
- Per SOP 4.2, PFS requires: sufficiently large magnitude, independent assessment confirmation, subgroup consistency, and supporting endpoints. These conditions are met given the targeted MOA and the sensitivity of LGG imaging.
- For this slow-progression disease, PFS encompasses both radiographic progression and malignant transformation (which would be captured as progression events by RANO).

**Endpoint definition details (RANO-LGG criteria)**:
- Complete response: disappearance of all measurable and non-measurable disease; no new lesions; stable or improving neurologic exam; off corticosteroids
- Partial response: ≥50% decrease in sum of perpendicular diameters of measurable disease; stable or improving neurologic exam; stable or decreasing corticosteroid dose
- Progression: ≥25% increase in sum of diameters of measurable lesions; or new lesions; or unequivocal progression of non-measurable disease; or clinical deterioration not explained by other causes
- Minimum duration of response: not applicable (no CR/PR expected as primary mechanism is disease stabilization)

---

## 4. Endpoint Definition (Primary)

**PFS by BICR per RANO-LGG criteria**

| Attribute | Definition |
|-----------|-----------|
| Start | Date of randomization |
| End | Date of first documented progression per BICR RANO-LGG, or date of death (any cause), whichever occurs first |
| Censoring | Censored at last adequate tumor assessment date if no progression or death; censored at date of new anti-cancer therapy if started before progression |
| Adequate assessment | MRI performed per protocol schedule with measurable disease documented |

**Estimand**: Treatment policy estimand (intent-to-treat, all randomized patients analyzed as assigned, regardless of protocol deviations, with intercurrent events handled by the treatment policy strategy). This is the primary estimand for regulatory submissions.

---

## 5. Secondary Endpoints

**Hierarchy (pre-specified testing order)**:

1. **Overall Survival (OS)** — Time from randomization to death from any cause. Pre-specified OS harm threshold: HR upper bound <1.20 must be excluded (per SOP 4.5). Analyzed when ≥70% of patients have died or at a pre-specified late-stage IA.

2. **Objective Response Rate (ORR)** — Proportion of patients achieving CR or PR per BICR RANO-LGG. Secondary endpoint (not primary) because this is an adjuvant/disease-stabilization indication; ORR as sole primary would not capture the clinically meaningful benefit of delaying progression in indolent disease.

3. **Time to Next Intervention** — Time from randomization to start of new anti-cancer therapy (RT, chemotherapy, or re-resection). Captures the clinical benefit of delaying treatment-related toxicity.

4. **Patient-Reported Outcomes (PRO) — Cognitive Function** — Measured by CogState Brief Battery or MMSE at baseline and every 6 months. Time to confirmed deterioration in cognitive domain scores.

5. **Safety and Tolerability** — Grade 3-4 AEs, serious AEs, AEs leading to discontinuation, dose modifications, and laboratory abnormalities.

6. **Pharmacokinetics (PK)** — Pre-dose and post-dose concentrations at specified timepoints (if Phase 1 data required confirmation of exposure).

7. **Duration of Response (DOR)** — For responders only; time from first response to progression or death.

---

## 6. Sample Size

**Total N = 650 (325 per arm)**

**Assumptions**:
| Parameter | Value | Basis |
|-----------|-------|-------|
| Control median PFS | 48 months | Observational Grade 2 LGG post-surgical data; consistent with literature showing median PFS ~4-5 years in active surveillance |
| HR (treatment vs. placebo) | 0.65 | Assumes meaningful disease-stabilizing effect of IDH inhibition in IDH-mut tumors; reduction from 48m to 73.8m median |
| Alpha | 0.025 (one-sided) | Standard for oncology superiority trial |
| Power | 85% | Standard pivotal trial power |
| Allocation | 1:1 | Equal randomization |
| Accrual | 24 months (uniform) | 27 patients/month globally; feasible given ~2,800 new IDH-mut Grade 2 LGG/year in US + international sites |
| Minimum follow-up | 18 months after last patient | Ensures adequate event accumulation |

**Events required**: 194 progression/death events (Schoenfeld formula)

**Sensitivity analysis** (HR sensitivity):
| HR | Median Trt (mo) | Total N |
|----|----------------|---------|
| 0.60 | 80.0 | 476 |
| **0.65** | **73.8** | **650** |
| 0.70 | 68.6 | 924 |

**⚠️ SDP — Sample Size Uncertainty**: The control arm median PFS of 48 months is derived from observational literature. If the actual control arm median PFS is shorter (e.g., 36 months), total N increases to ~750 at HR 0.65. If the Sponsor's Phase 2 data suggests a better HR (e.g., 0.55), total N = 359. Sponsor must confirm the HR assumption based on Phase 2 data before finalizing protocol.

**Pediatric**: Patients ≥12 years enrolled in adult protocol. Patients <12 years: separate PK/safety cohort after Phase 1/2 safety review.

---

## 7. Statistical Framework

**Multiplicity**: Single primary endpoint (PFS) → no multiplicity adjustment required at primary analysis.

**Multiplicity for secondary endpoints**: 
- Hierarchical testing (fixed sequence): OS → ORR → Time to Next Intervention → PRO → Safety
- Alpha spending for OS: O'Brien-Fleming spending function (Lan-DeMets approximation)
- If OS intermediate analysis crosses the pre-specified harm boundary (HR upper bound ≥1.20), trial may be stopped for futility or harm

**Interim Analyses**:
| Analysis | Timing | Purpose | Alpha spent |
|----------|--------|---------|------------|
| IA-1 | 50% events (97/194) | Futility (non-binding) | ~0.001 (OBF) |
| IA-2 | 75% events (146/194) | Futility + efficacy | ~0.018 (OBF) |
| Final | 100% events | Efficacy | 0.025 (one-sided) |

- Futility: non-binding (sponsor may continue if HR favorable); gamma family spending
- Efficacy stopping: two-sided p < 0.05 at IA-2 can support accelerated approval submission

**Analysis Populations**:
- **ITT**: All randomized patients; primary PFS analysis
- **mITT**: All dosed patients with ≥1 post-dose tumor assessment; sensitivity analysis
- **Safety**: All dosed patients with ≥1 post-dose safety assessment

**Covariate Adjustment**: 
- Stratification factors (1p/19q status, age) included in primary analysis model
- Additional prognostic covariates: baseline tumor size, extent of resection, baseline steroid use
- HR and 95% CI reported from stratified Cox model

**Subgroup Analyses**: Pre-specified for: 1p/19q status, IDH1 vs IDH2 mutation, age group (12-17/18-39/≥40), sex, race, region, extent of resection, baseline steroid use

---

## 8. Stratification Factors

Based on SOP 6.1 and indication-specific guidance for IDH-mut LGG:

| Factor | Categories | Rationale |
|--------|-----------|-----------|
| **1p/19q co-deletion status** | Co-deleted vs. Not co-deleted | Primary molecular prognostic factor in Grade 2 IDH-mut glioma; co-deleted (oligodendroglioma) has better prognosis than IDH-mut astrocytoma |
| **Age at randomization** | 12-17 / ≥18 years | Pediatric patients (≥12) in main trial; separate cohort for <12; adult vs. pediatric may have different progression rates |

**Note**: Extent of resection is NOT used as a stratification factor (per LGG SOP: "Extent of resection is not used as a stratification factor"). It will be captured as a baseline characteristic and covariate.

**Regional stratification** (implicit via IVRS/IWRS): not formally stratified but balanced via randomization.

---

## 9. Eligibility Criteria

### Inclusion Criteria

**Molecular and Histologic**:
1. Age ≥12 years at time of consent
2. Histologically confirmed WHO Grade 2 astrocytoma or oligodendroglioma (or their pediatric equivalents: diffuse astrocytoma, oligodendroglioma) based on local pathologist interpretation
3. Documented IDH1 R132H mutation by central testing, OR IDH2 R172/R140 mutation by central testing (sufficient for eligibility; patients with non-R132H IDH1 mutations eligible if centrally confirmed)
4. Tumor molecular classification documented: 1p/19q co-deletion status (by FISH or equivalent) determined centrally or locally

**Prior Therapy**:
5. Has undergone ≥1 surgery (biopsy, sub-total resection, or gross total resection) for the current tumor, with the most recent surgery occurring ≥4 weeks and ≤5 years prior to randomization
6. No prior radiotherapy, chemotherapy, immunotherapy, or targeted therapy for glioma (including temozolomide, PCV, nitrosoureas, bevacizumab, etc.)
7. No prior IDH inhibitor therapy

**Disease Status**:
8. Stable disease or better per investigator assessment at baseline (no progressive disease at time of randomization)
9. Radiographically stable disease on MRI performed within 28 days prior to randomization

**General**:
10. ECOG Performance Status 0-2 (adults) or Lansky ≥60 (pediatric patients 12-17)
11. Adequate organ function: ANC ≥1,500/μL, Platelets ≥100,000/μL, Hemoglobin ≥9 g/dL, ALT/AST ≤2.5×ULN, Total bilirubin ≤1.5×ULN, Serum creatinine ≤1.5×ULN
12. Able to undergo MRI with contrast (no contraindication to gadolinium)
13. For females of childbearing potential: negative pregnancy test; agreement to use highly effective contraception during study and for 3 months after last dose
14. For males: agreement to use barrier contraception during study and for 3 months after last dose
15. Written informed consent (or assent for patients 12-17) prior to any study-specific procedures

### Exclusion Criteria

**Prior Therapy**:
1. Prior treatment with any IDH inhibitor (including but not limited to ivosidenib, enasidenib, or other IDH1/2 inhibitors)
2. Prior radiotherapy to the brain or spinal cord
3. Prior chemotherapy or immunotherapy for glioma (including TMZ, PCV, bevacizumab, etc.)
4. Washout from any prior experimental therapy <4 weeks prior to randomization

**Neurologic**:
5. Uncontrolled seizures (defined as seizure frequency not stabilized with anti-epileptic drugs for ≥28 days prior to randomization)
6. Clinical signs or symptoms of impending neurological decline (e.g., progressive mass effect, significant midline shift, uncal herniation)
7. Evidence of malignant transformation (histologic or radiographic evidence of Grade 3 or 4 glioma)

**Medical History**:
8. Any active malignancy requiring systemic therapy within 3 years prior to randomization (except adequately treated basal cell carcinoma, squamous cell carcinoma, or melanoma in situ)
9. Active infection requiring systemic antibiotics or antifungals within 14 days prior to randomization
10. Known HIV, hepatitis B, or hepatitis C infection with detectable viral load
11. Any major surgery within 4 weeks prior to randomization
12. History of any condition requiring chronic systemic immunosuppression

**Cardiac/Other**:
13. QTcF >470 ms at baseline (or other significant cardiac conduction abnormality)
14. Any known organ dysfunction severe enough to preclude participation in the clinical trial per investigator judgment

---

## 10. Operational Considerations

### 10.1 Biomarker Testing Strategy
- **Central testing preferred** for IDH1/IDH2 mutation status and 1p/19q co-deletion: a central laboratory with demonstrated analytical validity must be designated.
- Local CLIA-certified testing is acceptable for initial screening if protocol-specified validated assay is used; central confirmation required prior to randomization.
- **Companion diagnostic**: If the Sponsor intends to file with a biomarker-selected label (IDH1/IDH2 mutation as required companion diagnostic), the CDx assay must be FDA-approved or an in vitro diagnostic with an agreed-upon CDx development plan with FDA. ⚠️ **SDP**: Should the label be restricted to IDH1 R132H only or include all IDH1/IDH2 susceptible mutations? This affects the CDx strategy and timeline.

### 10.2 Regional Strategy / Project ORBIS
- Multi-regional enrollment (US, EU, Japan, and rest of world) is planned to accelerate accrual given the rarity of the disease.
- **Project ORBIS**: If the Sponsor intends to pursue parallel submissions in US, EU, and Japan, the protocol must pre-specify harmonized endpoints, imaging acquisition standards (RANO-LGG), and central review charter acceptable to all three regulatory authorities.
- Regional regulatory strategy must be confirmed early (Phase 3 initiation); Japanese cohort requires Japanese-language consent forms, site contracts, and PMDA consultation on primary endpoint acceptability.

### 10.3 Pediatric Considerations
- Patients ≥12 years may be enrolled directly in the adult pivotal trial under a single protocol (with appropriate age-specific PK and safety monitoring).
- Patients <12 years require a separate PK/safety cohort (dose confirmation study) before enrollment in the pivotal trial.
- Pediatric assessment must follow FDA PREA requirements; plans for pediatric study in <12 age group must be included in the initial NDA/BLA submission.

### 10.4 Imaging and BICR Operations
- MRI protocol must be standardized across all sites: T1 pre/post gadolinium, T2/FLAIR, DWI, at baseline and every 3 months during the first 2 years, then every 6 months.
- Central BICR charter must be established before first patient dosed; readers must be blinded to treatment assignment, visit timing, and prior reads.
- RANO-LGG criteria must be formally trained and certified for all site investigators and central readers.

### 10.5 Dose Modifications and Safety
- Since this is an oral targeted therapy with expected favorable tolerability, dose reduction should be limited to 2 levels (full dose → level -1 → discontinued).
- Specific safety monitoring for IDH inhibitor class: differentiation syndrome (IDH-differentiation syndrome with IDH inhibitors has been observed; need specific monitoring and management guidelines), liver function abnormalities, QT prolongation.
- Safety oversight: Data Safety Monitoring Board (DSMB) with independent statistician; charter established before first patient dosed.

### 10.6 Accrual Risk
- **Primary operational risk**: Slow accrual due to rarity of the disease and stringent molecular inclusion criteria (IDH mutation + Grade 2 glioma).
- Mitigation: Global site activation (target ≥80 sites across US, EU, Japan); pre-screening registry to identify eligible patients; molecular screening log to track screen failure reasons.
- **Sample size re-estimation**: Non-binding sample size re-estimation at IA-1 (if events observed are fewer than projected) may be pre-specified in the SAP to adjust N without unblinding.

---

## ⚠️ Strategy Decision Points (SDP) Summary

| # | SDP | Options | Quantification | Recommendation |
|---|-----|---------|----------------|----------------|
| 1 | **Control arm / Indication scope** | (A) Low-risk: placebo (observation-replacement); (B) High-risk: IC of RT+TMZ or RT+PCV | Separate trials for each or stratified with pre-planned separate hypotheses | Confirm with Sponsor based on label ambition and Phase 2 data |
| 2 | **HR assumption / Sample size** | Optimistic (HR=0.55, N=359), Base (HR=0.65, N=650), Conservative (HR=0.70, N=924) | See sensitivity table | Use Phase 2 data to anchor; confirm before protocol finalization |
| 3 | **Companion diagnostic scope** | IDH1 R132H only vs. all susceptible IDH1/IDH2 mutations | Affects CDx development timeline and cost | Align with FDA during EoP1 meeting |
| 4 | **Pediatric scope in pivotal trial** | ≥12 years in main trial (PREA-compliant) vs. ≥18 years only (waiver possible) | Accrual impact: ~10-15% pediatric patients | PREA requires plan; ≥12 is feasible with additional safety monitoring |
| 5 | **Accelerated Approval pathway** | Pursue AA based on IA-2 PFS signal vs. traditional approval only | AA: file at IA-2 with ~146 events; Traditional: file at final | Discuss with FDA at EoP1; depends on Phase 2 magnitude of effect |
| 6 | **Regional strategy** | US-only vs. multi-regional (ORBIS) | ORBIS adds 6-12 months to regulatory timeline but enables simultaneous filings | Recommend ORBIS for a rare disease with high unmet need |
| 7 | **Sample size re-estimation** | Pre-specify non-binding re-estimation at IA-1 | Protects against slow accrual without compromising integrity | Recommend including as SAP option |

---

## Cross-Reference Checklist (per SOP FDA.7)

| # | Item | Status |
|---|------|--------|
| 1 | Synopsis = full text | ✓ Protocol summary included |
| 2 | SoA has references | To be completed in protocol |
| 3 | I/E benchmarked | ✓ Benchmarked against LGG SOP and oncologysolid SOP |
| 4 | Estimand complete | ✓ Treatment policy estimand defined |
| 5 | Dose mod covers CTCAE | To be detailed in full protocol |
| 6 | PFS censoring table | Defined in SAP framework |
| 7 | Testing hierarchy + alpha | ✓ Hierarchical fixed-sequence defined |
| 8 | ConMed matches DDI | ConMed restrictions defined |
| 9 | Brain imaging clear | RANO-LGG criteria specified; MRI protocol defined |
| 10 | PRO schedule | Cognitive PRO every 6 months specified |
| 11 | Pending items listed | SDPs explicitly flagged |
| 12 | FDA risks flagged | BICR requirement, CDx, PREA flagged as risks |

---

*This document represents an independent protocol design based on LGG disease characteristics, oncology SOP framework, and FDA/ICH guidelines. All numerical assumptions (median PFS, HR) are derived from disease background literature and should be validated against Sponsor's Phase 2 data before finalizing the protocol.*
