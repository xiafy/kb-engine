# Solver-C: Phase 3 Protocol Design — Nirogacestat (Gamma-Secretase Inhibitor) for Desmoid Tumors

> **Version**: 1.0 | **Solver**: C (Independent Design Agent) | **Date**: 2026-04-01
> **Information Isolation**: No access to NDA217677/Ogsiveo/PF-03084014 review documents.
> All design elements derived independently from SOP files, FDA/ICH guidance, disease background, and analogous cases (Romvimza/TGCT, Tazverik/epithelioid sarcoma).

---

## Dimension 1: Study Design Overview

### 1.1 Design Architecture

**Design**: Phase 3, double-blind, placebo-controlled, randomized 1:1 superiority trial  
**Arms**: 2 arms — nirogacestat 150 mg BID (oral) vs. matching placebo BID  
**Blinding**: Double-blind (patient, investigator, sponsor, BICR panel)  
**Setting**: Multi-center, international (USA/EU/Asia-Pacific)  
**Phase structure**: Two-part design
- **Part 1 (Double-blind)**: Primary analysis period (event-driven, until pre-specified PFS events)
- **Part 2 (Open-label extension)**: Cross-over allowed after confirmed progression or primary PFS analysis completion

### 1.2 Rationale for Double-Blind Placebo Control

- No FDA-approved therapy exists for desmoid tumors at time of study design → pure placebo is ethically acceptable (SOP §3.1: "No proven therapy that prevents death or irreversible morbidity → placebo control is scientifically optimal")
- Active surveillance ("watch and wait") is standard initial approach for many patients; placebo arm mirrors real-world practice
- Double-blind design enables Investigator-assessed PFS as primary (SOP §4.1: "IF double-blind → PFS may use investigator assessment as primary endpoint")
- BICR as sensitivity analysis (vs. primary in open-label designs) reduces cost and timeline
- Spontaneous regression rate ~20% (sorafenib DeFi trial placebo arm) makes blinding critical to avoid differential assessment bias

### 1.3 Dosing

- Nirogacestat 150 mg (3 × 50 mg tablets) orally BID
- Matching placebo tablets (3 tablets) orally BID
- Continuous dosing until disease progression, unacceptable toxicity, or withdrawal

⚠️ **SDP-1 (Dose Selection)**: The 150 mg BID dose must be supported by Phase 1/2 PK/PD data, exposure-response modeling, and reference to FDA Guidance "Optimizing the Dosage of Human Prescription Drugs" (2023). [SOP DOSE.1] The Phase 2 pivotal data should have established dose-response before Phase 3 initiation.

---

## Dimension 2: Key Eligibility Criteria

### 2.1 Key Inclusion Criteria

1. **Age**: ≥18 years
2. **Confirmed diagnosis**: Histologically confirmed desmoid tumor (DT) by central pathology review
3. **Measurable disease**: ≥1 measurable lesion per RECIST v1.1 (longest diameter ≥10 mm)
4. **Radiographic progression**: Documented disease progression by RECIST v1.1 within 12 months prior to enrollment (local radiographic assessment); OR clinically significant symptoms attributable to DT requiring systemic treatment
5. **Systemic therapy requirement**: Investigator judgment that patient requires systemic therapy (i.e., active surveillance alone not appropriate)
6. **Prior therapy**: No restriction on prior lines (drug-naive and previously treated eligible); prior NSAIDs, hormonal therapy, and TKIs permitted with appropriate washout
7. **ECOG PS**: 0–2
8. **Organ function**: Adequate hepatic (bilirubin ≤1.5× ULN, AST/ALT ≤2.5× ULN), renal (CrCl ≥30 mL/min), and hematologic function
9. **Reproductive**: Females of childbearing potential must use highly effective contraception; male patients must use contraception (relevant per SOP §2.5 item 9: male patients must be addressed)

### 2.2 Key Exclusion Criteria

1. Prior treatment with a gamma-secretase inhibitor or Notch pathway inhibitor
2. Active or prior GI disease that could affect drug absorption (relevant for oral agent)
3. Active uncontrolled systemic infection
4. Prior malignancy within 3 years (exceptions: adequately treated basal cell/squamous cell skin cancer, in situ cervical cancer)
5. FAP-associated DT: ⚠️ **SDP-2** — see below
6. Intra-abdominal DT with life-threatening complications requiring urgent surgery — exclude from initial enrollment; allow after stabilization
7. Pregnancy or breastfeeding
8. Significant cardiac disease (QTcF >480 ms at baseline)
9. Current use of strong CYP3A4 inhibitors/inducers (washout required)

### 2.3 I/E Strategy Decision Points

⚠️ **SDP-2 (FAP-Associated DT Inclusion/Exclusion)**:
- FAP-associated DTs (APC mutation; ~5–15% of all DTs) may have different tumor biology and progression kinetics vs. sporadic DTs (CTNNB1 mutation)
- **Option A (Exclude FAP)**: Homogeneous sporadic population; cleaner biology; ↑O1 (effect size), ↓O3 (enrollment feasibility by ~10%)
- **Option B (Include FAP, stratify)**: Broader generalizability; ↑O3 label breadth; adds stratification factor; requires subgroup analysis
- **Recommendation (CRO)**: Include FAP with stratification, present both subgroup results. Sponsor decides.

⚠️ **SDP-3 (Prior Systemic Therapy Line)**:
- **Option A (No prior systemic therapy required)**: Broader population; most drug-naive DT patients; mirrors real-world practice; ↑O3
- **Option B (≥1 prior systemic therapy)**: More refractory population; potentially larger unmet need argument; ↓O3; may show less absolute benefit if patients with spontaneous regression included in naive arm
- **Recommendation**: No prior systemic therapy requirement (drug-naive and previously treated eligible), consistent with unmet need profile and indication wording

⚠️ **SDP-4 (RECIST-measurable vs. Bone-Only Disease)**:
- Bone involvement in DT is rare; primarily soft tissue
- All patients require RECIST v1.1 measurable disease for PFS endpoint validity (SOP §2.4: "PFS→require evaluable disease")
- Non-measurable disease patients (bone-only equivalent): exclude or allow as separate exploratory cohort

---

## Dimension 3: Primary Endpoint

### 3.1 Primary Endpoint: Progression-Free Survival (PFS)

**Definition**: Time from randomization to the earlier of:
- Radiographic progression per RECIST v1.1 (investigator assessment)
- Clinical progression: defined as DT-related worsening requiring initiation of new anti-tumor therapy, surgical intervention, or radiation therapy, confirmed by Independent Review Committee (IRC) — per SOP rare-disease.md: "PFS may incorporate clinical progression for locally invasive cancers that do not metastasize"
- Death from any cause

**Assessor**: Investigator-assessed PFS (primary); BICR as confirmatory sensitivity analysis  
- Rationale: double-blind design allows investigator PFS as primary (SOP §4.1); BICR sensitivity analysis costs $500K–$2M and adds 3–5 day delay (SOP §4.7)

**Assessment schedule**: Every 8 weeks for first 12 months, then every 12 weeks thereafter (aligned with tumor doubling time for indolent tumors)

### 3.2 Justification

- PFS is the appropriate primary endpoint for DT Phase 3: disease is locally aggressive with significant morbidity but ~96% 5-year survival; OS endpoint would require massive sample size and 10+ year follow-up (not feasible)
- Clinical progression component: DTs cause morbidity through local invasion (not metastasis); radiographic PFS alone misses clinically significant worsening events (SOP rare-disease.md)
- Double-blind design mitigates investigator assessment bias, enabling PFS without mandatory BICR primary

### 3.3 Analog Cases

- **Romvimza/vimseltinib (TGCT, NDA219304)**: Locally aggressive, non-metastatic rare tumor; double-blind placebo-controlled; primary endpoint ORR (strong tumor response). TGCT differs from DT in that ORR was appropriate for TGCT given dramatic shrinkage; DT endpoint choice is PFS given more heterogeneous/indolent disease course
- **Sorafenib DeFi trial**: PFS used as primary endpoint for DT; placebo arm mPFS ~15.4 months

⚠️ **SDP-5 (PFS vs. ORR as Primary Endpoint)**:
- **Option A (PFS primary)**: Standard oncology primary; reflects disease control duration; established in DT trials (sorafenib); requires ~75–101 events; longer timeline
- **Option B (ORR primary)**: As in TGCT/vimseltinib precedent; requires smaller sample (N~100); faster primary analysis; FDA precedent for locally aggressive rare tumors; risk: ORR in DT may be lower than TGCT given indolent biology
- **Recommendation (CRO)**: PFS as primary for traditional approval; ORR as key secondary. If Phase 2 ORR is compelling (>25%), consider co-primary or ORR-primary strategy (SDP). Sponsor and FDA alignment required pre-Phase 3.

---

## Dimension 4: Secondary Endpoints

### 4.1 Key Secondary Endpoints (Hierarchical Testing Order)

1. **Overall Survival (OS)** — pre-specified harm threshold: HR ≤1.20 (upper bound); full OS analysis at ~80% maturity (long-term follow-up)
2. **Objective Response Rate (ORR)** — confirmed CR + PR per RECIST v1.1 (investigator); 95% CI; comparison vs. placebo
3. **Duration of Response (DOR)** — in responders; time from first response to progression or death
4. **Time to Next Treatment (TTNT)** — time from randomization to start of new anti-tumor therapy; reflects clinical utility
5. **Patient-Reported Outcomes (PROs)**:
   - **BPI-SF (Brief Pain Inventory – Short Form)**: Pain severity and pain interference subscales
   - **EORTC QLQ-C30**: Global health status/QoL, functional scales
   - **PROMIS Physical Function**: Functional capacity
   - Primary PRO endpoint: Time to Confirmed Clinical Deterioration (TTCD) in worst pain score (BPI-SF item 3), threshold: ≥2-point worsening confirmed at consecutive assessment
6. **BICR-assessed PFS** — sensitivity analysis for primary PFS; also secondary endpoint

### 4.2 Exploratory Endpoints

- PFS in FAP vs. sporadic DT subgroups
- PFS by CTNNB1 mutation subtype (T41A vs. S45F vs. other)
- Time to tumor size response (≥20% reduction by RECIST)
- Biomarker correlates (Notch pathway activity, plasma ctDNA)
- Health Resource Utilization (HRU) and hospitalization rates

### 4.3 PRO Strategy Notes

PROs to be completed before clinical assessments at each visit (SOP §4.6). Missing data handling: pre-specified in SAP with ≥2 sensitivity analyses. Content validity: BPI-SF validated in oncology pain; EORTC QLQ-C30 validated for rare tumors; consider DT-specific module development.

---

## Dimension 5: Sample Size Estimation

### 5.1 Key Assumptions

| Parameter | Value | Basis |
|-----------|-------|-------|
| Control arm (placebo) median PFS | 15 months | Sorafenib DeFi trial placebo arm mPFS ~15.4 months; historical DT data |
| HR (nirogacestat vs. placebo) | 0.50 (base case) | Clinically meaningful and biologically plausible for GSI in Notch-driven DT; note: spontaneous regression ~20% in placebo compresses true HR |
| Alpha | 0.025 one-sided | Standard oncology |
| Power | 85% | Per SOP §5.1 |
| Allocation ratio | 1:1 | Standard |
| Dropout/non-evaluable | 10% | Conservative estimate for rare disease |

### 5.2 Sample Size Calculation Results

**Base case (HR = 0.50, mPFS-control = 15 months):**
- Events required: **75** (Schoenfeld formula)
- Enrolled N: **120** patients (60 per arm)
- With 10% dropout inflation: **N = 134** total (~67 per arm)

**Sensitivity analysis table** (control mPFS = 15 months, α=0.025, power=85%):

| HR | Exp. Trt mPFS | Events | N Total | N per Arm |
|----|--------------|--------|---------|-----------|
| 0.45 | 33.3m | 57 | 94 | 47 |
| **0.50** | **30.0m** | **75** | **120** | **60** |
| 0.55 | 27.3m | 101 | 158 | 79 |
| 0.60 | 25.0m | 138 | 210 | 105 |
| 0.65 | 23.1m | 194 | 289 | 145 |

**Conservative case (HR = 0.55, accounting for spontaneous regression effect on HR):**
- Events required: **101**
- Enrolled N: ~158 + 10% dropout = **N ≈ 176** total

### 5.3 Recommended Plan

⚠️ **SDP-6 (Sample Size Scenario Selection)**:
- **Base case (N=134, HR=0.50)**: Adequate if Phase 2 data supports ≥50% risk reduction; feasible enrollment
- **Conservative (N=176, HR=0.55)**: Accounts for spontaneous regression diluting treatment effect; recommended for registration trial robustness
- **Recommendation (CRO)**: Use N=176 (conservative) as registration enrollment target; pre-specify re-estimation at 50% events under blinded review

**Timeline**: 24 months accrual + 18 months follow-up = ~42 months total study duration  
**Monthly accrual**: ~7.3 patients/month across 40–60 sites globally  
- Note: DT incidence 900–1500/year US; globally ~3,000–5,000/year; ~5–10% enrolled → feasible with aggressive site activation

---

## Dimension 6: Statistical Analysis Plan

### 6.1 Primary Analysis

- **Analysis set**: ITT (all randomized patients)
- **Method**: Log-rank test (stratified by randomization stratification factors), one-sided α=0.025
- **Effect estimate**: Stratified Cox proportional hazards model; HR with 95% CI
- **Kaplan-Meier curves**: Medians with 95% CI; landmark survival at 12, 24, 36 months
- **PFS censoring rules**: Per FDA guidance; patients without event censored at last tumor assessment date

### 6.2 Secondary Endpoint Multiplicity Strategy

- **Hierarchical testing** (SOP §5.2: 2 primary hypotheses → hierarchical):
  1. PFS (primary) — α=0.025
  2. ORR — tested only if PFS significant; α=0.025 carried over
  3. TTNT — tested only if ORR significant; α=0.025 carried over
  4. TTCD (PRO pain) — tested only if TTNT significant

- **OS**: Pre-specified harm threshold test (HR upper bound exclusion: 1.20); not in hierarchical efficacy chain; separate alpha preserved

### 6.3 Interim Analyses

Per SOP rare-disease.md: "IF rare disease target events ≤50–60: May omit interim analysis."

**Base case (75 events planned):**

⚠️ **SDP-7 (Interim Analysis Decision)**:
- **Option A (No interim)**: Conserves full α=0.025; simplest; appropriate if target events ~75 (near rare disease threshold)
- **Option B (1 interim at 50% events, ~37 events)**: Interim for futility only (non-binding); O'Brien-Fleming spending function; preserves α by spending minimally at interim (α spend ~0.001 at 50%, remaining ~0.024 at final); allows early stop for futility

- **Recommendation**: Single futility interim at 50% events (~37–38 events); O'Brien-Fleming spending; non-binding futility only; final PFS analysis at 75 events with effective α≈0.024

### 6.4 Sensitivity Analyses for Primary PFS

1. BICR-assessed PFS (primary sensitivity)
2. PFS excluding clinical progression events (radiographic-only PFS)
3. PFS per RECIST without confirmation requirement
4. Per-Protocol Set analysis
5. Non-Proportional Hazards assessment: RMST at 24 months + weighted log-rank (Flemington-Harrington)

### 6.5 Subgroup Analyses (Pre-specified)

- FAP vs. sporadic DT
- CTNNB1 mutation status (T41A vs. other vs. unknown)
- Prior systemic therapy (yes vs. no)
- Disease site (abdominal/intra-abdominal vs. extra-abdominal)
- Tumor size (≤10 cm vs. >10 cm per RECIST longest diameter)
- ECOG PS (0 vs. 1–2)
- Geographic region

---

## Dimension 7: Stratification Factors

Per SOP §6.1 for rare cancers: "Minimize to 1–2 factors; retain only the strongest prognostic factor."

### 7.1 Recommended Stratification Factors (2 factors maximum)

**Factor 1: FAP-associated DT vs. sporadic DT**
- Rationale: FAP (APC mutation) vs. sporadic (CTNNB1) represents distinct molecular and clinical subpopulations with potentially different progression rates and treatment responses
- Feasibility: Determinable from standard molecular testing (APC germline testing) prior to enrollment

**Factor 2: Prior systemic therapy (Yes vs. No)**
- Rationale: Strongest prognostic factor for PFS in DT; treatment-naïve patients may have higher spontaneous regression rate (confounding); refractory patients may have shorter PFS baseline
- Feasibility: Binary, easily ascertained at screening

⚠️ **Note on minimization**: SOP §6.1 warns against over-stratification in rare cancers causing small cell imbalance. With N~134–176 and 2 binary factors → 4 strata of ~34–44 patients each; acceptable. A third factor (e.g., tumor site: abdominal vs. extra-abdominal) could be added if sponsors strongly desire, but increases small-strata risk.

---

## Dimension 8: Key Operational Considerations

### 8.1 Imaging Assessment Strategy

- **Modality**: MRI preferred for soft tissue DT (superior contrast resolution); CT acceptable for intra-abdominal/thoracic lesions
- **Central imaging repository**: All scans submitted to central vendor for BICR
- **Assessment schedule**: Every 8 weeks ± 7 days (Cycles 1–6), then every 12 weeks ± 7 days
- **Reader qualification**: Radiologists with experience in soft tissue tumors; ≥2 independent readers; third reader for discordance
- **Clinical progression adjudication**: IRC (Independent Review Committee with oncologist + radiologist) must adjudicate all clinical progression events to prevent differential classification between arms

### 8.2 Rare Disease Enrollment Challenges

| Challenge | Mitigation |
|-----------|-----------|
| Low incidence (~900–1,500 US/year) | International trial (40–60 sites, North America + EU + Japan/Australia); rare disease center network; patient advocacy partnerships (Desmoid Tumor Research Foundation) |
| Referral centers | Partner with sarcoma specialty centers (NCCN-designated, NCI-designated cancer centers) |
| Screening failure | Broad I/E (no prior therapy requirement); central confirmatory pathology to reduce early failure |
| Long natural history | Event-driven design; operational flexibility to extend enrollment if event rate slower than projected |
| Active surveillance as SOC | Informed consent messaging: emphasizes "progressing disease" eligibility; patients who prefer surveillance can opt out |

### 8.3 Crossover Design Considerations

⚠️ **SDP-8 (Crossover Strategy)**:
- **Option A (Crossover after PFS analysis + progression)**: Patients on placebo may cross to active treatment after confirmed progression AND after primary PFS analysis is complete
- **Option B (Crossover after confirmed progression only)**: Earlier access; ethical; may compromise OS analysis
- **Option C (No crossover; OLE separate study)**: Maximizes OS data integrity; ethically challenging for progressive disease
- **Recommendation**: Option A — balances ethical access and OS signal preservation; OS will be analyzed with crossover-adjustment method (RPSFT or IPCW) pre-specified in SAP

### 8.4 Geographic and Regulatory Considerations

- **ICH E8 compliant**: Risk-based monitoring; EDC with real-time data capture
- **FDA IND/Type B pre-Phase 3 meeting**: Required to align on primary endpoint definition (radiographic vs. clinical progression component), sample size, and BICR strategy
- **EMA Scientific Advice**: Parallel advice recommended; EU rare disease designation may support accelerated review
- **Japan (PMDA)**: Inclusion of Japanese sites if PMDA consultation supports it; population inclusion critical for label breadth

---

## Dimension 9: Safety and Monitoring Design

### 9.1 Safety Monitoring Framework

- **DSMB/DMC**: Independent Data Safety Monitoring Board; meets every 6 months and after every 25 events (safety reviews); unblinded access; stopping rules pre-specified
- **Safety stopping rules**: 
  - Excess grade ≥3 serious adverse events in treatment arm vs. placebo (pre-specified threshold: ≥15% absolute difference in SAE rate)
  - Any grade ≥4 unexpected toxicity in ≥5% treatment arm patients

### 9.2 GSI-Specific Safety Monitoring

Gamma-secretase inhibitors have known Notch-mediated class effects:
- **GI toxicity** (diarrhea, nausea): Grade ≥3 diarrhea; dose reduction algorithm required
- **Rash/skin toxicity**: Squamous cell carcinoma risk (Notch inhibition in skin)
- **Myelosuppression**: CBC monitoring schedule
- **Ovarian toxicity/premature ovarian insufficiency (POI)**: Female patients of reproductive age; AMH monitoring; reproductive counseling; FSH/LH/estradiol at baseline and every 3 months
- **Bone density**: DXA scan at baseline and annually (GSI/Notch effects on bone)

### 9.3 Dose Modification Algorithm

- **Grade 1–2 toxicity**: Continue with monitoring
- **Grade 3 toxicity**: Dose hold until recovery to ≤Grade 1, then resume at reduced dose (100 mg BID)
- **Grade 4 toxicity or recurrent Grade 3 after dose reduction**: Permanent discontinuation
- Maximum 2 dose reductions permitted before discontinuation

### 9.4 Long-Term Safety

- Long-term follow-up for secondary malignancies (squamous cell carcinoma, treatment-related malignancies per GSI mechanism)
- Annual safety update reporting to FDA/DSMB

---

## Dimension 10: Regulatory Strategy and Approval Path

### 10.1 Approval Pathway

- **Pathway**: NDA 505(b)(1), traditional approval (not accelerated)
  - Rationale: PFS in double-blind placebo-controlled RCT is considered a direct clinical benefit endpoint for DT; spontaneous regression complicates ORR-based accelerated approval arguments; double-blind PFS supports traditional approval
- **Priority Review designation**: Likely eligible (serious condition with unmet medical need)
- **Orphan Drug Designation**: DT qualifies (<200,000 US patients); apply pre-Phase 3 for fee waiver and 7-year exclusivity
- **Breakthrough Therapy Designation**: ⚠️ **SDP-9** — apply if Phase 2 data shows substantial improvement (≥50% ORR or HR<0.45 vs. sorafenib historical)
- **Single pivotal trial**: Acceptable for rare disease with large effect size and high statistical significance (SOP §8.1)

### 10.2 FDA Pre-Phase 3 Alignment Requirements

Per SOP §1.1 and protocol-design.md: FDA meeting (Type B End of Phase 2) required to confirm:
1. Acceptability of PFS with clinical progression component as primary endpoint
2. Clinical progression definition and IRC adjudication process
3. Sample size assumptions and event-driven design
4. Crossover design and OS analysis plan with adjustment methodology
5. CDx requirement (if any): ⚠️ **SDP-10 (CDx/Biomarker)**:
   - DT is not biomarker-stratified for treatment selection (all DTs have some Notch activation)
   - CTNNB1/APC mutation testing: exploratory, not predictive; no CDx required for enrollment
   - Consider pre-specified predictive biomarker analysis (CTNNB1 subtype) for label refinement if subgroup data support

### 10.3 Protocol Writing Quality Checklist (SOP FDA.7)

Pre-submission self-check:
- [ ] Synopsis matches full text
- [ ] SoA has regulatory references for each assessment
- [ ] I/E benchmarked vs. sorafenib DeFi trial
- [ ] Estimand complete (5 attributes per ICH E9(R1))
- [ ] Dose modification covers all CTCAE ≥Grade 2 for GSI class toxicities
- [ ] PFS censoring table pre-specified
- [ ] Testing hierarchy + alpha allocation explicit
- [ ] Concurrent medications: CYP3A4 DDI addressed
- [ ] Clinical progression definition operationally unambiguous
- [ ] PRO schedule pre-specified with missing data plan
- [ ] All SDPs listed with pending Sponsor decisions noted
- [ ] OS harm threshold explicitly stated (HR upper bound ≤1.20)

---

## Summary of Strategy Decision Points (SDPs)

| SDP | Topic | Options | CRO Recommendation |
|-----|-------|---------|-------------------|
| SDP-1 | Dose justification | 150 mg BID supported by PK/PD data? | Confirm Phase 2 dose-response data available before Phase 3 |
| SDP-2 | FAP inclusion | Exclude vs. Include+stratify | Include, stratify |
| SDP-3 | Prior therapy requirement | Drug-naive only vs. all lines | All lines (no restriction) |
| SDP-4 | RECIST measurability | Measurable required vs. allow non-measurable | Measurable required for PFS primary |
| SDP-5 | Primary endpoint | PFS vs. ORR | PFS (traditional approval); ORR if Phase 2 ORR >25% compelling |
| SDP-6 | Sample size scenario | N=134 (HR=0.50) vs. N=176 (HR=0.55) | N=176 conservative |
| SDP-7 | Interim analysis | No interim vs. futility-only interim | Single futility interim at 50% events |
| SDP-8 | Crossover strategy | No cross vs. after PFS analysis | Cross after primary PFS + confirmed progression; OS adjusted |
| SDP-9 | Breakthrough Therapy | Apply vs. standard | Apply if Phase 2 HR<0.45 or ORR>50% |
| SDP-10 | CDx/biomarker | CTNNB1 CDx required vs. exploratory | Exploratory only; no CDx requirement for enrollment |

---

## Key Design Parameters Summary

| Parameter | Value |
|-----------|-------|
| Design | DB, PC, randomized 1:1, superiority |
| Primary endpoint | PFS (Investigator; clinical progression via IRC) |
| Alpha | 0.025 one-sided |
| Power | 85% |
| HR assumption (base) | 0.50 (control mPFS = 15 months) |
| Events required | 75 (base) / 101 (conservative) |
| N enrolled | 134 (base) / 176 (conservative, recommended) |
| Stratification | 2 factors: FAP status + prior systemic therapy |
| Interim analysis | 1 futility-only at 50% events (O'Brien-Fleming) |
| Crossover | Allowed post-PFS analysis + confirmed progression |
| Regulatory path | NDA 505(b)(1), traditional, Priority Review + Orphan |
| Analog cases | Romvimza/TGCT (DB-PC rare tumor), DeFi/sorafenib (DT PFS endpoint) |

---

*Solver-C generated independently without access to NDA217677 review documents. All parameter derivations trace to allowed sources: disease background, sorafenib DeFi trial public data, Romvimza/TGCT analog, FDA guidance, and SOP files.*
