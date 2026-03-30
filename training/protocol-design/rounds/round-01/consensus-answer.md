## Consensus Answer: Deucravacitinib [protocol-design]

> Based on Agent A + Agent C answers (Agent B timed out). Consensus from 2 independent agents.

### 1. Design Type (design_type)
Two Phase 3, multi-center, randomized, double-blind (double-dummy), placebo- and active comparator-controlled, parallel-group, 52-week trials. Allocation ratio 2:1:1 (deucravacitinib : placebo : apremilast). Second trial (PSO-2) includes randomized withdrawal phase for durability assessment.
**[consensus: 2/2]**

### 2. Control Arm (control_arm)
Three-arm: Placebo + Apremilast 30 mg BID (with standard 5-day titration per label). Double-dummy design for blinding. Apremilast chosen as relevant oral SOC comparator — same route, well-characterized efficacy, powers superiority claim for labeling differentiation.
**[consensus: 2/2]**

### 3. Primary Endpoint (primary_endpoint)
Co-primary endpoints (both must be statistically significant vs placebo):
1. sPGA 0 or 1 with ≥2-grade improvement from baseline at Week 16
2. PASI 75 (≥75% reduction from baseline PASI) at Week 16
**[consensus: 2/2]**

### 4. Endpoint Definition (endpoint_definition)
- sPGA: 5-point ordinal scale (0-4). Response = score 0 or 1 AND ≥2-point improvement from baseline. Clinician-assessed.
- PASI 75: ≥75% reduction from baseline PASI (range 0-72, 4 body regions weighted by area).
- Baseline = Week 0 (Randomization Visit)
- Missing data: Non-responder imputation (NRI)
- Assessment timepoints: Baseline, Weeks 4, 8, 12, 16, 24, 32, 40, 52
**[consensus: 2/2]**

### 5. Secondary Endpoints (secondary_endpoints)
Hierarchical testing with two parallel branches (vs Placebo and vs Apremilast):

**vs Placebo (Wk16):**
1. PASI 90
2. ss-PGA 0/1 (scalp, among baseline ss-PGA ≥3)
3. sPGA 0 (complete clearance)
4. PASI 100
5. PSSD Symptom Score = 0 (among baseline ≥1)
6. PGA-F 0/1 (nails, among baseline PGA-F ≥3)

**vs Apremilast:**
1. sPGA 0/1 at Wk16
2. PASI 75 at Wk16
3. PASI 90 at Wk16
4. sPGA 0/1 at Wk24
5. PASI 75 at Wk24
6. PASI 90 at Wk24
7. Change from baseline in PSSD symptom score at Wk16
8. ss-PGA 0/1 at Wk16
9-13. Wk52 comparisons (Trial 1 only)

**[consensus: 2/2, note: Both agents identified the same key secondaries. Agent A had slightly different ordering within placebo branch (PASI 90 → PASI 100 → sPGA 0 before scalp/nails); Agent C placed vs-Apremilast comparisons first. Adopted dual-branch structure with FDA-standard ordering: PASI 90 → scalp → sPGA 0 → PASI 100 → PSSD → nails for placebo branch.]**

### 6. Sample Size (sample_size)
- PSO-1: N ≈ 660 (deuc ~330, pbo ~165, aprem ~165)
- PSO-2: N ≈ 1020 (deuc ~510, pbo ~255, aprem ~255)

Assumptions: Deuc PASI75 ~55-58%, Placebo ~5%, Apremilast ~33-35%. Alpha 0.025 one-sided (or 0.05 two-sided), Power 90%, Dropout 15-20%.
**[consensus: 2/2, minor variation in assumed rates — A: 55% deuc, C: 58% deuc]**

### 7. Statistical Framework (stat_framework)
- Primary analysis: CMH test stratified by randomization factors (region, prior biologic use, body weight), NRI
- Multiplicity: Hierarchical testing (closed sequential gatekeeping); co-primaries as gate; dual branches (vs placebo α=0.025, vs apremilast α=0.025)
- Sensitivity: MI, tipping-point, LOCF, as-observed, per-protocol
- No interim efficacy analysis; DSMB/IDMC safety reviews only
- Populations: FAS (all randomized), PPS, Safety Set
**[consensus: 2/2]**

### 8. Stratification Factors (stratification)
1. Geographic region
2. Prior biologic therapy (yes vs no)
3. Body weight (<90 kg vs ≥90 kg)
**[consensus: 2/2]**

### 9. Eligibility (eligibility)
**Key Inclusion:**
- Age ≥18 years
- Plaque psoriasis ≥6 months
- sPGA ≥3, PASI ≥12, BSA ≥10% at screening and baseline
- Candidate for systemic therapy or phototherapy

**Key Exclusion:**
- Non-plaque psoriasis (guttate, erythrodermic, pustular)
- Active infections (TB, HBV, HCV, HIV)
- Prior TYK2 inhibitor use
- Biologics within 5 half-lives; systemics within 4 weeks; topicals within 2 weeks
- History of malignancy (except treated NMSC)
- Severe hepatic/renal impairment
- Pregnancy/breastfeeding
- Live vaccines within 4 weeks
**[consensus: 2/2]**

### 10. Operational (operational)
- Geography: Global multi-center (~200+ sites), North America, Europe, Asia-Pacific, Latin America
- Dosing: Deucravacitinib 6 mg QD oral tablet; Apremilast 30 mg BID with 5-day titration
- No biomarker/companion diagnostic required
- Double-dummy blinding (tablet + capsule matching)
**[consensus: 2/2]**
