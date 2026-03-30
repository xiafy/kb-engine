## My Answer: Deucravacitinib [protocol-design] — Agent C

### 1. Design Type (design_type)
Two Phase 3, multi-center, randomized, double-blind, placebo- and active comparator-controlled, parallel-group, 52-week trials (PSO-1 and PSO-2). Allocation ratio 2:1:1 (deucravacitinib : placebo : apremilast). PSO-2 includes randomized withdrawal phase. ~200+ global centers each.

### 2. Control Arm (control_arm)
Three-arm: Deucravacitinib 6 mg QD + Placebo + Apremilast 30 mg BID (with 5-day titration). Apremilast chosen: same oral route, best available oral SOC, powers superiority claim for labeling. Double-dummy design for blinding integrity.

### 3. Primary Endpoint (primary_endpoint)
Co-primary endpoints (both must be achieved):
1. sPGA 0 or 1 with ≥2-grade improvement from baseline at Week 16
2. PASI 75 at Week 16
Both vs Placebo.

### 4. Endpoint Definition (endpoint_definition)
- sPGA: 5-point ordinal scale (0-4). Response = 0 or 1 AND ≥2-point improvement from baseline.
- PASI 75: ≥75% reduction from baseline PASI. PASI range 0-72, 4 body regions weighted.
- Baseline = Week 0 (Randomization Visit)
- Missing data: NRI (non-responder imputation)

### 5. Secondary Endpoints (secondary_endpoints)
Hierarchical testing sequence:
1. PASI 75 vs Apremilast Wk16
2. sPGA 0/1 vs Apremilast Wk16
3. PASI 90 vs Placebo Wk16
4. PASI 100 vs Placebo Wk16
5. sPGA 0 vs Placebo Wk16
6. PSSD Symptom Score vs Apremilast Wk16
7. PSSD Symptom Score = 0 vs Placebo Wk16
8. PASI 75 vs Apremilast Wk24
9. sPGA 0/1 vs Apremilast Wk24
10. PASI 75 continuous Wk52
11. ScPGA 0/1 (scalp) vs Placebo Wk16
12. NAPSI ≥75% (nails) vs Placebo Wk16
13. DLQI 0/1 vs Placebo Wk16
14. SF-36 PCS vs Placebo Wk16

PSO-2: Proportion losing PASI 75 in randomized withdrawal (deuc continuous vs withdrawal)

Exploratory: PASI 90/100 at Wk24/52, time to PASI 75, absolute PASI ≤1, PSSD Sign/Total, WPAI, biomarkers

### 6. Sample Size (sample_size)
PSO-1: N = 666 (deuc 332, pbo 166, aprem 166)
PSO-2: N = 1020 (larger for apremilast comparison + withdrawal sub-study)

Assumptions: Deuc PASI75 58%, Placebo 5%, Aprem 33%. Alpha 0.025 (Bonferroni), Power 90%, Dropout 15-20%.

3-scenario:
- Base: N=664/trial
- Conservative (deuc 50%, pbo 7%): N~750/trial
- Optimistic (vs aprem powered): N~1120/trial for powered apremilast comparison

### 7. Statistical Framework (stat_framework)
- Primary: CMH test stratified by randomization factors, NRI
- Multiplicity: Hierarchical/fixed-sequence gatekeeping, alpha 0.025 one-sided
- Co-primaries as gate for secondary testing
- Sensitivity: MI, tipping-point, as-observed, per-protocol
- Interim: DSMB/IDMC safety reviews only, no interim efficacy
- Populations: FAS (randomized ≥1 dose), PPS, Safety

### 8. Stratification Factors (stratification)
1. Geographic region (North America vs Europe vs Rest of World)
2. Prior biologic therapy (yes vs no)
3. Body weight (<90 kg vs ≥90 kg)

### 9. Eligibility (eligibility)
Inclusion:
- Age ≥18
- Plaque psoriasis ≥6 months
- sPGA ≥3, PASI ≥12, BSA ≥10%
- Candidate for systemic therapy or phototherapy

Exclusion:
- Non-plaque psoriasis (guttate, erythrodermic, pustular)
- Active infections (TB, HBV, HCV, HIV)
- Prior TYK2 inhibitor
- Biologics within 5 half-lives; systemics within 4 wk; topicals within 2 wk
- History of malignancy (except treated NMSC)
- Severe hepatic/renal impairment
- Pregnancy/breastfeeding
- Live vaccines within 4 weeks

### 10. Operational (operational)
- Geography: Global multi-center (~200+ sites), North America, Europe, Asia-Pacific, Latin America
- Dosing: Deucravacitinib 6 mg QD oral tablet; Apremilast 30 mg BID with 5-day titration
- No biomarker/companion diagnostic needed
- Double-dummy blinding
