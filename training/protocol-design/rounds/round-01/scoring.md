## Scoring: Deucravacitinib [protocol-design] — Round 01

> 3 Judges, majority vote. Sessions: Judge 1 (c3b6472c), Judge 2 (bc69f9a3), Judge 3 (d452cd0c)

### Per-Item Majority Vote

| # | Dimension | J1 | J2 | J3 | **Majority** | Rationale |
|---|-----------|----|----|----|----|-----------|
| 1 | design_type | match | match | match | **match** | 3/3 unanimous. All macro-architecture elements identical. |
| 2 | control_arm | match | partial | partial | **partial** | 2/3 partial. AI correctly identified placebo + apremilast 30mg BID with titration, but added "double-dummy" detail not explicitly in FDA text. J1 argues this is operational detail, J2/J3 mark partial for adding element not in FDA spec. |
| 3 | primary_endpoint | match | match | match | **match** | 3/3 unanimous. Co-primary sPGA 0/1 + PASI 75 at Wk16 exactly matches. |
| 4 | endpoint_definition | partial | partial | partial | **partial** | 3/3 unanimous. AI captured core scale criteria (sPGA 0-4, 0/1+≥2pt; PASI 0-72; NRI) but missed: (1) sPGA subscale averaging/rounding method, (2) full sensitivity cascade (LOCF, LOCF+NRI hybrid, MI FCS 1000 datasets, tipping-point). |
| 5 | secondary_endpoints | match | match | match | **match** | 3/3 unanimous. All P1-P6 key secondaries + A1-A8 apremilast branch + Wk52 covered. key_coverage=100%. |
| 6 | sample_size | match | match | match | **match** | 3/3 unanimous. AI 660/1020 vs FDA 666/1020 = 0.9%/0% deviation. |
| 7 | stat_framework | partial | partial | partial | **partial** | 3/3 unanimous. AI correctly identified CMH, dual-branch hierarchical, α=0.025 for secondaries, no interim. Missed: co-primaries tested at α=0.05 two-sided each (not 0.025). |
| 8 | stratification | match | match | match | **match** | 3/3 unanimous. All 3 factors (region, prior biologic, body weight) identified. 100% coverage. |
| 9 | eligibility | partial | match | match | **match** | 2/3 match. Core inclusion criteria all captured. J1 noted missing "stable" qualifier and "screening AND baseline" dual-timepoint requirement. |
| 10 | operational | match | match | match | **match** | 3/3 unanimous. Geography (global), dosing (6mg QD / 30mg BID), no biomarker — all match. |

### Summary

| Metric | Value |
|--------|-------|
| match | 7 |
| partial | 3 (Items 2, 4, 7) |
| miss | 0 |
| skip | 0 |
| **match_score** | **0.70** |
| **weighted_score** | **0.85** |

### Inter-Judge Agreement

| Item | Agreement | Note |
|------|-----------|------|
| 1,3,5,6,8,10 | 3/3 match | Full consensus |
| 4,7 | 3/3 partial | Full consensus |
| 2 | 2/3 partial | J1 gave match (double-dummy is operational detail) |
| 9 | 2/3 match | J1 gave partial (missing "stable" and dual-timepoint) |
