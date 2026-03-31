## My Answer: Orgovyx [protocol-design] — Solver A (kimi)

### 1. design_type
Phase 3, multinational, randomized, open-label, parallel-group, active-controlled superiority trial with 2:1 allocation (relugolix:leuprolide).

### 2. control_arm
Leuprolide acetate 22.5 mg 3-month depot injection — GnRH agonist, established standard of care (~70% US market share). ⚠️ SDP: Could consider IC among GnRH agonists.

### 3. primary_endpoint
Sustained castration rate: Cumulative probability of sustained testosterone suppression to castrate levels (<50 ng/dL) from Day 29 through Week 48.

### 4. endpoint_definition
- Proportion of patients maintaining serum T <50 ng/dL at ALL assessments Day 29–Week 48
- Central lab LC-MS/MS
- Treatment discontinuation/death/missing = failure (treatment policy, NRI)
- Assessment: no BICR needed (objective lab endpoint)

### 5. secondary_endpoints
1. Sustained castration NI test (margin -10%)
2. Castrate T at Day 4 (rapid onset, no flare)
3. Profound castration (<20 ng/dL) at Day 15
4. PSA response (≥50%) at Day 15
5. FSH at Week 24
6. MACE-4 rate (CV death, MI, stroke, unstable angina)
7. Testosterone recovery post-treatment

### 6. sample_size
Target: 934 patients (622:312, 2:1)
- Expected: p1=96.0%, p2=88.5%, difference=7.5%
- Minimum calculated: 678 (α=0.025 one-sided, 90% power)
- Inflated to 934 for subgroup analyses, safety database, interim analysis
- 10% dropout assumed

### 7. stat_framework
- Primary: Farrington-Manning score test, α=0.025 one-sided
- NI secondary: margin -10%, 95% CI lower bound > -10%
- Hierarchical testing (fixed sequence) for secondaries
- Interim: 1 at ~50% info, O'Brien-Fleming spending (α=0.001 at interim)
- IDMC; estimand per ICH E9(R1)

### 8. stratification
1. Geographic region (Americas / Europe / Asia-Pacific)
2. Metastatic disease (Yes / No)
3. Age (≤75 / >75)

### 9. eligibility
**Inclusion**: Confirmed prostate adenocarcinoma; advanced disease requiring ≥1yr ADT; T ≥150 ng/dL; PSA >2.0; ECOG 0-1; age ≥18
**Exclusion**: Prior ADT within 3 months; cumulative ADT >18 months; prior orchiectomy; active CV disease within 6 months; prior malignancy within 2 years; severe hepatic impairment

### 10. operational
- Geography: Americas ~40%, Europe ~35%, Asia-Pacific ~25%
- No CDx required; central lab for all T/PSA/FSH
- Dosing: relugolix 360mg loading D1 → 120mg QD; leuprolide 22.5mg q12w depot
- EORTC QLQ-C30 + PR25 PRO; CV adjudication by blinded external committee
- BICR not required (objective lab endpoint)
