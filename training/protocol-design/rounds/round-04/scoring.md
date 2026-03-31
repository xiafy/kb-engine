## Scoring: Airsupra [protocol-design] — Round 04 (v5.1)

> match: 8 | partial: 2 | miss: 0 | match_score: 0.80 | weighted_score: 0.90

| # | Item | Final | Rationale |
|---|------|-------|-----------|
| 1 | design_type | match | 2-trial (PRN event-driven + factorial) correctly predicted |
| 2 | control_arm | partial | T1 albuterol match; T2 4-arm vs FDA 5-arm (extra BDA 80/180 dose) |
| 3 | primary_endpoint | match | T1 exacerbation + T2 co-primary FEV1 AUC+trough |
| 4 | endpoint_definition | match | Same definitions |
| 5 | secondary_endpoints | partial | Annualized rate match; missed SCS use (MANDALA) and FEV1 onset/duration (DENALI) |
| 6 | sample_size | match | T1 ~3000 vs 3132 (4%); T2 ~1000 vs 1001 (0%) |
| 7 | stat_framework | match | Cox PH + IUT + hierarchical |
| 8 | stratification | match | Both trials' factors match SOP exactly |
| 9 | eligibility | match | Severity split (mod-severe/mild) correct |
| 10 | operational | match | Global, correct dosing 180/160µg |

### Key: SOP §3.2 drove 2-trial design; respiratory SOP drove stratification. Partial on T2 arms (dose-ranging arm not predictable from SOP) and secondary endpoints (SCS use not in SOP).
