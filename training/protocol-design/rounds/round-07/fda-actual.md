# FDA Standard Answer — Round 07
**Drug:** Voranigo (vorasidenib)
**NDA:** NDA218784
**Source:** MultidisciplineR.md (Multi-Discipline Review and Evaluation)
**Pivotal Study:** AG881-C-004 (INDIGO, NCT04164901)

---

## 1. design_type

Phase 3, global, multicenter, randomized, double-blind, placebo-controlled study. Eligible subjects were randomized in a 1:1 ratio to receive vorasidenib or vorasidenib-matched placebo orally QD. FDA noted the study was designed for patients with Grade 2 IDH-mutant glioma (not all "non-enhancing" IDH-mutant gliomas as described by the Applicant).

---

## 2. control_arm

Placebo (vorasidenib-matched placebo) administered orally QD. Subjects randomized to placebo who achieved centrally confirmed radiographic progressive disease (PD) by BIRC were unblinded and allowed to cross over to receive vorasidenib, provided certain eligibility criteria per protocol were met.

---

## 3. primary_endpoint

BIRC-assessed progression-free survival (PFS) per modified Response Assessment in Neuro-Oncology for Low-Grade Gliomas (RANO-LGG) in the Full Analysis Set (FAS). FDA confirmed: "The statistical assessment of primary efficacy was based on results from the prespecified analysis of the primary endpoint of BIRC-assessed PFS per modified RANO-LGG in the full analysis set."

---

## 4. endpoint_definition

**PFS:** Time from date of randomization to the date of first occurrence of centrally confirmed radiographic PD by modified RANO-LGG assessed by the BIRC, or death from any cause, whichever occurred earlier. Subjects without confirmed radiographic PD or death were censored at the date of the last disease assessment.

**TTNI (key secondary):** Time from randomization to initiation of first subsequent anticancer therapy (including vorasidenib for placebo crossover subjects) or death due to any cause. Subjects who did not initiate subsequent anticancer therapy or did not die by the data cutoff date were censored at the last known alive date.

---

## 5. secondary_endpoints

- **Key secondary endpoint:** Time to Next Intervention (TTNI) — selected to illustrate the clinical meaningfulness of delaying radiographic PD. Tested in fixed-sequence after PFS.
- **Additional secondary endpoints:**
  - Tumor Growth Rate (TGR) as assessed by volume per the BIRC
  - Objective Response (OR): best overall response (BOR) of CR+PR+mR, CR+PR, time to response (TTR), time to CR+PR, duration of response (DOR), duration of CR+PR (assessed by both BIRC and Investigator)
  - Overall Survival (OS)
  - Health-related quality of life (HRQOL) as assessed by the Functional Assessment of Cancer Therapy – Brain (FACT-Br) questionnaire
  - PFS per Investigator assessment

FDA agreed with the Applicant's assessment of study endpoints.

---

## 6. sample_size

Sample size estimate was based on a target hazard ratio (HR) of 0.6, with median PFS of 18 months in the placebo arm and 30 months in the vorasidenib arm.

- **PFS (primary):** 164 PFS events required to provide ≥90% power to detect HR of 0.6 using a 1-sided log-rank test at significance level of 0.025, with a 3-look group-sequential design.
- **TTNI (key secondary):** 152 TTNI events required to provide approximately 80% power to detect HR of 0.636 using a 1-sided log-rank test at significance level of 0.025.
- **Enrolled:** 331 patients randomized (168 to vorasidenib arm, 163 to placebo arm).
- **IA2 cutoff (September 6, 2022):** 135 PFS events observed (82% information fraction); 77 TTNI events (51% information fraction). Study met primary and key secondary endpoints at IA2.

---

## 7. stat_framework

- **Analysis set:** Full Analysis Set (FAS)
- **Primary test:** 1-sided stratified log-rank test at significance level of 0.025
- **Cox PH model:** Stratified by randomization stratification factors to estimate HR with 95% CI
- **Kaplan-Meier:** Used for time-to-event endpoints; median with 2-sided 95% CI (Brookmeyer-Crowley method); survival function CIs via log-log transformation (Kalbfleisch-Prentice); SE by Greenwood formula
- **Group-sequential design:** 3 prespecified analyses:
  - IA1 (futility only): ~55 PFS events (33.5% of 164)
  - IA2 (superiority + futility): ~123 PFS events (75% of 164)
  - FA: ~164 PFS events
- **Alpha-spending:** Gamma family (−24) for efficacy boundaries; Gamma family (−5) β-spending for nonbinding futility boundaries
- **Type I error control:** Fixed-sequence testing procedure — TTNI tested only if PFS reached statistical significance
- **FDA assessment:** "FDA generally agrees with the Applicant's summary of the statistical analysis plan (SAP)."

---

## 8. stratification

Randomization was stratified by:
1. **Local 1p19q status:** co-deleted or not co-deleted
2. **Baseline tumor size per local assessment:** longest diameter ≥2 cm or <2 cm

Rationale: 1p19q co-deletion associated with increased sensitivity to alkylator therapy and favorable outcome; baseline tumor size correlated with long-term outcomes and tumor growth kinetics.

TTNI analysis also stratified by 1p19q status and baseline tumor size.

---

## 9. eligibility

**Applicant's description (FDA agreed):**

*Inclusion:*
- Residual or recurrent histologically confirmed Grade 2 oligodendroglioma or astrocytoma (per WHO 2016 classification) with IDH1 or IDH2 mutation
- At least 1 prior surgery (most recent surgery ≥1 year and ≤5 years before randomization)
- No other prior anticancer therapy (no chemotherapy, no radiotherapy)
- Not in immediate need of chemotherapy or RT per Investigator opinion
- Age ≥12 years and weight ≥40 kg (adults and adolescents)
- Confirmed IDH1 or IDH2 mutation by central laboratory testing; available 1p19q status by local testing using accredited laboratory
- Measurable disease: at least 1 non-enhancing target lesion ≥1 cm × ≥1 cm with centrally confirmed minimal, non-nodular, and non-measurable enhancement

*Exclusion (implied):*
- Prior chemotherapy or radiotherapy
- Immediate need for chemotherapy or RT

**FDA's Assessment:** "FDA agrees with the Applicant's description of eligibility criteria." FDA additionally clarified the population as patients with Grade 2 IDH-mutant glioma (not all non-enhancing gliomas).

---

## 10. operational

- **BIRC (Blinded Independent Review Committee):** Independent neuro-radiologists assessed radiographic eligibility for study entry, assessed the primary efficacy endpoint, and confirmed radiographic PD to permit unblinding and crossover. Images at each timepoint assessed by two independent reviewers (double read) using modified RANO-LGG criteria; adjudication process for disagreements.
- **Blinding:** Double-blind throughout; Sponsor remained blinded; subjects and all personnel involved in subject evaluation blinded to treatment until centrally confirmed radiographic PD.
- **MRI schedule:** At Screening, every 12 weeks beginning at Cycle 4, every 6 months beginning at Cycle 37 for 2 years, annually thereafter.
- **Crossover:** Permitted for placebo subjects upon confirmed radiographic PD (unblinding required); vorasidenib arm subjects not permitted to continue after PD.
- **Treatment:** Continuous 28-day cycles until centrally confirmed radiographic PD by BIRC, unacceptable toxicity, withdrawal of consent, or other discontinuation criteria.
- **SAP finalization:** SAP version 2.0 signed 04 February 2021, finalized prior to any efficacy analysis and database unblinding.
- **Study unblinding:** March 2023, following IDMC recommendation at IA2 Data Review Meeting (24 February 2023) due to early demonstration of efficacy.
- **Protocol amendments:** 3 global amendments — (1) dose switch from 50 mg F1 to 40 mg F2; (2) revised statistical design (power/HR assumptions, removal of TGR from testing order, TTNI designated sole key secondary endpoint); (3) change of Sponsorship.
