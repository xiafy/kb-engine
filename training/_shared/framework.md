# framework.md — 闭环训练通用骨架

> **版本**: v2.0 | **日期**: 2026-04-01
> **性质**: 所有训练分支共享的流程骨架。只定义步骤名称、输入/输出契约和不变量。
> **每个分支的 program.md 实现这些步骤的具体逻辑。**

---

## 新训练创建流程（framework 之上）

**每个新训练分支启动前，必须先完成训练方案设计。program.md / evaluate.md 等流程文档是方案设计的产出，不是起点。**

```
Phase 0: 训练方案设计（必须先完成，产出训练方案文档）
  ├─ 明确训练目标：这个分支要让 Agent 具备什么能力？
  ├─ 定义训练范围：覆盖哪些决策维度？边界在哪？
  ├─ 梳理需求：需要什么数据源、评分标准、领域知识？
  ├─ 分析差异：与已有分支（如 PD）的本质差异是什么？
  ├─ 设计评分体系：维度定义 + 评分标准 + 判例
  └─ Boss 确认训练方案

Phase 1: 生成流程文档（基于训练方案）
  ├─ 编写 program.md（训练程序，实现 framework.md 骨架）
  ├─ 编写 evaluate.md（评分标准）
  ├─ 创建 case-config.json + config.yaml
  └─ 创建种子 SOP

Phase 2: 验证 & 训练
  ├─ 3 个案例 baseline
  ├─ 正式训练
  └─ 收尾（SOP 清洗 + 版本标记）
```

---

## 训练执行流程骨架

v6 推荐采用**文件驱动 phase 架构**：

```text
P0 预处理（脚本）
P1 Solver ×N（独立 session）
P2 共识合并
P3 标准答案格式化
P4 Judge ×N + Scoring Merge
P5 差异分析 + 规则溯源 + SOP patch
P6 收尾 + results.tsv + 收敛判断
```

其中：
- 脚本 phase 负责配置解析、文件校验、计分复核、结果落盘、收敛判断
- LLM phase 只处理需要推理的结构化任务
- session 返回值不得作为跨 phase 的唯一数据通道

---

## 每步输入/输出契约

### P0: 预处理

| | 说明 |
|---|---|
| **输入** | `config.yaml` + `case-config.json` + 题目文件 + FDA Review 来源 |
| **输出** | `workspace/`（`sop-paths.txt`, `case-meta.json`, `question.md`, `fda-raw-sections.md`, `prepare-report.json`） |
| **不变量** | `prepare-report.json.status = blocked` → 终止 |
| **分支自定** | 章节提取关键词、fallback 策略、workspace 字段 |

### P1: 做题

| | 说明 |
|---|---|
| **输入** | SOP 文件列表 + 题目 + 信息隔离规则 |
| **输出** | `solver-{A|B|C}.md` |
| **不变量** | ① 不得查看本题药物 FDA Review ② 输出必须落盘 ③ <2 个 solver 成功则中止 |
| **分支自定** | Solver 数量、模型组合、timeout、可用工具 |

### P2: 共识合并

| | 说明 |
|---|---|
| **输入** | `solver-*.md` + 必要 SOP |
| **输出** | `consensus-answer.md` |
| **不变量** | 固定维度名；每维度必须有 `decision/source/support` |
| **分支自定** | 合并规则、仲裁策略、source 标记 |

### P3: 标准答案格式化

| | 说明 |
|---|---|
| **输入** | `fda-raw-sections.md` |
| **输出** | `fda-actual.md` |
| **不变量** | 固定维度名；每维度必须有 `answer/evidence/confidence` |
| **分支自定** | 提取章节、证据粒度、`NOT_STATED_IN_REVIEW` 规则 |

### P4: 裁判评分 + Merge

| | 说明 |
|---|---|
| **输入** | `consensus-answer.md` + `fda-actual.md` + `evaluate.md` |
| **输出** | `judge-*.md` + `scoring.md` |
| **不变量** | 裁判独立 session；不得看做题推理；`scoring.md` 必须脚本复核 |
| **分支自定** | 裁判数量、投票规则、特殊维度处理 |

### P5: 差异分析 + SOP

| | 说明 |
|---|---|
| **输入** | `consensus-answer.md` + `fda-actual.md` + `scoring.md` + SOP |
| **输出** | `analysis.md` + `grounding.md` + `sop-patch.md` + `review.md` |
| **不变量** | 仅 `KNOW/REG/STAT` 可进入 SOP patch；`analysis.md` 必须区分事实与推断 |
| **分支自定** | 差异类型集合、规则审核标准、写入目标 |

### P6: 收尾 + Git

| | 说明 |
|---|---|
| **输入** | 本轮 phase 产物 + `results.tsv` |
| **输出** | `results.tsv` 追加行 + `finalize-report.json` + 可选 Git/PR 结果 |
| **不变量** | 文件校验失败 → 不追加结果；收敛判断基于脚本计算结果 |
| **分支自定** | TSV 列定义、收敛阈值、Git 是否默认启用 |

---

## 文件契约

所有分支在 v6 架构下都应明确：
- 标准维度枚举
- 缺失值标记
- phase 输出 schema
- 错误码
- 校验顺序

推荐把这些内容写成独立文档，并由脚本和 prompt 共同遵守。

## 全局不变量（所有分支必须遵守）

1. **答案隔离**：做题 Agent 不能查看本题药物的 FDA Review
2. **裁判隔离**：裁判在独立 session 中执行，不看做题推理过程
3. **SOP Section-Append**：只追加不修改，避免 Git 合并冲突
4. **偏差记录**：SYS/DEV 偏差事件必须记录，复盘由 Boss 发起
5. **Git PR 模型**：每轮一个分支，squash merge 到 main
6. **审核门控**：SOP 更新前必须经独立 Agent 审核
