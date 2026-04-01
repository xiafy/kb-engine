# Pipeline v6.0 文件契约

> **状态**: Draft  
> **作者**: Helix  
> **日期**: 2026-04-01  
> **适用范围**: `docs/pipeline-v6-design.md` / `docs/implementation-plan-v6.md`

---

## 1. 目的

定义 Pipeline v6.0 各 phase 的文件输入、输出、最小 schema、校验规则和失败约定。

本文件的目标是：
- 让每个 phase 的输出都可被下游脚本稳定解析
- 避免自由文本格式漂移导致的隐性错误
- 为 `p0-prepare.sh`、`validate-scoring.sh`、`p6-finalize.sh` 提供固定契约

**原则**：
1. 字段名固定，不允许同义替换
2. phase 间只通过文件传递核心业务信息
3. 文件存在不代表有效，必须通过 schema 校验
4. 缺失信息必须显式标记，不允许静默省略

---

## 2. 目录结构

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

---

## 3. 全局约束

### 3.1 标准维度名

以下 10 个维度名为固定枚举，所有相关文件必须使用完全一致的字段名：

1. `design_type`
2. `control_arm`
3. `primary_endpoint`
4. `endpoint_definition`
5. `secondary_endpoints`
6. `sample_size`
7. `stat_framework`
8. `stratification`
9. `eligibility`
10. `operational`

**禁止**：
- 用中文字段名替代
- 用近义词替代，如 `study_design` / `primary_endpoints`
- 改顺序
- 缺维度不写

### 3.2 通用缺失值标记

| 标记 | 含义 | 允许出现的文件 |
|------|------|----------------|
| `TIMEOUT` | 上游 agent 超时 | `solver-*.md`, `judge-*.md` |
| `UNRESOLVED` | 无法形成稳定结论 | `consensus-answer.md` |
| `NOT_STATED_IN_REVIEW` | FDA Review 未明确写出 | `fda-actual.md` |
| `SKIP` | 该维度按评分规则不计入分母 | `judge-*.md`, `scoring.md` |
| `N/A` | 仅用于报告字段，不用于维度答案 | `prepare-report.json`, `finalize-report.json` |

### 3.3 Markdown 结构要求

除 `.json` 和 `.txt` 外，所有 phase 产物均使用 Markdown，且必须满足：
- 文件首部有一级标题
- 维度内容使用二级或三级标题，不允许纯散文结构
- 计数字段使用固定 label
- 不允许在必须字段前后插入无结构大段自由发挥内容

---

## 4. P0 文件契约

## 4.1 `workspace/sop-paths.txt`

**用途**：提供 Solver/P5 需要读取的 SOP 路径列表。

**格式**：每行一个绝对路径。

**要求**：
- 至少包含 1 个 `core` 文件
- 可包含 `domain`、`indication` 文件
- 不允许空行夹杂说明文字

**示例**：
```text
/abs/path/kb-engine/sop/core/protocol-design.md
/abs/path/kb-engine/sop/domains/oncology.md
/abs/path/kb-engine/sop/indications/melanoma.md
```

## 4.2 `workspace/case-meta.json`

**最小字段**：
```json
{
  "round": "round-06",
  "case_id": "kimmtrak",
  "drug_name": "Kimmtrak",
  "pathway": "protocol-design",
  "nda_bla_id": "BLA761228",
  "fda_review_path": "/abs/path/.../review.pdf",
  "question_path": "/abs/path/.../question.md"
}
```

**要求**：
- 缺失字段必须在 `prepare-report.json` 中显式报错
- `nda_bla_id` 允许为 `N/A`，但前提是 `fda_review_path` 可用

## 4.3 `workspace/question.md`

**要求**：
- 必须是题目原文副本
- 不允许追加 SOP、答案、分析内容
- 内容为空时视为 `P0_BLOCKED`

## 4.4 `workspace/fda-raw-sections.md`

**用途**：作为 `P3` 的唯一 FDA Review 输入。

**结构**：
```markdown
# FDA Raw Sections: {case_id}

## Source
- nda_bla_id: BLA761228
- retrieval_mode: docsearch | fallback-read
- source_path: /abs/path/...

## Section: trial design
[原始摘录]

## Section: control arm
[原始摘录]

## Section: sample size
[原始摘录]
```

**要求**：
- 必须保留 `retrieval_mode`
- 必须保留来源路径
- 每个 section 保留原文，不做总结改写

## 4.5 `workspace/prepare-report.json`

**用途**：记录 `P0` 结果和阻断原因。

**最小字段**：
```json
{
  "status": "ok",
  "case_id": "kimmtrak",
  "docsearch_hit": true,
  "fallback_used": false,
  "errors": [],
  "warnings": []
}
```

**`status` 枚举**：
- `ok`
- `warning`
- `blocked`

---

## 5. P1 文件契约

## 5.1 `solver-{A|B|C}.md`

**用途**：每个 Solver 的最终答案。

**固定结构**：
```markdown
# Solver Output: {drug_name} [protocol-design] — Solver A

## Status
- status: ok
- model: kimi
- case_id: kimmtrak

## 1. design_type
[答案]

## 2. control_arm
[答案]

## 3. primary_endpoint
[答案]

## 4. endpoint_definition
[答案]

## 5. secondary_endpoints
[答案]

## 6. sample_size
[答案]

## 7. stat_framework
[答案]

## 8. stratification
[答案]

## 9. eligibility
[答案]

## 10. operational
[答案]
```

**失败/超时写法**：
```markdown
# Solver Output: {drug_name} [protocol-design] — Solver B

## Status
- status: TIMEOUT
- model: minimax
- case_id: kimmtrak
```

**要求**：
- 成功文件必须包含 10 个维度
- 失败文件可只保留 `Status`
- 不允许写推理链或历史对话摘要

---

## 6. P2 文件契约

## 6.1 `consensus-answer.md`

**用途**：作为 Judge 和 P5 的 AI 最终答案输入。

**固定结构**：
```markdown
# Consensus Answer: {case_id}

## Summary
- valid_solvers: 3
- merge_model: sonnet

## 1. design_type
- decision: [最终答案]
- source: consensus | divergence | orchestrator-resolved | UNRESOLVED
- support: 2/3
- notes: [简短说明]

## 2. control_arm
...
```

**要求**：
- 必须完整覆盖 10 个维度
- 每个维度必须有 `decision` 和 `source`
- `source` 只能是固定枚举：`consensus` / `divergence` / `orchestrator-resolved` / `UNRESOLVED`
- `support` 格式固定为 `N/M`

**校验失败条件**：
- 缺任何维度
- `source` 使用未定义值
- 某维度没有 `decision`

---

## 7. P3 文件契约

## 7.1 `fda-actual.md`

**用途**：Judge 评分的 FDA 标准答案。

**固定结构**：
```markdown
# FDA Actual: {case_id}

## Source
- retrieval_mode: docsearch
- source_path: /abs/path/...

## 1. design_type
- answer: [FDA 实际方案]
- evidence: [FDA 原文摘录或 section anchor]
- confidence: explicit | inferred

## 2. control_arm
...
```

**要求**：
- 必须完整覆盖 10 个维度
- 每个维度必须有 `answer` 和 `evidence`
- 若 FDA Review 未明确提及，则写：
  - `answer: NOT_STATED_IN_REVIEW`
  - `evidence: section searched but no explicit statement`
- `confidence` 只能是 `explicit` 或 `inferred`

**规则**：
- `inferred` 仅在原文间接支持时允许使用
- 如果使用 `inferred`，P6 可计入 warning

---

## 8. P4 文件契约

## 8.1 `judge-{A|B|C}.md`

**用途**：单个 Judge 的评分结果。

**固定结构**：
```markdown
# Judge Score: {case_id} — Judge A

## Summary
- status: ok
- model: kimi

## 1. design_type
- score: match | partial | miss | SKIP
- rationale: [简短理由]
- evidence_ref: [引用 fda-actual.md 的 evidence]

## 2. control_arm
...
```

**要求**：
- 每个维度必须有 `score`
- `score` 只能取 `match / partial / miss / SKIP`
- 每个维度必须有 `rationale`
- 每个维度必须有 `evidence_ref`

## 8.2 `scoring.md`

**用途**：三位 Judge 的合并结果，也是 `P6` 的主要输入。

**固定结构**：
```markdown
# Final Scoring: {case_id}

## Per-Dimension Scores

### 1. design_type
- final_score: match
- votes: match, match, partial
- resolution: majority

### 2. control_arm
...

## Totals
- match_count: 7
- partial_count: 2
- miss_count: 1
- skip_count: 0
- total_items: 10
- match_score: 0.70
- weighted_score: 0.80
```

**要求**：
- `Per-Dimension Scores` 必须覆盖 10 个维度
- `final_score` 只能取 `match / partial / miss / SKIP`
- `votes` 必须保留原始投票顺序
- `resolution` 只能取：`majority` / `strict-tiebreak`
- `Totals` 六个字段必须齐全

**脚本校验规则**：
- `match_count + partial_count + miss_count + skip_count = 10`
- `total_items = 10 - skip_count`
- `match_score = match_count / total_items`
- `weighted_score = (match_count + 0.5 * partial_count) / total_items`

---

## 9. P5 文件契约

## 9.1 `analysis.md`

**用途**：差异归类与规则生成主文件。

**固定结构**：
```markdown
# Analysis: {case_id}

## Summary
- match_score: 0.70
- weighted_score: 0.80
- new_rules_proposed: 1
- delta_codes: KNOW

## Facts
[仅列出评分事实和 FDA/AI 差异]

## Inference
[差异归类和原因分析]

## Rule Proposals
### Rule 1
- delta_type: KNOW | REG | STAT | ALT | INFO
- dimension: sample_size
- proposal: [规则草案]
- disposition: proposed | rejected | not-applicable
- rationale: [原因]
```

**要求**：
- `Facts`、`Inference`、`Rule Proposals` 三段必须存在
- 每条规则必须包含 `delta_type`
- `delta_type` 只能取 `KNOW / REG / STAT / ALT / INFO`
- `ALT` 和 `INFO` 不应写入 SOP patch

## 9.2 `grounding.md`

**生成条件**：存在 `KNOW / REG / STAT` 规则候选。

**固定结构**：
```markdown
# Grounding: {case_id}

## Rule 1
- source_type: guidance | multi-case | single-case
- citation: [具体来源]
- excerpt: [简短摘录]
- confidence: high | medium | low
```

## 9.3 `sop-patch.md`

**生成条件**：存在允许写入 SOP 的规则。

**固定结构**：
```markdown
# SOP Patch: {case_id}

## Target
- file: /abs/path/...
- section: Trial Design

## Patch
- action: append
- content: [规则文本]
- grounded_by: Rule 1
```

## 9.4 `review.md`

**生成条件**：规则审核独立执行时。

**固定结构**：
```markdown
# Rule Review: {case_id}

## Decision
- status: approved | revise | rejected

## Comments
[审核意见]
```

---

## 10. P6 文件契约

## 10.1 `finalize-report.json`

**用途**：记录整轮收尾状态、校验结果和错误码。

**最小字段**：
```json
{
  "status": "ok",
  "case_id": "kimmtrak",
  "round": "round-06",
  "results_appended": true,
  "git_completed": true,
  "errors": [],
  "warnings": []
}
```

**`status` 枚举**：
- `ok`
- `warning`
- `failed`

### 10.2 `results.tsv`

**固定列顺序**：
```text
round,branch,case_id,drug_name,pathway,match_score,weighted_score,match_count,partial_count,miss_count,skip_count,total_items,new_rules,sop_total,delta_codes,notes,timestamp
```

**要求**：
- 列顺序固定
- 不允许插入新列
- `delta_codes` 多值时用逗号分隔
- `match_score` 和 `weighted_score` 保留 2 位小数

---

## 11. 错误码约定

| 错误码 | 含义 | 触发 phase |
|--------|------|-------------|
| `P0_BLOCKED` | 缺题目或 FDA Review 原文 | P0 |
| `LOW_CONFIDENCE_ABORT` | Solver 少于 2 个成功 | P1/P2 之间 |
| `FDA_FORMAT_SCHEMA_ERROR` | `fda-actual.md` 不满足契约 | P3 |
| `JUDGE_ABORT` | Judge 少于 2 个成功 | P4 |
| `SCORING_SCHEMA_ERROR` | `scoring.md` 缺字段或算术不一致 | P4/P6 |
| `ANALYSIS_SCHEMA_ERROR` | `analysis.md` 缺关键段落或 delta_type 非法 | P5 |
| `FINALIZE_FAILED` | P6 写入或 Git 失败 | P6 |

---

## 12. 校验顺序

建议 runner 按以下顺序校验：

1. `P0` 完成后校验 `prepare-report.json`
2. `P1` 完成后统计成功 solver 数量
3. `P2` 完成后校验 `consensus-answer.md` 10 维度完整性
4. `P3` 完成后校验 `fda-actual.md` 的 `answer/evidence`
5. `P4` 完成后校验 `judge-*.md` 和 `scoring.md`
6. `P5` 完成后校验 `analysis.md`/`grounding.md`/`sop-patch.md`
7. `P6` 完成后校验 `finalize-report.json` 和 `results.tsv`

---

## 13. 非兼容修改规则

如果后续要修改任一文件 schema，必须同时更新：
- 本文件
- 对应 prompt 模板
- 解析脚本
- `program.md` 中的输出定义

**禁止**只改 prompt 或只改脚本，不改契约文档。

---

## 14. 结论

Pipeline v6 的核心不是“把输出写到文件里”，而是让每个文件都成为稳定、可解析、可验证的 phase 契约。

只要这个契约不稳，脚本化、降本和自动收敛判断都会变成脆弱系统。因此：
- schema 必须先固定
- 错误码必须可追踪
- 缺失信息必须显式标记
- 所有下游逻辑都应基于契约，而不是基于自由文本猜测
