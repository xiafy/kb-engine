---
version: 2.0
source: sop.md v2.2 split + KB migration 2026-03-30
rule_count: 14
---

# ER+/HER2- Breast Cancer

> version: 1.0 | source: sop.md v2.2 split

## Trial Design

### Biomarker Testing Strategy
IF indication == "ER+/HER2- ESR1m breast cancer": → ctDNA-based NGS testing (not tissue IHC)

### Control Arm Selection
IF indication == "ER+/HER2- 2L+ mBC": → IC of endocrine therapy (fulvestrant/AI/tamoxifen pre-specified list)

### Stratification Factors
ER+/HER2- mBC recommended stratification factors: prior CDK4/6i (yes/no) + visceral metastasis (yes/no) + region.
⚠️ ESR1 mutation status is **NOT** a stratification factor — ESR1m is used to define the co-primary subgroup, not for randomization stratification (precedent: EMBER-3 did not use ESR1m as a stratification factor).
Note: Visceral metastasis is a general prognostic factor; specific trials may refine to liver metastasis (stronger prognostic factor).

### 4 Operational Conventions
(1) Control arm = IC of endocrine therapy; (2) ctDNA NGS testing for ESR1; (3) Open-label inv-PFS as primary endpoint (meeting 4.1 exemption criteria: non-cytotoxic oral ER antagonist vs IC of ET; BICR as sensitivity analysis); (4) Co-primary may be used: PFS in ESR1-mut + PFS in ITT, asymmetric alpha allocation.
- 📌 EMBER-3: co-primary inv-PFS (ESR1-mut α=0.02, ITT α=0.005), BIRC = sensitivity

### I/E Criteria Consensus (EMERALD/EMBER-3/VERITAC/OPERA/SERENA benchmarked)
Inclusion: ER+ IHC≥1% (ASCO/CAP); ≥1 prior AI ± CDK4/6i for advanced disease; post-menopausal or OFS with GnRH ≥28d before C1D1; ECOG 0-1; organ function: CrCl≥50, ANC≥1.5, Plt≥100, Hb≥9, TBili≤1.5×ULN, ALT/AST≤3×ULN; washout: myelosuppressive≥21d, non-myelo≥7d or 5t½, investigational≥28d or 5t½.
Exclusion: prior oral SERD/same mechanism; chemo (except adjuvant); visceral crisis/leptomeningeal; symptomatic brain mets (stable/treated OK if stable≥28d, no steroids≥14d); QTcF≥470ms; HR<60bpm; BRCA pathogenic mutation eligible for PARPi (in regions where accessible).
[source: kb/methods/sop/protocol-writing-sop.md §三]

### Endpoint Consensus
Primary: PFS — default investigator-assessed (EMBER-3 precedent), BICR as sensitivity. Alternative: BICR primary (EMERALD precedent). Final per FDA Meeting feedback.
Secondary: OS, ORR (confirmed CR+PR per RECIST 1.1), CBR (CR+PR+SD≥24wk), DOR, PRO (Worst Pain NRS, EORTC QLQ-C30, EQ-5D-5L).
[source: kb/methods/sop/protocol-writing-sop.md §三]

### Visit Schedule Consensus
Imaging (CT/MRI): Q8W(±4d)×12 months, then Q12W(±4d). Bone scan: baseline + Q24W(±4d). Brain imaging: baseline all patients; brain met history per RECIST frequency. Hematology/chemistry: Q4W. Lipids: baseline + Q3 cycles. ECG: baseline + C1D1 post-dose + C2D1 pre-dose + C4D1 + STFU. PK: C1D1, C2D1, C3D1, C4D1 (experimental arm). ctDNA: screening + C1D1 + C2D1 + odd cycles. Survival follow-up: Q12W(±14d).
[source: kb/methods/sop/protocol-writing-sop.md §三]

### Statistical Design Consensus
Alpha: 0.025 one-sided, graphical approach. ITT PFS initial α=0.005; ESR1-mut PFS initial α=0.02. Hierarchical testing: H1(ITT PFS)→H2(ESR1-mut PFS)→OS→etc. Interim: 1 futility analysis. PFS censoring: standard 6-scenario table (per EMBER-3 Section 9.4.3.1).
[source: kb/methods/sop/protocol-writing-sop.md §三]

### Protocol v1→v2 Correction Checklist (EMBER-3 实战教训)
Common errors in first draft: (1) PFS assessor wrong (BICR→Investigator); (2) Imaging window too wide (±7d→±4d); (3) ALT/AST threshold wrong (≤2.5×ULN→≤3×ULN, no liver met exception); (4) CrCl too strict (≥60→≥50); (5) Too many dose levels (3→2: 400→200→stop); (6) Unnecessary endometrial monitoring (TVUS Q24W not needed); (7) Unnecessary bone density DXA; (8) Unnecessary C-SSRS; (9) ET washout too long (14d→7d or 5t½); (10) Prior fulvestrant allowed→should exclude; (11) Missing BRCA/PARPi exclusion.
[source: kb/methods/sop/protocol-writing-sop.md §四]

### 15 Strategy Decision Points for ER+/HER2- mBC
(1) Prior CDK4/6i requirement; (2) Biomarker enrichment (ESR1-mut only vs ITT+ESR1 co-primary); (3) PFS assessor; (4) Primary endpoint; (5) Control arm; (6) Combination arm addition; (7) Bone-only disease; (8) CNS criteria; (9) Prior chemo allowance; (10) ECOG range; (11) Geographic strategy; (12) IA strategy; (13) CDx co-development; (14) PRO level; (15) Accelerated vs traditional path.
Each must be quantified with ≥2 options showing Δsample size, Δtime, Δcost, Δlabel scope, FDA precedent.
[source: kb/methods/sop/protocol-ie-endpoint-optimization-sop.md §5.5]

### FDA Lesson: Male patient inclusion required
Per FDA Male Breast Cancer Guidance (2020), all ER+/HER2- BC trials must address male patients. Include male-specific I/E clauses (GnRH ≥28d before C1D1 for pre-menopausal males). If excluding, justify in Protocol Rationale.
[source: kb/methods/sop/protocol-writing-sop.md §七 教训2]

### FDA Lesson: PARP-eligible exclusion clause
Exclusion Criteria must include standalone clause: patients with pathogenic BRCA1/2 or HRR mutations eligible for and not yet treated with PARPi (in regions where accessible).
[source: kb/methods/sop/protocol-writing-sop.md §七 教训6]

## SAP Design

### Control arm I/E modifiers for ER+/HER2- mBC
ESR1-mut requirement → ↓ control mPFS (−10% to −30%, prior ET resistance signals shorter SoC PFS). Mandating prior CDK4/6i → ↓ control mPFS (−10% to −25%, more heavily pre-treated). These are directional estimates, not validated meta-analysis.
[source: kb/methods/sop/statistical-design-sop.md Step 2.4]

<!-- Append rules here during training (section-append convention) -->
