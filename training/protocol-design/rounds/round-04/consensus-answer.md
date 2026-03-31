## Consensus Answer: Airsupra [protocol-design] — Round 04 (v5.1)

> Solvers: A (kimi) / B (minimax) / C (minimax)

### 1. design_type
**2 pivotal trials: (1) Event-driven PRN trial (exacerbation) + (2) Factorial fixed-dose trial (combination rule)**
All 3 Solvers correctly identified 2-trial requirement per SOP §3.2.
- Trial 1: randomized, double-blind, active-controlled (vs albuterol PRN)
- Trial 2: randomized, double-blind, factorial (FDC vs components vs placebo)
[consensus: 3/3]

### 2. control_arm
- Trial 1: Albuterol PRN (active comparator) [consensus: 3/3]
- Trial 2: 4-arm factorial (A: FDC, B: albuterol, C: budesonide, D: placebo) [consensus: 2/3, A has 5-arm QID variant]
[consensus: 3/3 on core structure]

### 3. primary_endpoint
- Trial 1: Time to first severe asthma exacerbation [consensus: 3/3]
- Trial 2: Co-primary FEV1 AUC0-6h + trough FEV1 at Week 12 [consensus: 3/3]
[consensus: 3/3]

### 4. endpoint_definition
- Trial 1: Severe exacerbation = OCS ≥3 days OR hospitalization OR ED visit [consensus: 3/3]
- Trial 2: Change from baseline in FEV1 AUC0-6h + trough FEV1; IUT convention [consensus: 3/3]
[consensus: 3/3]

### 5. secondary_endpoints
- Trial 1: Annualized exacerbation rate, ACQ-7, SABA use, QoL [consensus: 3/3]
- Trial 2: ACQ-7, PEF, rescue use [consensus: 3/3]
Hierarchical testing for secondaries [consensus: 3/3]
[consensus: 3/3]

### 6. sample_size
- Trial 1: A=3000-4000, B=1400, C=1100 → range 1100-4000
- Trial 2: A=1500-2000, B=1200, C=800 → range 800-2000
FDA: MANDALA N=3132, DENALI N=1001
[arbitrated: Trial 1 ~3000 (A closest), Trial 2 ~1000 (B/C range)]

### 7. stat_framework
- Trial 1: Cox PH, hierarchical secondary testing [consensus: 3/3]
- Trial 2: IUT for co-primaries (no alpha split), hierarchical secondaries [consensus: 3/3]
[consensus: 3/3]

### 8. stratification
- Trial 1: age + region + exacerbation history (1 vs >1) [consensus: 3/3, per SOP]
- Trial 2: age + ACQ-7 + background ICS [consensus: 3/3, per SOP]
[consensus: 3/3]

### 9. eligibility
- Trial 1: moderate-to-severe, ≥1 exacerbation/year, stable ICS/ICS-LABA background [consensus: 3/3]
- Trial 2: mild-moderate, ACQ-7 ≥1.0-1.5, measurable FEV1 [consensus: 3/3]
- Both: ≥18 years, asthma ≥1 year, exclude COPD/smoking [consensus: 3/3]
[consensus: 3/3]

### 10. operational
- Global multi-center [consensus: 3/3]
- Dosing: albuterol 180µg + budesonide 160µg per dose (2 actuations) [consensus: 3/3]
- Trial 1 PRN, Trial 2 QID fixed [consensus: 3/3]
- eDiary for rescue use tracking [consensus: 2/3]
[consensus: 3/3]
