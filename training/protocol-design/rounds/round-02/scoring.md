## Scoring: Orgovyx [protocol-design] — Round 02

> 3 Judges: J1 (kimi) / J2 (minimax) / J3 (minimax)
> Method: Majority vote (≥2/3); all-different → median

### Per-Item Scoring

| # | Item | J1 | J2 | J3 | **Final** | Rationale |
|---|------|----|----|-----|-----------|-----------|
| 1 | design_type | match | partial | miss | **partial** | All 3 different → median. AI: superiority RCT; FDA: RCT design but primary analysis as single-arm CI. Same RCT structure, different framing. |
| 2 | control_arm | match | partial | match | **match** | 2/3. Leuprolide 22.5mg 3mo depot exactly matches. Japan/Taiwan 11.25mg and antiandrogen flare are minor operational details. |
| 3 | primary_endpoint | match | match | match | **match** | 3/3. Sustained castration rate T<50 Day 29–48wk — identical endpoint type. |
| 4 | endpoint_definition | partial | miss | miss | **miss** | 2/3. AI: binary proportion (T<50 at all visits, NRI). FDA: KM cumulative probability with Greenwood CI log-log, single-arm lower bound ≥90%. Fundamentally different statistical methodology. |
| 5 | secondary_endpoints | match | match | match | **match** | 3/3. All 6 FDA key secondaries covered (NI, Day 4, Day 15, PSA, Profound, FSH). Other coverage adequate. |
| 6 | sample_size | match | match | match | **match** | 3/3. AI ~930 vs FDA 934 = 0.4% deviation. |
| 7 | stat_framework | partial | miss | miss | **miss** | 2/3. AI: superiority→NI hierarchical, α=0.025 one-sided, 1 interim OBF. FDA: single-arm KM CI lower bound ≥90%, NI rejected, α=0.05 two-sided, no interim. Different paradigm. |
| 8 | stratification | match | partial | partial | **partial** | 2/3. Region and metastatic both match. Age cutoff differs (<65/≥65 vs ≤75/>75). Coverage ~67%. |
| 9 | eligibility | partial | match | partial | **partial** | 2/3. Biomarker (no CDx) and line (≥1yr ADT) match. Key exclusions partially overlap (ADT restrictions match; AI adds MACE/QTcF/hepatic/CYP3A4; FDA has taxanes/brain mets). |
| 10 | operational | match | match | match | **match** | 3/3. Geography, central lab T, no CDx, dosing all match. |

### Summary

| Metric | Value |
|--------|-------|
| match_count | 5 |
| partial_count | 3 |
| miss_count | 2 |
| skip_count | 0 |
| total_items | 10 |
| **match_score** | **0.50** |
| **weighted_score** | **0.65** |

### Judge Agreement

| Item | Agreement | Note |
|------|-----------|------|
| 1 | 3-way split | J1 lenient (match), J3 strict (miss) — stat paradigm ambiguity |
| 4 | 2/3 | J1 partial (same direction), J2+J3 miss (different methodology) |
| 7 | 2/3 | J1 partial (same hierarchical), J2+J3 miss (different paradigm) |
| 8 | 2/3 | J1 match (all 3 factors present), J2+J3 partial (age cutoff mismatch) |
| Others | 2/3 or 3/3 | Good agreement |

### Key Failure Pattern

Items 4 and 7 share the same root cause: **FDA treated HERO as a single-arm threshold design** (lower bound 95% CI ≥90%) despite the trial being randomized. The Solvers (and the SOP) all assumed comparative analysis (superiority/NI), which is the natural framing for a 2-arm RCT. This is an ADT-class-specific regulatory convention: FDA evaluates GnRH analogues on a single-arm castration threshold, even when a comparator arm is present.
