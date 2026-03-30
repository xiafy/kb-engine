# program.md — 多分支闭环训练主程序

> **版本**: v3.6 | **创建**: 2026-03-30 | **来源**: v1.0 重构为多分支架构
> **原则**: Karpathy Autoresearch — 极简、自主、闭环
> **变更**: v3.1 裁判分离 | v3.2 Git PR | v3.3 路径+隔离+收敛 | v3.4 L4 审核 | v3.5 3+3 做题+共识 | v3.6 规则溯源(Step 5c)

---

## 系统角色

你是一个正在通过闭环训练提升 CRO 专业能力的 AI。你将反复做题、对答案、总结规律、更新 SOP，直到收敛。本程序支持多个训练分支（Protocol Design, SAP Design, ...），通过 branch config 切换。

## 文件清单

| 文件 | 可读 | 可写 | 说明 |
|------|------|------|------|
| `training/_shared/program.md` | ✅ | ❌ | 本文件，执行指令 |
| `training/_shared/evaluate.md` | ✅ | ❌ | 通用评分标准（branch 可 override） |
| `training/{branch}/config.yaml` | ✅ | ❌ | 分支配置（评分维度、答案提取、SOP 路径） |
| `training/_shared/case-config.json` | ✅ | ❌ | 案例→答案路径+域映射 |
| `training/{branch}/questions/{id}-{drug}.md` | ✅ | ❌ | 题目（分支专属） |
| `training/{branch}/results.tsv` | ✅ | ✅ 追加 | 每轮评分记录 |
| `sop/core/{task}.md` | ✅ | ✅ | **可变** — 核心决策 SOP |
| `sop/domains/{domain}.md` | ✅ | ✅ | **可变** — 疾病大类知识 |
| `sop/indications/{indication}.md` | ✅ | ✅ | **可变** — 适应症特定知识 |
| `sop/regulatory/{path}.md` | ✅ | ✅ | **可变** — 监管路径知识 |
| `data/fda-guidelines/markdown/INDEX.md` | ✅ | ❌ | FDA/ICH 指南索引（标题+文件名，156 份） |
| `data/fda-guidelines/markdown/fda/*.md` | ✅ | ❌ | FDA Guidance 原文（MD 格式，115 份） |
| `data/fda-guidelines/markdown/ich/*.md` | ✅ | ❌ | ICH 指南原文（MD 格式，41 份） |

> **⚠️ FDA Guidance/ICH 仅在 Step 5c 规则溯源时使用，Step 2 做题时禁止访问。**

## 分支列表

| 分支 | core/ SOP | 状态 | 描述 |
|------|-----------|------|------|
| protocol-design | protocol-design.md | ✅ v3.0（59 规则迁移） | Protocol 设计 8 步决策 |
| sap-design | sap-design.md | 🌱 seed | SAP 统计设计 |
| stat-analysis | stat-analysis.md | ⬜ 待创建 | 统计分析执行 |
| clinical-pharm | clinical-pharm.md | ⬜ 待创建 | 临床药理评估 |
| efficacy-assessment | efficacy-assessment.md | ⬜ 待创建 | 疗效评价 |
| safety-assessment | safety-assessment.md | ⬜ 待创建 | 安全性评价 |
| regulatory-strategy | regulatory-strategy.md | ⬜ 待创建 | 监管策略决策 |
| labeling-review | labeling-review.md | ⬜ 待创建 | 标签审核 |
| post-marketing | post-marketing.md | ⬜ 待创建 | 上市后要求预测 |

---

## 执行顺序表

### Protocol Design（已固定，20 案例，难度梯度优化）

```
Round 01: 12-sotyktu      (自免/炎症, RCT, 热身)
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

### 其他分支

执行顺序沿用上表（同一题库），但可按 config.yaml 的 `execution_order` 自定义。未定义时默认按 ID 顺序。

---

## Git 工作流（PR 模型）

每轮训练通过 Git 分支管理，main 是知识枢纽。

### 每轮 Git 操作

```bash
# 1. 从最新 main checkout
git checkout main && git pull

# 2. 创建本轮训练分支
git checkout -b train/{branch}-round-{NN}

# 3. 执行下面的 Step 0a - Step 7

# 4. 提交本轮变更
git add -A
git commit -m "round-{NN}: +{N} rules {文件}, match {score}"

# 5. 创建 PR 并 merge
gh pr create --base main --title "{Branch} Round {NN}: +{N} rules, match {score}"
gh pr merge train/{branch}-round-{NN} --squash --delete-branch
```

### 分支命名

```
train/pd-round-01          ← Protocol Design Round 1
train/sap-round-03         ← SAP Design Round 3
experiment/{描述}           ← 短期实验，失败可删
```

### Tag（收敛时打标）

```bash
# Batch 收敛后
git tag pd-batch1-stable    # 训练批次收敛点
git tag v3.2-release        # 正式稳定版（PM Agent 用）
git push --tags
```

### SOP 写入约定（Section-Append）

修改 domains/ 和 indications/ 文件时：
1. **写入对应 section**：每个训练分支写入文件中对应主题的 section（如 `## Trial Design`、`## SAP Design`）
2. **只追加不修改**：在 section 末尾追加新规则，不修改已有规则的文字
3. **不删除**：旧规则错了 → 追加修正规则 + `[supersedes: 旧规则摘要]`
4. **清洗在 main**：训练收敛后在 main 做清洗 commit（合并重复、删除 superseded、跨 section 去重）

**目的**：避免多训练分支同时改同一文件时的 Git 合并冲突。

---

## 每轮执行流程

### Step 0a: 加载分支配置

```
读取 training/{branch}/config.yaml
提取：
  - sop.core: 核心 SOP 文件路径
  - answer_extraction.chapters: FDA Review 中的答案提取章节
  - scoring.dimensions: 评分维度（override evaluate.md 默认）
  - sop_write_targets: SOP 写入目标规则
  - input_schema（如有）: 做题时的固定输入字段
```

### Step 0b: SOP 路径解析

```
读取 training/_shared/case-config.json，找到当前案例。
提取 domain, indication, regulatory 字段。

构建 SOP 加载列表（按顺序）：
  1. sop/core/{config.sop.core}          ← 必读
  2. sop/domains/{domain}.md             ← 如果 domain 存在
  3. sop/indications/{indication}.md     ← 如果 indication 存在且文件存在
  4. sop/regulatory/{regulatory}.md      ← 如果 regulatory 存在

输出：完整文件路径列表（记录到本轮日志，可审计）

多 domain 情况：如果案例涉及多个 domain（config 中为数组），
按字母序加载所有匹配文件。
```

### Step 1: 读题

```
读取 training/{branch}/questions/{id}-{drug}.md 全文。
提取关键信息：
  - drug_name, MOA, formulation
  - proposed_indication, target_population, line_of_therapy
  - disease_background, current_soc, unmet_need
  - regulatory_pathway (从 frontmatter)

如果分支 config 有 input_schema：
  从 training/_shared/case-config.json 的对应字段提取输入参数（如 protocol_params）
  这些参数作为"已知条件"提供给做题步骤
```

### Step 2: 并行做题（3 Agent 闭卷）

**严格要求：不得查看答案文件，不得使用外部搜索。仅基于题目信息 + SOP 文件作答。**

**并行 3 个做题 Agent**（独立 subagent session，互不可见）：
- 每个 Agent 获得相同输入：SOP 文件列表（Step 0b）+ 题目（Step 1）
- 每个 Agent 独立作答，按分支 config.yaml 的 scoring.dimensions 定义的维度输出
- 3 个 Agent 使用相同模型但独立 session（不同采样产生多样性）

输出格式（每个 Agent 各一份）：
```markdown
## My Answer: {drug_name} [{branch}] — Agent {A/B/C}

### 1. {dimension_1}
[答案内容]

### 2. {dimension_2}
[答案内容]
...
```

### Step 2b: 共识合并

3 份答案提交给调度者（Helix），逐维度合并：

```
对每个评分维度：
  IF 3/3 一致 → 直接采纳，标注 [consensus: 3/3]
  IF 2/3 一致 → 采纳多数意见，标注 [consensus: 2/3, dissent: Agent X 认为...]
  IF 3/3 各不同 → 列出所有选项 + 各自理由，标注 [no-consensus]
```

**[no-consensus] 是早期 SOP 质量信号**：3 个 Agent 读同一 SOP 却做出不同答案 → SOP 规则有歧义或缺失，比裁判评分更早暴露问题。

输出：
```markdown
## Consensus Answer: {drug_name} [{branch}]

### 1. {dimension_1}
[共识答案] [consensus: 3/3]

### 2. {dimension_2}
[多数意见] [consensus: 2/3, dissent: Agent C 认为 xxx]
...
```

**裁判评分基于 consensus-answer.md，不是个体答案。**

### Step 3: 对答案（读课本）

```
根据 training/_shared/case-config.json 找到答案路径：
  data/fda-reviews/md/{path}/MultidisciplineR.md

⚠️ 错误处理：
  - 如果文件不存在 → 记录 "ANSWER_NOT_FOUND"，跳至 Step 7
  - 如果文件超过 200KB → 只读取前 100KB + 搜索关键章节

从 FDA Review 中提取信息，**仅提取 config.yaml answer_extraction.chapters 指定的章节**。

将提取结果格式化为：
```

```markdown
## FDA Actual: {drug_name} [{branch}]

### 1. {dimension_1}
[FDA 实际内容]
...
```

### Step 4: 独立裁判评分

⚠️ **做题 Agent 不得自评。** 评分必须由独立裁判 Agent 执行。
实证数据：自评通胀约 25%（自评 0.93 vs 盲评 0.74，20 轮训练验证）。

**裁判配置**：
- 裁判数量：≥3 名独立 Agent（盲评，互不可见评分）
- 决定机制：多数票（≥2/3 一致采纳）；3 名裁判全不一致时取中值
- 裁判不得看做题 Agent 的推理过程，仅看最终答案 vs FDA 实际

**⚠️ 隔离强制要求**：
- 每位裁判必须在**独立 subagent session** 中执行（`sessions_spawn`）
- 传入裁判的输入**仅包含**：answer.md 最终答案 + FDA actual 文本 + evaluate.md
- **禁止传入**：做题 Agent 的推理过程、SOP 文件、题目原文
- scoring.md 中记录每位裁判的 session ID，用于审计追溯

**评分流程**：
1. 读取评分标准：先读 training/_shared/evaluate.md，再检查 branch config 是否有 override
2. 每位裁判独立对每个评分维度打分（match / partial / miss / skip）
3. 汇总多数票结果

```markdown
## Scoring: {drug_name} [{branch}]

| # | Dimension | My Answer | FDA Actual | Score | Rationale |
|---|-----------|-----------|------------|-------|-----------|
| 1 | ... | ... | ... | match | ... |
...
```

计算 match_score 和 weighted_score（公式见 evaluate.md）。

**评分异常检查**:
- match_score = 1.0 → 检查信息泄露或评分过松
- match_score < 0.2 → 检查答案文件是否正确
- 裁判间 κ < 0.5 → 重新校准评分标准（参考 evaluate.md 校准规则）

### Step 5: 差异归类

对所有 `partial` 和 `miss` 项，归类原因：

| 差异类型 | 代码 | 说明 | SOP 可修复？ |
|----------|------|------|-------------|
| 领域知识不足 | `KNOW` | 不知道某适应症/疾病的标准做法 | ✅ 追加规则 |
| 监管路径判断错误 | `REG` | 对 FDA 审批路径/要求判断失误 | ✅ 追加规则 |
| 统计方法选择错误 | `STAT` | 终点/分析方法/样本量假设不合适 | ✅ 追加规则 |
| 合理但非 FDA 选择 | `ALT` | 方案合理但 FDA 选了别的 | ⚠️ 记录不更新 |
| 题目信息不足 | `INFO` | 题目未提供做出正确判断所需的信息 | ❌ 不更新 |

### Step 5c: 规则溯源（Rule Grounding）

**目的**：确保写入 SOP 的规则不是单案例经验的简单照搬，而是有权威依据的可泛化决策框架。

**仅对 KNOW / REG / STAT 类差异执行**（ALT / INFO 不触发）。

对每条准备写入 SOP 的规则，按优先级溯源：

```
1. 查 FDA Guidance / ICH 指南（最高权威，通用原则）
   → 搜索 data/fda-guidelines/markdown/INDEX.md 匹配关键词
   → 找到相关指南 → 读原文提取具体章节依据
   → 规则写为通用决策框架（不限适应症）→ 写入 core/ 或 domains/

2. 查历史训练轮次（多案例交叉验证）
   → 检查 training/{branch}/rounds/ 中是否有 ≥3 个案例出现同一模式
   → 有 → 规则标注 [multi-case: case1, case2, case3]
   → 写入 domains/（疾病大类通用）

3. 仅当前案例支撑（最低可信度）
   → 规则标注 [single-case: FDA-Review-{drug}]
   → 写入 indications/（适应症特定）
   → 同时标注 [low-confidence]
```

**溯源结果标注（写入 SOP 时必须附加）**：
- `[grounded: FDA-Guidance-{name}, Section {X}]` — Guidance/ICH 依据
- `[grounded: ICH-{Exx}, Section {X}]` — ICH 依据
- `[multi-case: {drug1}, {drug2}, {drug3}]` — 多案例验证
- `[single-case: FDA-Review-{drug}]` — 单案例，低可信度

**规则形式区别**：
- 有 Guidance 依据 → 写为"当 [条件] 时，应 [做法]，因为 [原理]"（通用框架）
- 仅有案例依据 → 写为"对于 [特定适应症]，FDA 在 [药物] 案例中选择了 [做法]"（事实记录）

**⚠️ shared/kb/ 当前质量不稳定，不作为独立溯源依据。仅在 FDA Guidance 和多案例均无法支撑时，可参考但须额外标注 `[kb-ref, unverified]`。**

### Step 5b: SOP 更新审核（L4 质控门控）

⚠️ **SOP 更新前必须经独立 Agent 审核。** 这是防止坏规则进入 main 的最后一道防线。

**触发条件**：Step 5 差异归类中存在 KNOW / REG / STAT 类型的差异（即准备更新 SOP）。
如果本轮所有差异均为 ALT / INFO → 跳过此步，直接到 Step 7。

**审核流程**：
1. Spawn 独立审核 Agent（`sessions_spawn`，与做题/裁判不同的 session）
2. 传入审核 Agent 的输入：
   - 准备追加的每条规则（完整文本 + 溯源标注）
   - 写入目标文件和 section
   - 差异归类理由（KNOW/REG/STAT + 具体说明）
   - FDA Review 中的原始证据（支撑该规则的 FDA 原文摘录）
   - Step 5c 溯源结果（Guidance 引用 / 多案例列表 / 单案例标注）
3. **禁止传入**：做题 Agent 的完整答案、裁判评分详情、SOP 当前内容
4. 审核 Agent 对每条规则独立判定：
   - ✅ **同意追加**：规则准确、归类正确、措辞合规
   - ⚠️ **需修改**：方向正确但措辞需调整（附修改建议）
   - ❌ **拒绝追加**：归类错误（应为 ALT）、规则不准确、证据不足

**拒绝门控**：
- 被拒绝的规则**不写入 SOP**，记录在 analysis.md 的 `rejected_rules` 部分
- 需修改的规则按审核建议调整后写入
- 审核结果记录在 `rounds/round-{NN}/analysis.md` 中

### Step 6: 更新 SOP（核心学习步骤）

**仅当差异类型为 KNOW / REG / STAT 且通过 Step 5b 审核时更新。**

#### 6a. 确定写入目标

根据 config.yaml 的 `sop_write_targets`：
- 全局规则 → `sop/core/{task}.md`
- 疾病大类规则 → `sop/domains/{domain}.md` 的对应 section
- 适应症特定规则 → `sop/indications/{indication}.md` 的对应 section
- 监管路径规则 → `sop/regulatory/{path}.md`

#### 6b. 写入格式（Section-Append）

追加到目标文件的对应主题 section 末尾（如 `## Trial Design`、`## SAP Design`）。
格式与文件现有规则风格一致（无编号，纯内容）。

**⚠️ 只追加，不修改已有行。** 旧规则错了 → 追加修正规则 + `[supersedes: 旧规则摘要]`。
这是 Git PR 模型下避免跨分支合并冲突的核心约定。

#### 6c. 去重

追加前检查目标文件对应 section 是否已有类似规则：
- 已有且更精确 → 不追加
- 已有但本案例更好 → 追加新版本 + `[supersedes: 旧规则摘要]`（不修改旧行）
- 已有但本案例是不同适应症 → 追加为新适应症规则

#### 6d. 行数控制

更新后检查目标文件行数：
- core/ > 200 行 → 触发规则合并（将相似规则精简）
- domains/ > 100 行 → 考虑拆分子 section
- indications/ > 80 行 → 考虑精简表述

#### 6e. 版本更新

每次更新 SOP 文件后，递增 frontmatter version（patch +1）。

### Step 7: 记录结果

#### 7a. 保存本轮详细记录

将本轮完整产出保存到 `training/{branch}/rounds/round-{NN}/`：
```
rounds/round-{NN}/
├── answer-A.md          ← 做题 Agent A 输出
├── answer-B.md          ← 做题 Agent B 输出
├── answer-C.md          ← 做题 Agent C 输出
├── consensus-answer.md  ← 共识合并结果（含分歧标注）
├── fda-actual.md        ← FDA 实际方案
├── scoring.md           ← 3 裁判多数票评分（基于 consensus vs FDA）
├── analysis.md          ← 差异归类 + 规则溯源 + SOP 更新审核 + 共识分歧分析
└── grounding.md         ← Step 5c 溯源记录（查了哪些 Guidance、匹配结果）
```

#### 7b. 追加汇总评分

向 `training/{branch}/results.tsv` 追加一行。

基线列（必有）：
```
round, case_id, branch, match_score, weighted_score, timestamp
```

分支扩展列（由 config 定义）：
```
match_count, partial_count, miss_count, skip_count, total_items, new_rules_added, sop_rule_count, delta_codes, notes
```

### Step 8: 循环检查与收敛判断

```
收敛信号（任一触发 → 可提前结束）：
  - 连续 3 轮 match_score ≥ 0.70 且 new_rules_added ≤ 1
  - 连续 5 轮 new_rules_added = 0

发散告警（任一触发 → 暂停训练，审核 SOP）：
  - 5-round rolling average match_score 连续下降 3 个 batch
  - 连续 3 轮 new_rules_added ≥ 4

正常循环：
  如果还有剩余案例且未触发收敛/发散 → 回到 Step 0b（Step 0a 只在首轮执行）
  如果所有案例完成 或 触发收敛信号 → 进入收尾
```

---

## 收尾流程

所有轮次完成后：

1. **输出收敛报告**：
   - match_score 趋势（前 5 轮 vs 后 5 轮平均分）
   - SOP 各文件规则变更统计
   - 最常见差异类型 Top 3

2. **SOP 清洗**：
   - 检查各 SOP 文件中是否有矛盾规则
   - 合并重复规则（跨文件去重）
   - 标注仅单案例来源的规则为 `[low-confidence]`

3. **版本标记**：
   - 更新所有修改过的 SOP 文件的 version
   - 在 `sop/CHANGELOG.md` 记录本轮训练的变更摘要
   - 打 Git tag：`git tag {branch}-batch{N}-stable && git push --tags`

4. **SOP 清洗 commit**（在 main 上）：
   - 合并同一 section 内重复/矛盾的规则
   - 删除被 `[supersedes]` 标记的旧规则
   - 跨 section 去重（多个分支学到同一条 → 提取到通用位置）
   - `git commit -m "sop-cleanup: post-{branch}-batch{N}"`

---

## 分批策略

| 批次 | 案例 | 策略 | 人工介入 |
|------|------|------|----------|
| **Batch 1** (Round 1-5) | 精做 | 每轮完整执行，详细记录 | 第 5 轮后审核 SOP |
| **Batch 2** (Round 6-10) | 常规 | 正常执行，SOP 更新精简化 | 无 |
| **Batch 3** (Round 11-15) | 加速 | 评分+SOP 更新，省略详细叙述 | 无 |
| **Batch 4** (Round 16-20) | 冲刺 | 最小化输出，重点关注 miss 项 | 完成后审核最终 SOP |

**唯一人工介入点**: Round 5 后 和 Round 20 后，共 2 次。

---

## 错误处理

| 错误场景 | 处理方式 |
|----------|----------|
| 答案文件不存在 | 记录 `ANSWER_NOT_FOUND`，match_score = `N/A`，跳过 Step 4-6 |
| 答案文件过大 | 搜索 config 指定章节标题，提取相关段落 |
| match_score = 1.0 | 触发自检：重新严格评分 |
| match_score < 0.2 | 触发自检：确认答案文件正确 |
| core/ SOP > 200 行 | 触发规则合并 |
| case-config 无 domain/indication | 跳过对应 SOP 加载，仅加载 core/ |
| config.yaml 缺失字段 | 使用默认值（_shared/evaluate.md 原始 10 维度） |
| 新分支首次运行 | Step 0a 验证 config 完整性；core/ SOP 如不存在则报错退出 |
