## My Answer: Orgovyx [protocol-design] — Solver B (minimax)

### 1. design_type
Open-label, randomized (2:1), parallel-group, multinational Phase 3 pivotal trial with active control. Blinding not feasible (injectable vs oral route). Open-label mitigated by objective laboratory endpoint.

### 2. control_arm
Leuprolide acetate 3-month depot injection (22.5 mg or 11.25 mg SC q12w per regional label). Single dominant SOC; no IC needed. ⚠️ SDP: Could add degarelix arm (3-arm 2:1:1).

### 3. primary_endpoint
Sustained testosterone suppression rate — proportion of patients achieving and maintaining castrate T (<50 ng/dL) at all measurements Day 29–Week 48.

### 4. endpoint_definition
- Central lab (LC-MS/MS or validated immunoassay)
- Numerator: all post-Day-29 T values <50 ng/dL through Week 48
- Denominator: mITT (randomized, ≥1 dose, ≥1 post-baseline T)
- Discontinuation/alternative ADT/orchiectomy/missing = treatment failure (NRI)
- Treatment policy estimand

### 5. secondary_endpoints
1. Sustained castration (per-protocol population)
2. Sustained profound suppression (<20 ng/dL) Day 29–48w
3. T <50 ng/dL at Day 4 (flare prevention)
4. T <50 ng/dL at Day 15
5. PSA response (≥80% reduction) at Day 15
6. FSH at 6 months (geometric mean)
7. Testosterone recovery (time to T ≥280 ng/dL post-last dose)
8. MACE-free survival (MI, stroke, CV death)
9. PRO: FACT-P total score (time to ≥5-point deterioration)
10. Bone marker ratio (urine NTX/Cr)

### 6. sample_size
- Expected: p1=96.7%, p2=88.8%, delta=7.9%
- Calculated: base N=413 (α=0.025 one-sided, 90% power, 2:1)
- With 10% dropout: N=459 (306:153)
- ⚠️ SDP: If MACE powered analysis desired, increase to ~900+
- HERO enrolled 934 for CV safety characterization

### 7. stat_framework
- Primary: Superiority H0: p_relu ≤ p_leu, α=0.025 one-sided
- Step 2: NI confirmatory (margin -10pp)
- Hierarchical fixed-sequence for secondaries
- Interim: Week 24 (50% info), O'Brien-Fleming, DSMB
- Populations: mITT / PP / Safety
- Covariate adjustment: logistic regression with stratification factors

### 8. stratification
1. Geographic region (North America / Europe / Asia-Pacific or RoW)
2. Metastatic disease at baseline (M1 vs M0)
3. Age (<65 vs ≥65)

### 9. eligibility
**Inclusion**: Males ≥18; confirmed prostate adenocarcinoma; requiring ≥12mo ADT (biochemical relapse OR locally advanced OR metastatic); castration-sensitive (no prior ADT >3mo, no prior chemo for mets); T ≥150 ng/dL; ECOG 0-1; adequate organ function
**Exclusion**: Prior GnRH antagonists; prior orchiectomy; brain mets; MACE within 6 months; uncontrolled HTN (>160/100); ALT/AST >3×ULN or cirrhosis; QTcF >450ms; severe renal impairment (CrCl <30); strong CYP3A4 inducers/P-gp modulators; GI malabsorption

### 10. operational
- Geography: Global ~150-200 sites (NA + EU + Asia-Pacific/Japan), per ICH E17
- No CDx required; central testosterone LC-MS/MS at all timepoints
- Dosing: relugolix 360mg load D1 → 120mg QD; leuprolide 22.5mg or 11.25mg SC q12w per local label
- ECG centralized core lab for QTc monitoring
- Dose reductions for relugolix: 120mg → 80mg (Grade 3+ toxicity)
