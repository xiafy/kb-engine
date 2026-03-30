---
type: training-question
question_id: Q-009
drug_name: Komzifti (ziftomenib)
sponsor: Kura Oncology, Inc.
app_number: NDA220305
approval_year: 2025
regulatory_pathway: NDA, NME, Priority Review, Regular Approval, Breakthrough Therapy Designation, Fast Track Designation, Orphan Drug Designation
answer_source: shared/data/fda-reviews/md/2025/NDA220305-komzifti/MultidisciplineR.md
created: 2026-03-29
---

# Question 009: Ziftomenib (Komzifti)

## Drug Information

- **Generic Name**: Ziftomenib
- **Trade Name**: KOMZIFTI
- **Sponsor**: Kura Oncology, Inc.
- **Code Name**: KO-539
- **MOA**: Small molecule menin inhibitor; binds to menin at the KMT2A binding site and disrupts the interaction between menin and KMT2A (mixed lineage leukemia lysine methyltransferase 2A), blocking NPM1 mutation-driven leukemogenic gene regulation; new molecular entity
- **Pharmacologic Class**: Small molecule menin inhibitor
- **Formulation**: 200 mg capsules; dosing 600 mg orally once daily

## Proposed Indication

Treatment of adult patients with relapsed or refractory acute myeloid leukemia (AML) with a susceptible nucleophosmin 1 (NPM1) mutation who have no satisfactory alternative treatment options.

## Target Population

- Adults (≥18 years) with relapsed or refractory (R/R) AML
- Biomarker requirement: susceptible NPM1 mutation (mutations in exon 11 resulting in cytoplasmic localization of NPM1 protein, including A, B, and D subtypes; other mutations reasonably likely to lead to cytoplasmic localization are also permitted)
- NPM1 mutations represent approximately 30% of all AML cases; they are among the most common recurrent mutations in AML
- No satisfactory alternative treatment options available

## Line of Therapy

Relapsed or refractory (≥2nd line); median prior lines of therapy = 2 in the pivotal cohort

## Disease Background

- Acute myeloid leukemia (AML) is the most common acute leukemia in adults, with a median age at diagnosis of approximately 68 years.
- AML is universally fatal if untreated; despite recent therapeutic advances, overall survival outcomes remain poor.
- NPM1-mutated (NPM1-m) AML represents approximately 30% of all AML cases; while an NPM1 mutation at diagnosis is a relatively favorable prognostic factor compared to other AML subtypes, this prognostic advantage is lost in the relapsed/refractory setting.
- In patients with R/R NPM1-m AML, median aggregate OS is approximately 6.1 months; for patients receiving ≥3rd-line therapy, median OS decreases to 3.5–5.3 months, with relapse-free survival as low as 3.3 months.
- Up to 50% of AML patients who achieve remission will relapse, including those with NPM1 mutations; the leukemogenic activity of mutant NPM1 is mediated through the menin-MLL(KMT2A) interaction.

## Current Standard of Care

- **Newly diagnosed AML (fit patients)**: Standard induction chemotherapy "7+3" (cytarabine 7 days + anthracycline 3 days); consolidation with high-dose cytarabine ± HSCT
- **Newly diagnosed AML (unfit/elderly)**: Venetoclax + azacitidine (FDA-approved); lower-dose chemotherapy or hypomethylating agents
- **Targeted add-ons (mutation-specific)**:
  - FLT3 inhibitors (midostaurin, quizartinib, gilteritinib) for FLT3-mutated AML
  - IDH1 inhibitor (ivosidenib) for IDH1-mutated AML
  - IDH2 inhibitor (enasidenib) for IDH2-mutated AML
  - Gemtuzumab ozogamicin (CD33-positive AML)
- **R/R AML**:
  - HSCT (for eligible patients in remission)
  - Gilteritinib (FLT3-mutated R/R AML)
  - Venetoclax-based combinations
  - Clinical trial participation strongly recommended per NCCN guidelines before cycling through previously used therapies
  - **No FDA-approved or NCCN-recommended standard of care specifically for R/R NPM1-m AML**

## Unmet Medical Need

There are no FDA-approved or NCCN-recommended standard of care treatments specifically for R/R NPM1-m AML, and no therapies targeting the underlying disease driver (mutant NPM1/menin-KMT2A axis). Curative options (intensive chemotherapy + HSCT) are generally unavailable for older, frailer patients who represent the majority of the AML population. R/R NPM1-m AML has a dismal prognosis with median OS of approximately 6.1 months and progressively worsening outcomes with each subsequent therapy line. There remains an urgent unmet medical need for targeted therapies in this population.

---

## Task for AI

Based on the information above, design a complete pivotal trial protocol including:

1. **Study Design**: Single-arm vs. randomized, rationale for design choice
2. **Key Eligibility Criteria**: Inclusion/exclusion criteria
3. **Primary Endpoint(s)**: With justification for AML R/R setting
4. **Secondary Endpoint(s)**
5. **Sample Size Estimation**: With assumptions (historical control if single-arm)
6. **Statistical Analysis Plan**: Bayesian vs. frequentist, confidence intervals
7. **Biomarker Testing Strategy**: NPM1 mutation testing approach
8. **Key Operational Considerations**: Patient population, safety monitoring (differentiation syndrome risk)
