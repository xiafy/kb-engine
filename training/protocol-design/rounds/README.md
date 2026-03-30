# Protocol Design Training Rounds

每轮训练记录保存在 `round-{NN}/` 子目录中。

## 目录结构

```
round-{NN}/
├── answer.md       ← 做题 Agent 完整输出
├── scoring.md      ← 裁判评分详情（3 裁判 × N 维度 + 多数票 + κ）
└── analysis.md     ← 差异分析 + SOP 更新决策 + 关键洞察
```

## 历史数据

Round 1-20 的训练在 v3.0 架构之前完成（2026-03-29），当时未保存独立的 rounds/ 记录。
汇总数据保留在 `results.tsv` 中（20 轮完整评分 + delta_codes + notes）。
从 Round 21 起，所有训练将按上述结构保存完整记录。
