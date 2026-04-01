# Pipeline v6.0 设计文档 — 文件驱动训练架构

> **状态**: Draft | **作者**: Helix | **日期**: 2026-04-01
> **触发**: PD Round token 消耗分析发现 orchestrator context 累积导致单轮成本约 `$14`

---

## 1. 问题陈述

### 1.1 现状

当前训练流程在 Helix 主 session（Opus）中串行执行 Step 0→8，约 15 个对话 turn。由于 LLM API 每次调用都要重发完整 context history，实际 input token 消耗呈累积增长，而不是按单轮最大上下文估算：

```text
实际 input = Turn1_ctx + Turn2_ctx + ... + Turn15_ctx
           ≈ 3K + 10K + 13K + ... + 96K
           ≈ 800K tokens（而非朴素估算的 96K）
```

### 1.2 成本分析

| 指标 | 数值 |
|------|------|
| 单轮成本（有 new rules） | ~$14 |
| 单轮成本（0 new rules） | ~$6 |
| Batch 1（6 轮）总成本 | ~$53 |
| 20 轮预估 | $120-200 |
| Opus 占比 | 97%+ |

### 1.3 根因

**问题不是用了 Opus，而是在一个持续膨胀的 session 里串行跑了过多需要上下文回放的步骤。**

- Turn 11-15（溯源、审核、写入、Git、收敛）占总 input 成本约 50%
- 每个 turn 都要重发前面所有中间产物（Solver 答案、FDA Review 章节、Judge 评分等）
- 其中大量工作本质上不需要 LLM：配置解析、文件检查、计分、结果落盘、Git、收敛判断

---

## 2. 设计目标

| 目标 | 约束 |
|------|------|
| 单轮成本降到 `$3` 以内 | 仅在 full-analysis 场景统计 |
| 训练质量不降低 | `match_score` 偏差 ≤ 0.10；差异归类一致率 ≥ 80% |
| 保留 Opus 在关键环节 | 仅用于差异归类、规则制定、必要时规则审核 |
| 可观测、可回退 | 任一 phase 失败都能定位；对照实验不达标可恢复 v5.1.1 |
| 与现有 program.md 一致 | 10 个评分维度、17 列 `results.tsv`、现有收敛口径不变 |

**非目标**：本版本不改变 Solver/Judge 模型组合，不重写 SOP 内容，不改变评分标准本身。

---

## 3. 核心思路

**核心策略：把“长对话工作流”改成“短 session + 文件契约”。**

原则：
1. **文件是 phase 间唯一通信机制**。Session 返回值只用于状态，不用于传递核心业务结果。
2. **能脚本化的全部脚本化**。配置解析、文件完整性检查、计分、结果汇总、Git、收敛判断全部移出 LLM。
3. **每次 LLM 调用只读最小必要输入**。每个 agent 在全新 session 中只看自己需要的文件。
4. **Opus 只留给不可替代的临床/监管推理**。如果只是结构化抽取、合并、投票，就不用 Opus。
5. **失败优先可恢复**。任一 phase 输出不完整时，要么降级继续，要么显式中止，不允许静默带病进入下一步。

---

## 4. Pipeline 架构

```text
Helix 主 session（仅调度，不承载业务上下文）
│
├── P0 预处理 ───── bash 脚本 + DocSearch ─────── 零 LLM
├── P1 做题 ─────── 3× Solver subagent ───────── kimi×1 + minimax×2
├── P2 共识合并 ─── 1× Sonnet subagent ──────── Sonnet
├── P3 FDA 格式化 ─ 1× Sonnet subagent ──────── Sonnet
├── P4 评分 ─────── 3× Judge + 1× Merge ─────── kimi/minimax + Sonnet
├── P5 分析+SOP ─── 1× Opus/Sonnet subagent ─── 默认 Opus，满足门槛可降级
└── P6 收尾 ─────── bash 脚本 ───────────────── 零 LLM
```

### 4.1 依赖关系

```text
P0 → P1 → P2 ─┐
P0 → P3 ──────┼→ P4 Judge ×3 → P4 Scoring Merge → P5 → P6
              └────────────────────────────────────^
```

关键点：
- `P3` 只依赖 `P0` 的 `fda-raw-sections.md`，因此可以和 `P1/P2` 并行。
- `P4 Judge` 必须同时拿到 `consensus-answer.md` 和 `fda-actual.md`，因此**不能**在 `P3` 完成前启动。
- `P5` 只读取文件产物，不读取任何上游 session history。

### 4.2 P0 预处理（脚本，零 LLM）

**输入**：`round_num`, `case_id`, `case-config.json`

**输出目录**：`training/protocol-design/rounds/round-{NN}/workspace/`

| 步骤 | 工具 | 产出 |
|------|------|------|
| 解析 `case-config.json` | `jq` | `sop-paths.txt`, `case-meta.json` |
| 复制题目 | `cp` | `question.md` |
| 提取 FDA Review 章节 | `docsearch section` | `fda-raw-sections.md` |
| 预检输入完整性 | bash | `prepare-report.json` |

脚本：`scripts/p0-prepare.sh`

**DocSearch 查询策略**：
```bash
docsearch section "$NDA_ID" "trial design"
docsearch section "$NDA_ID" "control arm"
docsearch section "$NDA_ID" "sample size"
docsearch section "$NDA_ID" "efficacy endpoints"
docsearch section "$NDA_ID" "inclusion exclusion"
docsearch section "$NDA_ID" "statistical analysis"
```

**P0 成功判定**：
- `question.md` 存在且非空
- `sop-paths.txt` 至少含 `core/` 文件
- `fda-raw-sections.md` 非空，或 `prepare-report.json` 标记 fallback 已启用

**回退**：
- DocSearch 不能按 NDA/BLA ID 命中时，回退到 `case-config.json` 中的 `fda_review_path`
- 如果回退后仍拿不到 FDA Review 原文，整轮标记 `P0_BLOCKED` 并停止，不进入 LLM phase

### 4.3 P1 做题（3× Solver）

**模型**：`kimi ×1 + minimax ×2`（与 v5.1.1 一致）

**输入/每个 Solver**：
- `sop-paths.txt` 指向的 SOP 文件
- `question.md`
- 信息隔离规则
- 输出路径

**输出**：`solver-{A|B|C}.md`

**timeout**：300s

保持不变：
- 模型组合不变
- 信息隔离规则不变
- 输出格式不变
- 通过文件落盘传递答案，不读 subagent session 返回值

**P1 门禁**：
- `>=2` 个 solver 文件成功落盘：继续到 `P2`
- 仅 `1` 个 solver 成功：整轮标记 `LOW_CONFIDENCE_ABORT`，不进入共识合并
- `0` 个 solver 成功：整轮失败

成本估算：

```text
Input/Solver: ~28K tokens
Output/Solver: ~1.5K tokens
成本合计: ~$0.15
```

### 4.4 P2 共识合并（1× Sonnet subagent）

**模型**：Sonnet

**输入**：
- 共识合并指令（精简版，约 2K）
- `SOP core`（仲裁依据，约 16K；必要时再补 domain/indication）
- `solver-A.md + solver-B.md + solver-C.md`（约 4.5K）

**输出**：`consensus-answer.md`

**职责**：
- 逐维度对比 3 份 Solver 输出
- 记录 `consensus: N/M` 或 `[divergence]`
- 在全部不一致时，基于 SOP 规则给出单一最终答案，并显式标记 `[orchestrator-resolved]`

**为什么可降级到 Sonnet**：
- 这里是结构化比对和按既有规则裁决，不是新规则生成
- 真正高风险的“这是否值得写入 SOP”留到 `P5`

**需要补的约束**：
- `consensus-answer.md` 必须包含 10 个标准维度，不允许自由发挥字段名
- 每个维度都要带来源标记：`consensus`, `divergence`, 或 `orchestrator-resolved`
- 如果某维度因上游缺失无法判断，写 `UNRESOLVED`，由 `P4/P5` 显式看到，不允许省略

成本估算：

```text
Input: ~23K（单 turn，无累积）
Output: ~5K
成本: ~$0.15
```

### 4.5 P3 FDA 标准答案格式化（1× Sonnet subagent）

**模型**：Sonnet

**输入**：
- 格式化指令 + 10 维度定义（约 3K）
- `fda-raw-sections.md`（约 15K）

**输出**：`fda-actual.md`

**职责**：
- 从 FDA Review 章节中抽取与 10 个评分维度对应的“实际方案”
- 对每个维度保留证据片段或 section anchor，便于 Judge 引用
- 对缺失信息标注 `NOT_STATED_IN_REVIEW`，而不是擅自补全

**为什么可降级到 Sonnet**：
- 这是受控的结构化抽取任务
- Judge 仍会基于 `evaluate.md` 对抽取结果进行独立比对

**质量风险与防护**：
- 风险：FDA Review 叙述跨段落、同一维度信息分散
- 防护：`fda-actual.md` 要求保留 `evidence` 字段；P6 抽样校验每个维度是否附带证据

成本估算：

```text
Input: ~18K（单 turn）
Output: ~3K
成本: ~$0.10
```

**备选**：如果 DocSearch 输出后续足够结构化，可把 `P3` 进一步脚本化；v6.0 先保留 LLM 兜底。

### 4.6 P4 评分（3× Judge + 1× Scoring Merge）

#### Judge

- 模型：`kimi ×1 + minimax ×2`
- 输入：`evaluate.md` + `consensus-answer.md` + `fda-actual.md`
- 输出：`judge-{A|B|C}.md`
- 成本合计：约 `$0.05`

约束：
- Judge 不得读取题目原文、SOP、Solver 推理过程
- 每个维度必须给 `match / partial / miss / skip`
- 每个维度必须写明 rationale，并引用 `fda-actual.md` 中的证据定位

#### Scoring Merge

- 模型：Sonnet
- 输入：评分规则（约 2K） + 3 份 judge 文件（约 4.5K）
- 输出：`scoring.md`
- 成本：约 `$0.05`

明确规则：
- `>=2/3` 一致，直接采纳
- 三者全不同，按 `miss > partial > match` 取更严格结果，并写明 tie-break 原因
- 汇总时输出 `match_count`, `partial_count`, `miss_count`, `skip_count`, `total_items`

**P4 后必须由脚本复核**：
- `total_items = 10 - skip_count`
- `match_score = match_count / total_items`
- `weighted_score = (match_count + 0.5 * partial_count) / total_items`
- 保留 2 位小数

这一步很关键：Sonnet 负责把 3 份 Judge 结果合成可读文档，但**最终分数以脚本复核结果为准**，避免“LLM 合并正确、算术错误”的隐性偏差。

### 4.7 P5 差异分析 + SOP（1× Opus/Sonnet subagent）

**默认模型**：Opus

**输入**：
- 分析指令（差异归类规则 + 溯源优先级，约 3K）
- `consensus-answer.md`
- `fda-actual.md`
- `scoring.md`
- 当前 SOP（`core + domain + indication`，约 20K）
- 如需溯源：DocSearch/FDA Guidance 检索结果（约 5K）

**输出**：
- `analysis.md`
- `grounding.md`（条件生成）
- `sop-patch.md`（条件生成）
- `review.md`（仅在规则审核独立执行时生成）

**为什么这里只保留 Opus**：
- 这里涉及临床合理性、监管依据、规则抽象层级判断
- 不是简单“看差异”，而是判断“哪些差异值得制度化”

**P5 输出最少应包含**：
- 每个 `partial/miss` 维度的差异类型：`KNOW / REG / STAT / ALT / INFO`
- `new_rules_proposed`
- `rejected_rules`
- `delta_codes`
- 对 `ALT` 的明确说明：合理但不写入 SOP

**降级条件**：
- **保守默认**：`P5` 默认使用 Opus
- **仅在两种情形允许降级到 Sonnet**：
  1. `scoring.md` 显示 10 个维度全部 `match`，无需差异归类或规则生成
  2. 先运行一个独立的轻量 pre-classifier，将全部 `partial/miss` 预判为 `ALT/INFO-only`，且该 classifier 的误判率已在对照实验中验证可接受
- 只要存在未判明的 `partial/miss`，或 pre-classifier 未验证，就必须使用 Opus

成本估算：

```text
Input: ~38K（单 turn，vs 当前 ~330K 累积）
Output: ~8K
成本: ~$1.17
```

Sonnet 降级场景估算：约 `$0.19`

### 4.8 P6 收尾（脚本，零 LLM）

**步骤**：
1. 验证必要文件存在且 schema 合法
2. 从 `scoring.md` 提取 `match/partial/miss/skip` 计数
3. 计算 `match_score`, `weighted_score`
4. 从 `analysis.md` 提取 `new_rules`, `delta_codes`, `notes`
5. 追加 `training/protocol-design/results.tsv`
6. 执行 Git：branch → add → commit → PR → merge
7. 读取 `results.tsv` 最近 N 轮，执行收敛判断
8. 生成 `finalize-report.json`

脚本：`scripts/p6-finalize.sh`

**P6 不只是“善后”**：这里承担最终一致性检查，因此任何算术、文件缺失、schema 偏差都应在这里被拦截，而不是默默写入 `results.tsv`。

### 4.9 并行优化

合理并行方式：

```text
P0 → ┬─ P1 Solver ×3 → P2 共识合并 ─┐
     └─ P3 FDA 格式化 ───────────────┼→ P4 Judge ×3 → P4 Scoring Merge → P5 → P6
                                      └──────────────────────────────────────────^
```

这比“P2 后再开 P3”更合理，因为 `P3` 不依赖 Solver 结果。预估总耗时可从串行约 20 min 降到约 12-14 min。

---

## 5. 文件契约

### 5.1 目录结构

```text
training/protocol-design/rounds/round-{NN}/
├── workspace/
│   ├── sop-paths.txt
│   ├── case-meta.json
│   ├── question.md
│   ├── fda-raw-sections.md
│   └── prepare-report.json
├── solver-A.md
├── solver-B.md
├── solver-C.md
├── consensus-answer.md
├── fda-actual.md
├── judge-A.md
├── judge-B.md
├── judge-C.md
├── scoring.md
├── analysis.md
├── grounding.md
├── sop-patch.md
├── review.md
└── finalize-report.json
```

### 5.2 必填/选填文件

| 文件 | 产生 phase | 是否必需 | 说明 |
|------|------------|----------|------|
| `workspace/question.md` | P0 | 必需 | 题目副本 |
| `workspace/fda-raw-sections.md` | P0 | 必需 | FDA 原始章节或 fallback 抽取 |
| `solver-*.md` | P1 | 至少 2 份 | 少于 2 份直接中止 |
| `consensus-answer.md` | P2 | 必需 | 10 维度完整 |
| `fda-actual.md` | P3 | 必需 | 10 维度 + evidence |
| `judge-*.md` | P4 | 至少 2 份，目标 3 份 | 少于 2 份直接中止 |
| `scoring.md` | P4 | 必需 | 包含计数和每维度最终分数 |
| `analysis.md` | P5 | 必需 | 差异归类 |
| `grounding.md` | P5 | 条件生成 | 有 `KNOW/REG/STAT` 时生成 |
| `sop-patch.md` | P5 | 条件生成 | 有新规则时生成 |
| `review.md` | P5 | 条件生成 | 规则审核独立执行时生成 |
| `finalize-report.json` | P6 | 必需 | 成功/失败状态与校验结果 |

### 5.3 文件级 schema 要求

最低要求：
- `consensus-answer.md`、`fda-actual.md`、`scoring.md` 都必须固定使用 10 个标准维度名
- `fda-actual.md` 每个维度必须带 `evidence`
- `scoring.md` 必须带维度级最终判定和总计分
- `analysis.md` 必须区分 `facts`, `inference`, `rules`

否则后续 phase 的脚本解析会非常脆弱，文档里必须把“结构固定”写成契约，而不是建议。

---

## 6. 成本对比

### 6.1 单轮成本

| 组件 | 当前 v5.1.1 | Pipeline v6.0 | 节省 |
|------|-------------|---------------|------|
| P0 预处理 | Opus 累积 ~$0.40 | 脚本 ~$0 | 100% |
| P1 Solver ×3 | ~$0.15 | ~$0.15 | 0% |
| P2 共识合并 | Opus 累积 ~$0.96 | Sonnet 单 turn ~$0.15 | 84% |
| P3 FDA 格式化 | Opus 累积 ~$0.75 | Sonnet 单 turn ~$0.10 | 87% |
| P4 评分 | Opus 累积 ~$0.97 | kimi/minimax + Sonnet ~$0.10 | 90% |
| P5 分析+SOP | Opus 累积 ~$5.55 | Opus 单 turn ~$1.17 | 79% |
| P6 收尾 | Opus 累积 ~$2.85 | 脚本 ~$0 | 100% |
| Helix 调度 | 包含在上面 | 浅调度 turn，近似忽略 | — |
| **合计** | **~$14** | **~$2.67** | **-81%** |

### 6.2 批量预估

| 场景 | 当前 | Pipeline v6.0 |
|------|------|---------------|
| 有 new rules 的轮次 | ~$14 | ~$2.70 |
| 0 new rules 的轮次 | ~$6 | ~$1.50 |
| Batch 1（6 轮） | ~$53 | ~$12 |
| 20 轮总计 | ~$150 | ~$35 |

**注意**：以上估算默认 `P5` 大部分轮次仍用 Opus。Sonnet 降级只应在“全 match”或“已验证的轻量 pre-classifier 判定为 ALT/INFO-only”场景启用。

---

## 7. 质量保障

### 7.1 不变量

| 环节 | 保持不变的内容 |
|------|---------------|
| Solver 做题 | 模型、SOP、题目、信息隔离规则 |
| Judge 评分 | 模型、`evaluate.md`、盲评机制 |
| 评分口径 | 10 维度、`match/partial/miss/skip`、现有公式 |
| 差异归类 | `KNOW / REG / STAT / ALT / INFO` |
| `results.tsv` | 17 列 schema 与现有 program.md 一致 |

### 7.2 主要风险与防护

| 变更 | 风险 | 防护 |
|------|------|------|
| P2 Opus → Sonnet | 共识仲裁质量下降 | 强制保留 `divergence` 标记，P5 可审计 |
| P3 Opus → Sonnet | FDA 信息抽取遗漏 | 每维度强制 evidence；P6 抽样校验 |
| P4 Merge 用 Sonnet | 投票/算术出错 | 投票规则文档化；分数由脚本复核 |
| 文件驱动替代 session 传值 | 某 phase 输出不完整导致下游误读 | phase 门禁 + schema 校验 + finalize report |
| P5 条件降级 | 错把需要 Opus 的轮次降级 | 仅允许 `ALT/INFO-only` 才降级 |

### 7.3 对照实验设计

**实验对象**：Round 6（Kimmtrak，实体瘤罕见，RCT）

**执行方式**：
- 同一 case 同时跑 v5.1.1 基线和 v6.0
- 两边都保留完整 round artifacts
- 对 `consensus-answer.md`、`fda-actual.md`、`scoring.md`、`analysis.md` 做逐项对比

| 维度 | v5.1.1 基线 | Pipeline v6.0 |
|------|------------|---------------|
| `match_score` | 记录 | 记录 |
| `weighted_score` | 记录 | 记录 |
| 维度级评分分布 | 记录 | 记录 |
| `analysis.md` 差异归类 | 基线 | 对比一致性 |
| `new_rules` 数量 | 记录 | 记录 |
| token 消耗 | 记录 | 记录 |
| 总耗时 | 记录 | 记录 |

**通过标准**：
- `match_score` 偏差 ≤ 0.10
- `weighted_score` 偏差 ≤ 0.10
- 差异归类一致率 ≥ 80%
- 不出现“v5.1.1 判定为 `KNOW/REG/STAT`，v6.0 漏成 `ALT/INFO`”的高风险漏判
- token 消耗降幅 ≥ 50%

**不通过处理**：
- 定位问题 phase（`P2 / P3 / P4 / P5`）
- 允许局部回退，而不是整套回退
- 在确认问题闭环前，不切主流程

### 7.4 上线策略

建议分两步：
1. **Shadow mode**：连续 2-3 轮只做并行对照，不替换正式流程
2. **Partial cutover**：先切 `P0/P3/P6`，确认稳定后再切 `P2/P4/P5`

这样能避免“一次性全切”导致问题定位困难。

---

## 8. 实施计划

| # | 任务 | 依赖 | 耗时 | 产出 |
|---|------|------|------|------|
| 1 | 写 `scripts/p0-prepare.sh` | `case-config.json` 结构确认 | 1h | 脚本 |
| 2 | 写 `scripts/p6-finalize.sh` | `scoring.md` 与 `results.tsv` schema 确认 | 1h | 脚本 |
| 3 | 定义 phase 输出 schema | 无 | 1h | `docs/pipeline-v6-file-contract.md` 或内嵌 schema |
| 4 | 写 phase prompt 模板 | 1-3 完成 | 2h | `scripts/prompts/` |
| 5 | 更新 `training/protocol-design/program.md` | 1-4 完成 | 1h | program.md |
| 6 | 更新 `training/_shared/framework.md` | 5 完成 | 0.5h | framework.md |
| 7 | 跑 Round 6 对照实验 | 1-6 完成 | 0.5h | 实验报告 |
| 8 | 评估 + Go/No-Go 决策 | 7 完成 | 0.5h | 决策记录 |
| **总计** | | | **~7.5h** | |

### 8.1 前置条件

- [x] v5.1.1 Solver 落盘机制已实现（commit `2859d3a`）
- [ ] Judge 落盘机制确认可复用 Solver 模式
- [ ] DocSearch 能按 NDA/BLA ID 稳定定位 FDA Review 章节
- [ ] `case-config.json` 含 NDA/BLA ID，或可从 `fda_review_path` 可靠提取
- [ ] `results.tsv` 17 列 schema 与 `training/protocol-design/program.md` 对齐

### 8.2 回退方案

如果对照实验不通过：
1. 正式 `program.md` 保持 v5.1.1
2. 仅保留已验证无争议的改进（优先 `P0` 脚本化、`P6` 脚本化、Judge 落盘）
3. 问题 phase 单独修复后再进入下一轮 shadow test

---

## 9. 未来优化方向（不在本次范围）

| 方向 | 预估收益 | 条件 |
|------|---------|------|
| `P3` 脚本化（正则/结构化抽取替代 LLM） | -$0.10/轮 | DocSearch 输出稳定且可解析 |
| `P5` 自动降级 | 后期每轮再省 ~$1 | 需要独立、已校准的 pre-classifier，不能直接依赖 `scoring.md` |
| 维度级 loss curve | 提升训练诊断能力 | `results.tsv` 增加 dimension-level summary |
| 主调度层完全脚本化 | 进一步消除 orchestrator turn 成本 | 需要稳定 CLI/runner |
| 批量训练一键执行 | 减少人工等待 | Pipeline 稳定后 |

---

## 附录 A：Helix 主 Session 调度伪代码

```python
# Turn 1: P0
exec("bash scripts/p0-prepare.sh {round} {case}")
assert_exists(["workspace/question.md", "workspace/fda-raw-sections.md"])

# Turn 2: P1 + P3（并行）
spawn(solver_A, model="kimi",    task=render("scripts/prompts/p1-solver.md", {id:"A", ...}))
spawn(solver_B, model="minimax", task=render("scripts/prompts/p1-solver.md", {id:"B", ...}))
spawn(solver_C, model="minimax", task=render("scripts/prompts/p1-solver.md", {id:"C", ...}))
spawn(fda_format, model="sonnet", task=render("scripts/prompts/p3-fda-format.md", {...}))
wait_files(["solver-A.md", "solver-B.md"], timeout=300)  # 至少 2 个 solver 成功
wait_file("fda-actual.md", timeout=300)

# Turn 3: P2
spawn(consensus, model="sonnet", task=render("scripts/prompts/p2-consensus.md", {...}))
wait_file("consensus-answer.md")

# Turn 4: P4 Judge ×3
spawn(judge_A, model="kimi",    task=render("scripts/prompts/p4-judge.md", {id:"A", ...}))
spawn(judge_B, model="minimax", task=render("scripts/prompts/p4-judge.md", {id:"B", ...}))
spawn(judge_C, model="minimax", task=render("scripts/prompts/p4-judge.md", {id:"C", ...}))
wait_files(["judge-A.md", "judge-B.md"], timeout=300)  # 至少 2 个 judge 成功

# Turn 5: P4 Merge
spawn(scoring_merge, model="sonnet", task=render("scripts/prompts/p4-scoring-merge.md", {...}))
wait_file("scoring.md")
exec("bash scripts/validate-scoring.sh {round}")

# Turn 6: P5
all_match = scoring_summary("scoring.md").all_match
classifier_ok = preclassifier_verified("round") and preclassify("scoring.md") == "ALT_INFO_ONLY"
model = "sonnet" if (all_match or classifier_ok) else "opus"
spawn(analysis, model=model, task=render("scripts/prompts/p5-analysis.md", {...}))
wait_file("analysis.md")

# Turn 7: P6
exec("bash scripts/p6-finalize.sh {round}")
```

---

## 附录 B：成本计算公式

```text
Opus:    $15/M input  + $75/M output
Sonnet:  $3/M input   + $15/M output
kimi:    ~$0.2/M input + ~$0.8/M output
minimax: ~$0.5/M input + ~$2/M output

当前方案成本 = Σ(turn_i_context × model_input_price) + Σ(turn_i_output × model_output_price)
Pipeline 成本 = Σ(agent_j_input × agent_input_price) + Σ(agent_j_output × agent_output_price)
```

**估算口径说明**：
- 不把本地脚本运行时间折算进 token 成本
- 不把失败重试计入基线估算；真实运行时需单独记录 retry overhead
- 以后如果模型单价变化，更新本附录即可，主设计不变
