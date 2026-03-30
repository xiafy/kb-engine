# Scoring: Inluriyo [protocol-design] — Validation Round V0

## 裁判原始评分

| # | Item | Judge A | Judge B | Judge C | **Majority** |
|---|------|---------|---------|---------|-------------|
| 1 | design_type | partial | partial | partial | **partial** |
| 2 | control_arm | match | match | partial | **match** |
| 3 | primary_endpoint | match | match | match | **match** |
| 4 | endpoint_definition | miss | partial | miss | **miss** |
| 5 | secondary_endpoints | partial | partial | partial | **partial** |
| 6 | sample_size | partial | partial | partial | **partial** |
| 7 | stat_framework | match | match | match | **match** |
| 8 | stratification | partial | partial | partial | **partial** |
| 9 | eligibility | partial | match | match | **match** |
| 10 | operational | partial | match | match | **match** |

## 裁判间一致性

| Item | 一致性 | 说明 |
|------|--------|------|
| 1 | 3/3 一致 | 全部 partial（3-arm vs 2-arm）|
| 2 | 2/3 | A+B: match, C: partial（对照药物列表差异）|
| 3 | 3/3 一致 | 全部 match |
| 4 | 2/3 | A+C: miss, B: partial（BICR vs INV 分歧）|
| 5 | 3/3 一致 | 全部 partial |
| 6 | 3/3 一致 | 全部 partial（31.4% 偏差）|
| 7 | 3/3 一致 | 全部 match |
| 8 | 3/3 一致 | 全部 partial（ESR1m 假阳性因子）|
| 9 | 2/3 | B+C: match, A: partial（入排细节差异）|
| 10 | 2/3 | B+C: match, A: partial（BICR 影响运营评分）|

裁判间完全一致：7/10 项（70%）。分歧 3 项均为相邻评级（match↔partial 或 partial↔miss）。

## 多数票汇总

- **match: 5** (control_arm, primary_endpoint, stat_framework, eligibility, operational)
- **partial: 4** (design_type, secondary_endpoints, sample_size, stratification)
- **miss: 1** (endpoint_definition)

## 最终得分

| 指标 | 值 |
|------|-----|
| match_score | **0.50** (5/10) |
| weighted_score | **0.70** (5×1 + 4×0.5 + 1×0) / 10 |

## 裁判个体得分对比

| 裁判 | match_score | weighted_score |
|------|------------|----------------|
| A | 0.30 | 0.60 |
| B | 0.50 | 0.75 |
| C | 0.40 | 0.65 |
| **多数票** | **0.50** | **0.70** |

## 校准分析

原始 R20 Inluriyo 得分：match 1.00（自评）→ 校准系数 0.75 → 校准后 0.75
本次独立裁判多数票：match 0.50
差异：-0.25（裁判比校准自评更严格）

关键差异源：
1. Item 4（endpoint_definition）：BICR vs INV 是 miss 而非 match — SOP 实际有 inv-PFS 豁免规则但做题 Agent 未正确应用
2. Item 1（design_type）：3-arm vs 2-arm — 做题 Agent 无法预测联合臂的加入
3. Item 8（stratification）：ESR1m 不应是分层因子 — SOP 规则被过度应用
