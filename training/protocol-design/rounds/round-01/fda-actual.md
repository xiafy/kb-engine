## FDA Actual: Deucravacitinib [protocol-design]

> Source: MultidisciplineR.md, NDA 214958 (Sotyktu), Approved 2022
> Trials: IM011046 (PSO-1, NCT03624127) and IM011047 (PSO-2, NCT03611751)

### 1. Design Type (design_type)
Two Phase 3, 52-week, multicenter, randomized, double-blind, placebo- and active comparator-controlled trials with apremilast as comparator. Allocation ratio **2:1:1** (deucravacitinib 6 mg QD : placebo : apremilast 30 mg BID). Trial IM011047 additionally had a **randomized-withdrawal and maintenance period** (Week 24-52).

### 2. Control Arm (control_arm)
**Placebo + Apremilast 30 mg BID** (with initial titration per labeling: Day 1: 10 mg QD → Day 2: 10 mg BID → Day 3: 10 mg AM/20 mg PM → Day 4: 20 mg BID → Day 5: 20 mg AM/30 mg PM → Day 6+: 30 mg BID).

At Week 16: Placebo subjects switched (blinded) to deucravacitinib.
Trial IM011046: At Week 24, apremilast non-responders (PASI 50) switched to deucravacitinib.
Trial IM011047: At Week 24, deucravacitinib PASI 75 responders re-randomized 1:1 to deucravacitinib or placebo (withdrawal design).

### 3. Primary Endpoint (primary_endpoint)
**Co-primary endpoints** (both must demonstrate statistical significance):
1. **sPGA 0/1** (clear or minimal) with at least 2-grade improvement from baseline at **Week 16**
2. **PASI 75** (≥75% reduction from baseline PASI) at **Week 16**

Both compared to placebo.

### 4. Endpoint Definition (endpoint_definition)
- **sPGA**: 5-point VRS (0=Clear to 4=Severe). Components: erythema, induration, scaling; each rated 0-4, summed, averaged, rounded to nearest whole number. Response = 0 or 1 AND ≥2-grade improvement from baseline.
- **PASI**: ClinRO. Components: erythema, induration, scaling per body region (head 10%, arms 20%, trunk 30%, legs 40%); each rated 0-4, weighted by area involvement (0-6). Range 0-72. PASI 75 = ≥75% reduction from baseline.
- **Assessment**: Clinician-rated, in-person. Same assessor preferred.
- **Missing data**: NRI (primary). Sensitivity: LOCF, LOCF+NRI hybrid, MI (FCS, 1000 datasets), tipping-point analysis.
- **Analysis**: CMH test stratified by randomization factors (region, body weight, prior biologic use).
- **Analysis population**: FAS = all randomized subjects (primary). PPS as supportive.

### 5. Secondary Endpoints (secondary_endpoints)
**Dual-branch hierarchical testing (each branch α=0.025, two-sided α=0.05 for co-primaries):**

**Branch P — vs Placebo (Week 16):**
P1. PASI 90
P2. ss-PGA 0/1 (≥2-point improvement, among baseline ss-PGA ≥3)
P3. sPGA 0
P4. PASI 100
P5. PSSD symptom score of 0 (among baseline ≥1)
P6. PGA-F 0/1 (≥2-point improvement, among baseline PGA-F ≥3)

**Branch A — vs Apremilast:**
A1. sPGA 0/1 at Week 16
A2. PASI 75 at Week 16
A3. PASI 90 at Week 16
A4. sPGA 0/1 at Week 24
A5. PASI 75 at Week 24
A6. PASI 90 at Week 24
A7. Change from baseline in PSSD symptom score at Week 16
A8. ss-PGA 0/1 at Week 16 (among baseline ss-PGA ≥3)

**Trial IM011046 additional (vs Apremilast):**
A9. sPGA 0/1 at Week 52 and Week 24
A10. PASI 75 at Week 52 and Week 24
A11. PASI 90 at Week 52 and Week 24
A12. sPGA 0 at Week 16
A13. PSSD symptom score of 0 at Week 16 (among baseline ≥1)

**Trial IM011047 additional (vs Apremilast):**
A9. sPGA 0 at Week 16
A10. PSSD symptom score of 0 at Week 16 (among baseline ≥1)

"Additional secondary" endpoints not in MTP → exploratory.

### 6. Sample Size (sample_size)
- **Trial IM011046 (PSO-1)**: ~600 planned → **666 randomized** (deuc 332, pbo 166, aprem 168) [Note: Site 0092 excluded from primary analysis]
  - Actual N analyzed: deuc 330, pbo 166, aprem ~165
- **Trial IM011047 (PSO-2)**: ~1000 planned → **1020 randomized** (deuc 511, pbo 255, aprem 254)

### 7. Statistical Framework (stat_framework)
- **Primary test**: CMH test stratified by region, body weight (<90/≥90 kg, not applied in Japan/China), prior biologic use
- **Alpha**: Each co-primary tested at **two-sided α=0.05**. Both must be significant for trial success.
- **Multiplicity for secondaries**: Dual-branch hierarchical testing, each branch **α=0.025 two-sided**. Sequential gatekeeping within each branch — testing stops at first non-significant result.
- **Co-primaries gate secondaries**: Secondary testing proceeds only if both co-primaries significant.
- **Sensitivity**: NRI (primary), LOCF, LOCF+NRI hybrid, MI (FCS, 1000 datasets, Rubin's rules), tipping-point
- **Continuous endpoints**: ANCOVA with treatment + stratification factors as fixed effects, baseline as covariate. Missing data: mBOCF.
- **No interim efficacy analysis** specified in protocols.

### 8. Stratification Factors (stratification)
1. **Geographic region** (Trial 046: US, Japan, China, Rest of World; Trial 047: US, Rest of World)
2. **Previous biologic use** (psoriasis, PsA, or other inflammatory disease; yes/no)
3. **Body weight** (≥90 kg vs <90 kg; not applied in Japan or China)

### 9. Eligibility (eligibility)
**Key Inclusion:**
- Male or female ≥18 years old
- Diagnosed with stable plaque psoriasis ≥6 months
- Eligible for phototherapy or systemic therapy (investigator-deemed)
- BSA involvement ≥10% at screening AND baseline
- PASI ≥12 at screening AND baseline
- sPGA ≥3 at screening AND baseline

**Key Exclusion:** [Standard exclusions from protocols — not fully enumerated in Clinical Review. Typical for psoriasis trials: non-plaque forms, active infections, prior TYK2 inhibitor, washout periods for prior therapies, etc.]

### 10. Operational (operational)
- **Geography**: Trial 046: 11 countries (Canada, China, Germany, Japan, Poland, Russia, South Korea, Spain, Taiwan, UK, US). Trial 047: 16 countries (Australia, Canada, Czech Republic, Finland, France, Germany, Hungary, Israel, Italy, New Zealand, Poland, Puerto Rico, Spain, Sweden, UK, US). **Global multi-center.**
- **Dosing**: Deucravacitinib 6 mg QD oral tablet. Apremilast 30 mg BID with 5-day titration.
- **No biomarker testing required** (no companion diagnostic).
- **Double-dummy blinding** (implicit from double-blind design with different formulations/schedules).
- **Visits**: Screening, baseline, Weeks 1, 2, 4, then every 4 weeks through Week 52. Safety follow-up at Week 56.

### Actual Results (for reference)
| Endpoint | Trial 046 Deuc | Trial 046 PBO | Trial 047 Deuc | Trial 047 PBO |
|----------|---------------|---------------|----------------|---------------|
| sPGA 0/1 | 54% | 7% | 50% | 9% |
| PASI 75 | 58% | 13% | 53% | 9% |
