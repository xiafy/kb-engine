# framework.md — 闭环训练通用骨架

> **版本**: v1.0 | **日期**: 2026-03-31
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

```
Step 0  → 加载配置
Step 1  → 读题
Step 2  → 做题（spawn Owner Agent）
Step 2b → 共识合并
Step 2c → 行为变异记录
Step 3  → 提取标准答案
Step 4  → 裁判评分
Step 5  → 差异分析
Step 5c → 规则溯源
Step 5b → SOP 更新审核
Step 6  → SOP 写入
Step 7  → 记录结果 + Git
Step 8  → 收敛/循环判断
```

---

## 每步输入/输出契约

### Step 0: 加载配置

| | 说明 |
|---|---|
| **输入** | 分支 config.yaml + case-config.json |
| **输出** | 已解析的配置对象（SOP 路径列表、评分维度、答案提取章节等） |
| **不变量** | 配置加载失败 → 终止，不继续 |

### Step 1: 读题

| | 说明 |
|---|---|
| **输入** | 题目文件路径（从 config 解析） |
| **输出** | 结构化题目信息（药物信息、适应症、监管路径等） |
| **不变量** | 题目文件不存在 → 终止 |

### Step 2: 做题

| | 说明 |
|---|---|
| **输入** | SOP 文件列表 + 题目 + 可用资源路径 |
| **输出** | 每个 Solver 的独立答案文件（**必须写入磁盘** `rounds/round-{NN}/solver-{A|B|C}.md`，v5.1.1） |
| **不变量** | ① Solver 不能查看本题药物的任何信息（全渠道隔离，v5.1）② Solver 输出必须落盘，不依赖 session 返回值（v5.1.1） |
| **分支自定** | Agent 数量、角色配置、prompt 内容、timeout、可用工具 |

### Step 2b: 共识合并

| | 说明 |
|---|---|
| **输入** | 所有 Owner Agent 的答案 |
| **输出** | `consensus-answer.md`（含共识标注） |
| **不变量** | 裁判评分基于 consensus answer，不是个体答案 |
| **分支自定** | 合并规则（多数票 / 对比仲裁 / 其他）、角色维度拆分 |

### Step 2c: 行为变异记录

| | 说明 |
|---|---|
| **输入** | 所有 Owner Agent 的 session history |
| **输出** | `analysis.md ## Agent Behavior Variance` |
| **不变量** | 只记录事实，不做决策判断 |
| **分支自定** | 关注哪些行为维度 |

### Step 3: 提取标准答案

| | 说明 |
|---|---|
| **输入** | FDA Review 文件路径 + 答案提取章节列表 |
| **输出** | `fda-actual.md`（结构化标准答案） |
| **不变量** | 答案文件不存在 → 记录 ANSWER_NOT_FOUND，跳过 Step 4-6 |
| **分支自定** | 提取哪些章节、如何结构化 |

### Step 4: 裁判评分

| | 说明 |
|---|---|
| **输入** | consensus-answer.md + fda-actual.md + 评分标准 |
| **输出** | `scoring.md`（逐维度评分 + match/weighted score） |
| **不变量** | 裁判必须在独立 session 中执行；裁判不得看做题推理过程；≥3 裁判多数票 |
| **分支自定** | 评分维度、评分标准、判例库、特殊处理规则 |

### Step 5: 差异分析

| | 说明 |
|---|---|
| **输入** | scoring.md 中的 partial/miss 项 |
| **输出** | `analysis.md ## Difference Analysis`（差异归类） |
| **不变量** | 每个 partial/miss 必须归类 |
| **分支自定** | 差异类型代码（Protocol: KNOW/REG/STAT/ALT/INFO；SAP 可能完全不同） |

### Step 5c: 规则溯源

| | 说明 |
|---|---|
| **输入** | 准备写入 SOP 的规则草案 |
| **输出** | `grounding.md`（溯源结果 + 可信度标注） |
| **不变量** | 溯源优先级：FDA Guidance/ICH > 多案例交叉 > 单案例 |
| **分支自定** | 溯源搜索范围、可信度阈值 |

### Step 5b: SOP 更新审核

| | 说明 |
|---|---|
| **输入** | 规则草案 + 溯源结果 + FDA 原始证据 |
| **输出** | 审核结果（同意 / 需修改 / 拒绝） |
| **不变量** | 独立 Agent 审核；被拒绝的规则不写入 SOP |
| **分支自定** | 审核 Agent 的 prompt、审核标准 |

### Step 6: SOP 写入

| | 说明 |
|---|---|
| **输入** | 通过审核的规则 + 写入目标路径 |
| **输出** | SOP 文件更新（section-append） |
| **不变量** | 只追加不修改已有行；版本号递增 |
| **分支自定** | 写入目标（core/domains/indications/regulatory）、section 映射 |

### Step 7: 记录结果 + Git

| | 说明 |
|---|---|
| **输入** | 本轮所有产出文件 |
| **输出** | `rounds/round-{NN}/` 完整记录 + results.tsv 追加行 + Git commit |
| **不变量** | Git 分支命名 `train/{branch}-round-{NN}`；squash merge 到 main |
| **分支自定** | results.tsv 的列定义、round 目录的文件结构 |

### Step 8: 收敛/循环判断

| | 说明 |
|---|---|
| **输入** | results.tsv 历史数据 |
| **输出** | 继续 / 收敛 / 发散告警 |
| **不变量** | 发散告警 → 暂停训练，等待人工审核 |
| **分支自定** | 收敛阈值、发散判据、Batch 策略 |

---

## 全局不变量（所有分支必须遵守）

1. **答案隔离**：做题 Agent 不能查看本题药物的 FDA Review
2. **裁判隔离**：裁判在独立 session 中执行，不看做题推理过程
3. **SOP Section-Append**：只追加不修改，避免 Git 合并冲突
4. **偏差记录**：SYS/DEV 偏差事件必须记录，复盘由 Boss 发起
5. **Git PR 模型**：每轮一个分支，squash merge 到 main
6. **审核门控**：SOP 更新前必须经独立 Agent 审核
