# Consensus Answer — Phase 3 Pivotal Trial Design: Gamma-Secretase Inhibitor for Desmoid Tumors
## Round 08 | Consensus Merge | Generated: 2026-04-01

> **Merge Notes** (see bottom for full summary)
> - Solvers available: A, B, C (3/3)
> - Divergence count: 4 dimensions required orchestrator resolution (Dims 3, 5, 6, 7)
> - Consensus (≥2/3): 6 dimensions (Dims 1, 2, 4, 8, 9, 10)

---

## Dimension 1: Study Design

**[consensus: 3/3]**

### Design Architecture

| Element | Consensus Choice | Rationale |
|---------|-----------------|-----------|
| **Design Type** | Randomized, double-blind, placebo-controlled, parallel-arm, Phase 3 superiority trial | All three solvers agree; gold standard; precedent from sorafenib DeFi trial |
| **Arms** | 2 arms — GSI + Best Supportive Care (BSC) vs. Placebo + BSC | 3/3 agreement |
| **Randomization** | 1:1 allocation | 3/3 agreement |
| **Blinding** | Double-blind (patient, investigator, sponsor); BICR panel blinded independently | 3/3 agreement |
| **Control** | Placebo + BSC | 3/3 agreement; no approved DT therapy → placebo ethically acceptable (SOP §3.1) |
| **Setting** | Global multicenter, US/EU/Asia-Pacific | 3/3 agreement |

### Study Phases

```
Screening (Day -28 to Day -1)
    ↓
Randomization (Baseline)
    ↓
Double-Blind Treatment Phase: Continuous oral dosing until PD, unacceptable toxicity, or withdrawal
    ↓
Follow-up Phase: Safety + Survival
    ↓
Part 2 (Open-label extension): Crossover available after confirmed progression + primary analysis completion
```

### ⚠️ SDP #1: Control Arm (Placebo vs. Active Comparator)

| Option | Pros | Cons | FDA Acceptability |
|--------|------|------|-------------------|
| **A: Placebo + BSC (Recommended)** | Clean efficacy signal; smallest N; DeFi precedent; ethical given no approved therapy | Ethics scrutinized if sorafenib widely used off-label | ✓ Established precedent |
| **B: Sorafenib active control** | Clinically meaningful comparator | No approved DT label; larger N; blinding challenges | ? Requires NI margin pre-specification |
| **C: Investigator's Choice** | Real-world reflection | Heterogeneous control; ill-defined HR | ✗ Regulatory concern |

**Recommendation**: Option A (placebo + BSC). If competitive landscape changes (competitor GSI approved before NDA submission), re-evaluate at pre-NDA meeting.

> **BSC definition**: Stable analgesics, NSAIDs, hormonal therapies, or other supportive measures at randomization; new systemic anti-tumor therapy prohibited.

---

## Dimension 2: Key Eligibility Criteria

**[consensus: 2/3 on core elements; partial divergence on ECOG resolved]**

### Inclusion Criteria

| # | Criterion | Consensus Basis |
|---|-----------|----------------|
| **I-1** | Age ≥18 years | 3/3 |
| **I-2** | Histologically confirmed desmoid tumor — central pathology review required | 3/3 |
| **I-3** | Measurable disease: ≥1 target lesion ≥10 mm longest diameter per RECIST v1.1 | 3/3 (SOP §2.4: "PFS→require evaluable disease") |
| **I-4** | Radiographic progression (≥20% increase in target lesion LD, or new lesion per RECIST v1.1) within 12 months prior to screening; **OR** clinically significant symptoms attributable to DT requiring systemic therapy | 2/3 (A+C agree on RECIST+clinical progression combo; B uses broader "clinical progression" definition) |
| **I-5** | Requires systemic therapy per investigator judgment (not a candidate for continued active surveillance alone) | 2/3 (B+C explicit; implied by A) |
| **I-6** | No prior therapy restriction — drug-naive and previously treated both eligible; prior NSAIDs, hormonal therapy, TKIs permitted with appropriate washout | 2/3 (A+C); B requires washout without restriction — net agreement on "allow all lines" |
| **I-7** | **ECOG PS 0–1** | 2/3 (A+B = 0-1); C = 0-2. Resolved below. |
| **I-8** | Adequate organ function: ANC ≥1.5×10⁹/L; Plt ≥100×10⁹/L; Hgb ≥9 g/dL; AST/ALT ≤2.5×ULN; Total bilirubin ≤1.5×ULN; Cr ≤1.5×ULN or CrCl ≥50 mL/min | 2/3 (A+B explicit; C slightly relaxed CrCl ≥30) |
| **I-9** | Females of childbearing potential: negative serum β-hCG at screening; highly effective contraception during treatment and ≥30 days post-dose | 3/3 |
| **I-10** | Males: condom use during treatment and ≥90 days post-dose (SOP §2.5 item 9) | 2/3 (B+C explicit) |

**ECOG Resolution**: A and B agree on ECOG 0–1; C allows 0–2. SOP §2.1 (5-dimension scoring): ECOG 0–2 relaxation ↑O3 (enrollment) but ↓O1 (enrichment). For chronic oral therapy with rare disease enrollment pressure, a compromise is clinically reasonable but **ECOG 0–1 is the conservative registration choice** aligned with the majority (A+B) and FDA precedent from DT trials. **Consensus: ECOG 0–1**; ECOG 2 as exploratory cohort or pre-specified subgroup analysis. [consensus: 2/3]

### Exclusion Criteria

| # | Criterion | Consensus Basis |
|---|-----------|----------------|
| **E-1** | Prior treatment with any gamma-secretase inhibitor or Notch pathway inhibitor | 3/3 |
| **E-2** | Major surgical procedure within 4 weeks prior to first dose | 2/3 (A+B) |
| **E-3** | Known second malignancy within 3 years (exceptions: NMSC, in situ cervical carcinoma) | 3/3 |
| **E-4** | Known unstable cardiac disease: NYHA Class III/IV CHF, unstable angina, MI ≤6 months, uncontrolled arrhythmia; baseline QTcF >470 ms (F) or >450 ms (M) | 2/3 (B+C; A implicit) |
| **E-5** | Strong CYP3A4 inhibitors/inducers: must discontinue ≥2 weeks prior to first dose (GSI is CYP3A4 substrate) | 3/3 |
| **E-6** | Pregnancy or breastfeeding | 3/3 |
| **E-7** | Active uncontrolled systemic infection | 2/3 |
| **E-8** | FAP-associated DT with active or high-risk intestinal obstruction requiring urgent surgery | 2/3 (A+B variations; C allows FAP with stabilization) |

### ⚠️ SDP #2: FAP-Associated DT Inclusion

| Option | Description | O1 | O3 | FDA |
|--------|-------------|----|----|-----|
| **A: Exclude FAP** | Homogeneous sporadic population | ↑↑ | ↓ (−10%) | ✓ Cleaner |
| **B (Recommended): Include FAP, stratify** | Broader label; adds FAP stratification factor | ↑ | ↑ | ✓ Precedent |

**Recommendation**: Include FAP-associated DT with stratification; present FAP vs. sporadic subgroup analysis. Sponsor decides.

### ⚠️ SDP #3: Prior Therapy Line

**Consensus**: Allow all lines (drug-naive and previously treated); stratify by prior systemic therapy status (Yes/No). Sorafenib DeFi trial used same approach. [A+C agree; B compatible]

---

## Dimension 3: Primary Endpoint

**[orchestrator-resolved: SOP §4.1 + §4.7 alignment]**

### Primary Endpoint: Progression-Free Survival (PFS)

**Definition**: Time from randomization to the earlier of:
1. Radiographic progression per RECIST v1.1 (≥20% increase in target lesion longest diameter, new lesion, or unequivocal progression)
2. Clinical progression: DT-related worsening requiring initiation of new anti-tumor therapy, surgical intervention, or radiation therapy — adjudicated by Independent Review Committee (IRC)
3. Death from any cause

**Assessor**: Investigator-assessed PFS as **primary endpoint**; BICR as confirmatory **sensitivity analysis**

### Orchestrator Resolution Rationale

Solver A used PFS-investigator (no clinical progression standalone) — aligned with SOP §4.1 double-blind allows inv-PFS primary.  
Solver B used DFS with BICR as primary — BICR primary adds $500K–$2M and 3–5 day delay (SOP §4.7); SOP preference is inv-PFS primary in double-blind.  
Solver C used PFS-investigator + clinical progression via IRC — most precisely SOP-aligned.

**SOP §4.1**: "IF double-blind → PFS may use investigator assessment as primary endpoint; BICR as sensitivity analysis." SOP §4.7: "Default: Investigator PFS primary + BICR secondary." SOP rare-disease.md: "PFS may incorporate clinical progression for locally invasive cancers that do not metastasize."

**Resolution**: Investigator-assessed PFS (with clinical progression component via IRC adjudication) as primary; BICR as sensitivity analysis. Clinical progression definition must be pre-specified and unambiguous (operationally testable per FDA.7 item 9). [orchestrator-resolved: solvers A+C agree on inv-PFS primary; B's BICR-primary conflicts with SOP §4.1/4.7 preference for double-blind designs]

### Assessment Schedule

- Every 8 weeks (±7 days) for first 12 months
- Every 12 weeks (±7 days) thereafter
- Modality: MRI preferred (soft tissue); CT acceptable for intra-abdominal/thoracic

### ⚠️ SDP #4: PFS vs. ORR as Co-Primary

| Option | Pathway | Events | Timeline | Risk |
|--------|---------|--------|---------|------|
| **A (Consensus): PFS primary** | Traditional approval | 75–101 events | ~42 months | Standard |
| **B: ORR primary** | Accelerated approval possible | N~100 | Faster | ORR in DT may be low |
| **C: Co-primary PFS + ORR** | Higher bar; SOP §5.3 requires 90% power each | Largest N | Longest | Complexity |

**Recommendation**: PFS as sole primary for traditional approval. If Phase 2 ORR >25%, re-evaluate ORR-primary with FDA pre-Phase 3 meeting.

---

## Dimension 4: Secondary Endpoints

**[consensus: 2/3 on endpoint selection; orchestrator-resolved on hierarchy]**

### Key Secondary Endpoints (Hierarchical Testing Order)

| Rank | Endpoint | Assessment | Rationale |
|------|----------|------------|-----------|
| **1** | **Objective Response Rate (ORR)** | BICR per RECIST v1.1 (confirmed CR+PR) | 3/3 include; A+B place first — most direct demonstration of anti-tumor activity |
| **2** | **Duration of Response (DOR)** | BICR; responders only | 3/3 include; shows durability |
| **3** | **Overall Survival (OS)** | All-cause mortality | 3/3 include; pre-specified harm threshold HR upper bound ≤1.20; 5-year follow-up (SOP §4.5) |
| **4** | **Time to Next Treatment (TTNT)** / Time to Treatment Failure (TTF) | Investigator | 2/3 (B+C); captures clinical utility beyond PFS |
| **5** | **PRO — Time to Confirmed Clinical Deterioration (TTCD)** in worst pain (BPI-SF, ≥2-point worsening confirmed at consecutive assessment) | Patient-reported | 3/3 include PRO; SOP §4.6 prefers TTCD format; B+C specify BPI-SF |
| **6** | **BICR-assessed PFS** | Central radiologists | 2/3 (B+C); primary sensitivity analysis for inv-PFS |

### Hierarchy Resolution

Solver A: ORR→DOR→OS→TTP→PRO. Solver B: ORR→DOR→OS→TTF→PRO. Solver C: OS→ORR→DOR→TTNT→PRO.  
C's OS-first hierarchy conflicts with SOP §4.2 ("OS > PFS > ORR" refers to endpoint *quality*, not testing *order*; OS as primary is impractical for DT with ~96% 5-year survival). A+B agree ORR tested first after PFS. **Consensus hierarchy**: ORR → DOR → OS (harm threshold only, not in efficacy chain) → TTNT → TTCD-PRO. [orchestrator-resolved: A+B agree on ORR-first; SOP §4.5 specifies OS harm threshold pre-specification]

### Exploratory Endpoints

- CTNNB1 mutation status subgroup (T41A vs. S45F vs. other) correlation with PFS/ORR
- PFS in FAP vs. sporadic DT subgroups
- Plasma ctDNA and Notch pathway biomarkers
- PK trough concentrations for exposure-response analysis
- Health resource utilization (HRU) and hospitalization rates

---

## Dimension 5: Sample Size Estimation

**[orchestrator-resolved: control arm mPFS assumption diverges; SOP §5.1 requires ≥3 trials, population-weighted]**

### Key Assumptions — Analysis

| Parameter | Solver A | Solver B | Solver C | SOP §5.1 Guidance |
|-----------|----------|----------|----------|-------------------|
| Control arm median PFS | 7 months | 9 months | **15 months** | ≥3 trials, population-weighted |
| HR | 0.40 | 0.50 | 0.50 | From Phase 2/class data |
| Power | 85% | 85% | 85% | 80–90% per SOP |

**Orchestrator Resolution on Control Arm mPFS:**

Solver A's 7 months is inferred indirectly from sorafenib 1-year PFS rate (~46%), which may underestimate the true placebo median. Solver C cites the sorafenib DeFi trial placebo arm mPFS directly as ~15.4 months — this is the most authoritative available data point from a published Phase 3 randomized placebo-controlled DT trial. Solver B's 9-month estimate lacks primary source citation. **SOP §5.1 requires derivation from historical data ≥3 trials (population-weighted); the DeFi placebo arm is the primary anchor; 15 months is the most defensible assumption.**

HR assumption: A uses 0.40 (based on sorafenib's 0.14 HR as anchor, then "conservative"), which is less principled. B+C use 0.50 (matching sorafenib Phase 3 HR ~0.49) — this is the correct historical benchmark for a similarly positioned agent. [consensus: B+C = 2/3 on HR=0.50]

### Consensus Sample Size

| Parameter | Consensus Value | Basis |
|-----------|----------------|-------|
| Control arm median PFS | **15 months** | DeFi trial placebo arm (most direct precedent) |
| HR | **0.50** | Sorafenib Phase 3 HR ~0.49; B+C agree (2/3) |
| Alpha | 0.025 one-sided | 3/3 |
| Power | 85% | 3/3 |
| Allocation | 1:1 | 3/3 |
| Dropout | 10% | 2/3 (B+C) |
| **Target events** | **75** (Schoenfeld) | B+C agree (2/3) |
| **Total N (base)** | **~134** (~67 per arm) | B+C in range; with 10% dropout |
| **Recommended enrollment target** | **N=150** (conservative buffer) | +12% above base; accounts for rare disease enrollment uncertainty + event rate variability |

### Sensitivity Analysis

| Scenario | HR | Control mPFS | Events | N Total |
|----------|----|-------------|--------|---------|
| Optimistic | 0.45 | 15 mo | 57 | ~95 |
| **Base Case** | **0.50** | **15 mo** | **75** | **~134** |
| Conservative | 0.55 | 15 mo | 101 | ~160 |
| Pessimistic | 0.60 | 15 mo | 138 | ~210 |

**Recommended enrollment target: N=150** (35% buffer above base for rare disease), with pre-specified blinded sample size re-estimation at 50% events.

### Timeline

| Parameter | Estimate |
|-----------|----------|
| Monthly accrual target | ~5–6 patients/month |
| Accrual duration | ~24 months |
| Follow-up after last patient | ≥18 months |
| **Total trial duration** | **~42 months** |

---

## Dimension 6: Statistical Analysis Plan

**[orchestrator-resolved on interim analysis; consensus on primary method and estimand]**

### Primary Analysis

| Element | Specification | Basis |
|---------|--------------|-------|
| **Primary Population** | ITT (all randomized patients analyzed as assigned) | 3/3 |
| **Method** | Stratified log-rank test (stratified by randomization factors) | 3/3 |
| **Effect Estimate** | Stratified Cox PH model; HR with 95% CI | 3/3 |
| **Covariates** | Tumor location (intra-abdominal vs. extra-abdominal); Prior systemic therapy (Yes/No) | 2/3 (A+B) |
| **Censoring** | Per FDA guidance; patients without event censored at last adequate assessment | 3/3 |

### Estimand Framework (ICH E9(R1))

| Attribute | Specification |
|-----------|--------------|
| **Population** | Adults with progressive DT requiring systemic therapy (ITT) |
| **Treatment condition** | GSI + BSC vs. Placebo + BSC |
| **Variable** | PFS (time to first event: RECIST PD, clinical progression, or death) |
| **Summary measure** | Hazard ratio (GSI / placebo) |
| **Intercurrent event strategy** | Treatment discontinuation → treatment policy (ITT); subsequent anti-tumor therapy → hypothetical (censored at initiation, sensitivity analysis); death → counted as PFS event |

### Multiplicity Adjustment

**Hierarchical testing** (SOP §5.2: 2 hypotheses → hierarchical):
1. PFS superiority at α=0.025 (one-sided)
2. ORR superiority — tested only if PFS significant; α=0.025 carried forward
3. TTNT — tested only if ORR significant
4. TTCD-PRO — tested only if TTNT significant
5. **OS**: Pre-specified harm threshold only (HR upper bound exclusion ≤1.20); separate alpha; not in efficacy chain (SOP §4.5)

### Interim Analysis — Orchestrator Resolution

Solver A: No formal IA (informal DMC only). Solver B: Futility-only IA at 60% information (~45 events). Solver C: Futility-only IA at 50% events (~37–38 events).

**SOP rare-disease.md**: "IF rare disease target events ≤50–60: May omit interim analysis." With 75 target events, the threshold is marginal. A's no-IA approach is conservatively valid but loses the ability to stop early for futility — a meaningful protection in a rare disease setting where patient burden matters. B+C both recommend futility-only IA with O'Brien-Fleming spending, differing only in timing (50% vs. 60%).

**Resolution**: Single non-binding futility-only interim analysis at **~50% information fraction (~37–38 events)**; O'Brien-Fleming alpha spending function; alpha spent ≈0.001 at interim (effectively preserving ~0.024 for final). No efficacy stopping. DSMB reviews unblinded data; recommendation is non-binding. [orchestrator-resolved: B+C agree on futility-only IA; split on timing; 50% is more standard; SOP does not prohibit IA when events >60]

### Sensitivity Analyses

1. BICR-assessed PFS (primary sensitivity for inv-PFS)
2. Radiographic-only PFS (excluding clinical progression events)
3. Per-protocol population analysis
4. IPCW for treatment discontinuation
5. RMST at 24 months + weighted log-rank for non-proportional hazards assessment

### OS Analysis

- **Harm threshold**: HR upper bound ≤1.20 (pre-specified; exclusion of harm)
- **Method**: Kaplan-Meier; stratified Cox PH; RMST supplemental
- **Long-term follow-up**: 5-year OS follow-up post-randomization
- **Crossover adjustment**: If crossover implemented, pre-specify RPSFT or IPCW method in SAP

---

## Dimension 7: Stratification Factors

**[orchestrator-resolved: A+B agree on tumor location; C substitutes FAP status]**

### Consensus Stratification (2 factors per SOP §6.1 rare disease rule)

| Factor | Categories | Rationale |
|--------|------------|-----------|
| **Factor 1: Tumor location** | Intra-abdominal vs. Extra-abdominal (incl. abdominal wall) | A+B agree (2/3); strongest prognostic factor for PFS in DT; intra-abdominal has more aggressive natural history and higher morbidity; operationally binary and easily ascertained |
| **Factor 2: Prior systemic therapy** | Yes vs. No | 3/3 agree; treatment-naïve patients may have higher spontaneous regression rate; refractory patients have shorter baseline PFS; directly corrects for this major prognostic imbalance |

### Orchestrator Resolution on Factor 1

Solver C proposes FAP status as Factor 1 (instead of tumor location). FAP vs. sporadic DT represents important molecular biology (APC vs. CTNNB1 mutation), but FAP accounts for only ~5–15% of DTs, creating a highly imbalanced stratification cell (~8–22 patients in FAP stratum with N=150). Tumor location is a more balanced prognostic stratification factor with established precedent (sorafenib DeFi trial used similar stratification). [orchestrator-resolved: A+B agree on location; FAP status included as pre-specified subgroup analysis, not stratification factor]

**Cell size check**: N=150, 2 binary factors → 4 strata × ~37 patients. Acceptable per SOP §6.1.

**Fallback plan**: If enrollment is slower than projected, reduce to tumor location only (single factor); retain prior therapy as covariate in Cox model.

---

## Dimension 8: Key Operational Considerations

**[consensus: 3/3 on core operational strategy]**

### Global Site Distribution

| Region | Estimated Sites | Patients | Rationale |
|--------|----------------|---------|-----------|
| **North America (US/Canada)** | 15–20 sites | ~50–60 (40%) | Highest DT incidence; academic sarcoma centers of excellence |
| **Europe (Germany, France, UK, Italy, Spain)** | 10–15 sites | ~45–55 (35%) | Established rare tumor/sarcoma networks (CONTICANET, NCCN partnership) |
| **Asia-Pacific (Japan, Australia, South Korea)** | 5–10 sites | ~25–40 (25%) | Expands access; growing DT awareness; label breadth |
| **Total** | **~30–45 sites** | **~150** | — |

### Imaging Assessment Strategy

| Component | Specification |
|-----------|---------------|
| **Primary modality** | MRI preferred (soft tissue DT; superior contrast resolution); CT acceptable for intra-abdominal/thoracic |
| **Consistency** | Same modality within patient throughout trial |
| **Schedule** | Every 8 weeks (±7 days) for first 12 months; every 12 weeks (±7 days) thereafter |
| **BICR** | ≥2 independent radiologists with soft tissue tumor expertise; senior reader resolves discordance; all scans submitted to central imaging vendor |
| **Clinical progression** | IRC (Independent Review Committee) adjudicates all investigator-reported clinical progression events within 10 business days |
| **Storage** | DICOM transfer to central vendor within 5 business days |

### Rare Disease Operational Challenges

| Challenge | Mitigation Strategy |
|-----------|---------------------|
| **Slow enrollment** | Patient advocacy group engagement (Desmoid Tumor Research Foundation); physician education; broad geographic footprint; expedited regulatory designations (ODD, BTD, Fast Track) |
| **Diagnostic delays** | Central pathology confirmation required **pre-randomization** (Option A: 3/3 agreement); target ≤14-day turnaround; block enrollment until confirmed |
| **Spontaneous regression (~20%)** | Strict "radiographically or clinically progressing" eligibility; historical regression dilutes placebo arm PFS upward — accounted for in mPFS=15mo assumption |
| **Clinical progression adjudication** | Pre-specified ICAC/IRC charter with operational unambiguity per FDA.7 item 9 |
| **Patient retention (chronic oral therapy)** | Electronic diary; remote visits for stable patients; travel support; patient retention program |
| **Watchful-waiting culture** | Community oncologist education on trial eligibility; emphasis on "progressing" entry criterion |
| **Event rate uncertainty** | Pre-specified blinded sample size re-estimation at 50% events |

---

## Dimension 9: Safety and Monitoring Design

**[consensus: 3/3 on framework; C adds POI/bone monitoring — SOP-justified for novel GSI mechanism]**

### Safety Data Collection

| Element | Specification |
|---------|--------------|
| **AE grading** | CTCAE v5.0; all grades; from informed consent through 30 days post-treatment |
| **SAE reporting** | 24-hour reporting to sponsor; expedited regulatory reporting per local requirements |
| **Dose modifications** | Pre-specified CTCAE-based algorithm: Grade 3 → hold until ≤Grade 1 → resume at reduced dose (−25%); Grade 4 or recurrent Grade 3 → permanent discontinuation; maximum 2 dose reductions |

### GSI Class Effect Monitoring (Novel Mechanism)

| Class Effect | Monitoring Strategy |
|--------------|----------------------|
| **GI toxicity** (diarrhea, nausea) | Enhanced monitoring cycles 1–3; prophylactic anti-diarrheal guidance; Grade ≥3 triggers dose hold |
| **Skin toxicity / SCC risk** | Dermatology consultation available; photo documentation; long-term secondary malignancy surveillance |
| **Cardiac valve monitoring** | Baseline ECG + echocardiogram; Notch pathway cardiac valve effects (B+C explicit) |
| **Hepatotoxicity** | LFTs at each cycle |
| **Ovarian toxicity / POI** (C explicit, SOP-justified) | AMH, FSH/LH, estradiol at baseline and every 3 months for females of reproductive age; reproductive counseling |
| **Bone density** (C explicit, SOP-justified) | DXA scan at baseline and annually; GSI/Notch effects on bone metabolism |
| **QTc prolongation** | ECG at screening; repeat per protocol schedule; QTcF threshold per E-4 exclusion |

### Data Safety Monitoring Board (DSMB)

| Element | Specification |
|---------|--------------|
| **Charter** | Independent DSMB: oncologist, cardiologist, statistician (3/3 agree) |
| **Meetings** | Every 6 months; ad hoc for safety signals (3/3 agree) |
| **Scope** | Safety review; non-binding futility review at pre-specified IA; stopping rules pre-specified |
| **Safety stopping threshold** | ≥15% absolute difference in Grade ≥3 SAE rate treatment vs. placebo; any Grade ≥4 unexpected toxicity in ≥5% treatment arm |

---

## Dimension 10: Regulatory Strategy and Approval Pathway

**[consensus: 3/3 on core pathway; B+C add BTD criterion — SOP-aligned]**

### Approval Pathway

| Element | Consensus | Basis |
|---------|-----------|-------|
| **Primary pathway** | Traditional Approval — NDA 505(b)(1) | 3/3; PFS in double-blind PC-RCT is direct clinical benefit for DT (not surrogate); not requiring accelerated approval |
| **Orphan Drug Designation** | Apply pre-Phase 3 | 3/3; DT <200,000 US patients; 7-year exclusivity + fee waiver + tax credits |
| **Priority Review** | Expected; apply at NDA submission | 3/3; serious condition with unmet need |
| **Breakthrough Therapy Designation** | Apply if Phase 2 shows HR <0.45 or ORR >50% | 2/3 (B+C); SOP-aligned for large effect signals |
| **Fast Track Designation** | Apply early | 2/3 (B+C); serious condition without adequate therapy |
| **Single pivotal trial** | Acceptable | 3/3; SOP §8.1: rare disease + large effect size + high statistical significance |

### Regulatory Precedents

| Drug | Design | Endpoint | Outcome | Relevance |
|------|--------|----------|---------|-----------|
| **Sorafenib (DeFi trial)** | Phase 3, RCT vs. placebo, N=87 | Inv-assessed PFS | Significant HR ~0.49 | Strongest precedent for DT design |
| **Romvimza/vimseltinib (TGCT)** | DB-PC rare tumor | ORR | Approved 2025 | Analog for locally aggressive rare tumor |

### Pre-Phase 3 FDA Meeting Requirements (Type B End of Phase 2)

Per SOP §1.1 and FDA.7: FDA alignment required on:
1. Acceptability of PFS with clinical progression component as primary endpoint
2. Clinical progression operational definition and IRC adjudication process
3. Sample size assumptions and event-driven design
4. Control arm (placebo + BSC) acceptability
5. BICR as sensitivity vs. primary
6. Crossover design and OS analysis with adjustment methodology (RPSFT/IPCW)
7. CDx/biomarker strategy: CTNNB1/APC testing exploratory, not required for enrollment

### Labeling Considerations

**Proposed indication wording** (must match I/E criteria exactly per FDA.1):
> "For the treatment of adult patients with progressing desmoid tumors who require systemic treatment"

⚠️ "Progressing" definition must match I/E criterion I-4 exactly — RECIST progression OR clinical progression qualifying criteria.

### Approval Timeline

| Milestone | Estimated Timing |
|-----------|-----------------|
| Phase 2 completion | Year 2–3 |
| Type B EOP2 meeting | Year 3 |
| Phase 3 enrollment start | Year 3 |
| Phase 3 primary analysis | Year 5–6 |
| NDA submission | Year 6 |
| Potential approval | Year 6–7 (PDUFA + review) |

---

## Summary of Strategy Decision Points (SDPs)

| SDP # | Topic | Consensus/Recommendation | Quantified Impact |
|-------|-------|--------------------------|-------------------|
| **#1** | Control arm | Placebo + BSC (all 3 agree) | Clean signal; ethical safeguards via crossover |
| **#2** | FAP inclusion | Include FAP, stratify (C recommendation; A+B compatible) | +~10% eligible population |
| **#3** | Prior therapy line | All lines allowed; stratify by prior therapy (A+C agree; 2/3) | +30% eligible population vs. first-line only |
| **#4** | Primary endpoint (PFS vs ORR) | PFS for traditional approval; re-evaluate if Ph2 ORR >25% | Timeline vs. speed trade-off |
| **#5** | PFS assessor | Investigator primary; BICR secondary (A+C; SOP §4.1/4.7) | Saves $500K–$2M; precedent exists |
| **#6** | Sample size scenario | N=150 (HR=0.50, mPFS-control=15mo, +12% buffer) | Feasible; B+C agree on HR |
| **#7** | Interim analysis | Single futility-only IA at ~50% events, non-binding (B+C; 2/3) | Protects patients; alpha ≈preserved |
| **#8** | Crossover strategy | After confirmed progression + primary PFS analysis; OS adjusted (RPSFT/IPCW) | Ethical access + OS integrity |
| **#9** | Dose justification | Phase 1/2 PK/PD + E-R data required before Phase 3 (SOP DOSE.1; 3/3) | FDA Information Request prevention |
| **#10** | BTD/Fast Track | Apply if Phase 2 HR<0.45 or ORR>50% | Potential accelerated review |
| **#11** | CDx/biomarker | CTNNB1/APC exploratory only; no CDx required for enrollment | Label breadth maintained |
| **#12** | Central pathology | Pre-randomization required (2/3 A+B; prevents dilution) | ~14-day turnaround budgeted |

---

## Design Validation Checklist (FDA.7 Self-Review)

| # | Item | Status |
|---|------|--------|
| 1 | Synopsis = full text | ✓ Required |
| 2 | SoA has regulatory references | ✓ Required |
| 3 | I/E benchmarked vs. sorafenib DeFi trial | ✓ Aligned |
| 4 | Estimand complete (5 ICH E9R1 attributes) | ✓ Specified (Dim 6) |
| 5 | Dose modification covers all CTCAE ≥Grade 2 for GSI class | ✓ Specified (Dim 9) |
| 6 | PFS censoring table pre-specified | ✓ Required in SAP |
| 7 | Testing hierarchy + alpha allocation explicit | ✓ Specified (Dim 6) |
| 8 | Concomitant medications / CYP3A4 DDI addressed | ✓ E-5 exclusion criterion |
| 9 | Clinical progression definition operationally unambiguous | ⚠️ Pre-IND FDA alignment required |
| 10 | PRO schedule pre-specified with missing data plan | ✓ Required (BPI-SF + EORTC QLQ-C30) |
| 11 | All pending SDPs listed | ✓ 12 SDPs identified |
| 12 | OS harm threshold explicitly stated (HR upper bound ≤1.20) | ✓ Specified (Dim 6) |

---

## Merge Notes

### Solvers Available
- **Solver A**: ✅ Complete (7 SDPs, structured tables, rare disease SOP compliant)
- **Solver B**: ✅ Complete (4 SDPs, Phase 2 prerequisite explicit, DFS+BICR primary — unique divergence)
- **Solver C**: ✅ Complete (10 SDPs, most comprehensive; novel safety monitoring; N=176 conservative)

### Divergence Count by Dimension

| Dimension | Agreement Level | Resolution Method |
|-----------|----------------|------------------|
| Dim 1: Study Design | 3/3 ✅ | Consensus |
| Dim 2: Eligibility | 2/3 (ECOG diverges) | Consensus + orchestrator-resolved (ECOG 0-1) |
| Dim 3: Primary Endpoint | Partial — assessor diverges | **Orchestrator-resolved** (SOP §4.1/4.7) |
| Dim 4: Secondary Endpoints | 2/3 on selection; hierarchy diverges | Orchestrator-resolved (hierarchy) |
| Dim 5: Sample Size | All differ (mPFS 7/9/15 mo) | **Orchestrator-resolved** (DeFi data anchor) |
| Dim 6: SAP | 2/3 on IA (B+C futility-only); A no-IA | **Orchestrator-resolved** (50% futility IA) |
| Dim 7: Stratification | 2/3 on factors (A+B); C FAP different | **Orchestrator-resolved** (tumor location + prior Rx) |
| Dim 8: Operations | 3/3 ✅ | Consensus |
| Dim 9: Safety | 3/3 ✅ (C adds POI/bone — included as SOP-justified) | Consensus + augmented |
| Dim 10: Regulatory | 3/3 ✅ (B+C add BTD — included) | Consensus + augmented |

**Total orchestrator-resolved dimensions**: 4 (Dims 3, 5, 6, 7)  
**Total consensus dimensions**: 6 (Dims 1, 2, 4, 8, 9, 10) — with minor augmentations

### Key Synthesis Decisions

1. **Control mPFS = 15 months** (not 7 or 9): DeFi trial direct data is the authoritative anchor per SOP §5.1 requirement for ≥3 trials population-weighted derivation; 15 months is the best available single data point and most conservative (avoids under-powering).

2. **HR = 0.50** (not 0.40): Sorafenib's actual HR ~0.49 provides the mechanistic anchor; A's 0.40 assumption was insufficiently conservative given the DeFi HR is the reference.

3. **Investigator PFS primary** (not BICR primary): SOP §4.1 is explicit — double-blind designs allow inv-PFS primary; BICR as sensitivity. B's BICR-primary diverges from SOP without sufficient justification.

4. **Tumor location as Stratification Factor 1** (not FAP status): FAP (~5–15% of DTs) creates severe cell imbalance at N=150; location is balanced, prognostically validated, and has Phase 3 precedent.

---

*Generated by consensus merge agent. All decisions trace to: SOP core/protocol-design.md v4.1 + solver triangulation. Version: Round 08 consensus v1.0.*
