# Protocol Design SOP — Core Decision Process

> **Version**: v4.2 | **Source**: v4.1 + Batch 2 审核 (2026-04-01) | **Rule Count**: 64
> **Loading**: Required. Use together with domains/{category}.md + indications/{indication}.md

---

## Step 1: Intelligence Gathering and Benchmarking

### 1.1 Obtain approved Protocol for the same indication before starting design
Upon receiving a Protocol design task, the first step is to obtain ≥1 full-text FDA-approved Protocol for the same indication (ClinicalTrials.gov / Drugs@FDA / client-provided). Use the approved Protocol's table of contents and design elements as the baseline for drafting.

### 1.2 Design statistics independently first, then benchmark against approved protocol
Independently select statistical methods and calculate sample size based on literature data (without looking at the statistical section of the approved Protocol). After completion, compare item by item and attribute any differences to I/E criteria differences / HR assumption differences / alpha allocation strategy differences.

### 1.3 Protocol benchmarking must cover all 11 sections; parameter differences must be attributed
When benchmarking: (1) Cover all 11 sections (Synopsis→References + Appendices); (2) Classify differences into three categories: structural/content/parameters; (3) Parameter differences must be attributed to root causes (e.g., I/E criteria→control arm prognosis→HR→sample size); reporting numeric differences alone is insufficient.

### 1.4 Strategy Decision Points — identify upfront
Multiple points in the Protocol requiring Sponsor business decisions (control arm selection, I/E breadth, regional strategy, etc.) should be flagged as "⚠️ Strategy Decision Point" early in the design process rather than making the decision on behalf of the Sponsor.

### 1.5 Benchmarking: 5-layer root cause attribution + no-copy rule
For each parameter difference, attribute through: L1 I/E criteria → L2 comparator definition → L3 endpoint definition → L4 operational → L5 sponsor strategic choice. Never report raw numeric differences without mechanistic attribution. Never adopt a parameter without tracing to I/E logic (e.g., "EMBER-3 used mPFS=5.4m; our I/E more restrictive → we use 5.5m" — not "we copy 5.4m"). Before section-by-section comparison, align both ToC structures first.
[source: kb/methods/sop/protocol-benchmarking-sop.md §8.2, statistical-design-sop.md §8.3]

---

## Step 2: Target Population and Enrichment Strategy

### 2.1 I/E criteria optimization: 5-dimension scoring decision framework
Evaluate each I/E criterion across 5 dimensions and score:

| Dimension | Meaning | Score |
|-----------|---------|-------|
| O1 Statistical Efficacy | Increases effect size | +/0/- |
| O2 Trial Speed | Accelerates event accumulation | +/0/- |
| O3 Enrollment Feasibility | Screen failure rate | +/0/- |
| O4 Clinical Efficacy | Enriches benefiting population | +/0/- |
| O5 FDA Acceptability | Approved precedent exists | ✓/⚠️/✗ |

The trade-offs of enrichment vs. relaxation strategies must be quantified and presented as a Strategy Decision Point.

### 2.2 Biomarker-driven indications require a companion diagnostic
When an indication is restricted to a specific biomarker, the trial must include an FDA-approved or in-development companion diagnostic. Biomarker status must be centrally confirmed prior to enrollment.
→ Indication-specific testing strategy: `indications/{indication}.md`

### 2.4 Enrichment vs relaxation: quantify both directions as SDPs
Enrichment (biomarker, prognostic factor, therapy line) → ↑O1/O4, may ↓O3. Relaxation (bone-only +15-20%, ECOG 0-2, broader organ function) → ↑O3, may ↓O1. Both must be quantified (Δsample size, Δtime, Δpower) and presented as SDPs. Endpoint-driven I/E: PFS→require evaluable disease; OS→can relax; ORR→must require RECIST-measurable.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §2.2-2.3]

### 2.5 I/E checklist — 10 items to verify against competitors
(1) Biomarker per latest ASCO/CAP; (2) Prior therapy aligned with competitors; (3) Organ function benchmarked; (4) Washout reasonable; (5) CNS criteria consistent; (6) Cardiac exclusion proportional to drug QT profile; (7) No unnecessary exclusions raising screen failure; (8) No missing exclusions all competitors have; (9) Male patients addressed; (10) CDx timeline aligned with NDA.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §2.3]

### 2.3 Alpha allocation for predictive enrichment designs
(1) Biomarker cutoffs must be pre-defined with analytical validation; (2) If both marker+ and marker- patients are enrolled, randomization must be stratified by marker status; (3) Alpha must be pre-allocated between the enriched subgroup and the overall population; (4) Treatment × Biomarker interaction test must be pre-specified.

---

## Step 3: Control Arm Selection

### 3.1 Control arm selection decision tree

```
STEP 1: Does a proven therapy exist that prevents death or irreversible morbidity?
├─ No → Placebo control is scientifically optimal
├─ Yes → Pure placebo is unacceptable
│ ├─ SOC is clear and unique → Active control (the SOC drug)
│ ├─ SOC has multiple options → Investigator's Choice (pre-specified option list, selected before randomization)
│ └─ Grey area → Modified designs: add-on / early escape / withdrawal / limited placebo
└─ No established SOC (rare cancers, etc.) → IC (pre-specified 2-3 options including chemo + immunotherapy)
```

IF non-oncology with established SOC → Active control may lead to NI design (NI margin must be pre-specified); consider ethics.
→ Indication-specific controls: `indications/{indication}.md`

### 3.1a IC option count and evidence requirement [Batch 2 审核]
IC pre-specified list should contain 2-3 options (per §3.1). Each option must have **indication-specific evidence base** (not just drug class plausibility). Do not include drugs from the same mechanism class as duplicates (e.g., pembrolizumab + nivolumab = redundant PD-1). Do not include combination regimens unless combination has published data in the target indication.
[grounded: single-case — Kimmtrak BLA761228, FDA accepted 3-option IC (dacarbazine/ipi/pembro)]

### 3.2 FDC combination products require 2 types of trials
ICS/SABA and similar FDC reliever/controller products require: (1) A large event-driven PRN trial (FDC vs. individual components), primary endpoint: time to first severe exacerbation; (2) A factorial fixed-dose trial (FDC vs. each individual component vs. placebo), satisfying the combination rule (21 CFR 300.50a).
→ FDC stratification strategy: `domains/respiratory.md`

---

## Step 4: Endpoint Selection

### 4.1 Oncology endpoint assessment approach

IF open-label (including ICC comparator):
  IF ALL of: (1) non-cytotoxic drug, (2) trial arm and control arm share the same drug mechanism class, (3) disease progression is assessed primarily by radiographic imaging (not clinical/subjective assessment):
    → FDA may accept investigator-assessed PFS as primary endpoint (BICR as sensitivity analysis)
    → Precedent: EMBER-3/Inluriyo (oral ER antagonist vs IC of ET)
    → See `domains/oncology-solid.md ## Trial Design`
  ⚠️ This exemption does NOT apply to: ADC trials, CAR-T, bispecific antibodies, or any setting where progression assessment has significant subjective component (e.g., soft tissue measurement, clinical progression).
  ELSE:
    → PFS as primary endpoint requires BICR; investigator PFS as sensitivity analysis
IF double-blind → PFS may use investigator assessment as primary endpoint; BICR as sensitivity analysis.
→ Accelerated approval endpoints: `regulatory/accelerated-approval.md`

### 4.2 Oncology endpoint hierarchy
OS > PFS > ORR. Traditional approval: OS or PFS (with clinically meaningful improvement).
PFS requirements: (1) sufficiently large magnitude, (2) open-label requires independent assessment confirmation (BICR or meeting 4.1 inv-PFS exemption criteria), (3) subgroup consistency, (4) supporting endpoints such as ORR.

### 4.3 Non-oncology endpoints: follow disease-specific Guidance
Non-oncology endpoints are generally not OS/PFS/ORR. The relevant FDA Guidance must be consulted.
→ Indication-specific endpoints: `indications/{indication}.md`

### 4.7 PFS assessor decision tree (Investigator vs BICR)
Default: Investigator PFS primary + BICR secondary. Switch to BICR primary IF: (1) FDA Meeting requires; (2) CRL cited inv bias; (3) Open-label + highly subjective endpoint; (4) Placebo control. Either way, the other method must be pre-specified. BICR adds $500K-$2M + 3-5 day PD delay.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §3.0]

### 4.7a BICR precedence over double-blind INV exemption [Batch 2 审核]
IF PFS definition includes **clinical progression** (not purely radiographic) → BICR primary required, even in double-blind designs. Clinical progression requires blinded adjudication committee confirmation.
IF **CNS tumor** (glioma, brain mets as primary site) → BICR primary required due to pseudoprogression and imaging complexity, even in double-blind designs.
IF **placebo-controlled** + PFS as primary → BICR primary recommended (§4.7 condition 4 takes precedence over double-blind INV exemption).
⚠️ Priority rule: §4.7a conditions override the double-blind INV exemption in §4.1. When conditions conflict, BICR wins.
[grounded: multi-case — Ogsiveo NDA217677 (BICR + clinical progression), Voranigo NDA218784 (BICR + CNS)]

### 4.1a Bispecific BICR scope clarification [Batch 2 审核]
The §4.1 bispecific antibody BICR mandate applies when PFS is the **primary** endpoint. When PFS is a key **secondary** endpoint under an OS-primary design, investigator-assessed PFS is acceptable as the primary PFS analysis method (BICR as sensitivity). Rationale: assessor bias risk to the trial's primary conclusion is mitigated when OS is primary.
[grounded: single-case — Kimmtrak BLA761228, FDA accepted INV-PFS as key secondary under OS-primary]

### 4.8 Oncology endpoint selection: PFS(inv)→fastest Phase 3; PFS(BICR)→traditional; OS→gold standard but slow; ORR→accelerated/single-arm; pCR→neoadjuvant; iDFS/EFS→adjuvant.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §3.1]

### 4.4 Estimand framework must be defined at Protocol stage
The 5 attributes of the primary Estimand (treatment condition, target population, variable, summary measure, intercurrent event handling strategy) must be pre-specified. Intercurrent events (treatment discontinuation, subsequent therapies, death) must explicitly adopt one of 5 strategies.

### 4.5 OS analysis plan must be pre-specified even if not a primary endpoint
All randomized oncology trials must pre-specify in the SAP: (1) OS harm threshold (HR upper bound exclusion value, e.g., 1.20), (2) method to exclude harm, (3) interim analysis plan, (4) supplemental analyses for NPH (RMST + Landmark).

### 4.6 Oncology PRO secondary endpoints
PRO should preferably be included in hierarchical testing in the form of "Time to Confirmed Clinical Deterioration" (TTCD), using disease-specific tools (e.g., EORTC QLQ-C30 + module). Scales must undergo content validity validation with patient input; responder definition based on anchoring method; SAP must pre-lock missing data handling (≥2 sensitivity analyses). PRO must be completed prior to other clinical assessments.

---

## Step 5: Statistical Design (Protocol Level)

> Detailed SAP rules: `core/sap-design.md`. This section covers only Protocol-level statistical decisions.

### 5.1 Sample size based on clinically meaningful difference
Effect size must be derived from: (1) historical control arm data (≥3 trials, population-weighted); (2) experimental arm evidence (Phase 2/class effect); (3) 3-scenario sensitivity (optimistic/base/conservative). Never pick an HR from a "typical range" without proper derivation. Typical parameters: alpha=0.025 one-sided, power=80-90%. → Detailed estimation framework: `core/sap-design.md` (CA/HR/SS sections).

### 5.1a Control arm median PFS/OS data source annotation [Batch 2 审核]
Control arm median PFS/OS used for sample size must annotate data source type: **[RCT]** (from randomized trial control arm), **[observational]** (from registries, retrospective cohorts), **[meta-analysis]**. Observational cohort PFS is often 2-3× longer than RCT PFS due to lead-time bias, less frequent scheduled imaging, and different enrollment criteria. **Do not use observational mPFS directly as RCT control arm assumption** — apply a correction factor or use RCT-sourced data.
[grounded: multi-case — Voranigo NDA218784 (LGG observational mPFS ~48mo vs trial ~18mo), Ogsiveo NDA217677 (DeFi control mPFS ~15mo from prior RCT)]

### 5.2 Multiplicity correction strategy (framework)

IF number of hypothesis tests ≥3 → Prefer Graphical Approach (Bretz 2009 directed graph)
IF hypothesis tests = 2 (e.g., PFS + OS) → Hierarchical testing
→ Alpha allocation details, spending function, NI testing strategy: `core/sap-design.md`

### 5.3a Co-primary intersection-union alpha convention
When co-primary endpoints use an intersection-union test (ALL must be significant for trial success), each individual co-primary is tested at the FULL significance level (e.g., α=0.05 two-sided) with no alpha splitting between them. Rationale: under IUT, FWER ≤ α is guaranteed because the probability of all individual nulls being falsely rejected simultaneously = α^k (Berger 1982). Alpha splitting (e.g., Bonferroni) applies only to SECONDARY endpoint testing branches, not to co-primaries under IUT. Note: this convention applies strictly when ALL co-primaries must succeed. If success requires only a subset (e.g., at least 1 of 2), standard multiplicity adjustment is required.
[grounded: statistical theory (Berger 1982); confirmed in Sotyktu NDA §8.1.3 MTP — co-primaries at α=0.05 each, secondaries split α=0.025 per branch]

### 5.3 Co-primary endpoints each require 90% power
Co-primary requires all endpoints to be significant; joint power = product of each endpoint's power. 80% × 80% = 64%; must be raised to ~90% to ensure joint power ≥80%.

### 5.4 Covariate adjustment
(1) Stratification randomization variables must be included in the analysis model; (2) Additional prognostic covariates may be added to increase power; (3) Must be locked in the SAP before unblinding; (4) Non-linear models must pre-declare conditional vs. unconditional treatment effects.

---

## Step 6: Stratification Factors

### 6.1 General principles
Select prognostic factors with the greatest impact on the primary endpoint, typically 2-4. Stratification variables must be included as covariates in the analysis model.

IF rare cancer (<5/million incidence) → Minimize to 1-2 factors, retain only the strongest prognostic factor; avoid over-stratification leading to small cell imbalance.

→ Indication-specific stratification factors: `indications/{indication}.md`

---

## Step 7: Safety and Monitoring Design

### 7.1 Novel biologics (ADC/bispecific antibody/T-cell engager/CAR-T)
Confirmatory trials must pre-specify: (1) Step-up dosing regimen; (2) In-hospital monitoring requirements and duration for first/first-3 doses (T-cell engagers ≥16h); (3) CRS/ICANS grading management algorithm (per ASTCT consensus); (4) Pre-treatment regimen; (5) Dose modification criteria: ≥80% of patients maintain ≥80% dose intensity.

→ Disease-specific monitoring: `indications/{indication}.md`

---

## Step 8: Approval Strategy and Operations

### 8.1 Pivotal trial count depends on therapeutic area
Oncology: single pivotal trial is now common (most recent oncology approvals). Non-oncology: plan for 2 independent pivotal trials unless exceptional circumstances (rare disease, breakthrough, large effect size). Single-trial approval requires: large effect size, high statistical significance, consistency across subgroups, and supporting evidence from other studies.

→ Accelerated approval / Breakthrough strategy: `regulatory/` directory
→ Indication-specific operational conventions: `indications/{indication}.md`

---

## Dose Selection Rationale

### DOSE.1 Pivotal trial dose must be justified with PK/PD + exposure-response data
Section 4 (Study Design) must include dose justification referencing: (1) Phase 1/2 dose-finding results; (2) PK/PD modeling (exposure-response relationship); (3) therapeutic window (efficacy threshold vs toxicity); (4) FDA Guidance "Optimizing the Dosage of Human Prescription Drugs" (2023). This is a high-frequency FDA review dimension — inadequate dose justification triggers Information Requests.
[source: Opus clinical expert review 2026-03-30]

---

## Strategy Decision Points (SDP) — Identification and Handling

### SDP.1 CRO presents all options with quantification, sponsor decides
For business-strategy elements: (1) Present all options without pre-filtering; (2) Quantify each (Δsample size, Δtime, Δcost, Δlabel); (3) Provide FDA precedents + competitor benchmarks; (4) Sponsor decides.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §5.5]

### SDP.2 15 SDPs to check for every oncology Protocol
(1) Prior therapy line; (2) Biomarker enrichment; (3) PFS assessor; (4) Primary endpoint; (5) Control arm; (6) Combination arm; (7) Bone-only disease; (8) CNS criteria; (9) Prior chemo; (10) ECOG; (11) Geography; (12) IA strategy; (13) CDx; (14) PRO level; (15) Accelerated vs traditional path.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §5.5]

---

## FDA Review Lessons — Proactive Quality Checks

### FDA.1 Indication wording must exactly match I/E criteria (FDA routinely narrows vague wording). [source: kb/methods/sop/protocol-writing-sop.md §七]
### FDA.3 B/R must use PDUFA VI 5-dimension framework (Condition / Treatment Options / Benefit / Risk / Risk Management) with separate subsections. [source: kb/methods/sop/protocol-writing-sop.md §七]
### FDA.4 B/R Risk section must include competitor safety comparison table (≥Grade 3 AE rates, fatal AEs, discontinuation — vs ≥2 competitors from USPI/FDA Review). [source: kb/methods/sop/protocol-writing-sop.md §七]
### FDA.5 Dual primary (ITT + biomarker): Section 9.1 must state biomarker subgroup can independently support approval if ITT fails; biomarker subgroup must have ≥80% independent power. [source: kb/methods/sop/protocol-writing-sop.md §七]
### FDA.7 Self-review 12-item checklist: (1) Synopsis=full text; (2) SoA has refs; (3) I/E benchmarked; (4) Estimand complete; (5) Dose mod covers CTCAE; (6) PFS censoring table; (7) Testing hierarchy+alpha; (8) ConMed matches DDI; (9) Brain imaging clear; (10) PRO schedule; (11) Pending items listed; (12) FDA risks flagged. [source: kb/methods/sop/protocol-writing-sop.md §五]
