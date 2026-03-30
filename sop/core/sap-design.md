---
version: 0.2
status: seed
source: sop.md v2.2 拆分 + D2V SOP-BS-002 + kb/ 统计方法论
rule_count: 7
seed_absorbed:
  - d2v-sop/BS/sop-bs-002（SAP 开发流程）
  - methods/sop/statistical-design-sop.md（统计方法决策）
  - biostat/estimand-practical-guide.md（Estimand 框架）
  - biostat/missing-data-nrc2010-deep.md（缺失数据策略）
---

# SAP Design SOP — Core Decision Process

> 种子版 v0.2 — 训练后持续扩充
> 加载：必读。配合 domains/{大类}.md ## SAP Design + indications/ 使用

---

## Step 0: SAP 开发流程框架

### 0.1 SAP 起草时机
SAP 在 Protocol 和 CRF 就绪后起草。Study Statistician 起草 → Statistical Manager + Clinical Representative + Sponsor 审批。PK SAP 由 Clinical Pharmacology Representative 单独负责（如在主 SAP 内则负责 PK section）。
→ 来源: D2V SOP-BS-002

### 0.2 SAP 与 Protocol 的关系
SAP 是 Protocol 统计部分的技术细化。Protocol 定义 WHAT（终点、假设检验方向），SAP 定义 HOW（具体分析方法、缺失数据处理、敏感性分析）。两者不矛盾；SAP 不改变 Protocol 的假设检验方向。

---

## Step 1: Estimand 框架（ICH E9(R1)）

### 1.1 主要 Estimand 5 个属性
每个主要分析必须预先定义 Estimand 的 5 个属性：

| 属性 | 定义 |
|------|------|
| 目标人群 | Biomarker + I/E 定义的人群 |
| 治疗条件 | 试验药 vs 对照（含剂量/方案） |
| 变量（终点） | 精确定义 + 测量时间 |
| 伴随事件处理策略 | 5 种策略之一（见下） |
| 总体汇总指标 | HR / 率差 / RMST |

### 1.2 伴随事件处理策略选择

| 伴随事件 | 推荐策略 | 理由 |
|----------|---------|------|
| 进展前死亡 | Composite（计为事件） | FDA PFS 标准 |
| 毒性停药 | Treatment policy（跟踪到事件） | 保留 ITT 意图 |
| 后续治疗 | Treatment policy（OS 不删失） | 真实世界效果 |
| 评估缺失 | 在末次充分评估时删失 | RECIST 指南 |

---

## Step 2: 多重性控制 — Alpha 分配策略

### 2.1 3-Arm RCT Alpha 分配

活性对照 + 安慰剂 3-arm RCT：分 2 个比较分支（vs 安慰剂 α=0.025，vs 活性对照 α=0.025），各分支内 hierarchical。

---

### 2.2 Dual Primary PFS+OS Alpha Split

**替代设计（活性对照 RCT）**：双主要终点 PFS + OS 通过 alpha 分拆（如 PFS 1% + OS 4%），而非层级。PFS pass 后 alpha 可回收给 OS。

**Alpha Split 惯例**：
- IF PFS 预期 HR 强（≤0.65）且 power 充裕 → 分配较少 alpha 给 PFS（如 α_PFS=0.01 two-sided），将剩余 α=0.04 给 OS
- IF PFS 和 OS 预期 HR 相近 → 可均分（α=0.025 each）或 hierarchical（先 PFS 后 OS）
- PFS pass 后回收机制：PFS 的 α_PFS 可回收并入 OS 的后续分析（总 α 恢复至 0.05），用 Lan-DeMets OBF spending 控制 OS 多次分析
- 📌 Datroway TB01: PFS α=0.01 + OS α=0.04，PFS 通过后 OS 获得全额 α=0.05，OS 设 2 次 IA + 1 次 FA

---

## Step 3: 期中分析设计

Alpha spending 默认 Lan-DeMets O'Brien-Fleming（早期极保守、后期接近全额 alpha）。
- IF 罕见病目标事件数 ≤50-60: → 可省略期中分析，单次最终分析节省 alpha（详见 domains/rare-disease.md #45）
- IF 罕见病 RCT: → 次要终点可全部探索性，multiplicity 聚焦 co-primary

---

## Step 4: NI→Superiority 联合检验策略

IF 试验同时检验 NI 和 superiority（如非劣于 SOC 后进一步证明优效）:
→ 使用 sequential gatekeeping procedure 保持总体 α=0.05（two-sided）
→ 检验顺序：(1) NI at timepoint 1 → (2) NI at timepoint 2 → (3) superiority at timepoint 2 → (4) superiority at timepoint 1
→ NI margin 须基于历史 meta 分析推导 M1，M2 ≤ M1（通常保留 ≥50% 效应）
→ 若 NI 通过但 superiority 未通过，仍可支持 NI 结论（但 FDA 可能质疑 robustness）
→ 📌 Tavneos CL010_168: NI(Wk26, margin -20%) → superiority(Wk52)，sequential gatekeeping 控制 α=0.05

---

## Step 5: NI 试验界值 M1/M2

(1) M1 = 活性对照 vs 安慰剂效应的 95% CI 下界（历史 meta 分析）；(2) M2 ≤ M1，通常保留 ≥50% 效应；(3) 恒定假设须逐项验证。

---

## Step 6: 外部对照 SAP 要求

使用外部对照时：(1) 入组前锁定 SAP 并提交 FDA；(2) Index Date 定义两臂一致（避免 Immortal Time Bias）；(3) 预设可比性阈值；(4) 倾向评分匹配/加权 + 敏感性分析。

---

## Step 7: 分析集定义

### 7.1 标准分析集
| 分析集 | 定义 | 主要用途 |
|--------|------|---------|
| ITT / FAS | 所有随机化患者，按随机分组分析 | 主要分析（优效性） |
| mITT | 随机化且接受 ≥1 剂治疗 | 某些适应症的主要分析 |
| PP | 完成最低治疗周期、无重大方案偏离 | 敏感性分析（NI 试验的主要分析） |
| Safety | 接受 ≥1 剂治疗，按实际用药分析 | 安全性分析 |

IF NI 试验 → PP 为主要分析集（ITT 可能偏向 NI 结论），ITT 为敏感性分析。两者结论一致才有说服力。

---

## Step 8: 缺失数据处理

### 8.1 ICH E9(R1) 框架下的缺失数据策略
(1) 预先在 SAP 中锁定主要缺失数据方法；
(2) 至少 2 种敏感性分析（不同假设下）；
(3) tipping point 分析评估结论稳健性。

### 8.2 常见方法选择

| 终点类型 | 主要方法 | 敏感性分析 |
|----------|---------|-----------|
| TTE（PFS/OS） | 在删失规则下 Cox/KM | RMST + Multiple Imputation |
| 连续（change from baseline） | MMRM（MAR 假设） | Pattern Mixture Model + δ-adjustment |
| 二分类（响应率） | 完整数据分析 | NRI（Non-responder Imputation） |

---

## Step 9: 亚组分析

### 9.1 预设亚组
SAP 中预先指定亚组列表（通常 8-12 个），包括：
- 分层因子（必须）
- 关键人口统计学（年龄、性别、种族、地区）
- 关键基线特征（ECOG、疾病分期、前线治疗）
- Biomarker 亚组（如适用）

### 9.2 分析方法
Forest plot 展示各亚组 HR + 95% CI。交互检验 p 值用于探索一致性，不用于确证性结论。预设的交互检验 alpha 通常 0.10（探索性）。
