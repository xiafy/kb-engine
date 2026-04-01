# FDA Standard Answer — Round 08
## Drug: Nirogacestat (Ogsiveo) | NDA 217677 | Approved 2023
## Pivotal Study: NIR-DT-301 (DeFi)
## Source: NDA217677 MultidisciplineR.md

---

## 1. design_type
Randomized, double-blind, placebo-controlled, Phase 3 study. International, multicenter. Two-phase structure: double-blind (DB) phase followed by an optional open-label extension (OLE) phase. 1:1 randomization ratio (nirogacestat 150 mg BID vs. placebo).

## 2. control_arm
Placebo (oral, matching nirogacestat 150 mg BID, administered in 28-day cycles continuously). Cross-over to nirogacestat was permitted in the OLE phase following the primary PFS analysis or upon confirmed radiographic progression per RECIST v1.1.

## 3. primary_endpoint
Progression-free survival (PFS), defined as the time from randomization until the date of assessment of progression or death by any cause (whichever occurs first).

PFS was assessed by Blinded Independent Central Review (BICR). Progression included:
- Radiographic progression per RECIST v1.1 (by independent, blinded Central Imaging Review), AND
- Clinical progression (added via Protocol Amendment 5, February 9, 2021): onset or worsening of symptoms resulting in a global deterioration of health status causing permanent discontinuation from study treatment and initiation of emergent treatment (e.g., radiotherapy, surgery, or systemic therapy including chemotherapy or tyrosine kinase inhibitors) for DT/AF, adjudicated by blinded, independent, central clinical review committee.

FDA noted concern about the inclusion of clinical progression events due to potential for bias; however, concerns were mitigated by sensitivity analyses based on radiographic progression alone (HR = 0.31 [95% CI: 0.15, 0.62]; p < 0.001), which were consistent with the primary analysis.

Primary analysis was performed at 49 PFS events (pre-specified target: 51 events). FDA concurred that the early analysis was acceptable given the strongly significant and clinically meaningful result.

**Result:** Median PFS: nirogacestat NE (95% CI: NE, NE) vs. placebo 15.1 months (95% CI: 8.4, NE); HR = 0.29 (95% CI: 0.15, 0.55); statistically and clinically significant.

## 4. endpoint_definition
- **PFS:** Time from randomization to first documented progression (radiographic per RECIST v1.1 by BICR, or clinical progression confirmed by blinded central clinical review) or death by any cause, whichever occurs first.
- **Radiographic progression (RECIST v1.1):** Assessed by independent, blinded Central Imaging Review on target tumors identified by investigator at Screening.
- **Clinical progression (Amendment 5 definition):** Onset or worsening of symptoms resulting in global deterioration of health status causing permanent discontinuation from study treatment AND initiation of emergent treatment for DT/AF.
- **ORR:** Confirmed best overall response (BOR) of CR or PR by RECIST v1.1 per central review; required ≥2 sequential scans demonstrating CR or PR.
- **DOR:** Duration from time measurement criteria met for CR or PR (whichever first) until date of progression or death (whichever first).
- **PRO endpoints (GODDESS, BPI-SF, EORTC QLQ-C30):** Change from baseline over time.

## 5. secondary_endpoints
Hierarchical testing order (after PFS): ORR → disease symptoms, impact, and QoL by PRO.

Key pre-specified secondary endpoints:
1. **ORR** (confirmed BOR of CR or PR by RECIST v1.1 during DB phase) — **Result:** 41% (nirogacestat) vs. 8% (placebo); p < 0.001
2. **Duration of Response (DOR)** — descriptive/supportive analysis of ORR; median DOR not reached in either arm
3. **Change in PRO measures from baseline over time:**
   - GODDESS (GOunder/Desmoid Tumor Research Foundation Desmoid Symptom/Impact Scale)
   - BPI Short Form (Brief Pain Inventory) — proportion with improvement in BPI-SF API score at Cycle 10 moved to exploratory in SAP v2.0
   - EORTC QLQ-C30

FDA note: PRO results showed statistical significance but were considered exploratory due to large amounts of missing data at Cycle 10 and differential missingness between arms. FDA performed additional analyses on BPI-SF for pain at earlier timepoints, which were supportive of PFS results.

OS was not formally tested; FDA did not object because DT is rarely fatal.

## 6. sample_size
- **Planned:** 118 participants (based on 51 PFS events; 90% power; 1-sided type I error 0.025; assumed median PFS of 20 months [nirogacestat] vs. 8 months [placebo]; HR = 0.4; 10% dropout rate; 20% spontaneous regression rate; 1:1 randomization).
- **Actual enrolled:** 142 participants (all eligible participants in Screening at time of achieving target enrollment of 118 were allowed to enroll; excess due to COVID-19-related bolus in Screening).
- **Randomized:** 70 nirogacestat / 72 placebo.
- **Received treatment:** 141 participants (1 randomized but did not receive treatment).

Sample size was increased from original 105 to 118 (Amendment 2) because DTs can spontaneously regress.

## 7. stat_framework
- **Primary analysis population:** ITT (Intent-to-Treat): all enrolled and randomized participants, analyzed per randomized treatment and assigned stratum.
- **Safety population:** All randomized participants who received ≥1 dose; analyzed per treatment actually received.
- **Per-Protocol (PP) population:** Participants who received study treatment and had no major protocol deviations; used for sensitivity analyses.
- **Primary PFS analysis method:** Stratified log-rank test (one-sided, 0.025 significance level), stratified by tumor location.
- **Hazard ratio estimation:** Stratified Cox proportional hazards model (exact method for ties), stratified by tumor location; placebo as reference.
- **ORR comparison:** Cochran-Mantel-Haenszel test for general association, stratified by tumor location.
- **Hierarchical testing:** Endpoints tested sequentially (PFS → ORR → PRO); if null hypothesis not rejected at any step, all subsequent results considered descriptive only.
- **PRO formal testing:** 1-sided significance level of 0.025 (clarified in SAP v2.0).
- **Sensitivity analyses:** PFS excluding clinical progression events (radiographic only); ITT vs. PP population comparison.

## 8. stratification
Single stratification factor:
- **Target tumor(s) location at Baseline:** intra-abdominal vs. extra-abdominal

Rationale per FDA Review: Participants with intra-abdominal tumors have been found to have a less favorable outcome compared to extra-abdominal tumors (Howard & Pollock 2016). If a participant had multiple target tumors in both locations, the tumor was classified as intra-abdominal.

FDA noted that randomized strata (intra-abdominal vs. extra-abdominal) were balanced between treatment arms.

## 9. eligibility
**Key Inclusion Criteria (DB phase):**
- Age ≥18 years
- Histologically confirmed DT by local pathologist prior to informed consent
- DT that progressed by ≥20% as measured by RECIST v1.1 within 12 months of the Screening visit scan
- Treatment naïve OR recurrent/refractory to treatment with measurably progressing DT
- ECOG performance status ≤2
- DT tumor where continued PD did not result in immediate significant risk to the participant
- Adequate organ and bone marrow function
- Patients on chronic NSAIDs for conditions other than DT: must have been receiving them prior to DT progression documentation and on stable dose ≥28 days prior to first dose; patients on any DT treatment must have completed treatment ≥28 days (or 5 half-lives, whichever longer) prior to first dose

**Key Exclusion Criteria:**
- Current or prior treatment with gamma secretase inhibitor or anti-Notch antibody
- Current or chronic history of hepatobiliary disease (except Gilbert's syndrome or gallstones)
- Positive HIV test, positive hepatitis B surface antigen, or positive hepatitis C antibody or RNA
- Clinically significant heart disease or prolonged QTc interval

**FDA Assessment Notes:**
- Enrollment based on local DT diagnosis; central review of tumor specimens confirmed diagnosis for all patients (not required for eligibility but performed post-enrollment). FDA considered this appropriate for a rare tumor requiring expert diagnosis.
- Enrollment restricted to RECIST 1.1-defined progressing DT; FDA revised indication statement consistent with this criterion.
- Protocol deviations included 3 patients enrolled without meeting inclusion/exclusion criteria (2 nirogacestat, 1 placebo).

## 10. operational
- **Treatment administration:** Nirogacestat 150 mg BID, oral tablet, continuously in 28-day cycles; all participants dosed at same dose level.
- **Imaging assessment:** Tumor assessments by CT or MRI; RECIST v1.1 applied to target tumors identified by investigator at Screening; independent, blinded Central Imaging Review (BICR) used for all efficacy assessments.
- **Central review:** Central radiological review (radiographic PFS events) and blinded, independent central clinical review committee (clinical progression events).
- **Diagnosis confirmation:** Tumor specimens from all patients reviewed by central pathology to reconfirm DT diagnosis.
- **DB phase duration:** Participants remained until death, disease progression, discontinuation for any reason, or 51 PFS events observed and primary analysis completed.
- **OLE phase:** Optional; participants enrolled if still in DB phase when primary analysis completed, or met RECIST v1.1 PD criteria confirmed by central radiological review. Patients with clinical progression were NOT eligible for OLE and were not unblinded.
- **Unblinding at OLE entry:** C1D1 of OLE within 24 hours of EOT visit for DB phase; longer window allowed with medical monitor approval.
- **Crossover:** Permitted after primary PFS analysis (OLE phase); data post-crossover analyzed and reported separately.
- **Protocol amendments:** 5 amendments total (Amendment 4 not activated); key operational change was addition of clinical progression to PFS definition (Amendment 5).
- **Primary analysis timing:** 49 of 51 pre-specified PFS events; no new events reported between Sep 20, 2021 and April 07, 2022; study was ~3 years since first patient enrolled at time of analysis.
- **Regulatory pathway:** Traditional approval (not accelerated approval); single pivotal trial accepted given unmet medical need in rare disease (DT).
