## FDA Actual: Orgovyx [protocol-design] — Round 02

> Source: NDA214621 MultidisciplineR.md (HERO study, MVT-601-3201)

### 1. design_type
**Multinational, randomized (2:1), open-label, parallel-group study.**
- 934 patients randomized 2:1 (relugolix 624 : leuprolide 310)
- Open-label (injectable vs oral, blinding not feasible)
- 155 centers globally (North/South America, Europe, Asia/Rest of World)
- 48 weeks treatment

### 2. control_arm
**Leuprolide acetate 22.5 mg 3-month depot SC injection (or 11.25 mg in Japan and Taiwan)**
- Leuprolide group could receive antiandrogen for first 4 weeks for flare management
- Single active comparator (not IC)

### 3. primary_endpoint
**Sustained castration rate — cumulative probability of testosterone suppression to <50 ng/dL from Day 29 through 48 weeks**
- **Critical FDA position**: FDA preferred single-arm confidence interval approach (lower bound 95% CI ≥90%). FDA communicated that a two-arm trial was not necessary — the single investigational arm demonstrating maintenance of castrate T level is sufficient.
- Result: 96.7% (95% CI 94.9, 97.9), lower bound >90% ✓

### 4. endpoint_definition
- Kaplan-Meier estimate of cumulative probability of sustained T <50 ng/dL from Week 5 Day 1 (Day 29) through Week 49 Day 1 (Day 337)
- 95% CI using exponential Greenwood formula via log-log transformation
- Testosterone measured at screening, Days 1/4/8/15/29, then monthly through Week 48
- **FDA's analysis approach**: single-arm CI (not comparative), lower bound ≥90%

### 5. secondary_endpoints
**Key secondary endpoints (hierarchical testing order):**
1. Sustained castration rate NI (relugolix vs leuprolide) — **FDA rejected NI design as unacceptable**
2. Castration rate at Week 1 Day 4
3. Castration rate at Week 3 Day 1 (Day 15)
4. Confirmed PSA response rate at Week 3 Day 1
5. Profound castration rate (<20 ng/dL) at Week 3 Day 1
6. FSH level at Week 25 Day 1
7. (Final analysis: castration resistance-free survival, time to testosterone recovery)

**Other secondary (not alpha-controlled):**
- Time course of sustained profound castration (<20 ng/dL)
- Timing of testosterone recovery (to ≥50 ng/dL and ≥280 ng/dL)
- PSA response rate and time to PSA progression
- FSH levels over time
- PRO: EORTC QLQ-C30, QLQ-PR25, EQ-5D-5L (exploratory only, not alpha-controlled)
- Overall survival (exploratory, KM method)

**FDA note**: NI endpoint rejected; PRO all exploratory; other secondaries considered supportive.

### 6. sample_size
**N = 934 (originally ~915 targeted for Cohort 1)**
- Relugolix: 624 (completed: 563)
- Leuprolide: 310 (completed: 276)
- Assumptions: sustained suppression 94% (relugolix) and 96% (leuprolide); 2:1 ratio; 15% dropout
- For Criterion 1 (single-arm ≥90%): 610 relugolix patients → 90% power at α=0.05 two-sided
- For Criterion 2 (NI): ~915 total → 99% power (NI margin based on degarelix precedent)

### 7. stat_framework
- **Primary analysis**: Single-arm KM estimate with 95% CI; success = lower bound ≥90% (FDA-preferred approach)
- **NOT comparative superiority**: FDA explicitly rejected NI/superiority framing
- Hierarchical testing for key secondaries (fixed sequence, FWER at α=0.05 two-sided)
- No interim analysis described in the primary analysis
- KM method + exponential Greenwood CI
- Analysis populations: mITT

### 8. stratification
**3 factors:**
1. Geographic region (Europe / North and South America / Asia and Rest of World)
2. Presence of metastatic disease (yes / no) — regional lymph node metastases (N1) stratified as nonmetastatic
3. Age (≤75 years / >75 years)

### 9. eligibility
**Inclusion:**
- Candidate for ≥1 year continuous ADT for androgen-sensitive advanced prostate cancer
- Not candidate for surgical therapy
- Biochemical relapse (rising PSA) after curative-intent local therapy, OR newly diagnosed metastatic (excluding brain mets), OR advanced localized disease
- Baseline serum testosterone ≥150 ng/dL

**Exclusion:**
- Recent ADT use (within 3 months)
- Long cumulative ADT (>18 months)
- Previously treated with or expected to receive taxanes within 2 months of ADT initiation
- Brain metastases excluded

### 10. operational
- **Geography**: 155 centers globally — North/South America, Europe, Asia/Rest of World
- **Biomarker testing**: No CDx. Testosterone measured centrally at screening, D1/4/8/15/29, then monthly. Additional endocrine: LH, FSH, DHT, SHBG.
- **Dosing**: Relugolix 360mg load D1 → 120mg QD × 48wk; Leuprolide 22.5mg SC q3mo (11.25mg in Japan/Taiwan) × 48wk
- **PRO**: EORTC QLQ-C30, QLQ-PR25, EQ-5D-5L (baseline + q2-3mo)
- **Safety**: AEs, labs, vitals, 12-lead ECG, physical exam, visual acuity
- **PK**: Predose samples throughout; intensive PK on D1 and W2 (Japan)
- **Testosterone recovery substudy**: ~150 patients who completed 48wk, followed 90 days post-treatment
