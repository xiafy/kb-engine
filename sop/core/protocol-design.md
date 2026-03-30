# Protocol Design SOP — Core Decision Process

> **版本**: v3.0 | **来源**: sop.md v2.2 三层拆分 | **规则数**: 28
> **加载**: 必读。配合 domains/{大类}.md + indications/{适应症}.md 使用

---

## Step 1: 情报收集与对标

### 1.1 先获取同适应症获批 Protocol，再开始设计
收到 Protocol 设计任务后，第一步获取 ≥1 份同适应症已获 FDA 批准的 Protocol 全文（ClinicalTrials.gov / Drugs@FDA / 客户提供），以获批 Protocol 的目录结构和设计要素为基准开始撰写。

### 1.2 统计设计独立做，再对标获批方案
独立基于文献数据选择统计方法和计算样本量（不看获批 Protocol 统计部分）。完成后逐项对比，差异归因到入排标准差异 / HR 假设差异 / alpha 分配策略差异。

### 1.3 Protocol 对标须覆盖 11 section，参数差异必须归因
对标时：(1) 覆盖全部 11 个 section（Synopsis→References + Appendices）；(2) 差异分三类：结构/内容/参数；(3) 参数差异必须归因到根本原因（如入排→对照臂预后→HR→样本量），不能只报告数字差异。

### 1.4 Strategy Decision Points 前置识别
Protocol 中多项需要 Sponsor 商业决策的点（对照臂选择、入排宽严度、地区策略等），应在设计初期标注为"⚠️ Strategy Decision Point"，而非替 Sponsor 做决定。

---

## Step 2: 目标人群与富集策略

### 2.1 入排标准优化：5 维度打分决策框架
每条入排标准逐条按 5 维度评估并打分：

| 维度 | 含义 | 评分 |
|------|------|------|
| O1 统计有效性 | 增大效应量 | +/0/- |
| O2 试验速度 | 加快事件积累 | +/0/- |
| O3 入组可行性 | 筛选失败率 | +/0/- |
| O4 临床有效性 | 富集获益人群 | +/0/- |
| O5 FDA 可接受性 | 有获批先例 | ✓/⚠️/✗ |

富集策略和放宽策略的利弊须量化呈现为 Strategy Decision Point。

### 2.2 Biomarker 驱动适应症须配伴随诊断
适应症限定特定 biomarker 时，试验必须包含 FDA 批准或正在开发的伴随诊断。入组前必须中心化确认 biomarker 状态。
→ 适应症特定检测策略见 `indications/{适应症}.md`

### 2.3 预测富集设计的 alpha 分配
(1) biomarker cutoff 须预先定义并有分析验证；(2) 若同时入组 marker+/marker- 患者，须按 marker 状态分层随机化；(3) alpha 须在富集亚组和全人群间预先分配；(4) Treatment × Biomarker 交互检验须预先规定。

---

## Step 3: 对照组选择

### 3.1 对照组选择决策树

```
STEP 1: 是否存在已证实可预防死亡或不可逆发病率的有效治疗？
├─ 否 → 安慰剂对照科学上最优
├─ 是 → 纯安慰剂不可接受
│ ├─ SOC 明确且唯一 → 活性对照（该 SOC 药物）
│ ├─ SOC 有多选项 → Investigator's Choice（预设选项列表，随机前选定）
│ └─ 中间地带 → 设计改良：add-on / early escape / withdrawal / limited placebo
└─ 无确立 SOC（罕见肿瘤等）→ IC（预设 2-3 个选项含化疗+免疫）
```

IF 非肿瘤有 SOC → 活性对照可能导致 NI 设计（需预设 NI margin），注意伦理。
→ 适应症特定对照见 `indications/{适应症}.md`

### 3.2 FDC 组合产品需 2 类试验
ICS/SABA 等 FDC reliever/controller 产品需：(1) 大型事件驱动 PRN 试验（FDC vs 单组分），主要终点首次重度发作时间；(2) 析因固定剂量试验（FDC vs 各单组分 vs 安慰剂），满足 combination rule（21 CFR 300.50a）。
→ FDC 分层策略见 `domains/respiratory.md`

---

## Step 4: 终点选择

### 4.1 肿瘤终点评估方式

IF open-label（含 ICC 对照）:
  IF 非细胞毒药物 AND 试验臂与对照臂为同类药物机制 AND 疾病进展判断受主观偏倚影响较小:
    → FDA 可接受 investigator-assessed PFS 为主要终点（BICR 作为敏感性分析）
    → 先例：EMBER-3/Inluriyo（口服 ER 拮抗剂 vs IC of ET）
    → 详见 `domains/oncology-solid.md ## Trial Design`
  ELSE:
    → PFS 主要终点需 BICR；investigator PFS 为敏感性分析
IF double-blind → PFS 可用研究者评估为主要终点；BICR 作为敏感性分析。
→ 加速审批终点见 `regulatory/accelerated-approval.md`

### 4.2 肿瘤终点层级
OS > PFS > ORR。传统审批：OS 或 PFS（有临床意义的改善）。
PFS 需满足：(1) magnitude 足够大，(2) 开放标签需独立评估确认（BICR 或满足 4.1 inv-PFS 豁免条件），(3) 亚组一致性，(4) ORR 等终点支持。

### 4.3 非肿瘤终点：遵循疾病特异性 Guidance
非肿瘤终点通常不是 OS/PFS/ORR。必须查找对应 FDA Guidance。
→ 各适应症终点详见 `indications/{适应症}.md`

### 4.4 Estimand 框架须在 Protocol 阶段定义
主要 Estimand 的 5 个属性（治疗条件、目标人群、变量、总体汇总指标、伴随事件处理策略）须预先规定。伴随事件（停药、后续治疗、死亡）明确采用 5 种策略之一。

### 4.5 OS 即使非主要终点也须预先规定分析计划
所有随机肿瘤试验须在 SAP 中预设：(1) OS 危害阈值（HR 上界排除值如 1.20），(2) 排除危害方法，(3) 期中分析计划，(4) NPH 时的补充分析（RMST + Landmark）。

### 4.6 肿瘤 PRO 次要终点
PRO 优选 "Time to Confirmed Clinical Deterioration"（TTCD）形式纳入 hierarchical testing，用疾病特异性工具（如 EORTC QLQ-C30 + 模块）。量表须经患者参与的内容效度验证；应答者定义基于锚定法；SAP 预锁缺失数据处理（≥2 种敏感性分析）。PRO 须在其他临床评估之前完成。

---

## Step 5: 统计设计（Protocol 层面）

> 详细 SAP 规则见 `core/sap-design.md`。本节仅含 Protocol 层面统计决策。

### 5.1 样本量基于临床意义差异
效应量必须基于文献报道的临床意义最小差异和 SOC 数据。典型参数：alpha=0.025 单侧, power=80-90%。

| 设计 | 典型效应量 |
|------|----------|
| 肿瘤 PFS | HR 0.60-0.75 |
| 肿瘤 OS | HR 0.70-0.80 |
| 加速审批单臂 | N=50-200 |

### 5.2 多重性校正策略（框架）

IF 假设检验数 ≥3 → 优先 Graphical Approach（Bretz 2009 有向图）
IF 假设检验 = 2（如 PFS + OS）→ Hierarchical testing
→ Alpha 分配细节、spending function、NI 检验策略见 `core/sap-design.md`

### 5.3 Co-primary endpoints 每个需 90% power
Co-primary 要求所有终点均显著，联合 power = 各终点 power 之积。80% × 80% = 64%，须提升到 ~90% 以保证联合 ≥80%。

### 5.4 协变量调整
(1) 分层随机化变量必须入分析模型；(2) 可额外纳入预后协变量提高 power；(3) 揭盲前锁定于 SAP；(4) 非线性模型须预先声明条件 vs 无条件治疗效应。

---

## Step 6: 分层因子

### 6.1 通用原则
选对主要终点影响最大的预后因子，通常 2-4 个。分层变量必须纳入分析模型作为协变量。

IF 罕见肿瘤（<5/million incidence）→ 最小化至 1-2 个，仅保留最强预后因子，避免过度分层导致小细胞不平衡。

→ 适应症特定分层因子见 `indications/{适应症}.md`

---

## Step 7: 安全性与监测设计

### 7.1 新型生物制剂（ADC/双抗/T 细胞接合器/CAR-T）
确证性试验须预设：(1) Step-up dosing 方案；(2) 首剂/前 3 剂住院监测要求和时长（T 细胞接合器 ≥16h）；(3) CRS/ICANS 分级管理算法（参照 ASTCT 共识）；(4) 预处理方案；(5) 剂量修改标准：≥80% 患者维持 ≥80% 剂量强度。

→ 疾病特异性监测见 `indications/{适应症}.md`

---

## Step 8: 审批策略与运营

### 8.1 常规批准通常需要 2 个充分且对照良好的试验
设计时应规划 2 个独立 pivotal 试验。单一试验批准是例外（如 Tavneos — 罕见病）。

→ 加速审批 / Breakthrough 策略见 `regulatory/` 目录
→ 适应症特定运营惯例见 `indications/{适应症}.md`
