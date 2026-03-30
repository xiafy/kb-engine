# KB → SOP 知识迁移计划

> **版本**: v1.0 | **日期**: 2026-03-30
> **目的**: 将 Amanda/Walt 通过 Learner 沉淀在 shared/kb 中的决策知识提取到 kb-engine/sop/，提高训练起点
> **原则**: 提取可执行决策规则，不搬运流程文档；所有规则标注来源

---

## 1. 背景与决策

### 为什么要迁移

- Amanda/Walt 最近 3 天通过 Learner 产出了 11 篇 SOP + 5 篇模板（共 ~15,500 行）
- 这些内容包含大量基于 EMBER-3 实战的决策知识（入排优化、终点选择、统计设计等）
- kb-engine/sop/ 的 domains/ 平均仅 41 行、indications/ 平均仅 22 行，起点偏低
- 训练的目的是**产出高质量 Protocol/SAP**，把已验证的决策知识预装进 SOP 能显著提高起点

### 迁移原则

1. **提取决策规则，不复制流程步骤** — KB SOP 是操作手册，kb-engine/sop 是决策指令
2. **标注来源** — 每条规则标注 `[source: kb/methods/sop/xxx.md]`
3. **去重** — 与现有规则重复的跳过，更精确的替换
4. **适应症特定的设计选择也迁移** — 决策本身就是知识积累
5. **KB SOP 原文不动** — 保持完整操作手册角色

---

## 2. 源文件清单与迁移价值评估

### A. KB SOP（11 篇）

| # | 文件 | 行数 | 关联度 | 迁移价值 | 处理 |
|---|------|------|--------|---------|------|
| 1 | `protocol-writing-sop.md` (SOP-MW-001) | 620 | 🔴 核心 | **高** — 11-section 结构、6 步法、EMBER-3 入排/终点/统计共识、6 条 FDA 审评教训 | **提取** |
| 2 | `protocol-ie-endpoint-optimization-sop.md` (SOP-MW-003) | 456 | 🔴 核心 | **高** — 5 维度优化框架、PFS 评估者决策树、15 个 Strategy Decision Points、富集/放宽策略矩阵 | **提取** |
| 3 | `statistical-design-sop.md` (SOP-BS-002) | 773 | 🔴 核心 | **高** — 独立设计→对标双步法、Estimand 框架、HR 估计层级、样本量公式、多重性决策树、期中分析方案 | **提取** |
| 4 | `protocol-benchmarking-sop.md` (SOP-MW-007) | 530 | 🔴 核心 | **高** — 逐 Section 对标维度、三类差异框架、参数归因 5 层级、"不许抄"规则 | **提取** |
| 5 | `protocol-sap-workflow-master-sop.md` (SOP-MW-005) | 397 | 🔴 核心 | **中** — 全流程串联，决策规则散布在子 SOP 中，主要提取流程衔接规则 | **选择性提取** |
| 6 | `protocol-literature-search-sop.md` (SOP-MW-004) | 309 | 🟡 支撑 | **低** — 主要是渠道清单和检索流程，非决策规则 | **跳过**（训练时不需要文献检索能力） |
| 7 | `csr-writing-sop.md` (SOP-CW-001) | 839 | 🟡 未来 | 中 — 当前训练分支无 CSR | **暂不迁移**（CSR 分支启动时再迁） |
| 8 | `benefit-risk-assessment-sop.md` (SOP-MW-009) | 1038 | 🟡 未来 | 中 | **暂不迁移** |
| 9 | `template-cleaning-sop.md` (SOP-MW-008) | 614 | ⚪ 工具 | 低 | **跳过** |
| 10 | `disease-landscape-research-sop.md` | 543 | 🟡 支撑 | 低 | **跳过** |
| 11 | `d2v-automation-blueprint-sop.md` | 1209 | ⚪ 内部 | 低 | **跳过** |

### B. 模板（5 篇）

| # | 文件 | 行数 | 迁移价值 | 处理 |
|---|------|------|---------|------|
| 1 | `protocol-template-phase3-oncology.md` | 2055 | **中** — 提取预设的设计决策（非占位符部分） | **选择性提取** |
| 2 | `protocol-template-er-her2neg-mbc.md` | 1760 | **高** — 含 EMBER-3 对标的具体设计选择 | **提取到 indications/breast-er-her2neg.md** |
| 3 | `sap-template-phase3-oncology.md` | 1101 | **中** — SAP 结构+通用统计方法选择 | **选择性提取到 sap-design.md** |
| 4 | `sap-template-er-her2neg-mbc.md` | 1055 | **高** — 含 EMBER-3 统计设计决策 | **提取到 indications/breast-er-her2neg.md** |
| 5 | `csr-shell-phase3-oncology-v1.md` | 3403 | 低 — CSR 分支未启动 | **跳过** |

### C. 分析文件（1 篇）

| # | 文件 | 行数 | 处理 |
|---|------|------|------|
| 1 | `open-label-oncology-trial-design-lessons-ember3.md` | 144 | **提取到 domains/oncology-solid.md** |

---

## 3. 目标文件映射

### 提取规则 → kb-engine/sop/ 目标

| 规则类型 | 目标文件 | 来源 |
|---------|---------|------|
| Protocol 全流程决策框架 | `core/protocol-design.md` | SOP-MW-001, SOP-MW-007 |
| I/E 优化 5 维度框架 | `core/protocol-design.md` Step 2 | SOP-MW-003 |
| PFS 评估者决策树（Inv vs BICR） | `core/protocol-design.md` Step 4 | SOP-MW-003 |
| Strategy Decision Points 识别规则 | `core/protocol-design.md`（新 section） | SOP-MW-003 |
| 独立统计设计→对标双步法 | `core/sap-design.md` | SOP-BS-002 |
| Estimand ICE 处理策略表 | `core/sap-design.md` Step 1 | SOP-BS-002 |
| 历史对照臂数据加权框架 | `core/sap-design.md`（新 section） | SOP-BS-002 |
| HR 估计证据层级 | `core/sap-design.md`（新 section） | SOP-BS-002 |
| 多重性控制决策树 | `core/sap-design.md` Step 2 | SOP-BS-002 |
| 期中分析核心决策 | `core/sap-design.md` Step 3 | SOP-BS-002 |
| 对标差异归因 5 层级 | `core/protocol-design.md` Step 1 | SOP-MW-007 |
| "不许抄"规则 | `core/protocol-design.md` Step 1 | SOP-MW-007 |
| FDA 审评 6 条教训 | `core/protocol-design.md`（分散到各 Step） | SOP-MW-001 §七 |
| 实体瘤通用设计经验 | `domains/oncology-solid.md` | EMBER-3 lessons |
| ER+/HER2- mBC 入排共识 | `indications/breast-er-her2neg.md` | SOP-MW-001 §三, 模板 |
| ER+/HER2- mBC 终点共识 | `indications/breast-er-her2neg.md` | SOP-MW-001 §三, 模板 |
| ER+/HER2- mBC 统计设计共识 | `indications/breast-er-her2neg.md` | SOP-MW-001 §三, SOP-BS-002 |
| ER+/HER2- mBC Visit Schedule 共识 | `indications/breast-er-her2neg.md` | SOP-MW-001 §三 |
| 通用肿瘤 Protocol 11-section 结构 | `sop/templates/README.md`（新建索引） | SOP-MW-001 §一 |

---

## 4. 执行计划

### Phase 1: core/ 规则提取（预计 2h）

**Step 1.1: protocol-design.md 规则注入**

从 SOP-MW-001 + SOP-MW-003 + SOP-MW-007 提取，按现有 Step 结构追加：

| 目标 Step | 新增规则（预估） | 来源 |
|-----------|----------------|------|
| Step 1 (Intelligence) | ~5 条：对标覆盖 11 section + 差异归因 5 层级 + "不许抄"规则 + 结构差异识别 + 版本敏感上下文 | SOP-MW-007 |
| Step 2 (Population) | ~8 条：富集/放宽策略矩阵 + 常见入排检查清单 10 项 + 终点导向的入排调整 | SOP-MW-003 |
| Step 4 (Endpoint) | ~5 条：PFS 评估者决策树 + 终点选择矩阵 + co-primary 设计规则 | SOP-MW-003 |
| Step 5 (Statistics) | ~3 条：Protocol 级统计自审清单 | SOP-MW-001 |
| 新 section: Strategy Decision Points | ~3 条：SDP 识别标准 + CRO 职责 + 呈现模板 | SOP-MW-003 |
| 新 section: FDA 审评教训 | ~6 条：适应症措辞 + 男性患者 + B/R 五维度 + 竞品安全对比 + 双主要假设批准逻辑 + PARP 排除 | SOP-MW-001 §七 |
| **小计** | **~30 条** | |

**Step 1.2: sap-design.md 规则注入**

从 SOP-BS-002 提取，按现有 Step 结构追加：

| 目标 Step | 新增规则（预估） | 来源 |
|-----------|----------------|------|
| Step 0 (Process) | ~3 条：独立设计→对标双步法 + Pre-Flight Checklist + 独立性时间戳 | SOP-BS-002 |
| Step 1 (Estimand) | ~4 条：ICE 处理策略表 + Estimand 5 属性模板 | SOP-BS-002 |
| 新 section: 对照臂估计 | ~5 条：历史数据加权框架 + I/E 修正因子 + ≥3 试验要求 | SOP-BS-002 Step 2 |
| 新 section: HR 估计 | ~4 条：证据层级 + 保守调整 + 3 场景敏感性 | SOP-BS-002 Step 3 |
| 新 section: 样本量 | ~3 条：Schoenfeld 公式 + GSD 膨胀 + 参数表模板 | SOP-BS-002 Step 4 |
| Step 2 (Multiplicity) | ~5 条：决策树 + Graphical Testing + α分配原则 | SOP-BS-002 Step 5 |
| Step 3 (Interim) | ~4 条：IA 核心决策表 + OBF spending + futility 规则 | SOP-BS-002 Step 6 |
| 对标步骤 | ~3 条：参数对比表 + 差异归因 + "不许抄" | SOP-BS-002 Step 8 |
| **小计** | **~31 条** | |

### Phase 2: indications/ 知识注入（预计 1h）

**breast-er-her2neg.md**（当前 30 行 → 预计 100+ 行）

| 新增内容 | 来源 |
|---------|------|
| 入排标准共识表（含 EMERALD/EMBER-3/VERITAC 对标） | SOP-MW-001 §三 |
| 终点共识表（PFS 评估者、OS、ORR、CBR、PRO） | SOP-MW-001 §三 |
| Visit Schedule 共识（影像、骨扫描、ECG、PK、ctDNA） | SOP-MW-001 §三 |
| 统计设计共识（alpha 分配、hierarchical testing、期中分析） | SOP-MW-001 §三 |
| v1→v2 对标纠正清单（11 个 FDA 审评教训） | SOP-MW-001 §四 |
| 15 个常见 Strategy Decision Points | SOP-MW-003 |

### Phase 3: domains/ 知识注入（预计 30min）

**oncology-solid.md**（当前 43 行 → 预计 70+ 行）

| 新增内容 | 来源 |
|---------|------|
| Open-label 设计经验（EMBER-3） | EMBER-3 lessons |
| 通用 Protocol 11-section 结构参考 | SOP-MW-001 §一 |

### Phase 4: 模板索引（预计 15min）

创建 `sop/templates/README.md`，建立引用索引（不复制内容）。

### Phase 5: Opus 独立审核（预计 30min）

Spawn Opus sub-agent 审核所有新增规则：
- 与已有规则是否矛盾
- 规则是否可执行（"当 X 时做 Y"格式）
- 来源标注是否完整
- 适应症特定 vs 通用分类是否正确

### Phase 6: 提交 + 验证（预计 15min）

- Git commit + push
- 验证文件行数未超标（core/ ≤200，domains/ ≤100，indications/ ≤80）
- 运行训练系统 Step 0b 验证 SOP 加载正常

---

## 5. 风险与缓解

| 风险 | 缓解 |
|------|------|
| KB SOP 内容有错误（质量不稳定） | Opus 审核 + 所有规则标注来源，可追溯 |
| 规则过多导致 SOP 膨胀 | core/ ≤200 行红线，超过则合并精简 |
| 适应症特定规则被当成通用规则 | 严格分层：有 Guidance 依据→core/，仅有案例→indications/ |
| 与训练中自然积累的规则冲突 | 训练时优先 FDA Review 验证，冲突时 Review 优先 |

---

## 6. 预估产出

| 指标 | 迁移前 | 迁移后（预估） |
|------|--------|---------------|
| core/protocol-design.md | 157 行 | ~200 行（+30 规则） |
| core/sap-design.md | 147 行 | ~200 行（+31 规则） |
| indications/breast-er-her2neg.md | 30 行 | ~110 行 |
| domains/oncology-solid.md | 43 行 | ~70 行 |
| **总规则增量** | — | **~61 条新决策规则** |

---

## 7. 验收标准

- [ ] 所有新增规则有 `[source: kb/xxx.md]` 标注
- [ ] core/ 文件 ≤200 行
- [ ] domains/ 文件 ≤100 行
- [ ] indications/ 文件 ≤80 行（breast-er-her2neg 例外，允许 ≤120 行因为是最成熟适应症）
- [ ] Opus 审核通过（无 ❌ 拒绝的规则）
- [ ] Git commit + push 成功
- [ ] 训练系统 Step 0b SOP 加载验证通过
- [ ] 无规则与已有 SOP 矛盾（矛盾的已标注 [supersedes]）

---

*计划版本: v1.0 | 待 Boss 审核后执行*
