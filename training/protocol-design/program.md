# program.md — Protocol Design 训练程序

> **版本**: v6.0.1 | **日期**: 2026-04-01 | **分支**: protocol-design
> **骨架**: training/_shared/framework.md（通用流程）
> **前身**: training/_shared/program.md v4.1（已 SUPERSEDED）
> **原则**: docs/guiding-principles.md

---

## 系统角色

你是一个正在通过模拟实战提升 Protocol 设计能力的 AI。每轮训练模拟真实工作流：SOP 驱动方案设计→质量自审→对答案→提取规则。你可以使用 SOP + FDA Guidance/ICH 指南 + 同适应症其他药物信息 + exec 计算工具。**严禁查看本题药物的任何信息**（FDA Review、ClinicalTrials.gov、论文、新闻、ASCO 摘要等所有渠道）。

---

## 文件清单

| 文件 | 可读 | 可写 | 说明 |
|------|------|------|------|
| `training/protocol-design/program.md` | ✅ | ❌ | 本文件 |
| `training/protocol-design/evaluate.md` | ✅ | ❌ | 评分标准（10 维度） |
| `training/protocol-design/config.yaml` | ✅ | ❌ | 分支配置 |
| `training/protocol-design/case-config.json` | ✅ | ❌ | 案例→答案路径+域映射 |
| `training/protocol-design/questions/{id}-{drug}.md` | ✅ | ❌ | 题目 |
| `training/protocol-design/results.tsv` | ✅ | ✅ 追加 | 每轮评分记录 |
| `training/protocol-design/rounds/round-{NN}/workspace/*` | ✅ | ✅ | P0 预处理产物 |
| `scripts/p0-prepare.sh` | ✅ | ✅ 执行 | P0 预处理脚本 |
| `scripts/validate-scoring.sh` | ✅ | ✅ 执行 | P4/P6 计分复核脚本 |
| `scripts/p6-finalize.sh` | ✅ | ✅ 执行 | P6 收尾脚本 |
| `scripts/prompts/p2-consensus.md` | ✅ | ❌ | P2 共识合并模板 |
| `scripts/prompts/p3-fda-format.md` | ✅ | ❌ | P3 FDA 格式化模板 |
| `scripts/prompts/p4-judge.md` | ✅ | ❌ | P4 Judge 模板 |
| `scripts/prompts/p4-scoring-merge.md` | ✅ | ❌ | P4 Merge 模板 |
| `scripts/prompts/p5-analysis.md` | ✅ | ❌ | P5 分析模板 |
| `sop/core/protocol-design.md` | ✅ | ✅ | **可变** — 核心决策 SOP |
| `sop/domains/{domain}.md` | ✅ | ✅ | **可变** — 疾病大类知识 |
| `sop/indications/{indication}.md` | ✅ | ✅ | **可变** — 适应症特定知识 |
| `sop/regulatory/{path}.md` | ✅ | ✅ | **可变** — 监管路径知识 |
| `data/fda-guidelines/markdown/INDEX.md` | ✅ | ❌ | FDA/ICH 指南索引（156 份） |
| `data/fda-guidelines/markdown/fda/*.md` | ✅ | ❌ | FDA Guidance 原文 |
| `data/fda-guidelines/markdown/ich/*.md` | ✅ | ❌ | ICH 指南原文 |

---

## 训练粒度

| 级别 | 场景 | 输入 | 产出 |
|------|------|------|------|
| **L1 端到端** | 给一个药，从零设计完整 Protocol | 药名+适应症+MOA | 完整 10 维度设计方案 |
| **L2 模块级** | 优化已有方案的某个 Section | 方案草稿+具体问题 | 单 Section 优化建议 |
| **L3 决策点** | 做一个具体设计决策 | 决策场景+上下文 | 决策+理由+替代方案 |

**策略**：初期以 L1 为主，跑几轮后用 L2/L3 针对高频 miss 维度补强。

---

## 执行顺序（20 案例，难度梯度）

```
Round 01: 12-sotyktu      (自免/炎症, RCT, 热身)         ← B1R1 ✅ match 0.70
Round 02: 15-orgovyx      (泌尿/内分泌, RCT, 热身)
Round 03: 05-vyloy        (实体瘤 1L, RCT, 中等)
Round 04: 14-airsupra     (呼吸, RCT, 跨领域)
Round 05: 13-tavneos      (自免/炎症, RCT, 精做收尾)
Round 06: 10-kimmtrak     (实体瘤 罕见, RCT, 新领域)
Round 07: 18-voranigo     (神经/罕见, RCT)
Round 08: 16-ogsiveo      (罕见病, RCT)
Round 09: 08-truqap       (实体瘤 乳腺癌, RCT)
Round 10: 17-rytelo       (血液肿瘤, RCT)
Round 11: 19-lumakras     (实体瘤, 加速审批/单臂)
Round 12: 11-loqtorzi     (实体瘤 NPC, RCT)
Round 13: 04-datroway     (实体瘤 ADC, RCT)
Round 14: 07-orserdu      (乳腺癌 2L, RCT)
Round 15: 09-komzifti     (血液肿瘤 AML, RCT)
Round 16: 20-modeyso      (神经/罕见, 加速审批)
Round 17: 06-retevmo      (实体瘤 多适应症, 加速审批)
Round 18: 02-hernexeos    (实体瘤 NSCLC, 加速审批)
Round 19: 03-hyrnuo       (实体瘤 NSCLC, 加速审批)
Round 20: 01-inluriyo     (乳腺癌 ESR1m, RCT, 终极测试)
```

---

## 分批策略

| 批次 | 案例 | 策略 | 人工介入 |
|------|------|------|----------|
| **Batch 1** (Round 1-5) | 精做 | 每轮完整执行，详细记录 | 第 5 轮后审核 SOP |
| **Batch 2** (Round 6-10) | 常规 | 正常执行，SOP 更新精简化 | 无 |
| **Batch 3** (Round 11-15) | 加速 | 评分+SOP 更新，省略详细叙述 | 无 |
| **Batch 4** (Round 16-20) | 冲刺 | 最小化输出，重点关注 miss 项 | 完成后审核最终 SOP |

**唯一人工介入点**: Round 5 后和 Round 20 后。

---

## 每轮执行流程

v6.0 改为**文件驱动 phase 架构**，Helix 主 session 只负责调度，不再承载全量业务上下文。

```text
P0 预处理（脚本）
  → P1 Solver ×3
  → P2 共识合并
P0 预处理（脚本）
  → P3 FDA 格式化
P2 + P3 完成
  → P4 Judge ×3
  → P4 Scoring Merge
  → validate-scoring.sh
  → P5 差异分析 + SOP
  → P6 收尾 + results.tsv + 收敛判断
```

### P0: 预处理（脚本，零 LLM）

执行：`scripts/p0-prepare.sh <round> [case_selector]`

职责：
- 解析 `case-config.json`
- 复制题目到 `rounds/round-{NN}/workspace/question.md`
- 生成 `workspace/sop-paths.txt`
- 生成 `workspace/case-meta.json`
- 优先通过 `docsearch` 提取 FDA Review 章节，失败时回退到 FDA markdown 原文
- 生成 `workspace/fda-raw-sections.md`
- 生成 `workspace/prepare-report.json`

门禁：
- `prepare-report.json.status != blocked`
- `question.md` 非空
- `sop-paths.txt` 至少包含 core SOP
- `fda-raw-sections.md` 存在

### P1: 做题（3× Protocol Design Agent）

- 3 个独立 Agent（kimi ×1 + minimax ×2），各自独立设计 Protocol
- 严格信息隔离，不得查看本题药物 FDA Review
- 输出必须落盘到 `solver-{A|B|C}.md`（文件名保持 solver 前缀，兼容文件契约）
- Prompt 模板：`scripts/prompts/p1-solver.md`

**Agent 可用工具**：
- `read` — 读取 SOP 文件和题目（prompt 中已指定路径）
- **DocSearch** — 检索 FDA/ICH 指南（替代 `ls`/`grep` 目录浏览）
- **sample_size_survival.py** — 生存分析样本量计算（Schoenfeld/Freedman）
- **sample_size.py** — 比例差样本量计算
- **禁止**：`ls`/`grep` 浏览 `data/fda-guidelines/` 目录；从零写样本量公式

门禁：
- 至少 2 个 Solver 成功落盘，否则整轮中止（`LOW_CONFIDENCE_ABORT`）

### P2: 共识合并（1× Sonnet）

输入：
- `solver-{A|B|C}.md`
- `workspace/sop-paths.txt` 指向的 SOP
- `scripts/prompts/p2-consensus.md`

输出：
- `consensus-answer.md`

要求：
- 固定 10 个维度
- 每个维度都有 `decision / source / support / notes`
- `source` 只能是 `consensus / divergence / orchestrator-resolved / UNRESOLVED`

### P3: FDA 标准答案格式化（1× Sonnet）

输入：
- `workspace/fda-raw-sections.md`
- `scripts/prompts/p3-fda-format.md`

输出：
- `fda-actual.md`

要求：
- 固定 10 个维度
- 每个维度必须有 `answer / evidence / confidence`
- 未明确提及的信息写 `NOT_STATED_IN_REVIEW`

### P4: 评分（3× Judge + 1× Merge）

Judge 输入：
- `consensus-answer.md`
- `fda-actual.md`
- `evaluate.md`
- `scripts/prompts/p4-judge.md`

Judge 输出：
- `judge-{A|B|C}.md`

Scoring Merge 输入：
- `judge-{A|B|C}.md`
- `scripts/prompts/p4-scoring-merge.md`

Scoring Merge 输出：
- `scoring.md`

门禁：
- 至少 2 个 Judge 成功落盘
- `scoring.md` 必须通过 `scripts/validate-scoring.sh`
- 最终计分以脚本复核结果为准，不以 LLM 算术为准

### P5: 差异分析 + SOP（默认 Opus）

输入：
- `consensus-answer.md`
- `fda-actual.md`
- `scoring.md`
- `workspace/sop-paths.txt` 指向的 SOP
- `scripts/prompts/p5-analysis.md`

输出：
- `analysis.md`
- `grounding.md`（条件生成）
- `sop-patch.md`（条件生成）
- `review.md`（条件生成）

规则：
- 差异类型只能是 `KNOW / REG / STAT / ALT / INFO`
- 只有 `KNOW / REG / STAT` 可进入 SOP patch
- `analysis.md ## Summary` 必须包含 `new_rules_proposed / delta_codes / notes`
- 默认使用 Opus；仅在“全 match”或已验证 pre-classifier 判定为 `ALT/INFO-only` 时允许降级

### P6: 收尾（脚本，零 LLM）

执行：`scripts/p6-finalize.sh <round>`

职责：
- 校验必要文件存在
- 调用 `validate-scoring.sh` 复核 `scoring.md`
- 从 `analysis.md` 提取 `new_rules / delta_codes / notes`
- 汇总 SOP `rule_count`
- 追加 `results.tsv`
- 生成 `finalize-report.json`
- 执行收敛判断
- Git 步骤由脚本显式控制；本地验证默认可跳过

### 文件契约

v6 所有 phase 产物必须遵守：
- `docs/pipeline-v6-file-contract.md`
- 固定 10 维度名
- 固定缺失值标记
- 固定错误码约定

### v6 Round 目录结构

```text
rounds/round-{NN}/
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

### v6 核心不变量

1. Solver 不能查看本题药物 FDA Review
2. Solver/Judge 输出必须落盘，不依赖 session 返回值
3. Judge 只能读 `consensus-answer.md + fda-actual.md + evaluate.md`
4. `scoring.md` 必须经脚本复核后才可进入 P5/P6
5. 任何 schema 校验失败都必须中止，不允许带病继续

## R-FAIL: 偏差事件记录

执行阶段只记录事实，不做决策判断。架构/流程改进在 Batch 复盘中由 Boss 发起。

### SYS 偏差

Agent 超时 / API 429 / crash / 网络错误 → L1 记录：类型 + 最终状态 + 一句话原因

### DEV 偏差

Agent 间行为差异 → L2 记录：读 session history，提取 tool call 序列，记录差异

### 记录位置

`rounds/round-{NN}/analysis.md ## Deviation Events`

---

## 错误处理

| 错误场景 | 处理 |
|----------|------|
| 答案文件不存在 | 记录 ANSWER_NOT_FOUND，跳过 Step 4-6 |
| 答案文件 > 200KB | 搜索 config 指定章节，提取相关段落 |
| match_score = 1.0 | 重新严格评分 |
| match_score < 0.2 | 确认答案文件正确 |
| case-config 无 domain/indication | 仅加载 core/ |
| core/ SOP > 200 行 | 触发规则合并（合并重复、精简冗余） |
| config.yaml 缺失字段 | 使用默认值（evaluate.md 原始 10 维度） |
| 新分支首次运行 | Step 0 验证 config 完整性；core/ SOP 不存在则报错退出 |

---

## 收尾流程

所有轮次完成后：

1. **收敛报告**：match_score 趋势、SOP 规则变更统计、Top 3 差异类型
2. **SOP 清洗**：合并重复、删除 superseded、跨 section 去重
3. **版本标记**：更新 SOP version + CHANGELOG.md + Git tag `pd-batch{N}-stable`
