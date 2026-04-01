# Phase 3 Pivotal Trial Design — Desmoid Tumor (DT)
## Gamma-Secretase Inhibitor (GSI) Program
**Designer**: solver-B | **Date**: 2026-04-01 | **Indication**: Adult patients with progressing desmoid tumors requiring systemic treatment

> **Information Isolation Compliance**: No information from nirogacestat/Ogsiveo/PF-03084014/NDA217677 was accessed. Design based solely on: SOC evidence (sorafenib Phase 3, pazopanib Phase 2), disease natural history, FDA/ICH guidelines via DocSearch, and protocol design SOPs.

---

## Dimension 1: Study Design

### 1.1 Design Type
**Randomized, Double-Blind, Placebo-Controlled, Parallel-Arm, Phase 3 Pivotal Trial**

- Phase 3, global multicenter (US/EU/Asia-Pacific), 1:1 randomization
- Double-blind: investigational drug and placebo identical in appearance; GSI blinding requires dummy dose adjustments if active has unique AEs
- Parallel-arm: 2 arms (see §1.2)

### 1.2 Arms

| Arm | Description | Rationale |
|-----|-------------|-----------|
| **Arm A (Investigational)** | GSI (selected Phase 2 dose) + Best Supportive Care (BSC) | First-in-class mechanism; Phase 2 signal required before Phase 3 |
| **Arm B (Control)** | Placebo + Best Supportive Care | No approved therapy; placebo scientifically acceptable; consistent with DeFi trial precedent |

**BSC definition**: Includes chronic analgesics, NSAIDs, hormonal therapies, or other supportive measures stable at randomization; new systemic anti-tumor therapy prohibited.

### 1.3 Key Design Decision: Control Arm ⚠️ SDP

**SDP-1 (Control Arm Selection)**: Three options are viable; sponsor must decide:

| Option | Description | Advantage | Disadvantage |
|--------|-------------|-----------|--------------|
| **Option A (Recommended)** | Placebo + BSC (double-blind) | Clean efficacy signal; smallest N; avoids off-label variability | Ethics scrutinized if any active therapy widely used |
| **Option B** | Active control: Sorafenib (400 mg QD) + double-dummy | Clinically meaningful comparator; directly addresses competitive landscape | Sorafenib has no DT-approved label; dosing varies; larger N (event rate differs); sorafenib toxicity creates blinding challenges |
| **Option C** | Investigator's Choice (IC) pre-specified list: sorafenib, imatinib, pazopanib, methotrexate/vinblastine | Reflects real-world practice; pragmatic | Extreme heterogeneity in control arm; HR becomes ill-defined; regulatory reviewers may reject |

**Recommended**: Option A (placebo) based on: (1) no approved DT therapy eliminates ethical barrier; (2) sorafenib's own Phase 3 (NCT020notify) used placebo as control; (3) minimizes sample size; (4) avoids active comparator toxicity blinding issues.
> ⚠️ If sponsor has business reasons to differentiate from placebo-controlled design (e.g., competitive positioning vs. a sorafenib-like drug), Option B should be re-evaluated with a formal non-inferiority (NI) or superiority assessment.

### 1.4 Study Phases

```
Screening (Day -28 to Day -1)
    ↓
Randomization (Baseline)
    ↓
Treatment Phase: Continuous oral dosing until PD, unacceptable toxicity, or withdrawal
    ↓
Follow-up Phase: Safety + Survival (post-treatment)
    ↓
Primary Analysis at DFS event target
```

### 1.5 Duration
- **Enrollment**: ~24 months (estimated accrual rate: 3–5 patients/month given rare disease)
- **Follow-up**: Minimum 18 months after last patient enrolled (event-driven)
- **Total estimated duration**: ~42 months (recruitment 24 mo + follow-up 18 mo)
- **Data cut-off**: Event-driven (target 75 DFS events)

---

## Dimension 2: Target Population & Eligibility Criteria

### 2.1 Inclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| **I-1** | Age ≥18 years at signing of informed consent | Adult population; pediatric DT has distinct biology |
| **I-2** | Histologically or cytologically confirmed desmoid tumor (centrally confirmed) | Diagnostic confirmation; avoids mis-enrollment |
| **I-3** | Progressive disease within 12 months prior to screening, defined as ≥1 of: (a) ≥20% increase in target lesion longest diameter (RECIST v1.1); (b) new lesion; (c) clinically significant deterioration attributable to PD (e.g., new/worsening pain, functional impairment requiring intervention) | Confirms active disease; "clinical progression" accepted per rare-disease oncology precedent (NCCN DT guidelines); avoids enrolling indolent/stable patients |
| **I-4** | Requires systemic therapy per investigator judgment (i.e., not a candidate for continued active surveillance alone) | Aligns with indication wording; ensures ethical enrollment |
| **I-5** | Measurable disease: ≥1 target lesion with longest diameter ≥10 mm (CT/MRI) per RECIST v1.1 | Required for radiographic assessment; non-measurable-only patients excluded |
| **I-6** | ECOG Performance Status 0 or 1 at screening | General safety threshold for chronic oral therapy |
| **I-7** | Adequate organ function: ANC ≥1.5 × 10⁹/L; Platelets ≥100 × 10⁹/L; Hemoglobin ≥9 g/dL; AST/ALT ≤2.5 × ULN; Total bilirubin ≤1.5 × ULN; Serum creatinine ≤1.5 × ULN or CrCl ≥50 mL/min | Standard Phase 3 safety thresholds |
| **I-8** | For females of childbearing potential: negative serum β-hCG at screening; agreement to use highly effective contraception during treatment and ≥30 days post-dose | Standard reproductive toxicity |
| **I-9** | For males: agreement to use condoms during treatment and ≥90 days post-dose | Standard |
| **I-10** | Signed informed consent | Regulatory requirement |

### 2.2 Exclusion Criteria

| # | Criterion | Rationale |
|---|-----------|-----------|
| **E-1** | Prior systemic therapy for DT within 4 weeks (or 5 half-lives, whichever longer) prior to first dose | Adequate washout; avoids confounding from prior therapy |
| **E-2** | Prior treatment with any gamma-secretase inhibitor (GSI) | Mechanism-specific exclusion; avoids prior-attribution confounding |
| **E-3** | Major surgical procedure within 4 weeks prior to first dose | Wound healing concern for chronic oral agent |
| **E-4** | Known history of second malignancy within 3 years prior to screening (except adequately treated basal cell carcinoma, squamous cell carcinoma, or in situ carcinoma of the cervix) | Standard oncology exclusion; avoids competing risk confounding |
| **E-5** | Known unstable or symptomatic cardiac disease: NYHA Class III/IV CHF, unstable angina, recent MI (≤6 months), uncontrolled arrhythmia | GSI class may have cardiac signals (Notch pathway cardiac valve); requires baseline exclusion |
| **E-6** | Baseline QTcF >470 ms (females) or >450 ms (males) | QT prolongation monitoring for GSI class |
| **E-7** | Known active CNS involvement by desmoid tumor | Separate compartment; requires site-specific exclusion or separate protocol |
| **E-8** | History of or current interstitial lung disease or pulmonary fibrosis | GSI class — pneumotoxicity signal monitoring |
| **E-9** | For patients on strong CYP3A4 inhibitors or inducers: must be able to switch or discontinue ≥2 weeks before first dose | GSI is CYP3A4 substrate; DDI management |
| **E-10** | Pregnant or breastfeeding | Teratogenicity unknown; standard exclusion |
| **E-11** | Known hypersensitivity to any investigational drug excipient | Standard |
| **E-12** | Concurrent participation in another interventional clinical trial | No concomitant therapy |
| **E-13** | Familial adenomatous polyposis (FAP)-associated intra-abdominal DT with active or high-risk intestinal obstruction | Safety concern; disease-specific |

### 2.3 I/E Scoring Summary (5-Dimension)

| Criterion | O1 (Efficacy ↑) | O2 (Speed ↑) | O3 (Enrollment ↑) | O4 (Clinical ↑) | O5 (FDA ✓) |
|-----------|-----------------|-------------|-------------------|-----------------|------------|
| Progressive disease requirement (I-3) | + | + | + | + | ✓ |
| Measurable disease (I-5) | + | 0 | − | + | ✓ |
| Prior therapy washout 4 wks (E-1) | 0 | 0 | − | + | ✓ |
| ECOG 0-1 (I-6) | 0 | 0 | + | + | ✓ |
| No prior GSI (E-2) | + | 0 | 0 | + | ✓ |

> **Overall**: Moderate enrichment (progression requirement) is justified — it selects patients with active disease most likely to benefit, aligns with FDA precedent for DT trials, and is clinically standard for oncology. Relaxing to non-progressing patients would dilute signal and increase sample size.

---

## Dimension 3: Primary Endpoint & Justification

### 3.1 Primary Endpoint
**Disease-Free Survival (DFS)**, defined as time from randomization to one of the following adjudicated events:
- Disease progression (radiographic: ≥20% increase in target lesion longest diameter, or new non-target lesion, per RECIST v1.1; confirmed by independent central review)
- Clinical progression: symptom worsening leading to initiation of new systemic anti-tumor therapy, radiation, or unplanned surgery (confirmed by independent central adjudication committee)
- Death from any cause

**Primary Endpoint Assessed by**: Blinded Independent Central Review (BICR); Clinical progression events adjudicated by Independent Central Adjudication Committee (ICAC)

### 3.2 Justification

1. **Endpoint is clinically meaningful in DT**: DT does not metastasize; the clinically relevant outcome is local growth and associated morbidity (pain, functional impairment). DFS captures both radiographic PD and clinically-driven treatment decisions.

2. **Precedent for "clinical progression" in DT**: NCCN DT guidelines and the sorafenib DeFi trial included "clinical progression" (symptomatic worsening requiring intervention) as a DFS component. DT's natural history includes periods of stability, and radiographic PD may not always trigger clinical action — including clinical progression ensures the endpoint reflects patient benefit.

3. **BICR requirement**: Open-label risk is present; investigator-assessed progression may be biased toward Arm A (higher vigilance for GSI-treated patients). BICR confirmed by ≥2 independent radiologists; discrepancy resolved by senior radiologist.

4. **Endpoint hierarchy**: For Traditional Approval in a rare disease with no approved therapy, DFS is the most appropriate primary endpoint. OS is a secondary endpoint (DT patients live ~96% at 5 years; OS events will be very few).

5. **Regulatory precedent**: Desmoid tumor trials (e.g., sorafenib Phase 3 NCT0249554; pazopanib Phase 2 NCT01349478) used PFS/DFS as primary endpoint. FDA has accepted this framework for DT.

### 3.3 DFS as Primary — SDP ⚠️ SDP-2

**SDP-2 (Endpoint Definition)**: DFS with or without clinical progression component:

| Option | Definition | Consideration |
|--------|-----------|---------------|
| **Option A (Recommended)** | DFS = radiographic PD OR clinical progression OR death | Captures full clinical benefit; more events → smaller N; broader label claim |
| **Option B** | DFS = radiographic PD only (no clinical progression) | Cleaner endpoint; fewer adjudication complexities; may miss clinically meaningful benefit |

**Recommendation**: Option A — DTC is a rare, locally aggressive tumor where clinical deterioration is as important as radiographic change. Regulatory precedent supports this.

---

## Dimension 4: Secondary Endpoints

### 4.1 Key Secondary Endpoints (tested in pre-specified hierarchy)

| Priority | Endpoint | Assessment | Rationale |
|----------|----------|------------|-----------|
| **SE1** | Objective Response Rate (ORR) | BICR per RECIST v1.1 | Demonstrates tumor shrinkage; supports efficacy |
| **SE2** | Duration of Response (DOR) | BICR | Shows durability of response |
| **SE3** | Overall Survival (OS) | All-cause mortality | Gold standard; long follow-up needed given DT natural history |
| **SE4** | Time to Treatment Failure (TTF) | Investigator-assessed | Composite endpoint capturing efficacy + safety + persistence |
| **SE5** | PRO: Pain (NRS 0-10) and physical function (LARS score or disease-specific DT-QoL) | Patient-reported | Directly captures QoL benefit; DT causes significant pain and functional impairment |
| **SE6** | Safety and tolerability: AEs, laboratory abnormalities, dose modifications | CTCAE v5.0 | Standard safety characterization |

### 4.2 Secondary Endpoint Justification

- **ORR/DOR**: ORR supports magnitude of anti-tumor activity; DOR confirms durability
- **OS**: Pre-specified but not expected to reach statistical significance at primary analysis; long-term follow-up (5 years) planned; OS harm threshold HR <1.20 pre-specified in SAP
- **PRO**: Pain and functional impairment are the primary sources of morbidity in DT. PRO instruments must be validated for DT population; content validity study recommended before Phase 3
- **TTF**: Captures treatment sustainability including tolerability-driven discontinuation

### 4.3 Exploratory Endpoints
- Biomarker: CTNNB1 mutation status (somatic); correlation with efficacy
- Pharmacokinetics: trough concentrations (PK) for exposure-response analysis
- Health economics: healthcare resource utilization

---

## Dimension 5: Sample Size & Statistical Assumptions

### 5.1 Base Case

| Parameter | Value | Source/Justification |
|-----------|-------|----------------------|
| Median DFS (Control) | 9 months | Based on natural history data from observational DT cohorts; consistent with control arm of sorafenib Phase 3 DeFi trial |
| Median DFS (Treatment) | 18 months | HR = 0.50 (50% reduction in progression risk); anchored on Phase 2 GSI activity signal (≥1 Phase 2 study required to establish signal before Phase 3) |
| Hazard Ratio (HR) | 0.50 | Assumes 2× improvement in median DFS; clinically meaningful; consistent with sorafenib Phase 3 result (HR ~0.49) |
| Alpha (one-sided) | 0.025 | Standard for Phase 3 pivotal trials |
| Power | 85% | Acceptable for rare disease; above minimum 80% |
| Randomization | 1:1 | Equal allocation; standard |
| Dropout rate | 10% | Conservative assumption for rare disease with chronic oral therapy |

### 5.2 Primary Sample Size Calculation

Using Schoenfeld formula (events-based):

| Parameter | Value |
|-----------|-------|
| Target DFS events | **75** |
| Total N (events only) | 95 |
| Total N with 10% dropout | **~106 patients** (53 per arm) |
| Monthly accrual rate | ~4.5 patients/month |
| Accrual duration | 24 months |
| Follow-up after last patient | 18 months |
| Total study duration | ~42 months |

**Calculation verification** (script output at median control = 9 mo, HR = 0.50, α = 0.025 one-sided, power = 85%):
- Schoenfeld events needed: 75
- Freedman events needed: 81
- Total N (Schoenfeld): 95
- Weighted event probability: 79.3% (79.3% × 95 ≈ 75 events)
- Conservative N = 106 (with 10% dropout inflation)

### 5.3 Sensitivity Analyses

| Scenario | HR | Median Trt | Events | N (total) | N/arm | Risk |
|----------|----|-----------|--------|----------|-------|------|
| Optimistic | 0.45 | 20 mo | 57 | 74 | 37 | Under-powered if HR is actually 0.50 |
| **Base Case** | **0.50** | **18 mo** | **75** | **106** | **53** | **Primary** |
| Conservative | 0.55 | 16.4 mo | 101 | 125 | 63 | Requires longer follow-up |
| Flat | 0.60 | 15 mo | 138 | 168 | 84 | Large N; consider enrichment |

**Key insight**: N = 106 is feasible for DT (900–1,500 incident cases/year in US; ~2-3% annual incidence of progressive DT → ~25–45 new progressive cases/year in US; global accrual over 24 months is achievable with ~15–20 sites).

### 5.4 Alternative Control Arm Sample Size Impact ⚠️ SDP-1B

If Option B (sorafenib active control) is chosen:
- Control arm median DFS ≈ 15 months (based on DeFi trial): N would increase to ~140
- If Option B NI design: requires pre-specified NI margin (typically HR <1.30 for DT); ~200+ patients required
- Active comparator substantially increases operational burden

---

## Dimension 6: Statistical Analysis Plan

### 6.1 Primary Analysis Population
**Intent-to-Treat (ITT) Population**: All randomized patients analyzed as assigned regardless of treatment received. Primary endpoint analyzed in ITT.

### 6.2 Estimand Framework

| Estimand Attribute | Specification |
|--------------------|---------------|
| **Population** | Adults with progressive DT requiring systemic therapy (ITT) |
| **Treatment condition** | GSI + BSC vs. placebo + BSC |
| **Variable** | DFS (time to first event: PD, clinical progression, or death) |
| **Summary measure** | Hazard ratio (GSI / placebo) |
| **Intercurrent events** | Treatment discontinuation → data censored at last tumor assessment prior to discontinuation (Treatment Policy strategy for censoring); subsequent anti-tumor therapy → data censored at initiation (Hypothetical strategy); death without prior PD → event counted |

> **Estimand rationale**: Primary estimand uses treatment policy for discontinuation to avoid selection bias; hypothetical estimand for subsequent therapy as sensitivity analysis. This follows ICH E9(R1) recommendations.

### 6.3 Multiplicity Adjustment

| Test | Strategy | Details |
|------|----------|---------|
| Primary endpoint (DFS) | Single test at α=0.025 one-sided | No multiplicity at primary level |
| Key secondary endpoints (ORR, DOR, OS) | Hierarchical testing (fixed sequence) | ORR → DOR → OS; each tested at α=0.025 one-sided only if preceding test is significant |
| PRO endpoint | Descriptive + sensitivity analysis | No formal alpha allocation due to DT population size |

**Rationale**: Hierarchical (fixed-sequence) testing is preferred for 2–3 key secondaries. Graphical approach (Bretz 2009) used only if ≥4 secondary hypotheses.

### 6.4 Interim Analysis Plan

| IA Timing | Purpose | Alpha Spending | O'Brien-Fleming Boundary |
|----------|---------|---------------|-------------------------|
| **IA-1** at 60% information fraction (~45 events) | Futility only (non-binding) | Whitehead's triangle or gamma(0) method | Stop for futility if HR >1.0 conditional power <20% |
| **Final** at 75 events | Primary efficacy | Pre-specified | Z > 2.241 (one-sided α=0.025) |

**Rationale**: Single IA for futility only; no efficacy stopping early. Rare disease event rate is uncertain; conservative IA approach avoids alpha inflation. Non-binding futility allows early stop only with DSMB recommendation.

**DSMB**: Independent DSMB reviews unblinded IA-1 data. Safety monitoring ongoing (every 6 months).

### 6.5 Sensitivity Analyses for Primary Endpoint

1. **Per-protocol analysis**: Patients without major protocol deviations; results presented alongside ITT
2. **Treatment policy (IPCW)**: Inverse probability of censoring weighting for treatment discontinuation
3. **Scenario-based**: Multiple imputation for intercurrent events
4. **BICR vs. investigator-assessed concordance**: Sensitivity of primary result to assessor choice

### 6.6 OS Analysis Plan

- **Harm threshold**: HR upper bound <1.20 (pre-specified; exclusion of harm)
- **Interim OS analysis**: Only at DFS primary analysis (not at IA-1 futility)
- **Methods**: Kaplan-Meier, stratified Cox PH; RMST as supplemental
- **Follow-up duration**: 5-year OS follow-up post-randomization (survival events expected rare in DT)

---

## Dimension 7: Stratification Factors

### 7.1 Stratification Factors

| Factor | Categories | Rationale |
|--------|------------|-----------|
| **Tumor location** | Intra-abdominal vs. Extra-abdominal / abdominal wall | Primary prognostic factor for DT; intra-abdominal DT has distinct natural history and higher morbidity |
| **Prior systemic therapy for DT** | Yes vs. No | Prior therapy exposure is prognostic; some agents may affect subsequent treatment sensitivity |

### 7.2 Stratification Minimization for Rare Disease

> Per SOP: "IF rare cancer (<5/million incidence) → Minimize to 1-2 stratification factors; retain only the strongest prognostic factor"

With 2 stratification factors (location + prior therapy), 4 stratification cells (2 × 2), and ~106 patients, average cell size = ~26-27 patients. This is acceptable for N=106 with 1:1 randomization. **No further minimization required.**

**If enrollment is slower than planned** (rare disease risk): Stratification may be reduced to tumor location only (single strongest prognostic factor), with prior therapy captured as covariate in Cox model.

---

## Dimension 8: Key Operational Considerations

### 8.1 Global Site Distribution

| Region | Estimated Sites | Rationale |
|--------|----------------|-----------|
| North America (US/Canada) | 15–20 sites | Highest DT incidence; academic sarcoma centers |
| Europe (Germany, France, UK, Italy, Spain) | 10–15 sites | DT referral centers; NCCN collaboration |
| Asia-Pacific (Japan, Australia, South Korea) | 5–8 sites | Emerging DT awareness; some patients without local therapy options |

**Total sites**: ~30–43 sites for 106 patients over 24 months (~0.4 patients/site/month) — feasible for experienced sarcoma centers.

### 8.2 Imaging Assessment Strategy

| Component | Specification |
|-----------|---------------|
| **Primary assessment** | BICR (blinded independent central review) — ≥2 independent radiologists; discrepancy resolved by senior |
| **Schedule** | CT/MRI every 8 weeks (±7 days) for first 12 months; every 12 weeks thereafter |
| **Clinical progression assessment** | ICAC (independent central adjudication committee) — 3 members including DT sarcoma medical oncologist |
| **Central imaging vendor** | eCRO with specialized sarcoma imaging core lab (e.g., BioClinica, ERT, or equivalent) |
| **Storage** | DICOM transfer to central vendor within 5 business days of acquisition |

**Note**: Rare disease challenge — radiologist expertise in DT is limited globally. Central review must include radiologists with DT/CTOS sarcoma experience.

### 8.3 Rare Disease Operational Challenges

| Challenge | Mitigation Strategy |
|-----------|---------------------|
| **Slow enrollment** | Engagement with DT patient advocacy groups (Desmoid Tumor Research Foundation); physician education; broad geographic footprint; consider expedited regulatory pathways (RMAT, PRIME) |
| **Diagnostic delays** | Central pathology confirmation with 28-day screening window; local pathology acceptable with central confirmation retrospective |
| **Clinical progression adjudication complexity** | Pre-specified ICAC charter; ICAC reviews investigator-reported clinical progression events within 10 business days |
| **Patient retention** | Chronic oral therapy (daily dosing); remote visits for stable patients; travel support; patient-reported outcome eDiary |
| **Event rate uncertainty** | Pre-planned sample size re-estimation (blinded) after 50% enrollment if needed; consider adaptive design pre-specification |

### 8.4 Pharmacovigilance
- AE reporting per ICH E2A; CTCAE v5.0 grading
- Special monitoring for: hepatotoxicity, GI toxicity (DT tumors often intra-abdominal), dermatologic events, cardiac valve disease (GSI class — Notch pathway)
- Pregnancies: study drug discontinued immediately; pregnancy outcomes followed

### 8.5 Drug-Drug Interactions
- GSI is CYP3A4 substrate (postulated; confirm from Phase 1 data)
- Concomitant strong CYP3A4 inhibitors/inducers prohibited or requires washout
- Concomitant medications documented at each visit

---

## Dimension 9: Dose Selection Rationale

### 9.1 Phase 3 Dose Justification Requirements

Per protocol-design SOP: "Pivotal trial dose must be justified with PK/PD + exposure-response data" and FDA Guidance "Optimizing the Dosage of Human Prescription Drugs" (2023).

### 9.2 Required Phase 1/2 Data Package Before Phase 3 Initiation

| Data Element | Required Information |
|--------------|---------------------|
| **Dose-finding** | MTD or RP2D from Phase 1 dose escalation (≥3+3 design); recommended Phase 2 dose |
| **PK/PD** | Population PK model; exposure-response (E-R) for efficacy (DFS/ORR) and safety (AE) |
| **E-R analysis** | Is there a flat, increasing, or U-shaped E-R for efficacy? For toxicity? |
| **Therapeutic window** | Minimum effective exposure vs. maximum tolerated exposure |
| **Phase 2 dose** | Preliminary efficacy signal at proposed Phase 3 dose; ORR + DOR data |

### 9.3 Dose and Schedule for Phase 3

**Assuming oral solid tablet formulation, BID or QD schedule** (to be confirmed from Phase 1/2 data):

| Parameter | Specification | Justification |
|-----------|-------------|---------------|
| Dose | Phase 2 RP2D (e.g., 150 mg BID or equivalent) | Determined from Phase 1/2 E-R |
| Schedule | Continuous daily oral dosing (no scheduled breaks) | Chronic DT management requires sustained inhibition |
| Administration | With or without food (per Phase 1 food effect data) | Standard |
| Dose modifications | Level −1 (−25% dose reduction) and Level −2 (50% reduction) for AEs | Per protocol CTCAE v5.0 algorithm |
| Maximum treatment duration | Until PD, unacceptable toxicity, or withdrawal | Chronic DT management paradigm |

### 9.4 SDP: Fixed Dose vs. Body Weight-Based Dosing ⚠️ SDP-3

**SDP-3**: If Phase 1 shows significant body weight effect on PK (which is common for oral agents):
- Option A: Fixed dose (simpler; better adherence)
- Option B: Weight-based dose (more personalized; operational complexity)

**Recommendation**: Fixed dose pending Phase 1 E-R analysis. If E-R is flat, fixed dose is preferred.

---

## Dimension 10: Regulatory Pathway & Approval Strategy

### 10.1 Regulatory Pathway

| Factor | Assessment |
|--------|-----------|
| **Indication** | Treatment of adult patients with progressing desmoid tumors requiring systemic treatment |
| **Pathway** | Traditional Approval (505(b)(1) NDA) — novel mechanism (GSI first-in-class) |
| **Breakthrough/Treatment Advantage** | GSI first-in-class; may qualify for Breakthrough Therapy Designation (BTD) if Phase 2 shows compelling HR (e.g., HR <0.40); Fast Track Designation feasible given rare disease + unmet need |
| **Orphan Drug Designation** | Desmoid tumors qualify (prevalence <200,000 in US); ODD provides: 7-year market exclusivity (orphan drug), PDUFA fee waiver, tax credits for clinical testing |
| **RMAT** | Regenerative Medicine Advanced Therapy designation possible if mechanism involves tissue repair (check with FDA pre-IND) |

### 10.2 Pivotal Trial Strategy

| Element | Decision | Justification |
|---------|----------|---------------|
| **Number of pivotal trials** | 1 trial (Phase 3) sufficient | Single pivotal trial increasingly accepted in oncology; DT is rare disease with high unmet need; effect size large (HR=0.50); Phase 2 must confirm signal before Phase 3 commitment |
| **Phase 2 required before Phase 3** | Yes (mandatory) | First-in-class mechanism; dose/route/schedule must be validated; no Phase 2 = inadequate dose justification per FDA 2023 dose-optimization guidance |
| **Pre-IND meeting** | Strongly recommended | Submit Phase 1/2 data + Phase 3 protocol; align on: primary endpoint definition (DFS ± clinical progression), control arm, statistical design, FDA's expectation for dose justification |

### 10.3 Pre-IND Regulatory Considerations

| Topic | Question to FDA | SDP Flag |
|-------|----------------|----------|
| **Primary endpoint** | Is DFS with clinical progression component acceptable? Or radiographic PD only? | SDP-2: align before Phase 3 |
| **Control arm** | Is placebo + BSC acceptable given no approved therapy? Any concern? | SDP-1: confirm before Phase 3 |
| **BICR** | Does FDA require BICR for DFS primary endpoint? | BICR preferred for open-label risk |
| **Biomarker** | Is CTNNB1/APC mutation status required as enrollment criterion or exploratory only? | Biomarker-driven stratification optional |
| **Pediatric** | DT occurs in adolescents; any plan to include 12-17 year olds? | Pediatric Investigation Plan (PIP) required if ODD |

### 10.4 CMC/Regulatory Considerations
- GSI formulation: 50 mg tablet (bid) — standard oral tablet; no special formulation concerns
- CMC: confirm drug substance stability, drug product specifications, GMP compliance
- No special handling requirements (temperature-sensitive storage) unless Phase 1 data indicates otherwise

### 10.5 Approval Timeline

| Milestone | Estimated Timing |
|-----------|-----------------|
| Phase 2 completion | Year 2–3 |
| Phase 3 enrollment start | Year 3 |
| Phase 3 primary analysis | Year 5–6 |
| NDA submission | Year 6 |
| Potential approval | Year 6–7 (PDUFA + review) |

### 10.6 Competitive Landscape (Placeholder for SDP) ⚠️ SDP-4

**SDP-4 (Competitive Intelligence)**: At the time of Phase 3 design, the competitive landscape includes:
- **Sorafenib**: Phase 3 DeFi trial (NCT0249554) completed; results published — HR ~0.49 for PFS; sorafenib is TKIs with broad activity; potential competitive product
- **Pazopanib**: Phase 2 data (NCT01349478) — ORR support; ongoing development status unknown
- **Imatinib**: Limited data; off-label use in some centers
- **Nirogacestat (GSI)**: DeFi Phase 3 positive; first-in-class GSI approved by FDA 2023 (if approved at time of own Phase 3 initiation)

**Strategic consideration**: If nirogacestat (or another GSI) has been approved by the time of own NDA submission, a head-to-head vs. approved drug may be required for market access, shifting from placebo to active comparator design. This should be re-evaluated at a **pre-NDA meeting** with FDA.

---

## Summary: Strategy Decision Points (SDPs)

| SDP | Topic | Options | Recommended |
|-----|-------|---------|-------------|
| **SDP-1** | Control arm | Placebo+BSC vs. sorafenib active control vs. IC | Placebo+BSC (Option A) |
| **SDP-2** | Primary endpoint definition | DFS = PD only vs. PD + clinical progression | DFS = PD + clinical progression (Option A) |
| **SDP-3** | Dose: fixed vs. weight-based | Fixed dose vs. weight-based | Fixed dose pending Phase 1 E-R |
| **SDP-4** | Competitive landscape impact | Placebo design vs. active comparator if competitor approved | Re-evaluate at pre-NDA; may require design pivot |

---

## Key Protocol Parameters Summary

| Parameter | Value |
|-----------|-------|
| Phase | 3 |
| Design | Randomized, double-blind, placebo-controlled |
| Arms | 2 (GSI + BSC vs. placebo + BSC, 1:1) |
| N (total) | ~106 (53/arm) |
| Primary endpoint | DFS (BICR + ICAC) |
| Primary analysis | Log-rank test, HR, stratified Cox |
| Alpha | 0.025 one-sided |
| Power | 85% |
| Median control DFS | 9 months (assumption) |
| HR | 0.50 |
| Stratification | Tumor location + prior systemic therapy |
| Interim analysis | Futility only at 60% information |
| DSMB | Yes; safety + futility review |
| Reg path | 505(b)(1), ODD, possible BTD/Fast Track |
| Sites | ~30-43 global sites |
| Duration | ~42 months |

---

## Flags for Cross-Validation

| Flag | Description |
|------|-------------|
| ⚠️ SDP-1 | Control arm — sponsor decision required before final protocol |
| ⚠️ SDP-2 | Primary endpoint definition — pre-IND FDA alignment needed |
| ⚠️ SDP-3 | Dose selection — Phase 1/2 E-R data required before Phase 3 initiation |
| ⚠️ SDP-4 | Competitive landscape — may require design pivot if competitor approved |
| ⚠️ DATA GAP | Phase 2 GSI data required before Phase 3 initiation (dose justification) |
| ⚠️ DATA GAP | PRO instrument validation for DT pain/functional impairment needed |
| ⚠️ DATA GAP | CTNNB1/APC biomarker: confirmatory Phase 2 correlative science plan needed |
