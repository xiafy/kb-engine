---
version: 1.1
source: v1.0 + Batch 2 R7 Voranigo (NDA218784)
rule_count: 6
---

# IDH-mut Low-Grade Glioma (LGG)

> version: 1.1 | Batch 2 审核 (2026-04-01)

## Trial Design

### Eligibility Criteria
IF indication == "post-surgical observation replacement (slow-progression tumors such as LGG)":
→ Restrict to time window after most recent surgery (≥1 year ≤5 years), ensuring clinical stability and that placebo use is ethically acceptable

### Stratification Factors
IDH-mut LGG recommended stratification factors: 1p/19q co-deletion + baseline tumor size (≥2cm vs <2cm).
Note: Extent of resection is not used as a stratification factor.
[validated: Voranigo NDA218784 — INDIGO used 1p19q + tumor size]

### Key Secondary Endpoint: TTNI (not OS) [Batch 2 审核]
IF observation-replacement trial for LGG: → Time to Next Intervention (TTNI) should be the **sole key secondary** endpoint, not OS. TTNI captures the core clinical benefit: deferral of treatment burden (RT/chemotherapy toxicity). OS is too immature in slow-progression LGG and should be exploratory.
[grounded: single-case — Voranigo NDA218784, FDA designated TTNI as sole key secondary]

### PFS Assessor: BICR Required [Batch 2 审核]
IF LGG (CNS tumor): → BICR as primary PFS assessor even in double-blind designs. CNS imaging complexity (pseudoprogression, T2/FLAIR changes, non-enhancing progression) requires independent expert review. Use modified RANO-LGG criteria, not generic RANO or RECIST.
[grounded: single-case — Voranigo NDA218784, INDIGO used BIRC despite double-blind; see also core §4.7a]

### Control mPFS in Trial Setting [Batch 2 审核]
IF LGG placebo-controlled trial: → Control arm mPFS is approximately **18 months** in trial setting with scheduled MRI (not 48 months from observational literature). Observational PFS is inflated by less frequent imaging and diagnostic delay. Use RCT-sourced data for sample size assumptions.
[grounded: single-case — Voranigo NDA218784, INDIGO placebo mPFS ~18mo]

## SAP Design

<!-- Append rules here during training (section-append convention) -->
