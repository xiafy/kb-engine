---
version: 1.1
source: sop.md v2.2 split + Round 02 training (Orgovyx)
rule_count: 6
---

# Prostate Cancer ADT

> version: 1.1 | source: sop.md v2.2 split + Round 02 training

## Trial Design

### Eligibility Criteria
IF indication == "ADT (GnRH class)": → Baseline testosterone ≥150 ng/dL; exclude recent ADT (within 3 months) and prolonged cumulative ADT (>18 months)

ADT-specific exclusion criteria should also include: (1) prior or planned taxane chemotherapy within 2 months of ADT initiation; (2) brain metastases (other metastatic sites allowed). These reflect FDA's actual eligibility requirements for the ADT class.
[single-case: FDA-Review-Orgovyx]

### Stratification
IF indication == "ADT (GnRH class)": → Stratify by: (1) geographic region; (2) metastatic disease (yes/no, with regional lymph node N1 classified as non-metastatic); (3) age (≤75 years / >75 years). The age cutoff of 75 (not 65) reflects the elderly-predominant prostate cancer population and differential CV risk above 75.
[single-case: FDA-Review-Orgovyx]

### Endpoint Selection
IF indication == "ADT (GnRH class)":
- **ALL GnRH analogs (including oral vs injectable comparisons)**: FDA evaluates the primary endpoint as a **single-arm threshold**: KM sustained testosterone suppression rate 95% CI lower bound ≥90% (T<50 ng/dL, Day 29–48 wk). This applies even when the trial is randomized with an active comparator arm. FDA's stated position: "the preferred FDA approach to evaluation of GnRH analogues is to consider only whether the single investigational arm demonstrates attainment of a castrate (<50 ng/dL) testosterone level that is maintained until the end of a treatment period." FDA explicitly communicated that "a two-arm trial was not necessary for approval." NI and superiority comparisons are secondary/exploratory only — FDA rejected NI as a primary analysis framework for the Orgovyx HERO trial.
[single-case: FDA-Review-Orgovyx] [supersedes: previous rule that oral-vs-injectable ADT uses RCT superiority as primary]
- IF oral new drug vs injectable standard ADT (e.g., relugolix vs leuprolide) → Open-label RCT with active comparator acceptable (2:1 randomization) for **design**, but primary **analysis** uses single-arm threshold method, not between-arm comparison. Comparator arm data supports safety characterization (especially MACE/CV events) and secondary endpoint claims.
[single-case: FDA-Review-Orgovyx]

### Primary Endpoint Methodology
IF indication == "ADT (GnRH class)": → Sustained castration rate calculated as KM estimate of cumulative probability of maintaining T<50 ng/dL from Day 29 through Week 48/49. 95% CI via exponential Greenwood formula using log-log transformation of survival function. Success criterion: lower bound of 95% CI ≥ 90%. Do NOT use binary proportion (T<50 at all visits) — use KM survival methodology.
[single-case: FDA-Review-Orgovyx]

## SAP Design

<!-- Append rules here during training (section-append convention) -->
