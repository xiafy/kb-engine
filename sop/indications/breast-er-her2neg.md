---
version: 1.0
source: sop.md v2.2 split
rule_count: 4
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

## SAP Design

<!-- Append rules here during training (section-append convention) -->
