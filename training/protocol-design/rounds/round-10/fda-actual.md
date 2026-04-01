## FDA Actual: Kimmtrak [protocol-design] — Round 10

### 1. design_type

Phase 3, open-label, randomized, controlled, multi-center study (Study IMCgp100-202 / NCT03070392). Patients were randomized 2:1 to receive either tebentafusp (Arm 1) or investigator's choice (Arm 2). The study is ongoing (enrollment completed, treatment and follow-up ongoing at time of BLA review). No blinding was employed; the study was open-label.

> "This is an ongoing open-label, randomized, multi-center study to evaluate the efficacy and safety of tebentafusp versus investigator's choice (dacarbazine, ipilimumab, or pembrolizumab) in adult HLA-A*02:01-positive patients with mUM who had not received prior systemic therapy in the metastatic setting."

### 2. control_arm

Investigator's choice (IC) of one of three pre-selected options, chosen prior to randomization:
- **Dacarbazine**: 1000 mg/m² IV on Day 1 of each 21-day cycle
- **Ipilimumab**: 3 mg/kg IV on Day 1 of each 21-day cycle, maximum 4 doses
- **Pembrolizumab**: 2 mg/kg (up to maximum of 200 mg) or 200 mg IV on Day 1 of each 21-day cycle

> "The comparator arm consisting of Investigator's choice of dacarbazine, ipilimumab or pembrolizumab is considered appropriate and consistent with current standard of care for the systemic treatment of unresectable and metastatic uveal melanoma." (FDA Assessment)

The preferred investigator's choice agent was selected prior to randomization.

### 3. primary_endpoint

Overall survival (OS) in the ITT Analysis Set (all randomized patients).

> "The primary study endpoint was overall survival (OS), and key secondary endpoint was investigator-assessed progression free survival (PFS) per RECIST 1.1."

Note: Although OS in the RAS (Rash Analysis Set) population was one of the primary objectives in the study, FDA's risk:benefit assessment of tebentafusp was only based on the OS in all patients randomized (ITT Analysis population).

### 4. endpoint_definition

OS was assessed in the ITT Analysis Set (all patients randomized, analyzed by treatment assignment regardless of whether the patient received the assigned treatment). The OS analysis was event-driven: 250 death events required. The difference in OS between treatment arms was tested using a 2-sided log-rank test stratified by LDH status (LDH > ULN versus LDH ≤ ULN; measured centrally). The OS hazard ratio was estimated using a stratified Cox-proportional hazards model using the Efron approach for handling ties, along with corresponding 95% CIs for the HR.

Two interim analyses were planned using a 3-stage group sequential design with O'Brien-Fleming boundaries (Lan-DeMets spending function). First interim analysis at ~60% of events (150 events); second interim at ~80% of events (200 events).

### 5. secondary_endpoints

Key secondary endpoints tested in hierarchical order (strong control of type I error via sequential testing):
1. **PFS** (progression-free survival per RECIST v1.1, investigator-assessed) — tested at overall alpha 0.045 (2-sided); required 274 PD/death events; analysis method same as OS
2. **BOR** (best overall response) — formally tested only if null hypotheses for OS and PFS both rejected; tested at overall alpha 0.045 (2-sided)

Additional secondary endpoints (not formally tested hierarchically):
- DCR: disease control rate, defined as CR + PR + SD ≥ 24 weeks
- DOR (duration of response)
- TTR (time to response)
- HRQoL assessed using EQ-5D-5L and EORTC QLQ-C30
- Safety and tolerability (AEs, SAEs, laboratory parameters, vital signs, ECGs)
- PK (serum concentrations over time; later removed from secondary endpoints per SAP Amendment 3)

> "FDA agrees with the applicant's summary of study endpoints."

> "Note that despite the statistically significant results observed for PFS, FDA considers the difference in PFS observed between the treatment arms was not clinically meaningful. ORR analysis was not formally tested at this interim analysis."

### 6. sample_size

- **Total randomized**: N = 378 (per safety database); planned N = 369
- **Tebentafusp arm (Arm 1)**: N = 252 randomized / 245 treated
- **Investigator's choice arm (Arm 2)**: N = 126 randomized / 111 treated
- **Randomization ratio**: 2:1 (tebentafusp : investigator's choice)

Sample size was driven by OS in the all-randomized (ITT) population:

> "Assuming a 2:1 randomization ratio of tebentafusp versus investigator's choice, 250 events (deaths) were required to provide 89% power to detect an OS HR of 0.645 at 2-sided significance level of 0.045. Assuming OS was exponentially distributed and a median OS of 12 months in the investigator's choice arm, the HR of 0.645 corresponds to a median OS of 18.6 months in the tebentafusp arm resulting in a difference of 6.6 months in median OS between the arms. Considering a non-uniform recruitment of about 33 months and 10% annual drop-out rate, 369 patients were to be randomized in a 2:1 ratio to the 2 arms to observe 250 events after 51 months as follows." (FDA Assessment)

Note: Target sample size was increased from an earlier planned N to N = 369 in Amendment 4 (31 March 2020), removing a formal sample size re-estimation.

### 7. stat_framework

- **Primary analysis**: 2-sided log-rank test stratified by LDH status (LDH > ULN vs LDH ≤ ULN; centrally measured)
- **Overall alpha**: 0.045 (2-sided) for primary and key secondary endpoints; could increase to 0.05 if alpha from RAS analysis transferred to ITT analyses
- **Multiplicity control**: Sequential hierarchical testing — OS → PFS → BOR (ITT Analysis Set). Alpha cannot transfer if prior test not statistically significant
- **Interim analyses**: 3-stage group sequential design; O'Brien-Fleming boundaries; Lan-DeMets approximation for actual vs. planned events
  - First interim: ~150 events (60%); RAS OS analyzed first
  - Second interim: ~200 events (80%)
- **HR estimation**: Stratified Cox-proportional hazards model (Efron approach for ties), 95% CI
- **ORR analysis**: Stratified Cochran-Mantel-Haenszel (CMH) test adjusting for baseline LDH status
- **PFS analysis**: Same method as OS (stratified log-rank test + stratified Cox model); based on 274 PD/death events; 90% power to detect HR 0.66 (assumed median PFS 5 months tebentafusp vs. 3.3 months IC)
- **RAS analysis**: Alpha = 0.005 for RAS OS; if crossed, full alpha added to ITT allocation (total αITT = 0.05)

FDA conclusion: "FDA agrees that tebentafusp demonstrated a statistically significant and clinically meaningful improvement in overall survival (OS)."

### 8. stratification

Single stratification factor:
- **LDH status**: LDH > ULN versus LDH ≤ ULN, measured centrally

> "Randomization was stratified by LDH status."

> "The difference in OS between the treatment arms was tested using a 2-sided log-rank test stratified by LDH status (LDH > ULN versus LDH ≤ ULN; measured centrally)."

No other stratification factors were used in the primary analysis.

### 9. eligibility

**Key Inclusion Criteria:**
- ≥ 18 years of age at the time of informed consent
- Histologically or cytologically confirmed mUM
- No prior systemic therapy in the metastatic or advanced setting
- No regional liver-directed therapy
- HLA-A*02:01 positive by central assay
- ECOG performance status score of 0 or 1
- (Amendment 4) Prior surgical resection of oligometastatic disease outside liver permitted

**Key Exclusion Criteria:**
- Systemic or untreated CNS metastases
- History of severe hypersensitivity reactions to other biologic drugs or mAbs
- Clinically significant cardiac or impaired cardiac function
- Active infection requiring systemic antibiotic therapy
- Known HIV
- Active hepatitis B virus or hepatitis C virus infection
- History of adrenal insufficiency
- History of interstitial lung disease
- History of pneumonitis requiring corticosteroid treatment or current pneumonitis
- History of colitis or inflammatory bowel disease
- Treatment with systemic steroid therapy or any other immunosuppressive medication at any dose level
- Radiotherapy within 2 weeks of first dose of study drug
- Use of hematopoietic colony-stimulating growth factors
- (Amendment 4) Updated: absolute lymphocyte count < 0.5 × 10⁹/L (changed from < 1.0 × 10⁹/L)

From RiskR.md: "Inclusion criteria included patients who were HLA-A*02:01 genotype positive, ≥ 18 years of age..."

### 10. operational

**Geography**: 58 centers in 14 countries (Study 202 — multinational, multi-center)

**Dosing regimen (tebentafusp arm):**
- 20 mcg IV on Cycle 1 Day 1
- 30 mcg IV on Cycle 1 Day 8
- 68 mcg IV on Cycle 1 Day 15
- 68 mcg IV once every week thereafter
- Administered via IV infusion over 15–20 minutes
- Intra-patient dose escalation regimen (RP2D-IE) selected based on Phase 1/2 data

**Mandatory inpatient monitoring:**
> "Patients were monitored for at least 16 hours after dosing as an inpatient following the weekly doses on Days 1, 8, and 15" (due to anticipated cytokine release-associated toxicity with first 3 doses)

**Antihypertensive medication hold**: Mandatory hold of antihypertensive drugs 24 hours before and after tebentafusp administration during at least the first 3 weeks (revised in Amendment 4 to allow greater flexibility)

**Treatment duration**: Until radiographic progression (except for patients receiving ipilimumab), unacceptable toxicity, investigator decision, or patient withdrawal of consent. Treatment beyond initial RECIST progression was permitted with prespecified criteria for tebentafusp, pembrolizumab, and ipilimumab arms.

**Investigator's choice arm (standard approved dosing for metastatic melanoma):**
- Dacarbazine: 1000 mg/m² q3w (Day 1 of each 21-day cycle)
- Ipilimumab: 3 mg/kg q3w for maximum 4 doses
- Pembrolizumab: 2 mg/kg (up to 200 mg) or 200 mg q3w; flat dosing permitted where locally approved

**Pre-randomization agent selection**: Investigator's choice agent selected prior to randomization.

**Trial registration**: NCT03070392

**Regulatory designations**: Orphan Drug Designation (21 Jan 2016), Fast Track Designation (01 Apr 2019), Breakthrough Therapy Designation (18 Feb 2021)

---

## Source
- BLA761228 MultidisciplineR.md (primary)
- BLA761228 RiskR.md (supplemental, eligibility)
- Sections extracted via DocSearch
- Key lines: 4805–4954 (Trial Design), 4955–5539 (Endpoints & SAP), 5590–6084 (Patient Disposition), 6385–6560 (Primary Endpoint Results), 6555–7053 (Secondary Endpoints), 1090–1110 (Summary OS), 1793–1980 (Regulatory Background)
