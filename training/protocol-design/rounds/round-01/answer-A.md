## My Answer: Deucravacitinib [protocol-design] — Agent A

### Intelligence Gathering Summary

| Source | Key Finding |
|--------|-------------|
| Phase 2 NEJM 2018 (NCT02931838) | 6 mg QD showed PASI75 = 69% at Wk 12 (3mg BID arm); 12mg QD = 75%; placebo = 7%. Dose selection: 6mg QD balances efficacy/safety |
| ESTEEM 1 & 2 (apremilast) | PASI75 at Wk 16: apremilast ~33%, placebo ~5.3%; design: 2:1 RCT, double-blind, 52 weeks |
| ERASURE/FIXTURE (secukinumab) | PASI75 at Wk 12: 81.6% vs 4.5% placebo; uses coprimary PASI75 + IGA 0/1; Week 12 primary timepoint |
| UNCOVER (ixekizumab) | PASI75/PASI90 at Wk 12; head-to-head vs etanercept; 3-arm design |
| VOYAGE (guselkumab) | Head-to-head vs adalimumab; co-primary PASI90 + IGA 0/1 Wk 16 |
| Placebo meta-analysis (PMID 32894834) | Pooled PASI75 placebo rate = 5.2% (95%CI 4.7–5.7%) |
| ClinicalTrials.gov NCT03624127 (PSO-1) | N=666, ratio 2:1:1, comparator = apremilast, coprimary sPGA 0/1 + PASI75 at Wk 16 |
| ClinicalTrials.gov NCT03611751 (PSO-2) | N=1020, ratio 2:1:1, randomized withdrawal design, apremilast comparator |

### 1. Design Type (design_type)
Two pivotal trials (PSO-1 and PSO-2). Each: randomized, double-blind (double-dummy), parallel-group, 3-arm, placebo- and active-controlled. Allocation ratio 2:1:1 (deucravacitinib : placebo : apremilast). PSO-1: 52 weeks. PSO-2: 58 weeks with randomized withdrawal.

### 2. Control Arm (control_arm)
Dual control: Placebo + Apremilast (30 mg BID, with standard titration). Apremilast chosen as same oral route enabling double-blind double-dummy; relevant oral benchmark; superiority provides key differentiation for labeling.

### 3. Primary Endpoint (primary_endpoint)
Co-primary endpoints (both must achieve significance vs placebo):
1. sPGA 0 or 1 (with ≥2-grade improvement from baseline) at Week 16
2. PASI 75 at Week 16

### 4. Endpoint Definition (endpoint_definition)
- sPGA: 5-point scale (0-4), response = score 0 or 1 AND ≥2-point improvement from baseline
- PASI 75: ≥75% reduction from baseline PASI (range 0-72)
- Assessment: In-person physician evaluation (trained/certified assessors)
- Missing data: Non-responder imputation (NRI)
- Timepoints: Baseline, Weeks 4, 8, 12, 16, 24, 32, 40, 52

### 5. Secondary Endpoints (secondary_endpoints)
Hierarchical testing sequence:
1. PASI 90 vs Placebo Wk16
2. PASI 100 vs Placebo Wk16
3. sPGA 0 vs Placebo Wk16
4. PASI 75 vs Apremilast Wk16
5. sPGA 0/1 vs Apremilast Wk16
6. PASI 90 vs Apremilast Wk16
7. ss-PGA 0/1 (scalp) vs Placebo Wk16
8. PGA-F 0/1 (nails) vs Placebo Wk16
9. PSSD Symptom Score vs Placebo Wk16
10. PSSD Symptom Score = 0 vs Placebo Wk16
11. DLQI 0/1 vs Placebo Wk16
12-17. Wk24 and Wk52 comparisons vs Apremilast
PSO-2: Time to relapse in randomized withdrawal

Exploratory: Palmoplantar PGA, Itch NRS, EQ-5D-5L, SF-36, PK/PD correlations

### 6. Sample Size (sample_size)
PSO-1: N = 660 (deuc 330, pbo 165, aprem 165)
PSO-2: N = 1020 (deuc 510, pbo 255, aprem 255)

Assumptions: Deuc PASI75 55%, Aprem 35%, Placebo 5%. Alpha 0.025 one-sided, power 90%, dropout 15%.

3-scenario:
- Base: N~460 (deuc 55% vs aprem 35%)
- Conservative: N~810 (deuc 50%)
- Optimistic: N~295 (deuc 60%)

### 7. Statistical Framework (stat_framework)
- Primary: CMH test stratified by randomization factors, NRI
- Multiplicity: Hierarchical testing (closed testing/serial gatekeeping), alpha 0.025 one-sided
- Co-primaries: Both must pass before proceeding to secondary hierarchy
- Sensitivity: MI, as-observed, tipping-point, per-protocol
- Interim: IDMC safety review only at 25% and 50% enrollment; no efficacy interim
- Analysis populations: FAS (all randomized ≥1 dose), PPS, Safety Set

### 8. Stratification Factors (stratification)
1. Geographic region (North America vs Europe vs Rest of World)
2. Prior biologic therapy (yes vs no)
3. Body weight (<90 kg vs ≥90 kg)

### 9. Eligibility (eligibility)
Key Inclusion:
- Age ≥18 years
- Moderate-to-severe plaque psoriasis ≥6 months
- sPGA ≥3, PASI ≥12, BSA ≥10%
- Candidate for systemic therapy or phototherapy
- Inadequate response, intolerance, or contraindication to ≥1 conventional systemic therapy

Key Exclusion:
- Non-plaque psoriasis (guttate, erythrodermic, pustular)
- Active infection (TB, hepatitis B/C, HIV)
- Prior treatment with deucravacitinib or any TYK2 inhibitor
- Use of biologics within 5 half-lives; systemic therapy within 4 weeks; topical within 2 weeks
- Prior apremilast use (excluded to ensure unbiased active comparator)
- History of malignancy (except treated non-melanoma skin cancer)
- Severe hepatic/renal impairment; active cardiovascular disease
- Pregnancy or breastfeeding
- Live vaccines within 4 weeks

### 10. Operational (operational)
- Geography: Global multi-center (~200+ sites), North America, Europe, Asia-Pacific, Latin America
- Dosing: Deucravacitinib 6 mg QD oral tablet; Apremilast 30 mg BID with 5-day titration
- No biomarker testing required (no companion diagnostic needed for psoriasis)
- Double-dummy blinding (tablet + capsule matching)
