## Scoring: Vyloy [protocol-design] — Round 03 v2 (v5.1 信息隔离)

> 3 Judges: J1 (kimi) / J2 (minimax) / J3 (minimax)
> J2+J3 used continuous scoring (0-1), mapped: 1.0→match, 0.5-0.9→partial, <0.5→miss

| # | Item | J1 | J2 | J3 | **Final** | Rationale |
|---|------|----|----|-----|-----------|-----------|
| 1 | design_type | match | match | partial | **match** | DB 1:1 placebo design matches; trial count not scored |
| 2 | control_arm | partial | partial | partial | **partial** | Chemo-only correct; AI said "FP/platinum" generically vs FDA's specific mFOLFOX6/CAPOX |
| 3 | primary_endpoint | match | partial | match | **match** | PFS type matches; BICR=IRC |
| 4 | endpoint_definition | match | match | match | **match** | BICR RECIST 1.1 ITT consistent |
| 5 | secondary_endpoints | match | partial | partial | **partial** | OS+ORR+DOR covered; TTCD hierarchy position differs |
| 6 | sample_size | match | partial | match | **match** | AI N≈565 vs FDA SPOTLIGHT 565 = 0% deviation |
| 7 | stat_framework | match | match | partial | **match** | Hierarchical + OBF consistent |
| 8 | stratification | match | match | match | **match** | SOP 3 factors 100% coverage |
| 9 | eligibility | match | match | match | **match** | CLDN18.2+/HER2-neg/1L/ECOG all match |
| 10 | operational | partial | partial | partial | **partial** | Geography + CDx match; dosing unspecified (question only gave formulation, not dose regimen) |

### Summary
match: 7 | partial: 3 | miss: 0 | skip: 0
**match_score: 0.70 | weighted_score: 0.85**

### Comparison: v5.0 (intel-allowed) vs v5.1 (info-isolated)

| Metric | R3 v5.0 | R3 v2 (v5.1) | Delta |
|--------|---------|-------------|-------|
| match_score | 1.00 | 0.70 | -0.30 |
| weighted_score | 1.00 | 0.85 | -0.15 |

v5.1 信息隔离使得 match_score 从 1.00 降到 0.70 — 证实 v5.0 满分中 ~30% 来自情报检索。
v5.1 的 0.70 才是 SOP 真实预测能力的度量。

### partial 根因
- Item 2: SOP 没有指定具体化疗方案名称（mFOLFOX6 vs CAPOX），只有"FP+platinum"通用描述
- Item 5: TTCD 在层级中的位置和 PRO 工具选择有分歧
- Item 10: 剂量方案（800/600 mg/m² Q3W）无法从 SOP 或通用知识推导 — 需要 Phase 1/2 数据
