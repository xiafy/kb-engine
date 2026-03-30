# SOP v2.2 试分类表 — 规则→目标文件映射

> **创建**: 2026-03-30 | **用途**: Step 1 拆分前的 checklist
> **源文件**: `docs/training-loop/sop.md`（v2.2, 287 行）
> **计数方法**: `###` 节 + 内嵌 IF-THEN 分支 = 独立规则单元

---

## 分类统计

| 目标层 | 规则数 | 预估行数 |
|--------|--------|---------|
| core/protocol-design.md | 28 | ~170 行 |
| core/sap-design.md（种子分流） | 6 | ~40 行 |
| domains/oncology-solid.md | 5 | ~50 行 |
| domains/oncology-heme.md | 3 | ~30 行 |
| domains/autoimmune.md | 2 | ~20 行 |
| domains/respiratory.md | 3 | ~30 行 |
| domains/rare-disease.md | 2 | ~15 行 |
| indications/（各适应症） | 14 | ~80 行合计 |
| regulatory/（各路径） | 3 | ~25 行合计 |
| **合计** | **~66** | **~460 行（拆分后总量，含格式）** |

---

## 逐条映射

### Step 1: 情报收集与对标

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 1 | 1.1 | 先获取同适应症获批 Protocol 再设计 | **core/protocol-design.md** | 高 |
| 2 | 1.2 | 统计设计独立做再对标 | **core/protocol-design.md** | 高 |
| 3 | 1.3 | 对标须覆盖 11 section + 参数差异归因 | **core/protocol-design.md** | 高 |
| 4 | 1.4 | Strategy Decision Points 前置识别 | **core/protocol-design.md** | 高 |

### Step 2: 目标人群与富集策略

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 5 | 2.1 | 入排 5 维度打分决策框架 | **core/protocol-design.md** | 高 |
| 6 | 2.2 主干 | Biomarker 驱动适应症须配伴随诊断 | **core/protocol-design.md** | 高 |
| 7 | 2.2 IF ESR1m | ctDNA-based NGS 检测 | **indications/breast-er-her2neg.md** | 高 |
| 8 | 2.2 IF KRAS G12C | 双伴随诊断 + sPMA | **indications/nsclc.md** | 高 |
| 9 | 2.2 IF AML 分子靶向 | 本地实验室检测可入组 | **indications/aml.md** | 高 |
| 10 | 2.2 IF 泛瘤种 basket | 接受多种 CLIA 检测方法 | **domains/oncology-solid.md** | 中 — 泛瘤种跨适应症 |
| 11 | 2.3 | 预测富集设计 alpha 分配 | **core/protocol-design.md** | 高 |
| 12 | 2.4 | 儿科患者纳入策略（肿瘤） | **domains/oncology-solid.md** | 高 |
| 13 | 2.5 IF ADT | 基线睾酮 + 排除条件 | **indications/prostate-adt.md** | 高 |
| 14 | 2.5 IF 术后观察（LGG） | 手术后时间窗限定 | **indications/lgg.md** | 高 |
| 15 | 2.5 IF 银屑病 | sPGA≥3 + PASI≥12 + BSA≥10% | **indications/psoriasis.md** | 高 |

### Step 3: 对照组选择

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 16 | 3.1 主干 | 对照组选择决策树 | **core/protocol-design.md** | 高 |
| 17 | 3.1 IF ER+/HER2- 2L+ | IC of endocrine therapy | **indications/breast-er-her2neg.md** | 高 |
| 18 | 3.1 IF ANCA 血管炎 | 替代设计 + 双模拟 | **indications/anca-vasculitis.md** | 高 |
| 19 | 3.1 IF 非肿瘤有 SOC | NI 设计提示 | **core/protocol-design.md** | 高 — 通用逻辑 |
| 20 | 3.2 主干 | FDC 组合产品需 2 类试验 | **core/protocol-design.md** | 高 — FDC 不限呼吸科 |
| 21 | 3.2 IF FDC 含 ICS | 分层策略（PRN 试验 + 析因试验） | **domains/respiratory.md** | 高 |
| 22 | 3.2 4-11 岁 | 儿科亚组不进一步分层 | **domains/respiratory.md** | 高 |

### Step 4: 终点选择

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 23 | 4.1 IF AA | AA 终点 ORR+DOR + futility 监测 | **regulatory/accelerated-approval.md** | 高 |
| 24 | 4.1 IF open-label | PFS 需 BICR + investigator 敏感性分析 | **core/protocol-design.md** | 高 |
| 25 | 4.1 IF double-blind | PFS 可用研究者评估 | **core/protocol-design.md** | 高 |
| 26 | 4.1 ⚠️ 豁免 | 非细胞毒开放标签可用 inv-PFS（先例 EMBER-3） | **domains/oncology-solid.md** | 中 — 特定条件，但不限适应症 |
| 27 | 4.1 终点层级 | OS > PFS > ORR + PFS 4 条件 | **core/protocol-design.md** | 高 |
| 28 | 4.2 IF 银屑病 | sPGA 0/1 + PASI 75 Week 16 + withdrawal | **indications/psoriasis.md** | 高 |
| 29 | 4.2 IF ADT | 持续睾酮抑制率 + NI 或单臂阈值 | **indications/prostate-adt.md** | 高 |
| 30 | 4.2 IF ANCA | BVAS=0 缓解 + 肾脏生物标志物 | **indications/anca-vasculitis.md** | 高 |
| 31 | 4.2 IF 哮喘 | FEV1 AUC0-6h + trough FEV1 | **indications/asthma.md** | 高 |
| 32 | 4.2 IF MDS | 8-wk RBC-TI + CMH 检验 | **indications/mds.md** | 高 |
| 33 | 4.3 | AML 终点按治疗意图 + EFS 定义 | **domains/oncology-heme.md** | 高 |
| 34 | 4.4 | 罕见非转移性肿瘤 PFS 含临床进展 | **domains/rare-disease.md** | 高 |
| 35 | 4.5 | Estimand 框架须在 Protocol 定义 | **core/protocol-design.md** | 高 |
| 36 | 4.6 | OS 非主要终点也须预设分析计划 | **core/protocol-design.md** | 高 |
| 37 | 4.7 | 肿瘤 PRO 次要终点 TTCD 形式 | **core/protocol-design.md** | 高 |

### Step 5: 统计设计 ⚠️ 跨 SOP 分流

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 | 分流理由 |
|---|---------|---------|---------|--------|---------|
| 38 | 5.1 | 样本量基于临床意义差异 + 典型效应量 | **core/protocol-design.md** | 高 | Protocol 层面决策 |
| 39 | 5.2 主干 | 多重性 Graphical/Hierarchical 框架 | **core/protocol-design.md** | 高 | Protocol 层面 alpha 分配 |
| 40 | 5.2 3-arm RCT | 活性对照+安慰剂分支 alpha 分配 | → **core/sap-design.md 种子** | 中 | SAP 细节 |
| 41 | 5.2 替代设计 | Dual PFS+OS alpha split | → **core/sap-design.md 种子** | 中 | SAP 细节 |
| 42 | 5.2 Alpha Split 惯例 | PFS/OS alpha 分配惯例 + 回收机制 | → **core/sap-design.md 种子** | 高 | 纯 SAP 内容 |
| 43 | 5.3 | Co-primary 每个需 90% power | **core/protocol-design.md** | 高 | Protocol 层面 |
| 44 | 5.4 | 期中分析 Lan-DeMets OBF | → **core/sap-design.md 种子** | 高 | 纯 SAP 内容 |
| 45 | 5.4 IF 罕见病 | 可省略期中分析 | **domains/rare-disease.md** | 高 | — |
| 46 | 5.5 | NI→Superiority 联合检验 | → **core/sap-design.md 种子** | 高 | 纯 SAP 内容 |
| 47 | 5.6 | NI 试验界值 M1/M2 | → **core/sap-design.md 种子** | 高 | 纯 SAP 内容 |
| 48 | 5.7 | 协变量调整 4 条原则 | **core/protocol-design.md** | 高 | Protocol + SAP 共用，放 protocol 引用 |
| 49 | 5.8 | 外部对照 SAP 要求 | → **core/sap-design.md 种子** | 中 | SAP 特定 |

**Step 5 分流小结**：
- 留 core/protocol-design.md：#38(样本量), #39(多重性框架), #43(co-primary power), #48(协变量)— 4 条
- 分流到 core/sap-design.md 种子：#40, #41, #42, #44, #46, #47, #49 — 7 条（但 #44 罕见病部分→domains/）

### Step 6: 分层因子

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 50 | 6.1 | 通用原则 2-4 个 + 罕见病最小化 | **core/protocol-design.md** | 高 |
| 51 | 6.2 ER+/HER2- | ESR1 + CDK4/6i + 内脏转移 + 地区 | **indications/breast-er-her2neg.md** | 高 |
| 52 | 6.2 胃癌/GEJ | Asia/非Asia + 转移器官数 + 胃切除 | **indications/gastric-gejc.md** | 高 |
| 53 | 6.2 AML | ELN + 疾病状态 + 年龄 | **indications/aml.md** | 高 |
| 54 | 6.2 NSCLC | EGFR/ALK + PD-L1 + 治疗线数 | **indications/nsclc.md** | 高 |
| 55 | 6.2 哮喘 | 年龄 + 地区 + 发作次数 | **indications/asthma.md** | 高 |
| 56 | 6.2 IDH-mut LGG | 1p/19q + 基线肿瘤大小 | **indications/lgg.md** | 高 |
| 57 | 6.2 NPC | ECOG + 疾病分期 | **indications/npc.md** | 高 |
| 58 | 6.2 罕见肿瘤（UM） | 仅 LDH | **domains/rare-disease.md** | 高 |

### Step 7: 安全性与监测设计

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 59 | 7.1 | 新型生物制剂 5 项预设 | **core/protocol-design.md** | 高 |
| 60 | 7.2 IF NPC | EBV 病毒载量监测 | **indications/npc.md** | 高 |
| 61 | 7.2 IF 银屑病 | Week 16 placebo escape + withdrawal | **indications/psoriasis.md** | 高 |

### Step 8: 审批策略与运营

| # | 规则位置 | 规则摘要 | 目标文件 | 置信度 |
|---|---------|---------|---------|--------|
| 62 | 8.1 IF AA | 确证性试验须与 FDA 一致 | **regulatory/accelerated-approval.md** | 高 |
| 63 | 8.1 IF Breakthrough | Phase 1/2 阳性后申请 BTD | **regulatory/breakthrough.md** | 高 |
| 64 | 8.2 | 常规批准通常需 2 个 pivotal 试验 | **core/protocol-design.md** | 高 |
| 65 | 8.3 | ER+/HER2- mBC 运营惯例 4 条 | **indications/breast-er-her2neg.md** | 高 |

---

## 目标文件汇总

### core/protocol-design.md（28 条规则）

规则 #: 1,2,3,4,5,6,11,16,19,20,24,25,27,35,36,37,38,39,43,48,50,59,64 + 部分框架性内容

**行数估算**：~170-180 行（含标题和格式行）— ✅ 在 200 行限制内

### core/sap-design.md 种子（7 条规则）

规则 #: 40,41,42,44,46,47,49

**行数估算**：~35-45 行 — 种子版，训练后增长

### domains/ 文件

| 文件 | 规则 # | 行数估算 |
|------|--------|---------|
| oncology-solid.md | 10,12,26 + 4.1 终点通用 | ~50 |
| oncology-heme.md | 33(AML 终点) | ~25 |
| autoimmune.md | （当前无独立通用规则，适应症特定的在 indications/） | ~10（框架） |
| respiratory.md | 21,22 (FDC ICS 分层) | ~30 |
| rare-disease.md | 34,45,58 | ~20 |

### indications/ 文件

| 文件 | 规则 # | 行数估算 |
|------|--------|---------|
| breast-er-her2neg.md | 7,17,51,65 | ~25 |
| nsclc.md | 8,54 | ~10 |
| gastric-gejc.md | 52 | ~8 |
| aml.md | 9,53 | ~12 |
| psoriasis.md | 15,28,61 | ~15 |
| prostate-adt.md | 13,29 | ~10 |
| anca-vasculitis.md | 18,30 | ~12 |
| asthma.md | 31,55 | ~10 |
| mds.md | 32 | ~8 |
| lgg.md | 14,56 | ~8 |
| npc.md | 57,60 | ~8 |

### regulatory/ 文件

| 文件 | 规则 # | 行数估算 |
|------|--------|---------|
| accelerated-approval.md | 23,62 | ~15 |
| breakthrough.md | 63 | ~8 |
| botanical-drug.md | （从康缘项目经验，当前 sop.md 无直接规则） | ~5（占位） |

---

## 置信度低的规则（需执行时确认）

| # | 规则 | 问题 | 决定 |
|---|------|------|------|
| 10 | 泛瘤种 basket 检测 | 归 oncology-solid 还是新建 domains/basket-trial.md？ | → **oncology-solid.md**（basket 是实体瘤范畴，不独立建文件） |
| 26 | 非细胞毒开放标签 inv-PFS 豁免 | 是否只适用于肿瘤？ | → **domains/oncology-solid.md**（目前仅有肿瘤先例） |
| 40-41 | 3-arm / alpha split | 留 protocol-design 还是 sap-design？ | → **sap-design.md 种子**（alpha 分配细节属 SAP，Protocol 只定框架） |
| 48 | 协变量调整 | 跨 protocol + SAP | → **core/protocol-design.md**（SAP 引用此规则，不重复） |

---

## Checklist 完整性验证

- sop.md v2.2 有效内容行数：~250 行
- 试分类表覆盖规则：65 条（含 IF 分支独立计数）
- 未分类规则：0（botanical-drug 为占位，无 sop.md 直接规则）
- core/protocol-design.md 预估行数：~170-180 行 ✅ ≤200
- 所有 `###` 节已覆盖 ✅
- 所有 IF-THEN 分支已覆盖 ✅
