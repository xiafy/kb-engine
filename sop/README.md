# SOP 服务目录 — PM Agent 路由表

> **版本**: v1.0 | **更新**: 2026-03-30

## 服务总览

| # | core/ SOP | 能力描述 | 训练状态 | FDA Review 答案章节 |
|---|-----------|---------|---------|-------------------|
| 1 | `protocol-design.md` | Protocol 设计（8 步决策流程） | ✅ v2.2（59 规则，20 案例） | Clinical Review — Trial Design |
| 2 | `sap-design.md` | SAP 统计设计 | ⬜ 待训练 | Statistical Review |
| 3 | `stat-analysis.md` | 统计分析执行 | ⬜ 待训练 | Statistical Review |
| 4 | `clinical-pharm.md` | 临床药理评估 | ⬜ 待训练 | Clinical Pharmacology Review |
| 5 | `efficacy-assessment.md` | 疗效评价 | ⬜ 待训练 | Clinical Review — Efficacy |
| 6 | `safety-assessment.md` | 安全性评价 | ⬜ 待训练 | Clinical Review — Safety |
| 7 | `regulatory-strategy.md` | 监管策略决策 | ⬜ 待训练 | 贯穿全文 |
| 8 | `labeling-review.md` | 标签审核 | ⬜ 待训练 | Labeling Review |
| 9 | `post-marketing.md` | 上市后要求预测 | ⬜ 待训练 | PMR/PMC sections |

## PM Agent 路由规则

```
收到客户请求
    ↓
识别任务类型 → 匹配 core/ SOP（见上表）
    ↓
检查训练状态：
  ✅ → 加载 SOP + domains/ + indications/ + regulatory/ → 执行
  ⬜ → 告知客户该能力尚未就绪，或降级为通用 LLM 响应
    ↓
执行 SOP → 按 templates/ 格式化输出 → 交付
```

## 加载示例

```
任务: "评审一个 ER+/HER2- 乳腺癌 Phase 3 Protocol"

加载:
  1. sop/core/protocol-design.md          ← 必读
  2. sop/domains/oncology-solid.md         ← 疾病大类
  3. sop/indications/breast-er-her2neg.md  ← 适应症特定
  4. (无特殊监管路径)

输出: 按 sop/templates/protocol-review-report.md 格式
```

## 工作流依赖

```
Protocol Design ──→ SAP Design ──→ Stat Analysis
       │                                  │
       ↓                                  ↓
Regulatory Strategy              Efficacy Assessment
       │                         Safety Assessment
       ↓                                  │
  Labeling Review ←───────────────────────┘
       │
       ↓
  Post-marketing
```

## 目录约定

- `core/` — 每个文件 ≤200 行，按决策步骤组织，零附录
- `domains/` — 每个文件 ≤200 行，多维度 section（Trial Design / Safety / CRF）
- `indications/` — 每个文件 ≤100 行，训练中自动增长
- `regulatory/` — 每个文件 ≤100 行
- `templates/` — 每个 core/ SOP 对应一个交付模板
