## My Answer: Orgovyx [protocol-design] — Solver C (minimax)

### 1. design_type
Phase 3, randomized (2:1), open-label, parallel-group, active-control superiority trial. Open-label justified: non-cytotoxic, same mechanism class, objective lab endpoint (testosterone). 2:1 allocation.

### 2. control_arm
Leuprolide acetate 3-month depot 22.5 mg SC q12w — the most widely used GnRH agonist worldwide. Single dominant SOC, no IC needed.

### 3. primary_endpoint
Proportion of patients with sustained testosterone suppression to castrate levels (<50 ng/dL) from Day 29 through Week 48.

### 4. endpoint_definition
- Numerator: T <50 ng/dL at ALL scheduled assessments Day 29–Week 48 (visits at D29, W8, W16, W24, W32, W40, W48)
- Denominator: mITT (randomized, ≥1 dose, ≥1 post-baseline T)
- Central lab LC-MS/MS
- Missing = NOT sustained suppression (unless censored by death/intercurrent event)
- Assessment window ±3 days
- No BICR needed (objective quantitative lab assay)

### 5. secondary_endpoints
1. NI of relugolix vs leuprolide (sustained suppression, NI margin 10pp)
2. Superiority on sustained suppression (if NI established)
3. T <50 ng/dL at Day 4 (no flare claim)
4. Profound castration (<20 ng/dL) at Day 15
5. Testosterone recovery at 90 days post-last dose (~180 patient subgroup)
6. MACE composite (MI, stroke, CV death) — HR, 2-sided 95% CI
7. PSA response (≥50% decline) at Week 24
8. Time to PSA progression (PCWG-2 criteria)
9. PRO: EORTC QLQ-C30 TTCD (≥10-point decline)

### 6. sample_size
- Expected: p1=96.7%, p2=88.8%, delta=7.9%
- Calculated: base evaluable N=663 (442:221, α=0.05 two-sided, 90% power, 2:1)
- With 15% dropout: N≈930 (rounded up)
- ⚠️ SDP: If CV safety claim primary differentiator, consider ~900+ for MACE analysis

### 7. stat_framework
- Primary: CMH chi-square, α=0.05 two-sided (or 0.025 one-sided)
- Hierarchical testing: primary superiority → NI (margin -10pp) → Day 4 → Day 15 → recovery → MACE → PSA → TTPP → PRO
- Interim: IA1 at W24 (50% info, OBF futility); IA2 at W36 (75% info, SSR with cap N=1000)
- Final: Week 48 database lock
- Populations: mITT / PP; treatment policy estimand; tipping-point sensitivity

### 8. stratification
1. Metastatic status (M1 metastatic vs M0 non-metastatic)
2. ECOG (0 vs 1-2)
3. Geographic region (North America / Europe / Asia-Pacific or RoW)

### 9. eligibility
**Inclusion**: Males ≥18; histologically confirmed prostate adenocarcinoma; requiring continuous ADT ≥12mo; T ≥150 ng/dL; ECOG 0-1; expected survival ≥12mo; no more than 18mo cumulative prior ADT
**Exclusion**: Prior GnRH antagonists; prior chemo for prostate cancer within 12mo; brain mets; MACE within 6 months (MI, ACS, stroke, TIA, NYHA III-IV); QTcF >450ms; ALT/AST >3×ULN or bilirubin >2×ULN; CrCl <30; strong CYP3A4 inducers/P-gp modulators; prior orchiectomy; severe constipation/GI malabsorption

### 10. operational
- Geography: Global ~200 sites (NA, EU5+Eastern Europe, Asia-Pacific/Japan/Australia/SK/Taiwan)
- No CDx required; central testosterone LC-MS/MS at all timepoints
- Dosing: relugolix 360mg load D1 → 120mg QD; leuprolide 22.5mg SC q12w
- PRO: EORTC QLQ-C30 completed before blood draw at each visit
- CV adjudication by independent blinded committee
