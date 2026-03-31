# SAP Design 训练方案设计

> **版本**: v1.0 | **日期**: 2026-03-31 | **状态**: 待 Boss 确认
> **前置**: framework.md Phase 0（训练方案设计先于流程文档）
> **依赖**: Protocol Design 分支（SAP 输入 = PD 已确定的试验设计参数）

---

## 一、训练目标

**让 Agent 具备独立完成 FDA 级别 SAP（Statistical Analysis Plan）设计的能力。**

具体来说：给定一个药物的 Protocol 设计参数（终点、对照、人群、设计类型），Agent 能产出一份完整的统计分析计划，覆盖主分析方法、多重性控制、期中分析、缺失数据处理、敏感性分析等核心决策，并与 FDA 实际审评通过的 SAP 高度匹配。

**与 Protocol Design 的关系**：
- PD 训练的是"做什么"（选什么终点、什么对照、多大样本量）
- SAP 训练的是"怎么做"（确定了终点之后，具体的统计分析方法、假设检验策略、数据处理规则）
- SAP 以 PD 的输出为输入（protocol_params），不重复做终点/对照选择

---

## 二、训练范围

### 覆盖的决策维度（9 项）

| # | 维度 | 核心决策 | 对应 SOP 章节 |
|---|------|---------|-------------|
| 1 | **主分析方法** | Cox/KM/LogRank/MMRM/CMH 选择 + 模型参数 | Step 1 (Estimand) |
| 2 | **多重性控制** | α 分配策略（Hierarchical/Graphical/Bonferroni）+ recycling | Step 2 |
| 3 | **期中分析** | IA 次数、时机、spending function、futility 界值 | Step 3 |
| 4 | **分析集定义** | ITT/mITT/PP/Safety 选择 + NI 试验特殊规则 | Step 7 |
| 5 | **缺失数据处理** | 主分析方法 + ≥2 种敏感性分析 + tipping point | Step 8 |
| 6 | **亚组分析** | 预设亚组列表 + interaction test + forest plot | Step 9 |
| 7 | **敏感性分析** | 至少 2 种假设下的敏感性分析设计 | Step 8 + BM |
| 8 | **样本量计算方法** | Schoenfeld/Simon/精确法 + 假设表 + 3-scenario | SS.1-2 |
| 9 | **Estimand 框架** | ICH E9(R1) 5 属性 + intercurrent event 策略 | Step 1 |

### 边界（不训练的内容）

- ❌ 终点选择（PD 的范围）
- ❌ 对照臂选择（PD 的范围）
- ❌ 试验设计类型选择（PD 的范围）
- ❌ TFL（Table/Figure/Listing）编程规范（属于 stat-analysis 分支）
- ❌ CDISC/ADaM 数据标准（属于 stat-analysis 分支）

---

## 三、与 Protocol Design 的本质差异

| 维度 | Protocol Design | SAP Design |
|------|----------------|------------|
| **核心技能** | 临床决策（终点、对照、入排） | 统计方法论（检验策略、缺失数据、敏感性） |
| **输入** | 药物信息 + 适应症 | Protocol 参数（终点已定、设计已定） |
| **答案来源** | Clinical Review + Statistical Review | **Statistical Review 为主** + Clinical Review 辅助 |
| **差异类型** | KNOW/REG/STAT/ALT/INFO | **METH/ASSUM/IMPL/ALT/INFO**（见下） |
| **SOP 改进方向** | 加临床规则 + 适应症知识 | 加统计方法论 + 公式/模型选择规则 |
| **工具需求** | web_search 为主 | **exec（Python/R）为主** — 样本量验算、spending function 计算 |
| **评分粒度** | 定性为主（match/partial/miss） | **定量+定性混合** — 部分维度需要数值比较 |

### SAP 独有的差异类型代码

| 代码 | 说明 | SOP 可修复？ |
|------|------|-------------|
| `METH` | 统计方法选择错误（如该用 MMRM 却用了 LOCF） | ✅ |
| `ASSUM` | 假设参数不合理（如 control arm median、dropout rate） | ✅ |
| `IMPL` | 实施细节遗漏（如 censoring rule、intercurrent event 处理） | ✅ |
| `ALT` | 合理但非 FDA 选择（如不同 spending function） | ⚠️ 记录 |
| `INFO` | Protocol 参数不足以判断 | ❌ |

---

## 四、数据源需求

### 答案提取章节（从 FDA Review）

```yaml
answer_extraction:
  chapters:
    - "Statistical Review — Analysis Plan"
    - "Statistical Review — Multiplicity"
    - "Statistical Review — Interim Analysis"
    - "Statistical Review — Sample Size"
    - "Statistical Review — Missing Data"
    - "Statistical Review — Subgroup Analysis"
    - "Clinical Review — Efficacy"         # 分析集定义、敏感性分析验证
```

### 做题输入

每个案例的输入 = `case-params.json` 中的 `protocol_params`：
- primary_endpoint（类型 + 评估方法）
- comparator（对照臂方案）
- population（目标人群）
- design（设计类型 + 随机化比例）
- sample_size（已确定的样本量）
- stratification_factors（分层因子列表）

**Owner Agent 不需要重新做终点/对照选择**——这些是给定输入。

### 工具需求

| 工具 | 用途 | 优先级 |
|------|------|--------|
| `exec`（Python scipy/statsmodels） | 样本量验算、spending function 计算、power analysis | **核心** |
| `exec`（R gsDesign/rpact） | GSD 设计、alpha spending 精确计算 | 核心 |
| `read` | SOP、FDA Guidance/ICH 指南 | 核心 |
| `web_search` | 同适应症历史试验 SAP 参数（control median 等） | 辅助 |

---

## 五、评分体系设计

### 评分原则

1. **评的是 SAP 关键决策的匹配度**，不是 SAP 文档的完整性
2. **以 FDA Statistical Review 中描述/认可的分析计划为标准答案**
3. **定量维度需要数值比较**（如 alpha 分配、IA timing），不能只做定性判断
4. **方法论等价算 match**（如 OBF ≈ Lan-DeMets OBF）

### 9 维度评分标准（概要）

#### 1. 主分析方法（primary_analysis_method）

**评判对象**：主要终点的统计分析方法选择

| 评分 | 标准 |
|------|------|
| `match` | 方法类型一致（如都选 stratified log-rank + Cox 模型） |
| `partial` | 同族方法但参数不同（如 unstratified vs stratified；Cox vs Fine-Gray） |
| `miss` | 方法族完全不同（如 MMRM vs CMH；logrank vs Wilcoxon） |

**单臂试验**：评判是否选择了正确的精确方法（如 Clopper-Pearson CI vs Wald CI）。

#### 2. 多重性控制（multiplicity_control）

**评判对象**：α 分配策略 + 检验顺序

| 评分 | 标准 |
|------|------|
| `match` | 策略族一致（Hierarchical ≈ Fixed-Sequence ≈ Graphical gatekeeping）且 α 分配方向一致 |
| `partial` | 策略族一致但 α 数值分配不同（如 PFS 0.01 + OS 0.04 vs PFS 0.02 + OS 0.03） |
| `miss` | 策略族不同（如 Hierarchical vs Bonferroni）；或完全遗漏多重性控制 |

**单终点无 key secondary**：标 `skip`。

#### 3. 期中分析（interim_analysis）

**评判对象**：IA 次数 + timing + spending function

| 评分 | 标准 |
|------|------|
| `match` | IA 次数一致 + spending function 族一致 + timing 差异 ≤10% IF |
| `partial` | IA 次数一致但 spending function 不同；或 timing 差异 >10% IF |
| `miss` | 有 IA vs 无 IA；或 IA 次数差异 ≥2 |

**固定设计（无 IA）**：双方都无 IA → `match`；一方有一方无 → `miss`。

#### 4. 分析集定义（analysis_sets）

**评判对象**：主分析的分析集选择（ITT/mITT/PP/Safety）

| 评分 | 标准 |
|------|------|
| `match` | 主分析集选择一致（如都用 ITT/FAS） |
| `partial` | 相近但不同（如 FAS vs mITT） |
| `miss` | 根本不同（如 PP vs ITT 用于优效性试验） |

**NI 试验特殊规则**：PP 为主分析集是正确的；用 ITT 做 NI 主分析 → 降一档。

#### 5. 缺失数据处理（missing_data）

**评判对象**：主分析的缺失数据假设 + 敏感性分析方法

| 评分 | 标准 |
|------|------|
| `match` | 主方法一致 + 至少 1 个敏感性方法一致 |
| `partial` | 主方法一致但敏感性不同；或主方法不同但属同族 |
| `miss` | 主方法族完全不同；或完全未提及缺失数据处理 |

#### 6. 亚组分析（subgroup_analysis）

**评判对象**：预设亚组列表的覆盖度

覆盖率 = AI 命中的预设亚组数 / FDA 预设亚组总数

| 评分 | 标准 |
|------|------|
| `match` | 覆盖率 ≥ 70% |
| `partial` | 覆盖率 30–69% |
| `miss` | 覆盖率 < 30% |

**强制规则**：遗漏任何分层因子对应的亚组 → 最高 `partial`。

#### 7. 敏感性分析（sensitivity_analyses）

**评判对象**：是否设计了足够的敏感性分析来支持主分析的稳健性

| 评分 | 标准 |
|------|------|
| `match` | ≥2 种敏感性分析 + 至少 1 种与 FDA 方法一致 |
| `partial` | 有敏感性分析但方法全不同；或只有 1 种 |
| `miss` | 完全无敏感性分析 |

#### 8. 样本量计算方法（sample_size_method）

**评判对象**：计算方法 + 关键假设（不是数字本身——数字在 PD 的 Item 6 已评）

| 评分 | 标准 |
|------|------|
| `match` | 方法一致（如 Schoenfeld 事件数公式）+ 关键假设方向一致（HR、median、dropout） |
| `partial` | 方法一致但假设不同（如 HR 假设偏差 >0.05）；或方法不同但同族 |
| `miss` | 方法族不同（如 event-based vs fixed-N）；或未给出计算方法 |

#### 9. Estimand 框架（estimand_framework）

**评判对象**：是否按 ICH E9(R1) 定义了 Estimand 5 属性 + intercurrent event 策略

| 评分 | 标准 |
|------|------|
| `match` | 5 属性齐全 + intercurrent event 策略与 FDA 一致 |
| `partial` | 有 Estimand 描述但不完整（缺 1-2 属性）；或策略有差异 |
| `miss` | 无 Estimand 框架；或策略根本不同（如 treatment policy vs composite） |

**注意**：2020 年之前的 FDA Review 可能无显式 Estimand 框架 → 检查是否隐含定义。

---

## 六、Owner Agent 配置

| 参数 | 值 | 理由 |
|------|---|------|
| 数量 | 2（并行） | 与 PD 一致，利用自然随机性 |
| timeout | 360s | SAP 比 PD 需要更多计算时间（exec Python/R） |
| 核心工具 | exec + read + web_search | exec 是 SAP 的核心工具（样本量验算、spending 计算） |

**与 PD 的关键差异**：
- Owner Agent 收到的输入包含 `protocol_params`（PD 的输出），不需要重新做终点选择
- SOP 中的编排指引侧重"何时用 exec 跑统计计算"而非"何时 spawn Biostat sub-agent"

---

## 七、训练执行计划

### 案例复用

20 个 FDA Review 案例与 PD 共享，但从 Statistical Review 章节提取答案。
每个案例的 protocol_params 已在 `case-params.json` 中预置。

### 执行顺序（建议）

基于统计复杂度梯度，与 PD 不同：

```
热身（简单统计框架）：
  Round 01: 12-sotyktu      (co-primary + 3-arm + IUT)
  Round 02: 15-orgovyx      (单终点 + NI-like threshold)
  Round 03: 10-kimmtrak     (RCT + co-primary OS/RAS)

中等（多重性 + IA）：
  Round 04: 05-vyloy        (双试验 + hierarchical + 2 IA)
  Round 05: 13-tavneos      (NI→superiority sequential)
  Round 06: 18-voranigo     (PFS + rare + crossover adjustment)

进阶（复杂 α 分配）：
  Round 07: 04-datroway     (dual primary PFS+OS α split + recycling)
  Round 08: 08-truqap       (dual population + graphical testing)
  Round 09: 07-orserdu      (family of endpoints + α recycling)
  Round 10: 01-inluriyo     (3-arm + 3 comparisons + α partition)
```

先跑 10 个 RCT 案例（统计复杂度高），加速审批/单臂案例（统计简单）后续补充。

### Batch 策略

| 批次 | 案例 | 策略 |
|------|------|------|
| Batch 1 (Round 1-5) | 精做 | 完整执行，详细记录 |
| Batch 2 (Round 6-10) | 常规 | 正常执行 |

5 轮后审核 SOP。预估 10 轮可收敛（种子 SOP 已有 38 条规则，起点比 PD 高）。

---

## 八、成功标准

1. Batch 1 结束时（Round 5）：match_score ≥ 0.50
2. Batch 2 结束时（Round 10）：match_score ≥ 0.65
3. 收敛标准：连续 3 轮 match_score ≥ 0.65 且 new_rules ≤ 1

---

## 九、风险与缓解

| 风险 | 影响 | 缓解 |
|------|------|------|
| Statistical Review 中 SAP 细节不足 | 部分维度无法评分 | 标 skip + 从 Clinical Review 补充 |
| exec 计算超时 | Owner Agent timeout | timeout 360s（vs PD 300s）+ SOP 预置计算模板代码 |
| Estimand 框架在早期案例（2020-2021）中缺失 | 维度 9 频繁 skip | 单独记录，不影响其他维度评分 |
| 与 PD 分支的样本量评分重叠 | 维度 8 可能与 PD Item 6 重复 | SAP 评的是"方法和假设"，PD 评的是"数字量级"——侧重不同 |

---

## 十、产出清单（Phase 0 完成后 → Phase 1）

| 产出 | 说明 |
|------|------|
| ✅ 本文档 | `docs/sap-design-training-design.md`（训练方案设计） |
| ⬜ Boss 确认 | — |
| ⬜ `training/sap-design/program.md` | 基于本文档 + framework.md 编写 |
| ⬜ `training/sap-design/evaluate.md` | 基于本文档第五节细化（含判例） |
| ⬜ `training/sap-design/case-config.json` | 从 case-params.json 转换 |
| ⬜ `training/sap-design/config.yaml` v2.0 | 更新为自包含格式 |
