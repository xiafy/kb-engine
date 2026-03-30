# evaluate.md — 固定评分标准

> **版本**: v2.0 | **创建**: 2026-03-29 | **基于**: v1.0 + 三裁判盲评实验校准
> **用途**: AI 答案 vs FDA 实际方案的匹配度评分
> **变更说明**: 解决 5 项裁判间分歧（Item 3/4 边界、次要终点计算法、operational 收窄、样本量分层阈值、stat_framework 判例库），增加判例和校准规则

---

## 评分原则

1. **评的是匹配度，不是质量** — AI 方案可能优于 FDA 实际方案，但仍算 `partial` 或 `miss`
2. **以 FDA 实际审评通过的方案为标准答案** — 不是 FDA 建议的方案，是获批的方案
3. **合理偏差给 partial** — 方向正确但具体选择不同，给 `partial` 而非 `miss`
4. **不可用的信息不扣分** — 题目未提供、且无法合理推断的信息，该项标 `skip`
5. **一项一判** — 每个 Item 只评其定义范围内的内容，不越界吸收相邻 Item 的评判对象

---

## 评分校准规则（裁判必读）

所有裁判在评分前必须逐条确认以下规则：

### 规则 A: "方向一致但细节不同 = partial" 的精确定义

> **"方向一致"** = 两个选择解决同一个临床问题、服务同一个监管目的。
> **"细节不同"** = 具体执行方式、参数、阈值、工具有差异，但不改变临床决策的根本逻辑。

- ✅ partial 例：都用化疗对照，但具体方案不同（FOLFOX vs FOLFIRI）
- ✅ partial 例：都做期中分析，但 alpha spending function 不同
- ❌ 不是 partial：一个用活性对照，另一个用安慰剂（根本逻辑不同 → miss）

### 规则 B: 边界情况从严原则

当你在 match 和 partial 之间犹豫时 → **给 partial**。
当你在 partial 和 miss 之间犹豫时 → **给 partial**（保守但不苛刻）。

### 规则 C: 独立性原则

每个 Item 的评分不得受其他 Item 评分的影响。不因 Item 3 给了 match 就放松 Item 4 的标准。

### 规则 D: "该 Item 评什么"优先于直觉

如果你的直觉和 Item 定义冲突，按 Item 定义执行。每个 Item 的"评判对象"和"不评什么"是硬边界。

### 规则 E: 判例优先级

判例表中有完全匹配的情况 → 直接适用判例评分，不做个人判断。

---

## 10 个评分项

---

### Item 1: 设计类型 (`design_type`)

**评判对象**: 试验的宏观设计架构——随机对照 vs 单臂；平行 vs 交叉；开放标签 vs 双盲

**不评什么**: 随机化比例（属于运营细节）、分层因子（Item 8）

| 评分 | 标准 |
|------|------|
| `match` | 设计类型完全一致（如都是随机、平行、双盲） |
| `partial` | 同属 RCT 但盲法不同（如双盲 vs 开放标签）；或随机化比例不同（2:1 vs 1:1） |
| `miss` | 设计类型根本不同（RCT vs 单臂；平行 vs 交叉） |

**加速审批特殊规则**: 如果 regulatory_pathway 含 "Accelerated Approval"，AI 选择单臂设计得 `match`。

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: 随机双盲平行对照 / FDA: 随机双盲平行对照 | `match` | 完全一致 |
| AI: 随机开放标签 2:1 / FDA: 随机双盲 1:1 | `partial` | 同为 RCT，盲法和比例不同 |
| AI: 单臂 / FDA: 随机对照 | `miss` | 设计架构根本不同 |

---

### Item 2: 对照臂选择 (`control_arm`)

**评判对象**: 对照药物/方案的具体选择

**不评什么**: 试验药的选择（不在评分范围）、给药方案细节（属于 Item 10）

| 评分 | 标准 |
|------|------|
| `match` | 对照臂方案一致（同药物/同组合） |
| `partial` | 对照臂方向正确但具体药物不同（如都选了化疗对照，但方案不同） |
| `miss` | 对照臂完全不同（如安慰剂 vs 活性对照；或活性对照的药物类别不同） |

**单臂试验**: 标 `skip`。

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: 安慰剂 + BSC / FDA: 安慰剂 + BSC | `match` | 一致 |
| AI: 多西他赛 / FDA: 紫杉醇 | `partial` | 同属紫杉类化疗，方向正确 |
| AI: 安慰剂 / FDA: 研究者选择化疗 | `miss` | 安慰剂 vs 活性对照是根本不同 |

---

### Item 3: 主要终点选择 (`primary_endpoint`)

**评判对象**: 主要终点的**类型名称**——仅评 OS / PFS / EFS / ORR / CR rate / DFS / DOR 等终点类型是否一致

**⚠️ 硬边界——以下内容不属于 Item 3**:
- 评估方法（BICR vs INV）→ Item 4
- 评估标准（RECIST 1.1 vs iRECIST）→ Item 4
- 统计定义（事件定义、删失规则）→ Item 4
- 时间窗定义（24 周 PFS vs 12 周 PFS）→ Item 4

**判断规则**: Item 3 只回答一个问题——"AI 和 FDA 选了同一个终点**名称/类型**吗？"

| 评分 | 标准 |
|------|------|
| `match` | 终点类型名称一致（OS=OS; PFS=PFS; ORR=ORR） |
| `partial` | 同一维度但不同粒度（PFS vs EFS；ORR vs CR rate；DFS vs RFS） |
| `miss` | 完全不同维度的终点（OS vs ORR；PFS vs DOR） |

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: PFS / FDA: PFS | `match` | 类型名称一致。即使 BICR vs INV 不同，那是 Item 4 的事 |
| AI: ORR / FDA: CR rate | `partial` | 都是客观缓解维度，但粒度不同 |
| AI: OS / FDA: ORR | `miss` | 生存终点 vs 缓解终点，完全不同维度 |

---

### Item 4: 主要终点定义精度 (`endpoint_definition`)

**评判对象**: 在终点类型已确定（Item 3）的基础上，评估终点的**定义方式和评估方法**是否一致

**具体评估的子维度**（按优先级）:
1. **评估方法**: BICR/IRC vs 研究者评估
2. **评估标准**: RECIST 1.1 / iRECIST / Lugano / IWG / 其他
3. **事件定义**: PFS 中什么算"进展"或"死亡"；ORR 中需要确认评估吗
4. **时间窗/截点**: 如 24 周 CR rate vs 不限时间的 CR rate

**前置条件**: 如果 Item 3 = miss（终点类型根本不同），Item 4 自动 = `miss`（无法比较定义精度）

| 评分 | 标准 |
|------|------|
| `match` | 评估方法 + 评估标准均一致 |
| `partial` | 其中一个一致另一个不同（如都用 RECIST 1.1，但 BICR vs INV） |
| `miss` | 评估方法和评估标准都不同；或 Item 3 = miss |

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: PFS by BICR per RECIST 1.1 / FDA: PFS by BICR per RECIST 1.1 | `match` | 评估方法和标准都一致 |
| AI: PFS by INV per RECIST 1.1 / FDA: PFS by BICR per RECIST 1.1 | `partial` | 标准一致，评估方法不同 |
| AI: ORR per RECIST 1.1 / FDA: ORR per Lugano criteria | `miss` | 评估标准完全不同，且评估方法未对齐 |

---

### Item 5: 次要终点覆盖 (`secondary_endpoints`)

**评判对象**: 次要终点的覆盖度

**覆盖率计算方法**（精确规则）:

**Step 1**: 将 FDA 方案中的次要终点分为两类：
- **关键次要终点 (Key Secondary)**: FDA Review 中明确标注为 key secondary endpoint 的；或在统计分析计划中纳入多重性控制的
- **其他次要终点 (Other Secondary)**: 不满足上述条件的所有次要终点

**Step 2**: 分别计算覆盖率：
- `key_coverage` = AI 命中的关键次要终点数 / FDA 关键次要终点总数
- `other_coverage` = AI 命中的其他次要终点数 / FDA 其他次要终点总数

**Step 3**: 评分规则：

| 评分 | 标准 |
|------|------|
| `match` | `key_coverage` = 100% **且** `other_coverage` ≥ 60% |
| `partial` | `key_coverage` ≥ 50%；或 `key_coverage` = 100% 但 `other_coverage` < 60% |
| `miss` | `key_coverage` < 50% |

**强制规则**: 遗漏任何一个关键次要终点 → 最高只能给 `partial`（无论 other_coverage 多高）

**"命中"的定义**: 终点类型名称一致即算命中（不要求定义精度完全一致，那是 Item 4 的范畴）。如 FDA 有"OS as key secondary"，AI 也提到 OS 作为次要终点 = 命中。

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| FDA key: OS, DOR / AI: OS, DOR, PFS（多写无扣分） | `match` | key_coverage=100%, other 也覆盖 |
| FDA key: OS, PFS / AI: OS（漏 PFS） | `partial` | key_coverage=50%, 漏了一个关键终点 |
| FDA key: OS, ORR, DOR / AI: 仅有 QoL | `miss` | key_coverage=0% |

---

### Item 6: 样本量量级 (`sample_size`)

**评判对象**: 样本量是否在合理范围

**分层阈值规则**（解决罕见病 vs 大适应症差异）:

| FDA 实际样本量 | match 阈值 | partial 阈值 | miss |
|---------------|-----------|-------------|------|
| N ≥ 300（大型试验） | ±30% | 31–60% | >60% |
| 100 ≤ N < 300（中型试验） | ±25% | 26–50% | >50% |
| N < 100（小型/罕见病试验） | ±20% | 21–40% | >40% |

**计算方法**: `偏差率 = |AI样本量 - FDA样本量| / FDA样本量 × 100%`

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| FDA: N=500, AI: N=480 (偏差 4%) | `match` | 大型试验，在 ±30% 内 |
| FDA: N=120, AI: N=155 (偏差 29%) | `partial` | 中型试验，超 ±25% 但在 26-50% 内 |
| FDA: N=60, AI: N=200 (偏差 233%) | `miss` | 小型试验，远超 ±40% |

---

### Item 7: 统计分析框架 (`stat_framework`)

**评判对象**: 多重性校正策略、期中分析设计、整体假设检验框架

**不评什么**: 具体 alpha 水平数值（0.025 vs 0.05 是常识，不单独扣分）、样本量计算（Item 6）

**判例库**（遇到以下情况直接适用，不做个人判断）:

| AI 方案 | FDA 方案 | 固定评分 | 理由 |
|---------|---------|---------|------|
| Hierarchical testing | Graphical approach (gatekeeping) | `match` | 都是封闭族多重性控制，实质等价 |
| Graphical approach | Hierarchical testing | `match` | 同上 |
| Group sequential design (GSD) | GSD | `match` | 框架一致 |
| GSD with O'Brien-Fleming | GSD with Lan-DeMets | `match` | 同属 GSD，spending function 差异是细节 |
| Fixed design（无期中） | GSD（有期中） | `partial` | 方向不同但都是正式假设检验 |
| Superiority test | Non-inferiority test | `miss` | 假设检验方向根本不同 |
| NI → Superiority stepdown | 单臂阈值法 (threshold-based) | `miss` | RCT 框架 vs 单臂框架，根本不同 |
| Hierarchical testing（多终点） | 单终点无多重性校正 | `partial` | AI 比 FDA 更复杂，但方向不冲突 |
| 描述性统计（无正式检验） | 正式假设检验 | `miss` | 框架层面根本不同 |

**不在判例库中的情况**: 按以下决策树判断：
1. 假设检验方向一致吗？（superiority vs NI vs 单臂）→ 不一致 = `miss`
2. 都有/都没有期中分析？→ 不一致 = `partial`
3. 多重性控制策略属于同一族？→ 不一致 = `partial`
4. 以上都一致 = `match`

**单臂试验**: 评判是否正确识别为描述性统计 / 精确置信区间。

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: hierarchical testing + 1 次期中 / FDA: graphical approach + 1 次期中 | `match` | 判例库直接命中 + 期中一致 |
| AI: 固定设计 / FDA: 2 次期中分析的 GSD | `partial` | 都是正式检验，但期中分析设计不同 |
| AI: NI 设计 / FDA: superiority 设计 | `miss` | 假设检验方向根本不同 |

---

### Item 8: 分层因子 (`stratification`)

**评判对象**: 随机化分层因子的选择

**覆盖率计算**: 按因子数量计数（每个因子等权）。`覆盖率 = AI 命中的分层因子数 / FDA 分层因子总数`

| 评分 | 标准 |
|------|------|
| `match` | 覆盖率 ≥ 70% |
| `partial` | 覆盖率 30–69% |
| `miss` | 覆盖率 < 30% 或完全遗漏分层 |

**"命中"的定义**: 因子的临床含义一致即算命中。如 FDA 用"ECOG 0 vs 1"，AI 用"ECOG 0-1 vs 2"= 命中（同一维度）。但"ECOG"vs"地理区域"= 不命中（不同维度）。

**单臂试验**: 标 `skip`。

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| FDA: 3 个因子(ECOG, 地区, 前线治疗) / AI: 命中 3 个 | `match` | 100% 覆盖 |
| FDA: 3 个因子 / AI: 命中 1 个 + 1 个额外 | `partial` | 33% 覆盖 |
| FDA: 3 个因子 / AI: 0 个命中 | `miss` | 0% 覆盖 |

---

### Item 9: 入排标准关键项 (`eligibility`)

**评判对象**: 关键入排标准——biomarker 要求、治疗线数限制、关键排除标准

**不评什么**: 常规入排（年龄 ≥ 18、ECOG 0-1 等）——这些太通用，不区分方案质量

**评分聚焦 3 个子维度**:
1. **Biomarker 要求**: 伴随诊断、基因突变/表达阈值（如 PD-L1 CPS ≥ 10）
2. **治疗线数**: 几线治疗（1L / 2L / 3L+）；前线治疗要求
3. **关键排除**: 与该疾病特异相关的排除标准（如脑转移、自身免疫病史）

| 评分 | 标准 |
|------|------|
| `match` | 3 个子维度中 ≥ 2 个一致 |
| `partial` | 1 个子维度一致 |
| `miss` | 0 个一致，或 biomarker 要求完全遗漏/错误 |

**强制规则**: Biomarker 要求完全遗漏或错误 → 最高只能给 `partial`（即使线数和排除标准一致）

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI 和 FDA 都要求 EGFR 突变阳性、2L+、排除脑转移 | `match` | 3/3 一致 |
| AI 正确识别 BRCA 突变，但线数写 1L（FDA 是 2L+） | `partial` | biomarker 对，线数不对 |
| AI 未提及 HER2 阳性要求（FDA 核心要求） | `partial` 上限 | biomarker 遗漏，触发强制规则 |

---

### Item 10: 运营关键决策 (`operational`)

**评判对象**: 仅评以下 **3 个子维度**，其他运营细节（如访视时间表、CRF 设计、数据管理）不评：

1. **试验地理范围**: 全球多中心 vs 区域性（如仅美国/仅中国/仅日本）vs 单中心
2. **Biomarker 检测策略**: 中心化检测 vs 本地检测 vs 未指定
3. **给药方案核心参数**: 剂量 + 给药频率 + 给药途径是否一致（如 200mg Q3W IV vs 400mg Q6W IV）

**不评什么**: 地理区域的具体国家组成、入组速度预期、数据监查委员会设置、特殊人群子研究（这些不纳入评分）

**评分规则**:

| 评分 | 标准 |
|------|------|
| `match` | 3 个子维度中 ≥ 2 个一致（或正确识别） |
| `partial` | 1 个子维度一致 |
| `miss` | 0 个一致 |

**"一致"的定义**:
- 地理范围：全球=全球 → 一致；全球 vs 仅区域 → 不一致
- Biomarker 检测：中心化=中心化 → 一致；中心化 vs 本地 → 不一致；都未提及 → 该子维度跳过（不算入分母）
- 给药方案：剂量和频率都一致 → 一致；剂量一致频率不同（Q2W vs Q3W）→ 不一致

**当某子维度双方都未提及时**: 该子维度不纳入评分（分母从 3 缩减为 2 或 1）。如果所有子维度都未提及 → `skip`

**判例**:

| 场景 | 评分 | 理由 |
|------|------|------|
| AI: 全球多中心 + 中心化检测 + 200mg Q3W / FDA: 同 | `match` | 3/3 一致 |
| AI: 全球多中心 + 未提检测 + 剂量正确但 Q2W vs Q3W | `partial` | 地理一致，检测跳过，给药不一致 = 1/2 |
| AI: 仅美国 + 本地检测 + 完全不同剂量 | `miss` | 0/3 一致 |

---

## 计分公式

```
match_count = count(score == "match")
partial_count = count(score == "partial")
miss_count = count(score == "miss")
skip_count = count(score == "skip")
total_items = 10 - skip_count

match_score = match_count / total_items  (保留 2 位小数)
weighted_score = (match_count * 1.0 + partial_count * 0.5) / total_items  (保留 2 位小数)
```

**主指标**: `match_score`（严格匹配率，用于收敛判断）
**辅助指标**: `weighted_score`（加权得分，partial 算半分，用于观察进步趋势）

---

## 加速审批 / 单臂试验特殊处理

当 `regulatory_pathway` 包含 "Accelerated Approval" 时：

| 评分项 | 调整 |
|--------|------|
| `control_arm` | → `skip`（无对照臂） |
| `stratification` | → `skip`（通常无随机化） |
| `stat_framework` | 评判简化为：是否正确识别为描述性统计 / 精确置信区间 |

**适用总项数变为 8 项**（跳过 2 项）。

---

## 评分纪律

1. **不得自我宽容** — 如果你的方案和 FDA 不同，即使你认为自己的更好，也按匹配度打分
2. **引用原文** — 每项评分的 rationale 必须引用 FDA Review 中的具体表述
3. **不确定时从严** — 无法判断时给 `partial` 而非 `match`
4. **保持一致性** — 同样的偏差在不同案例中应得到相同评分
5. **判例优先** — 判例库/判例表中有匹配情况时，直接适用，不做个人自由裁量
6. **先分类再评分** — 评 Item 3 和 Item 4 时，先确认"这个差异属于终点类型还是终点定义？"，再打分

---

## 附录: v1.0 → v2.0 变更摘要

| 分歧 | v1.0 问题 | v2.0 修正 |
|------|----------|----------|
| Item 3 vs 4 边界 | 未明确区分"终点类型"和"终点定义" | Item 3 只评类型名称，Item 4 评评估方法+标准+事件定义；增加硬边界声明 |
| 次要终点覆盖率 | "≥80% match"但计算方法未定义 | 区分 key vs other，按数量计数，key 遗漏强制 partial 上限 |
| Operational 过于开放 | 含太多子维度，裁判理解不一 | 收窄为 3 个子维度（地理范围、biomarker 检测、给药方案），其他不评 |
| 样本量阈值 | 统一 ±30%，罕见病不适用 | 分层阈值（大/中/小型试验不同阈值） |
| stat_framework 模糊 | "大方向一致"无定义 | 增加 8 条固定判例 + 决策树；NI vs superiority = miss 明确化 |
| 全局 | 无判例、无校准规则 | 每项 3 个判例 + 5 条校准规则 |

---

## Branch Override 机制

各训练分支可在 `branches/{branch}/config.yaml` 中 override 以下设置：
- `scoring.dimensions`: 替换默认 10 项评分维度为分支特定维度
- `scoring.skip_items`: 指定该分支不适用的评分项（自动 skip）
- `scoring.custom_rubric`: 分支特定的判例库（追加到默认判例库之后）

Override 优先级：branch config > evaluate.md 默认值

当分支有自定义评分维度时，计分公式不变（match/partial/miss/skip），但 total_items 基数改为分支维度数。
