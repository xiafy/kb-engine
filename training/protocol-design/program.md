# program.md — Protocol Design 训练程序

> **版本**: v5.0 | **日期**: 2026-03-31 | **分支**: protocol-design
> **骨架**: training/_shared/framework.md（通用流程）
> **前身**: training/_shared/program.md v4.1（已 SUPERSEDED）
> **原则**: docs/guiding-principles.md

---

## 系统角色

你是一个正在通过模拟实战提升 Protocol 设计能力的 AI。每轮训练模拟真实工作流：情报收集→方案设计→质量自审→对答案→提取规则。你可以使用所有可用资源（SOP、FDA 指南、模板、文献检索），唯一限制是不能查看本题药物的 FDA Review（那是答案）。

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

### Step 0: 加载配置

```
读取 training/protocol-design/config.yaml
读取 training/protocol-design/case-config.json，找到当前案例
提取 domain, indication, regulatory 字段

构建 SOP 加载列表：
  1. sop/core/protocol-design.md          ← 必读
  2. sop/domains/{domain}.md             ← 如果文件存在
  3. sop/indications/{indication}.md     ← 如果文件存在
  4. sop/regulatory/{regulatory}.md      ← 如果文件存在

多 domain 情况：数组 → 按字母序加载所有匹配文件。
```

### Step 1: 读题

```
读取 training/protocol-design/questions/{id}-{drug}.md 全文
提取：drug_name, MOA, formulation, proposed_indication,
      target_population, line_of_therapy, disease_background,
      current_soc, unmet_need, regulatory_pathway (frontmatter)
```

### Step 2: 做题（开卷实战）

**模拟真实 CRO Protocol 设计工作流。可用所有资源，唯一限制：不能查看本题药物的 FDA Review。**

#### 可用资源

- SOP 全部文件（core/ + domains/ + indications/ + regulatory/）
- FDA Guidance / ICH 指南原文（data/fda-guidelines/markdown/）
- 同适应症**其他药物**的 FDA Review（非本题答案）
- 模板（shared/kb/methods/templates/）
- 外部搜索（ClinicalTrials.gov、PubMed 等公开信息）

#### Owner Agent 配置

- **数量**: 2 个（并行，独立 subagent session）
- **输入**: SOP 文件列表 + 题目 + 可用资源路径 + orchestration 指引
- **timeout**: 300s

每个 Owner Agent 读 SOP 后**自行决定**工作流：
- 直接完成全部 10 维度设计
- 或按 SOP 中的编排指引 spawn sub-agent（如 Biostat 做样本量精确计算）
- 使用任何可用工具（web_search, exec, web_fetch, read）

**program.md 不规定 Owner Agent 内部如何编排**——这是 SOP 的内容，也是训练要验证的能力。

#### 输出格式（每个 Owner Agent 各一份）

```markdown
## My Answer: {drug_name} [protocol-design] — Owner {A/B}

### 1. design_type
[答案]

### 2. control_arm
[答案]

### 3. primary_endpoint
[答案]

### 4. endpoint_definition
[答案]

### 5. secondary_endpoints
[答案]

### 6. sample_size
[答案]

### 7. stat_framework
[答案]

### 8. stratification
[答案]

### 9. eligibility
[答案]

### 10. operational
[答案]
```

### Step 2b: 共识合并

2 份答案逐维度对比：

```
对每个评分维度（10 个）：
  IF 2/2 一致 → 直接采纳 [consensus: 2/2]
  IF 2/2 不同 → 列出两个选项 + 各自理由 [divergence]
    → Orchestrator 基于 SOP 规则选择更合理的，标注 [orchestrator-resolved]
```

**[divergence] 的价值**：
- 两个 Owner 对 SOP 理解不同 → SOP 措辞有歧义
- 一个 spawn 了 sub-agent 另一个没有 → 编排指令不够明确
- 这些都是 SOP 改进信号

输出：`consensus-answer.md`

### Step 2c: 行为变异记录

Helix 在共识合并时记录：

1. **SOP 理解一致性**：两个 Owner 对同一规则的执行是否一致
2. **编排差异**：Owner A spawn 了哪些 sub-agent vs Owner B
3. **工具使用差异**：一个用了 exec 另一个没有
4. **SOP 违反/跳过**：是否有 Owner 忽略了 SOP 规则
5. **SOP 之外的额外行为**：做了 SOP 没要求的事

只记录事实，不做决策判断。写入 `analysis.md ## Agent Behavior Variance`。

### Step 3: 提取标准答案

```
从 case-config.json 找到答案路径：
  data/fda-reviews/md/{path}/MultidisciplineR.md

⚠️ 错误处理：
  - 文件不存在 → 记录 "ANSWER_NOT_FOUND"，跳至 Step 7
  - 文件超过 200KB → 只读前 100KB + 搜索关键章节

提取章节（config.yaml answer_extraction.chapters）：
  - Clinical Review — Trial Design
  - Clinical Review — Inclusion/Exclusion
  - Clinical Review — Efficacy
  - Clinical Review — Safety
  - Statistical Review — Study Design
  - Statistical Review — Sample Size

格式化为 10 维度的 fda-actual.md
```

### Step 4: 裁判评分

**⚠️ 做题 Agent 不得自评。** 自评通胀约 25%（实证数据）。

**裁判配置**：
- 数量：3 名独立 Agent（盲评，互不可见）
- 决定机制：多数票（≥2/3 一致采纳）；3 名全不一致取中值
- 每位裁判在**独立 subagent session** 中执行

**裁判输入（仅以下内容，不得传入其他）**：
- consensus-answer.md 最终答案
- fda-actual.md
- evaluate.md（本分支评分标准）

**禁止传入**：做题推理过程、SOP 文件、题目原文

**评分维度**（10 项，详见 evaluate.md）：

| # | 维度 | 评判对象 |
|---|------|---------|
| 1 | design_type | 试验宏观设计架构 |
| 2 | control_arm | 对照药物/方案 |
| 3 | primary_endpoint | 主要终点类型 |
| 4 | endpoint_definition | 终点定义精度 |
| 5 | secondary_endpoints | 次要终点覆盖度 |
| 6 | sample_size | 样本量量级 |
| 7 | stat_framework | 统计分析框架 |
| 8 | stratification | 分层因子 |
| 9 | eligibility | 入排标准关键项 |
| 10 | operational | 运营关键决策 |

每项打分：match / partial / miss / skip

```
match_score = match_count / (10 - skip_count)
weighted_score = (match * 1.0 + partial * 0.5) / (10 - skip_count)
```

**异常检查**：
- match_score = 1.0 → 检查信息泄露或评分过松
- match_score < 0.2 → 检查答案文件是否正确
- 裁判间 κ < 0.5 → 重新校准评分标准

### Step 5: 差异分析

对所有 partial 和 miss 项，归类原因：

| 差异类型 | 代码 | 说明 | SOP 可修复？ |
|----------|------|------|-------------|
| 领域知识不足 | `KNOW` | 不知道某适应症/疾病的标准做法 | ✅ 追加规则 |
| 监管路径判断错误 | `REG` | 对 FDA 审批路径/要求判断失误 | ✅ 追加规则 |
| 统计方法选择错误 | `STAT` | 终点/分析方法/样本量假设不合适 | ✅ 追加规则 |
| 合理但非 FDA 选择 | `ALT` | 方案合理但 FDA 选了别的 | ⚠️ 记录；每 5 轮分析模式 |
| 题目信息不足 | `INFO` | 题目未提供做出正确判断所需的信息 | ❌ 不更新 |

### Step 5c: 规则溯源

**仅对 KNOW / REG / STAT 类差异执行。**

按优先级溯源：

```
1. FDA Guidance / ICH 指南（最高权威）
   → 搜索 INDEX.md → 读原文 → 规则写为通用决策框架 → 写入 core/ 或 domains/
   → 标注 [grounded: FDA-Guidance-{name}, Section {X}]

2. 历史训练轮次（多案例交叉验证）
   → ≥3 个案例同一模式 → 标注 [multi-case: case1, case2, case3]
   → 写入 domains/

3. 仅当前案例支撑（最低可信度）
   → 标注 [single-case: FDA-Review-{drug}] + [low-confidence]
   → 写入 indications/
```

### Step 5b: SOP 更新审核

**触发条件**：存在 KNOW / REG / STAT 类差异。全部为 ALT / INFO → 跳过。

1. Spawn 独立审核 Agent
2. 传入：规则草案 + 溯源标注 + FDA 原文摘录
3. 审核 Agent 判定：✅ 同意 / ⚠️ 需修改 / ❌ 拒绝
4. 被拒绝的规则**不写入 SOP**，记录在 analysis.md `rejected_rules`

### Step 6: SOP 写入

**写入目标**（从 config.yaml）：
- 全局规则 → `sop/core/protocol-design.md`
- 疾病大类 → `sop/domains/{domain}.md ## Trial Design`
- 适应症特定 → `sop/indications/{indication}.md ## Trial Design`
- 监管路径 → `sop/regulatory/{regulatory}.md`

**写入约定**：
- Section-Append（追加到对应 section 末尾）
- 只追加不修改已有行
- 旧规则错了 → 追加修正 + `[supersedes: 旧规则摘要]`
- 每次更新递增 frontmatter version

### Step 7: 记录结果

**本轮产出**保存到 `training/protocol-design/rounds/round-{NN}/`：

```
rounds/round-{NN}/
├── answer-A.md          ← Owner Agent A 输出
├── answer-B.md          ← Owner Agent B 输出
├── consensus-answer.md  ← 共识合并结果
├── fda-actual.md        ← FDA 实际方案
├── scoring.md           ← 3 裁判多数票评分
├── analysis.md          ← 差异归类 + 偏差事件 + 行为变异
└── grounding.md         ← 规则溯源记录
```

**results.tsv 追加一行**（17 列，与历史数据一致）：
```
round, branch, case_id, drug_name, pathway, match_score, weighted_score, match_count, partial_count, miss_count, skip_count, total_items, new_rules, sop_total, delta_codes, notes, timestamp
```

**Git**：
```bash
git checkout main && git pull
git checkout -b train/pd-round-{NN}
git add -A
git commit -m "round-{NN}: +{N} rules, match {score}"
gh pr create --base main --title "PD Round {NN}: +{N} rules, match {score}"
gh pr merge --squash --delete-branch
```

**分支命名约定**：
- `train/pd-round-{NN}` — Protocol Design 正式训练轮次
- `experiment/{描述}` — 短期实验，失败可删

**Tag 策略**（收敛时打标）：
```bash
git tag pd-batch{N}-stable     # Batch 收敛点
git tag v{X.Y}-release         # 正式稳定版（PM Agent 用）
git push --tags
```

### Step 8: 收敛判断

```
收敛信号（任一触发 → 可提前结束）：
  - 连续 3 轮 match_score ≥ 0.70 且 new_rules_added ≤ 1
  - 连续 5 轮 new_rules_added = 0

发散告警（任一触发 → 暂停训练，等待人工审核）：
  - 5-round rolling average match_score 连续下降 3 个 batch
  - 连续 3 轮 new_rules_added ≥ 4

正常循环 → 回到 Step 0
```

---

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
