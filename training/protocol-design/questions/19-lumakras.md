---
type: training-question
question_id: Q-019
drug_name: Lumakras (sotorasib)
sponsor: Amgen, Inc.
app_number: NDA214665
approval_year: 2021
regulatory_pathway: NDA, Priority Review, Accelerated Approval, Project ORBIS
answer_source: shared/data/fda-reviews/md/2021/NDA214665-lumakras/MultidisciplineR.md
created: 2026-03-29
---

# Question 019: Sotorasib (Lumakras)

## Drug Information

- **Generic Name**: Sotorasib
- **Trade Name**: Lumakras
- **Sponsor**: Amgen, Inc.
- **Code Name**: AMG-510
- **MOA**: Small molecule that binds irreversibly to KRAS G12C, locking the protein in its inactive GDP-bound conformation; inhibits downstream RAS signaling (ERK1/2 phosphorylation) and induces tumor cell apoptosis; first-in-class covalent KRAS G12C inhibitor
- **Pharmacologic Class**: Inhibitor of the RAS GTPase family (KRAS G12C inhibitor)
- **Formulation**: Tablets, 120 mg

## Proposed Indication

Treatment of adult patients with KRAS G12C-mutated locally advanced or metastatic non-small cell lung cancer (NSCLC), as determined by an FDA-approved test, who have received at least one prior systemic therapy.

## Target Population

- Adults with KRAS G12C-mutated locally advanced or metastatic NSCLC
- Confirmed by FDA-approved companion diagnostic test (tissue or plasma)
- At least one prior systemic therapy (typically platinum-based chemotherapy ± immune checkpoint inhibitor)
- KRAS G12C mutation present exclusively; does not co-occur with other targetable mutations (EGFR, ALK, ROS1, BRAF, NTRK)

## Line of Therapy

Second-line or later (post-prior systemic therapy including platinum-based chemotherapy and/or immune checkpoint inhibitor)

## Disease Background

- Lung cancer is the leading cause of cancer death worldwide and in the United States; NSCLC accounts for >80% of all lung cancer cases; an estimated 225,000 new cases and >135,000 deaths (22.4% of all cancer deaths) were projected in the U.S. in 2020 (SEER 2020).
- Advanced NSCLC (Stage IIIB/IV) has a 5-year survival rate of only 5.2% (SEER 2019); global incidence of lung cancer in 2018 was ~2.09 million cases with ~1.76 million deaths.
- The KRAS G12C mutation—a glycine-to-cysteine substitution at amino acid position 12—is present in approximately 13% of lung adenocarcinomas in Western populations (~3% in Asia), estimated to affect ~15,760 patients per year in the United States; KRAS G12C is strongly associated with a history of tobacco smoking and is associated with higher PD-L1 expression and tumor mutational burden than wild-type NSCLC cells.
- KRAS G12C-mutated NSCLC has been refractory to drug targeting for decades; patients with this mutation historically have had poor prognosis compared to patients with actionable EGFR mutations; median OS with immunotherapy is approximately 21–28 months versus 10–20 months with chemotherapy alone (Herbst 2019, Gadgeel 2019).
- Prior to sotorasib approval, no targeted therapies were approved specifically for patients with KRAS G12C mutated NSCLC, representing a first-in-class opportunity.

## Current Standard of Care

- **1L (KRAS G12C-mutated, no co-occurring targetable mutations)**:
  - Same as NSCLC without targetable mutations: platinum-based doublet chemotherapy ± immune checkpoint inhibitor (pembrolizumab, atezolizumab); pembrolizumab monotherapy for high PD-L1 expressors (TPS ≥50%)
- **2L+ available therapies** (prior to sotorasib approval):
  - Immune checkpoint inhibitors (nivolumab, pembrolizumab, atezolizumab): ORR 14–30%, median OS 9–14 months in unselected NSCLC
  - Docetaxel ± ramucirumab: median OS 10.5 months with combination (REVEL); docetaxel alone ORR ~5–6%, median survival 5.7–7.5 months
  - Pemetrexed (if not given in 1L, non-squamous only): ORR 8.5%, median OS 8.3 months
  - Afatinib (squamous): ORR 3%, median OS 7.9 months
  - No approved therapies specifically targeting the KRAS G12C oncogenic driver mutation

## Unmet Medical Need

FDA-approved treatment options for patients with KRAS G12C-mutated NSCLC are limited to the same therapies used for NSCLC without a targetable mutation; there are no approved therapies targeting this oncogenic driver. KRAS has been recognized as an oncogenic driver in NSCLC for decades yet was historically considered "undruggable." Patients with KRAS G12C mutations are not candidates for currently approved targeted therapies (EGFR, ALK, ROS1, BRAF inhibitors), and response rates to second-line chemotherapy and immunotherapy in this population are modest. The lack of any targeted therapy for KRAS G12C-mutated NSCLC represents a substantial unmet medical need for this genetically distinct, poor-prognosis lung cancer subset.

---

## Task for AI

Based on the information above, design a complete pivotal trial protocol including:

1. **Study Design**: Randomization scheme, blinding, control arm, number of arms
2. **Key Eligibility Criteria**: Inclusion/exclusion criteria
3. **Primary Endpoint(s)**: With justification (consider whether accelerated or regular approval pathway)
4. **Secondary Endpoint(s)**
5. **Sample Size Estimation**: With assumptions
6. **Statistical Analysis Plan**: Multiplicity adjustment, interim analyses
7. **Stratification Factors**
8. **Key Operational Considerations**: Companion diagnostic strategy, biomarker testing (tissue vs. plasma), prior therapy requirements
