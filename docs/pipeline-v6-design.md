# Pipeline v6.0 设计文档 — 文件驱动训练架构

> **状态**: Draft | **作者**: Helix | **日期**: 2026-04-01
> **触发**: PD Round Token 消耗分析发现 Orchestrator context 累积导致单轮成本 ~$14

---

## 1. 问题陈述

### 1.1 现状

当前训练流程在 Helix 主 session（Opus）中串行执行 Step 0→8，约 15 个对话 turn。由于 LLM API 每次调用需重发完整 context history，实际 input token 消耗呈等差数列累积：

```
实际 input = Turn1_ctx + Turn2_ctx + ... + Turn15_ctx
           ≈ 3K + 10K + 13K + ... + 96K
           ≈ 800K tokens（而非朴素估算的 96K）
```

### 1.2 成本分析

| 指标 | 数值 |
|------|------|
| 单轮成本（有 new rules） | ~$14 |
| 单轮成本（0 new rules） | ~$6 |
| Batch 1 (6 轮) 总成本 | ~$53 |
| 20 轮预估 | $120-200 |
| Opus 占比 | 97%+ |

### 1.3 根因

**不是"用了 Opus"，而是"在一个不断膨胀的 session 里串行跑了 15 个 turn"。**

- Turn 11-15（溯源+审核+写入+Git+收敛）占总 input 成本的 ~50%
- 每个 turn 都要重发前面所有中间产物（Solver 答案、FDA Review 章节、Judge 评分等）
- 其中大量 turn 的工作（配置解析、Git、收敛判断）不需要 LLM

---

## 2. 设计目标

| 目标 | 约束 |
|------|------|
| 单轮成本降至 $3 以内 | — |
| 训练质量不降低 | match_score 偏差 ≤ 0.1 |
| 保持 Opus 做核心分析 | 差异归类 + SOP 规则制定仍用 Opus |
| 可回退 | 对照实验不达标时可恢复 v5.1.1 流程 |

---

## 3. 核心思路

**杀掉连续对话——用文件传递中间状态，每个 LLM 调用都是全新 session、最小 context。**

原则：
1. **文件是唯一的 Phase 间通信机制**（v5.1.1 已为 Solver 落盘，扩展到全链路）
2. **能脚本化的不用 LLM**（配置解析、FDA 章节提取、分数计算、Git、收敛判断）
3. **需要 LLM 的用最小 context 的独立 session**（每个 agent 只看自己需要的文件）
4. **Opus 只用于不可替代的环节**（临床专业判断 + SOP 规则制定）

---

## 4. Pipeline 架构

```
Helix 主 session（调度层）
│
├── P0 预处理 ──── bash 脚本 + DocSearch ──── 零 LLM
├── P1 做题 ────── 3× Solver subagent ─────── kimi×1 + minimax×2
├── P2 共识合并 ── 1× Sonnet subagent ─────── Sonnet
├── P3 FDA 格式化 ─ 1× Sonnet subagent ────── Sonnet
├── P4 评分 ────── 3× Judge + 1× Merge ────── kimi/minimax + Sonnet
├── P5 分析+SOP ── 1× Opus subagent ────────── Opus（唯一）
└── P6 收尾 ────── bash 脚本 ─────────────── 零 LLM
```

### 4.1 P0 预处理（脚本，零 LLM）

**输入**: round_num, case_id
**输出**: `rounds/round-{NN}/workspace/` 目录

| 步骤 | 工具 | 产出 |
|------|------|------|
| 解析 case-config.json | jq | sop-paths.txt |
| 复制题目 | cp | question.md |
| 提取 FDA Review 章节 | DocSearch `section` 命令 | fda-raw-sections.md |

脚本: `scripts/p0-prepare.sh`

**DocSearch 查询策略**:
```bash
docsearch section "$NDA_ID" "trial design"
docsearch section "$NDA_ID" "sample size"
docsearch section "$NDA_ID" "efficacy endpoints"
docsearch section "$NDA_ID" "inclusion exclusion"
docsearch section "$NDA_ID" "statistical analysis"
```

如果 DocSearch 找不到对应 NDA_ID → 回退到直接 `read` FDA Review 文件（路径在 case-config.json）。

### 4.2 P1 做题（3× Solver）

**模型**: kimi×1 + minimax×2（不变）
**输入/Solver**: SOP 文件 + 题目 + 信息隔离规则 + 输出路径
**输出**: `solver-{A|B|C}.md`（v5.1.1 已强制落盘）
**Timeout**: 300s

与 v5.1.1 完全一致，无变更。

```
Input/Solver: ~28K tokens
Output/Solver: ~1.5K tokens
成本合计: ~$0.15
```

### 4.3 P2 共识合并（1× Sonnet subagent）

**模型**: Sonnet
**输入**:
- 合并指令（精简版，~2K）
- SOP core（仲裁依据，~16K）
- solver-A.md + solver-B.md + solver-C.md（~4.5K）
**输出**: `consensus-answer.md`（~5K）

**质量论证**: 共识合并是结构化比对（10 维度逐项对比）+ SOP 规则查询（if-then 逻辑）。Sonnet 完全胜任。divergence 项会被记录，P5 Opus 可审查。

```
Input: ~23K（单 turn，无累积）
Output: ~5K
成本: $0.15
```

### 4.4 P3 FDA 标准答案格式化（1× Sonnet subagent）

**模型**: Sonnet
**输入**:
- 格式化指令 + 10 维度定义（~3K）
- fda-raw-sections.md（P0 DocSearch 产出，~15K）
**输出**: `fda-actual.md`（~3K）

**质量论证**: 从 FDA Review 叙述中提取并映射到 10 个固定维度，是结构化信息抽取，不需要临床推理。

```
Input: ~18K（单 turn）
Output: ~3K
成本: $0.10
```

**备选**: 如果 DocSearch 产出足够结构化，可尝试脚本化（正则提取），进一步降到 $0。初期保留 LLM 兜底。

### 4.5 P4 评分（3× Judge + 1× Scoring Merge）

**Judge**:
- 模型: kimi×1 + minimax×2
- 输入/Judge: evaluate.md(精简) + consensus-answer.md + fda-actual.md（~13K）
- 输出: `judge-{A|B|C}.md`（~1.5K）
- 成本合计: ~$0.05

**Scoring Merge**:
- 模型: Sonnet
- 输入: 评分规则(2K) + 3 份 judge 文件(~4.5K) = ~7K
- 输出: `scoring.md`（~2K）
- 成本: $0.05

**Judge 落盘**: 与 Solver 同理，Judge 必须将评分写入 `judge-{A|B|C}.md`，不依赖 session 返回值。

### 4.6 P5 分析 + SOP（1× Opus subagent）

**模型**: Opus（**唯一 Opus 调用**）
**输入**:
- 分析指令（差异归类规则 + 溯源优先级，~3K）
- consensus-answer.md（~5K）
- fda-actual.md（~3K）
- scoring.md（~2K）
- 当前 SOP（core + domain + indication，~20K）
- [如需溯源] DocSearch 查 FDA Guidance 结果（~5K）
**输出**: analysis.md + grounding.md + sop-patch.md（~8K）

**关键**: 单 turn、全新 session、零 context 累积。所有必要信息一次性给齐。

```
Input: ~38K（单 turn，vs 当前 ~330K 累积）
Output: ~8K
成本: $1.17
```

**0 new rules 时降级**: 如果 scoring.md 全部为 match 或 ALT → P5 降级 Sonnet，成本 $0.19。
判断逻辑: P6 脚本预扫 scoring.md，无 KNOW/REG/STAT 类 partial/miss → 用 Sonnet。

### 4.7 P6 收尾（脚本，零 LLM）

**步骤**:
1. 从 scoring.md 提取 match/partial/miss/skip 计数
2. 计算 match_score, weighted_score
3. 从 analysis.md 提取 new_rules 数量和 delta_codes
4. 追加 results.tsv
5. Git: branch → add → commit → PR → merge
6. 收敛判断（读 results.tsv 最近 N 轮）

脚本: `scripts/p6-finalize.sh`

### 4.8 并行优化

P3（FDA 格式化）和 P4 Judge 可以与 P2 之后**并行执行**：

```
P0 → P1 → P2 → ┬─ P3（FDA 格式化）
                ├─ P4 Judge ×3
                └─ [等 P3+P4 完成]
                → P4 Scoring Merge → P5 → P6
```

这可以将总耗时从串行 ~20min 缩短到 ~12min。

---

## 5. 文件契约

```
rounds/round-{NN}/
├── workspace/                    ← P0 预处理产出
│   ├── sop-paths.txt            ← SOP 文件路径列表
│   ├── question.md              ← 题目副本
│   └── fda-raw-sections.md      ← DocSearch 提取的 FDA Review 原始章节
├── solver-A.md                   ← P1 Solver A 答案（必须落盘）
├── solver-B.md                   ← P1 Solver B（超时则不存在）
├── solver-C.md                   ← P1 Solver C（超时则不存在）
├── consensus-answer.md           ← P2 共识合并
├── fda-actual.md                 ← P3 格式化标准答案
├── judge-A.md                    ← P4 Judge A 评分
├── judge-B.md                    ← P4 Judge B
├── judge-C.md                    ← P4 Judge C
├── scoring.md                    ← P4 多数票汇总
├── analysis.md                   ← P5 差异分析
├── grounding.md                  ← P5 规则溯源（条件生成）
└── sop-patch.md                  ← P5 SOP 变更记录（条件生成）
```

**完整性检查**: P6 脚本在执行前验证必要文件存在：
- 必须存在: ≥2 个 solver-*.md, consensus-answer.md, fda-actual.md, ≥2 个 judge-*.md, scoring.md, analysis.md
- 可选: grounding.md, sop-patch.md

---

## 6. 成本对比

### 6.1 单轮成本

| 组件 | 当前 v5.1.1 | Pipeline v6.0 | 节省 |
|------|------------|---------------|------|
| P0 预处理 | Opus 累积 $0.40 | 脚本 $0 | 100% |
| P1 Solver ×3 | $0.15 | $0.15 | 0% |
| P2 共识合并 | Opus 累积 $0.96 | Sonnet 单 turn $0.15 | 84% |
| P3 FDA 格式化 | Opus 累积 $0.75 | Sonnet 单 turn $0.10 | 87% |
| P4 评分 | Opus 累积 $0.97 | kimi/minimax + Sonnet $0.10 | 90% |
| P5 分析+SOP | Opus 累积 $5.55 | Opus 单 turn $1.17 | 79% |
| P6 收尾 | Opus 累积 $2.85 | 脚本 $0 | 100% |
| Helix 调度 | 包含在上面 | Opus 6 浅 turn ~$1.00 | — |
| **合计** | **~$14** | **~$2.67** | **-81%** |

### 6.2 批量预估

| 场景 | 当前 | Pipeline v6.0 |
|------|------|---------------|
| 有 new rules 的轮次 | ~$14 | ~$2.70 |
| 0 new rules 的轮次 | ~$6 | ~$1.50 |
| Batch 1 (6 轮) | ~$53 | ~$12 |
| 20 轮总计 | ~$150 | ~$35 |

---

## 7. 质量保障

### 7.1 不变量

| 环节 | 保持不变的内容 |
|------|---------------|
| Solver 做题 | 模型、SOP、题目、信息隔离规则 — 全部不变 |
| Judge 评分 | 模型、evaluate.md、盲评机制 — 全部不变 |
| P5 差异分析 | Opus 模型、分析指令、可用信息 — 全部不变 |
| SOP 更新规则 | 溯源优先级、写入约定 — 全部不变 |

### 7.2 变更点及质量风险

| 变更 | 风险 | 防护 |
|------|------|------|
| P2 共识合并 Opus→Sonnet | 仲裁判断不如 Opus | SOP 规则是 if-then 逻辑；divergence 记录供 P5 审查 |
| P3 FDA 格式化 Opus→Sonnet | 遗漏关键信息 | DocSearch 已按章节提取；10 维度映射是结构化操作 |
| P4 Scoring Merge Opus→Sonnet | 多数票算错 | 3→1 简单逻辑；P6 脚本交叉校验 |
| P0 DocSearch 替代直接 read | 章节定位不准 | 多关键词冗余查询；P3 agent 兜底理解 |

### 7.3 对照实验设计

**实验**: Round 6 (Kimmtrak, 实体瘤罕见, RCT) 同时跑两种方案

| 维度 | v5.1.1 基线 | Pipeline v6.0 |
|------|------------|---------------|
| match_score | 记录 | 记录 |
| weighted_score | 记录 | 记录 |
| consensus-answer 内容差异 | 基线 | 逐维度对比 |
| analysis.md 差异归类 | 基线 | 对比分类一致性 |
| 总 token 消耗 | 记录 | 记录 |
| 总耗时 | 记录 | 记录 |

**通过标准**:
- match_score 偏差 ≤ 0.1
- 差异归类（KNOW/ALT/REG/STAT）一致率 ≥ 80%
- Token 消耗降幅 ≥ 50%

**不通过处理**: 定位问题环节（P2/P3/P5），局部回退到 Opus，重跑对比。

---

## 8. 实施计划

| # | 任务 | 依赖 | 耗时 | 产出 |
|---|------|------|------|------|
| 1 | 写 `scripts/p0-prepare.sh` | case-config.json 结构确认 | 1h | 脚本 |
| 2 | 写 `scripts/p6-finalize.sh` | scoring.md 格式确认 | 1h | 脚本 |
| 3 | 写 Phase prompt 模板 | — | 2h | `scripts/prompts/` 目录 |
| | — P2 共识合并 prompt | | | p2-consensus.md |
| | — P3 FDA 格式化 prompt | | | p3-fda-format.md |
| | — P4 Scoring Merge prompt | | | p4-scoring-merge.md |
| | — P5 分析+SOP prompt | | | p5-analysis.md |
| 4 | 更新 program.md v6.0 | 1-3 完成 | 1h | program.md |
| 5 | 更新 framework.md | 4 完成 | 0.5h | framework.md |
| 6 | **对照实验**: Round 6 Kimmtrak | 1-5 完成 | 0.5h | 实验报告 |
| 7 | 评估 + 决策 | 6 完成 | — | Go / No-Go |
| **总计** | | | **~6h** | |

### 8.1 前置条件

- [x] v5.1.1 Solver 落盘机制已实现（commit `2859d3a`）
- [ ] 确认 DocSearch 能按 NDA/BLA ID 定位 FDA Review 章节
- [ ] 确认 case-config.json 包含 NDA/BLA ID 字段（或可从 fda_review_path 提取）

### 8.2 回退方案

如果对照实验不通过：
1. program.md 保持 v5.1.1 不变
2. 仅保留已验证可用的改进（如 P0 脚本化、P6 脚本化）
3. 记录实验数据供后续优化参考

---

## 9. 未来优化方向（不在本次范围）

| 方向 | 预估收益 | 条件 |
|------|---------|------|
| P3 脚本化（正则提取替代 LLM） | -$0.10/轮 | DocSearch 产出足够结构化 |
| P5 自动降级（0 rules → Sonnet） | -$1/轮（后期） | 需要可靠的 pre-scan 逻辑 |
| Helix 调度层也 spawn（主 session 零参与） | 消除主 session 累积 | 需要 orchestrator agent 或 CLI 脚本 |
| 批量训练脚本（一键跑 N 轮） | 减少人工等待 | Pipeline 稳定后 |

---

## 附录 A: Helix 主 Session 调度伪代码

```
# Turn 1: P0
exec("bash scripts/p0-prepare.sh {round} {case}")

# Turn 2: P1 — spawn 3 Solvers
spawn(solver_A, model="kimi",    task=render("scripts/prompts/p1-solver.md", {id:"A", ...}))
spawn(solver_B, model="minimax", task=render("scripts/prompts/p1-solver.md", {id:"B", ...}))
spawn(solver_C, model="minimax", task=render("scripts/prompts/p1-solver.md", {id:"C", ...}))
wait_files(["solver-A.md"], timeout=300)  # 至少 1 个完成

# Turn 3: P2 — spawn 共识合并
spawn(consensus, model="sonnet", task=render("scripts/prompts/p2-consensus.md", {...}))
wait_file("consensus-answer.md")

# Turn 4: P3 + P4 Judge — 并行
spawn(fda_format, model="sonnet", task=render("scripts/prompts/p3-fda-format.md", {...}))
spawn(judge_A, model="kimi",    task=render("scripts/prompts/p4-judge.md", {id:"A", ...}))
spawn(judge_B, model="minimax", task=render("scripts/prompts/p4-judge.md", {id:"B", ...}))
spawn(judge_C, model="minimax", task=render("scripts/prompts/p4-judge.md", {id:"C", ...}))
wait_files(["fda-actual.md", "judge-A.md"], timeout=300)

# Turn 5: P4 Merge + P5
spawn(scoring_merge, model="sonnet", task=render("scripts/prompts/p4-scoring-merge.md", {...}))
wait_file("scoring.md")
# 判断是否需要 Opus
needs_opus = pre_scan_scoring("scoring.md")  # 有 KNOW/REG/STAT partial/miss?
model = "opus" if needs_opus else "sonnet"
spawn(analysis, model=model, task=render("scripts/prompts/p5-analysis.md", {...}))
wait_file("analysis.md")

# Turn 6: P6
exec("bash scripts/p6-finalize.sh {round}")
```

---

## 附录 B: 成本计算公式

```
Opus:   $15/M input  + $75/M output
Sonnet: $3/M input   + $15/M output
kimi:   ~$0.2/M input + ~$0.8/M output  (Fireworks)
minimax: ~$0.5/M input + ~$2/M output

当前方案累积成本 = Σ(turn_i_context × $15/M) + Σ(turn_i_output × $75/M)
Pipeline 方案成本 = Σ(agent_j_input × agent_j_price/M) + Σ(agent_j_output × agent_j_price/M)
```
