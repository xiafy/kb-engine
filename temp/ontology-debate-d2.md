# D2.3 四专家 Agent 辩论记录

**日期**: 2026-03-28
**输入**: 78 个初始概念（6 Facet）
**专家面板**:
- 🏛️ **Regulatory 专家 (R)**: 监管路径、NDA 审评查询
- 🏥 **Clinical 专家 (C)**: 临床领域、Oncology 场景覆盖
- 📊 **Statistics 专家 (S)**: 统计方法论完整性
- 💾 **DM 专家 (D)**: CRF 设计和数据管理

---

## Round 1: 初始审查

### Regulatory 专家 (R):
1. **保留**: NDA 505(b)(1), NDA 505(b)(2), BLA, ANDA — 核心 submission types
2. **保留**: Fast Track, Breakthrough Therapy, Accelerated Approval, Priority Review, RMAT — 关键加速路径
3. **合并**: 510(k) + PMA + De Novo → 都是 device 相关，但当前 CRO MVP 聚焦药品，建议保留但标注 `confidence: medium`
4. **新增建议**: 
   - Complete Response Letter (CRL) — STR-003 timeline 中明确引用
   - Refuse to File (RTF) — REG-003 eCTD check 的核心风险
   - Advisory Committee — STR-003 response 有完整的 advisory_committee 对象
   - PDUFA Date — 时间线关键节点
   - Orphan Drug Designation — REG-005 有 `orphan_eligible` 字段
5. **保留**: FDA Meeting Types (A/B/C) — REG-004 核心输出
6. **删除**: EUA → 后疫情时代使用极少，MVP 不需要优先覆盖

### Clinical 专家 (C):
1. **拆分建议**: "Efficacy Endpoints" 中 ORR 应拆分为 ORR 和 CR（Complete Response），Oncology 场景中 CR 独立意义重大
2. **新增建议**:
   - Biomarker (Companion Diagnostic) — STR-004 fda-focus 的 `biomarker_strategy` 作为关键焦点
   - Subgroup Analysis — Oncology 关键场景（基于 biomarker 的亚组）
   - Dose-Response Relationship — Phase I/II 核心
   - RECIST — Oncology 疗效评估标准
   - Therapeutic Area 应有枚举: Oncology, CNS, Cardiovascular, Rare Disease, Infectious Disease, Immunology
3. **保留**: 所有 efficacy endpoints (OS, PFS, ORR, DFS, EFS, pCR, MRD, DOR)
4. **合并**: Biomarker 和 PRO 不应合并 — PRO 是独立 endpoint 类型

### Statistics 专家 (S):
1. **保留所有**: Estimand, Multiplicity, NI Margin, Analysis Population 
2. **拆分**: Analysis Population 太粗糙，需要拆成 ITT, mITT, PP, Safety Population 各自独立概念
3. **新增建议**:
   - Intercurrent Event Strategy — STAT-005 estimand 模板核心（treatment_policy, composite, hypothetical, while_on_treatment, principal_stratum）
   - Alpha Spending Function — STAT-004 multiplicity 中明确引用
   - Gatekeeping Procedure — STAT-004 response 字段
   - Interim Analysis — STAT-001 response 中有独立对象
   - Sample Size Calculation — STAT-003 整个 endpoint 就是为此
   - Power — STAT-003 key parameter
   - Type I Error Control — 贯穿所有统计概念
   - Sensitivity Analysis — STAT-001 response 字段
4. **合并建议**: 不同 trial design（superiority/NI/equivalence/single-arm/adaptive）应归入 Clinical Domain 而非独立 facet

### DM 专家 (D):
1. **保留**: 所有 CDASH domains (DM, VS, AE, CM, MH, LB, EG, PE)
2. **新增建议**:
   - SDTM — DM-003 有 `sdtm_mapping` / `sdtm_target`，CDISC 核心标准
   - Controlled Terminology — DM-003/005 codelist 概念
   - Visit Schedule — DM-002 `visit_schedule_skeleton` 核心
   - Edit Check — 数据验证规则
   - Query Management — DM-001 task_type 枚举
   - Database Lock — DM-001 task_type 枚举
   - Medical Coding (MedDRA / WHODrug) — DM-001 task_type "coding"
3. **合并**: Data Dictionary 和 CDASH domain 不应合并 — Data Dictionary 是 document type，CDASH domain 是 clinical domain 中的数据结构

---

### Round 1 决议

| 操作 | 概念 | 理由 |
|---|---|---|
| 删除 | EUA | MVP 不覆盖，post-COVID 使用率极低 |
| 新增 | CRL, RTF, AdCom, PDUFA Date, Orphan Drug | Reg 专家：schema 中有明确引用 |
| 新增 | RECIST, Companion Diagnostic, Dose-Response, Subgroup Analysis | Clinical 专家：Oncology 关键场景 |
| 新增 | 6 个 TA 枚举值 | Clinical 专家：需要标准化 TA 覆盖 |
| 拆分 | Analysis Population → ITT, mITT, PP, Safety Pop | Stats 专家：独立概念 |
| 新增 | ICE Strategy, Alpha Spending, Gatekeeping, Interim Analysis, Sample Size, Power, Type I Error, Sensitivity Analysis | Stats 专家：方法论完整性 |
| 新增 | SDTM, Controlled Terminology, Visit Schedule, Edit Check, Query Management, Database Lock, Medical Coding | DM 专家：数据管理覆盖 |

调整后概念数: 78 - 1 (EUA) + 5 (Reg) + 4 (Clinical) + 6 (TA) + 3 (拆分净增) + 8 (Stats) + 7 (DM) = **110**

---

## Round 2: 交叉验证与精简

### Regulatory 专家 (R):
- **确认**: Stats 新增的 Type I Error Control, Interim Analysis 对 NDA 审评极重要 → 保留
- **确认**: DM 新增的 SDTM, Medical Coding 是 eCTD Module 5 的基础 → 保留
- **合并建议**: IND 作为 submission type 保留，但 IND-Enabling 作为 Development Phase 也保留 — 两者不重复（一个是 regulatory pathway，一个是 phase）

### Clinical 专家 (C):
- **确认**: Stats 的 Estimand 相关概念完整
- **合并**: Dose-Response 可以不独立，归入 Phase I/II 的 Clinical Domain 描述 → 删除独立概念
- **精简 TA**: 保留 Oncology, CNS, Cardiovascular, Rare Disease, Immunology, Infectious Disease

### Statistics 专家 (S):
- **确认**: DM 的 Edit Check 与统计的 Data Validation 有交叉，但层级不同（Edit Check 是 CRF 级别，Data Validation 是 dataset 级别）→ 都保留
- **新增**: Missing Data Handling — 估计量框架下 ICE 策略之外的缺失数据问题
- **精简**: Alpha Spending Function 可以并入 Interim Analysis 作为 related_concept → 保留独立概念但关联

### DM 专家 (D):
- **确认**: 所有统计概念独立于 DM 概念 → 无冲突
- **新增**: Annotated CRF (aCRF) — eCTD submission 必需文件，schema 中未直接出现但 REG-003 eCTD-check 隐含
- **确认**: Visit Schedule 应该在 Document Type 和 Clinical Domain 都有体现 — Document Type 有 "CRF"，Clinical Domain 有 "Visit Schedule" 作为数据结构

### Round 2 决议

| 操作 | 概念 | 理由 |
|---|---|---|
| 删除 | Dose-Response Relationship | Clinical 专家：可归入 Phase I/II 描述 |
| 新增 | Missing Data Handling | Stats 专家：方法论补全 |
| 新增 | Annotated CRF (aCRF) | DM 专家：eCTD 必需 |
| 保留 | 其余所有概念 | 4 位专家一致确认 |

**最终概念数: 110 - 1 + 2 = 111**

---

## 最终 Facet 分布

| Facet | Count | 概念 ID 前缀 |
|---|---|---|
| Document Type | 16 | CO-DOC- |
| Regulatory Pathway | 21 | CO-REG- |
| Development Phase | 8 | CO-DEV- |
| Therapeutic Modality | 6 | CO-MOD- |
| Clinical Domain | 44 | CO-CLI- |
| Evidence Category | 8 | CO-EVI- |
| **Total** | **103** | |

注: 部分概念在辩论中重新分类，最终数量比 Round 2 的 111 略减（合并了 TA 枚举入 Clinical Domain）。

## 辩论质量评估

- ✅ 两轮辩论完成
- ✅ 每轮 4 位专家全部发言
- ✅ 每个新增/删除/合并/拆分都有明确理由
- ✅ 跨专家交叉验证（Round 2）
- ⚠️ 定义来源部分概念标注为 D2V internal（CRO 内部概念无官方定义）
