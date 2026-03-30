---
version: 0.2
status: seed
source: sop.md v2.2 split + D2V SOP-BS-002 + kb/ statistical methodology
rule_count: 7
seed_absorbed:
  - d2v-sop/BS/sop-bs-002 (SAP development process)
  - methods/sop/statistical-design-sop.md (statistical method decisions)
  - biostat/estimand-practical-guide.md (Estimand framework)
  - biostat/missing-data-nrc2010-deep.md (missing data strategy)
---

# SAP Design SOP — Core Decision Process

> Seed version v0.2 — continuously expanded after training
> Loading: Required. Use together with domains/{category}.md ## SAP Design + indications/

---

## Step 0: SAP Development Process Framework

### 0.1 SAP drafting timing
SAP is drafted after the Protocol and CRF are finalized. Study Statistician drafts → Statistical Manager + Clinical Representative + Sponsor approves. PK SAP is the sole responsibility of the Clinical Pharmacology Representative (or they own the PK section if within the main SAP).
→ Source: D2V SOP-BS-002

### 0.2 Relationship between SAP and Protocol
SAP is the technical elaboration of the Protocol's statistical section. Protocol defines WHAT (endpoints, hypothesis testing direction); SAP defines HOW (specific analysis methods, missing data handling, sensitivity analyses). The two are not contradictory; SAP does not change the hypothesis testing direction established in the Protocol.

---

## Step 1: Estimand Framework (ICH E9(R1))

### 1.1 Primary Estimand — 5 attributes
Each primary analysis must pre-define 5 attributes of the Estimand:

| Attribute | Definition |
|-----------|-----------|
| Target population | Population defined by Biomarker + I/E criteria |
| Treatment condition | Investigational drug vs. control (including dose/regimen) |
| Variable (endpoint) | Precise definition + measurement timepoint |
| Intercurrent event handling strategy | One of 5 strategies (see below) |
| Summary measure | HR / rate difference / RMST |

### 1.2 Intercurrent event handling strategy selection

| Intercurrent Event | Recommended Strategy | Rationale |
|--------------------|---------------------|-----------|
| Death before progression | Composite (counted as event) | FDA PFS standard |
| Toxicity-related discontinuation | Treatment policy (follow to event) | Preserves ITT intent |
| Subsequent therapies | Treatment policy (OS not censored) | Real-world effect |
| Missing assessment | Censor at last adequate assessment | RECIST guidelines |

---

## Step 2: Multiplicity Control — Alpha Allocation Strategy

### 2.1 3-Arm RCT Alpha Allocation

Active comparator + placebo 3-arm RCT: Split into 2 comparison branches (vs. placebo α=0.025, vs. active comparator α=0.025), hierarchical within each branch.

---

### 2.2 Dual Primary PFS+OS Alpha Split

**Alternative design (active comparator RCT)**: Dual primary endpoints PFS + OS via alpha split (e.g., PFS 1% + OS 4%) rather than hierarchical. Alpha can be recycled from PFS to OS upon PFS passing.

**Alpha Split conventions**:
- IF PFS expected HR is strong (≤0.65) and power is sufficient → Allocate less alpha to PFS (e.g., α_PFS=0.01 two-sided), give remaining α=0.04 to OS
- IF PFS and OS expected HRs are similar → Can split equally (α=0.025 each) or use hierarchical (PFS first, then OS)
- PFS pass recycling: α_PFS can be recycled and added to OS subsequent analyses (total α restores to 0.05), using Lan-DeMets OBF spending to control OS multiple analyses
- 📌 Datroway TB01: PFS α=0.01 + OS α=0.04, after PFS passes OS receives full α=0.05, OS has 2 IAs + 1 FA

---

## Step 3: Interim Analysis Design

Alpha spending default: Lan-DeMets O'Brien-Fleming (very conservative early, approaches full alpha late).
- IF rare disease target events ≤50-60: → May omit interim analysis; single final analysis saves alpha (see domains/rare-disease.md #45)
- IF rare disease RCT: → Secondary endpoints may all be exploratory; multiplicity focused on co-primary

---

## Step 4: NI→Superiority Sequential Testing Strategy

IF the trial tests both NI and superiority (e.g., non-inferiority to SOC followed by demonstration of superiority):
→ Use sequential gatekeeping procedure to maintain overall α=0.05 (two-sided)
→ Testing order: (1) NI at timepoint 1 → (2) NI at timepoint 2 → (3) superiority at timepoint 2 → (4) superiority at timepoint 1
→ NI margin must be derived from historical meta-analysis for M1; M2 ≤ M1 (typically preserving ≥50% effect)
→ If NI passes but superiority does not, NI conclusion may still be supported (but FDA may question robustness)
→ 📌 Tavneos CL010_168: NI(Wk26, margin -20%) → superiority(Wk52), sequential gatekeeping controls α=0.05

---

## Step 5: NI Trial Margin M1/M2

(1) M1 = lower bound of 95% CI of active comparator vs. placebo effect (historical meta-analysis); (2) M2 ≤ M1, typically preserving ≥50% effect; (3) Constancy assumption must be verified item by item.

---

## Step 6: External Control SAP Requirements

When using external controls: (1) Lock SAP before enrollment and submit to FDA; (2) Index Date definition must be consistent across both arms (to avoid Immortal Time Bias); (3) Pre-specify comparability thresholds; (4) Propensity score matching/weighting + sensitivity analyses.

---

## Step 7: Analysis Set Definitions

### 7.1 Standard analysis sets
| Analysis Set | Definition | Primary Use |
|-------------|-----------|------------|
| ITT / FAS | All randomized patients, analyzed per randomized assignment | Primary analysis (superiority) |
| mITT | Randomized and received ≥1 dose of treatment | Primary analysis for certain indications |
| PP | Completed minimum treatment cycles, no major protocol deviations | Sensitivity analysis (primary analysis for NI trials) |
| Safety | Received ≥1 dose, analyzed per actual treatment received | Safety analysis |

IF NI trial → PP is the primary analysis set (ITT may bias toward NI conclusion); ITT is the sensitivity analysis. Both conclusions must be consistent to be convincing.

---

## Step 8: Missing Data Handling

### 8.1 Missing data strategy under the ICH E9(R1) framework
(1) Pre-lock the primary missing data method in the SAP;
(2) At least 2 sensitivity analyses (under different assumptions);
(3) Tipping point analysis to assess robustness of conclusions.

### 8.2 Common method selection

| Endpoint Type | Primary Method | Sensitivity Analysis |
|--------------|---------------|---------------------|
| TTE (PFS/OS) | Cox/KM under censoring rules | RMST + Multiple Imputation |
| Continuous (change from baseline) | MMRM (MAR assumption) | Pattern Mixture Model + delta-adjustment |
| Binary (response rate) | Complete case analysis | NRI (Non-responder Imputation) |

---

## Step 9: Subgroup Analysis

### 9.1 Pre-specified subgroups
Pre-specify the list of subgroups in the SAP (typically 8-12), including:
- Stratification factors (required)
- Key demographics (age, sex, race, region)
- Key baseline characteristics (ECOG, disease stage, prior lines of therapy)
- Biomarker subgroups (if applicable)

### 9.2 Analysis methods
Forest plot displaying subgroup HRs + 95% CIs. Interaction test p-values used to explore consistency, not for confirmatory conclusions. Pre-specified interaction test alpha is typically 0.10 (exploratory).
