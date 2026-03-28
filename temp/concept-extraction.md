# D2.1 概念提取过程记录

**执行日期**: 2026-03-28
**执行者**: Helix (D2 Subagent)
**输入**: 8 个 JSON schema 文件，34 个 API endpoints

## 1. Schema 文件与 Endpoint 清单

| Schema 文件 | Agent Type | Endpoints | IDs |
|---|---|---|---|
| dm_crf_schema.json | dm_crf | 5 | DM-001 ~ DM-005 |
| error_handling.json | system | 1 | (degraded mode) |
| public_schema.json | public | 4 | PUB-001 ~ PUB-004 |
| regulatory_schema.json | regulatory | 5 | REG-001 ~ REG-005 |
| statistics_schema.json | statistics | 5 | STAT-001 ~ STAT-005 |
| strategy_schema.json | strategy | 5 | STR-001 ~ STR-005 |
| system_schema.json | system | 4 | SYS-001 ~ SYS-004 |
| writing_schema.json | writing | 5 | WRT-001 ~ WRT-005 |
| **Total** | | **34** | |

## 2. 概念提取方法

### 2.1 Request 字段分析
- **context 对象**: 所有 endpoint 共享 `indication`, `phase`, `ta`, `submission_type` → 隐含 Development Phase, Therapeutic Area, Regulatory Pathway 概念
- **枚举值**: 直接从 `enum` 字段提取（如 submission_type: NDA/BLA/510k/PMA/EUA/ANDA）
- **业务参数**: `drug_class`, `mechanism`, `therapeutic_modality`, `endpoint`, `design` 等

### 2.2 Response 字段分析
- **实体引用**: `document_type`, `evidence_category`, `knowledge_type`, `trust_level`, `verification_level`
- **领域对象**: `estimand`, `multiplicity_adjustment`, `analysis_population`, `intercurrent_events`
- **指标类型**: `metric_type` 枚举（p_value, hazard_ratio, orr, median_os 等）

### 2.3 按 Facet 提取结果

#### Facet 1: Document Type (14 concepts)
来源: WRT-001 `document_type` enum, PUB-001 `document_type`, DM-002 CRF templates
- Protocol, CSR, CSR Synopsis, IB, SAP, ICF, DSUR, PBRER, CTD Summary
- FDA Guidance, FDA Review, eCTD Module, CRF, Data Dictionary

#### Facet 2: Regulatory Pathway (17 concepts)
来源: REG-001 `submission_type` enum, REG-005 `recommended_pathway` enum, REG-005 `expedited_programs`
- Submission types: NDA 505(b)(1), NDA 505(b)(2), BLA, 510(k), PMA, De Novo, EUA, ANDA, IND
- Expedited programs: Fast Track, Breakthrough Therapy, Accelerated Approval, Priority Review, RMAT
- Meeting types: Type A, Type B, Type C

#### Facet 3: Development Phase (8 concepts)
来源: DM-001/DM-002 `phase` enum, WRT-001 `phase` enum, STR-005 `phase` enum
- IND-Enabling, Phase I, Phase I/II, Phase II, Phase II/III, Phase III, Phase IV, NDA/BLA Submission

#### Facet 4: Therapeutic Modality (6 concepts)
来源: REG-005 `therapeutic_modality`
- Small Molecule, Monoclonal Antibody, Cell Therapy, Gene Therapy, RNA Therapeutic, Combination Product

#### Facet 5: Clinical Domain (25 concepts)
来源: STAT-001~005, STR-001~002, DM-003, DM-005
- **Efficacy endpoints**: OS, PFS, ORR, DFS, EFS, pCR, MRD, DOR
- **Safety**: AE, SAE
- **PK parameters**: Cmax, AUC
- **Biomarker/PRO**
- **CDASH domains**: DM, VS, AE, CM, MH, LB, EG, PE
- **Statistical concepts**: Estimand, Multiplicity, NI Margin, Analysis Population (ITT/mITT/PP)
- **Trial designs**: Superiority, Non-inferiority, Equivalence, Single-arm, Adaptive

#### Facet 6: Evidence Category (8 concepts)
来源: PUB-001/003, SYS-004 metadata
- Evidence tiers: Binding (Tier 1), Authoritative (Tier 2), Informative (Tier 3), Experiential (Tier 4)
- Knowledge types: Execution Rule, Reference, Template
- Verification level: L0 (dual extraction verified)

## 3. 初始概念总数

| Facet | Count |
|---|---|
| Document Type | 14 |
| Regulatory Pathway | 17 |
| Development Phase | 8 |
| Therapeutic Modality | 6 |
| Clinical Domain | 25 |
| Evidence Category | 8 |
| **Total** | **78** |

→ 进入 D2.2 定义收集和 D2.3 专家辩论
