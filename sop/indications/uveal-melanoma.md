---
version: 1.1
source: Batch 2 R6 Kimmtrak (BLA761228)
rule_count: 4
---

# Uveal Melanoma (Metastatic)

> Batch 2 审核 (2026-04-01) — 从 placeholder 升级

## Trial Design

### Primary Endpoint: OS
IF metastatic uveal melanoma (mUM): → OS as primary endpoint (not PFS). Ultra-poor prognosis (median OS <12 months) makes OS feasible and clinically most meaningful. No validated PFS surrogate established in mUM.
[grounded: single-case — Kimmtrak BLA761228, OS primary]

### Control Arm: 3-Option IC
IF no approved SOC for mUM: → Investigator's Choice with exactly 3 pre-specified options: dacarbazine, ipilimumab, pembrolizumab. Do not add nivolumab (redundant with pembrolizumab, same PD-1 class). Do not add combination immunotherapy (ipi+nivo) without mUM-specific evidence.
[grounded: single-case — Kimmtrak BLA761228, FDA: "dacarbazine, ipilimumab or pembrolizumab is considered appropriate"]

### Stratification: LDH Only
IF mUM: → Single stratification factor: LDH status (elevated vs normal, centrally measured). LDH is the strongest independent prognostic factor. Liver metastasis status (~90% prevalence) is highly correlated with LDH, not needed as separate factor.
[grounded: single-case — Kimmtrak BLA761228 + rare-disease SOP §minimization]

### PFS Assessment Under OS-Primary
IF mUM with OS as primary: → Investigator-assessed PFS acceptable as key secondary endpoint, with BICR as sensitivity analysis. The bispecific antibody BICR mandate (core §4.1) applies to PFS-primary designs only.
[grounded: single-case — Kimmtrak BLA761228, FDA accepted INV-PFS as key secondary]

## SAP Design

<!-- Append rules here during training (section-append convention) -->
