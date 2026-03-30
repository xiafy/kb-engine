# kb-engine 执行计划

> **版本**: v2.1 | **创建**: 2026-03-30 | **Owner**: Helix-Core
> **状态**: ✅ Step 0-7 完成 | Batch 1 训练启动（B1R1 完成，match 0.70）| program.md v4.1
> **仓库**: `xiafy/kb-engine` | Tag: `pd-validation-pass`
> **架构文档**: `kb-engine-architecture-v2.md`
> **评审记录**: 4 轮 Opus（项目 B+ / 架构 B·B+·B+ / Step 6 方案 B），全部阻塞项已修复

---

## 背景

Training Loop 已验证"做题→对答案→优化 SOP"模式在 Protocol Design 上有效（校准后 match 0.74，SOP v2.2 59 条规则）。现在要将这个模式从单一 Protocol Design 扩展到 CRO 全业务，同时在过程中重建知识库。

**三个目标**：
1. 建立自我迭代系统（Training Loop 多分支扩展）
2. 基于 PM Agent 实现面向终端用户的 CRO 服务能力（MVP 端到端交付）
3. 建立面向实战的知识库系统（kb-engine）

---

## 已确认的设计决策

| 决策 | 结论 | 来源 |
|------|------|------|
| MVP 范围 | FDA Review 可训练的全部 9 个能力 | Boss 确认 |
| D2V SOP 吸收策略 | 方案 B：按需吸收，与 Training Loop 节奏同步 | Boss 确认 |
| 新旧 KB 共存策略 | 方案 A：共存，kb/ 文件加 `absorbed_by:` 标记 | Boss 确认 |
| kb/ 同步方式 | 手动扫描 + diff 对比，不自动同步 | Boss 确认 |
| kb-engine 位置 | `shared/kb-engine/` | Boss 确认 |
| training/ 位置 | kb-engine/ 下，与 sop/ 平级 | Boss 确认 |
| templates/ | 纳入 sop/ 内 | Boss 确认 |
| 数据引用 | 符号链接 `data -> ../data`，不复制 | Boss 同意 |
| core/ 行数上限 | **200 行**（Opus 评审修正，原 150 不现实） | 评审修正 |
| 验证基线 | **校准后 0.74**（非自评 0.83） | 评审修正 |

---

## 当前状态

### 已完成
- [x] `shared/kb-engine/` 目录骨架：sop/{core,domains,indications,regulatory,templates}
- [x] `kb-engine/README.md` 全局索引
- [x] `kb-engine/sop/README.md` PM Agent 路由表（9 个 core/ SOP + 加载规则 + 工作流依赖图）
- [x] `data -> ../data` 符号链接

### 已创建
- [x] `training/` 目录结构（branches/protocol-design, questions, results, archive）
- [x] training/ 下各子目录

### 执行状态
- [x] **Step 0**: 试分类表（65 条规则全映射）→ `docs/kb-engine/kb-engine-split-map.md`
- [x] **Step 1**: Protocol Design v2.2 拆分（21 文件 + 3 QC 补充占位，42/42 关键词零损失验证 ✅）
- [x] **Step 2**: Training Framework v3（program.md 299 行，多分支框架）✅ Opus Pass
- [x] **Step 3**: 评分标准 + 题库迁移（case-config 增强 + evaluate.md + questions/ + schema.md）✅ Opus Pass
- [x] **Step 4**: Protocol-design 分支配置（config.yaml + README.md）✅ Opus Pass（2 项已修复）
- [x] **Step 5**: SAP-design 分支启动准备（config.yaml + README.md + sap-design.md v0.2 145 行）✅
- [x] **Step 6**: 验证 ✅ — V1-V5 avg match 0.84 / weighted 0.92，5/5 domain 覆盖，Tag `pd-validation-pass`
- [x] **Step 7**: 9-SOP Roadmap → `shared/kb-engine/ROADMAP.md` ✅

---

## Step 0: 试分类表（新增，评审要求）

**目的**: 在动手拆分前，先对 sop.md v2.2 的每条规则标注目标文件路径，发现模糊地带。

**输入**: `docs/training-loop/sop.md`（v2.2, 33 个 `###` 节 + ~21 个 IF-THEN 分支）

**输出**: `docs/kb-engine-split-map.md`（试分类表）

### 表格格式

```
| 原 sop.md 位置 | 规则摘要 | 目标文件 | 分类置信度 | 备注 |
|---|---|---|---|---|
| Step 1.1 | FDA 情报收集流程 | core/protocol-design.md | 高 | 全局规则 |
| Step 4.2 IF 银屑病 | PASI 75/90/100 终点选择 | indications/psoriasis.md | 高 | 适应症特定 |
| Step 5.2 | 多重性控制策略 | ⚠️ 待定 | 低 | 跨 SOP 共享？ |
```

### 关键决策点（需在试分类中解决）

| 模糊规则 | 选项 A | 选项 B | 决定 |
|----------|--------|--------|------|
| Step 5 统计规则（~70 行） | 全留 protocol-design | 分流：框架留 protocol-design，细节给 sap-design | **选 B**：纯 SAP 内容（多重性细节、期中分析 spending function、NI→Sup 设计）→ sap-design.md 种子；Protocol 层面统计规则（样本量逻辑、协变量调整）→ protocol-design.md |
| Step 6.2 适应症特定分层因子表 | 整表留 core/ | 逐行拆到 indications/ | **选 B**：每个适应症的分层因子随规则一起拆到对应 indications/ 文件 |
| Step 3.2 FDC 组合产品 | core/ | domains/respiratory | **暂留 core/**：FDC 不限于呼吸科，当前规则虽以呼吸科为例但逻辑通用 |
| Step 4.2 非肿瘤终点 5 个 IF 分支 | 单个 domains/ 文件 | 按适应症拆分 | **按适应症拆分**到对应 indications/ 文件 |

### 跨 SOP 规则共享机制

多个 core/ SOP 可能引用同一规则（如统计设计原则）。处理方式：

1. **首选**：规则只存在于最相关的 core/ SOP，其他 SOP 用一句话引用（"统计设计详见 `sap-design.md` Step X"）
2. **Fallback**：如果 core/ 行数仍超 200 行 → 引入 `core/shared-stats.md` 共享层，protocol-design 和 sap-design 都 include

### 工作量估计
- AI 实际：1-2 小时

---

## Step 1: Protocol Design v2.2 → 三层拆分

**输入**: `docs/training-loop/sop.md`（v2.2）+ Step 0 试分类表
**输出**: core/ + domains/ + indications/ + regulatory/ 文件

### 拆分规则

| sop.md 中的内容类型 | 目标位置 | 判断标准 |
|-------------------|---------|---------|
| 全局决策步骤（Step 0-8 流程） | `core/protocol-design.md` | 不依赖疾病/适应症的通用规则 |
| 疾病大类特定规则 | `domains/{大类}.md` | 含"for oncology"等大类限定 |
| 适应症特定规则 | `indications/{适应症}.md` | 含具体药名、靶点、机制 |
| 监管路径特定规则 | `regulatory/{路径}.md` | 含特殊监管路径逻辑 |
| 纯 SAP 统计规则 | `core/sap-design.md`（种子） | 多重性细节、spending function、NI 设计 |
| 溯源/来源注释 | 不迁移 | 存 archive/ 或 git history |

### 预期产出

```
sop/core/protocol-design.md           ← ≤200 行，8 步决策流程 + 全局规则（不含纯 SAP 内容）
sop/core/sap-design.md                ← ~40 行种子（从 Step 5 分流的纯 SAP 规则）
sop/domains/oncology-solid.md         ← ~100 行
sop/domains/oncology-heme.md          ← ~80 行
sop/domains/autoimmune.md             ← ~60 行
sop/domains/respiratory.md            ← ~40 行
sop/indications/breast-er-her2neg.md  ← 案例 01,07,08
sop/indications/nsclc.md              ← 案例 19
sop/indications/gastric-gejc.md       ← 案例 05
sop/indications/psoriasis.md          ← 案例 12
sop/indications/anca-vasculitis.md    ← 案例 13
sop/indications/mds.md                ← 案例 17
sop/regulatory/accelerated-approval.md
sop/regulatory/breakthrough.md
sop/regulatory/botanical-drug.md      ← 康缘 KYG0395 场景
```

### 零损失验证方法（评审加强版）

1. **规则清单法**（拆分前）：提取 sop.md 中所有规则的 one-liner 清单（每条规则一行摘要），作为 checklist
2. **去向标注**（拆分后）：对 checklist 每条规则标注目标文件 + 行号，确保 100% 覆盖
3. **重组合 diff**（拆分后）：cat 所有产出文件，与原文 diff（去除格式差异），确认内容等价
4. **Opus 审核**：独立 Agent 对照 checklist 验证零损失

### core/ 行数 Fallback

- **目标**: ≤200 行
- **Dry-run 后如果 >200 行**: 引入 `core/shared-stats.md`（跨 SOP 统计规则共享层）
- **硬上限**: 250 行（超过此值必须再次拆分）

### 质量要求
- core/ 文件 ≤200 行，零附录，线性可执行
- 拆分后全部规则的并集 = 原 sop.md v2.2 全部规则（零损失，规则清单法验证）
- 拆分后跑验证案例，输出质量不低于拆分前

### 工作量估计
- AI 实际：4-6 小时（含 dry-run + Opus 审核 + 可能的调整）

---

## Step 2: Training Framework v3

**输入**: `docs/training-loop/program.md`（单任务版）
**输出**: `kb-engine/training/program.md`（v3，多分支版）

### 关键变更

| v2（当前） | v3（目标） |
|-----------|-----------|
| 单一 SOP 文件路径 | 从 branch config 读取 SOP 路径 + 答案提取规则 |
| 固定评分维度 | 通用 10 项 + branch 可 override |
| 结果写 results.tsv | 结果写 `results/{branch}/results.tsv` |
| SOP 更新直接改文件 | SOP 更新写到 `sop/core/` 或 `sop/domains/` |
| 无 SOP 路径解析步骤 | 新增 Step 0b：解析题目→SOP 文件路径映射 |

### program.md v3 核心流程

```
Step 0a: 加载 branch config（评分维度、答案提取规则、SOP 路径）
Step 0b: SOP 路径解析 — 确定本题目需加载的 domains/ 和 indications/ 文件
         输出: 完整文件路径列表（可审计）
Step 1:  选题（从 questions/ 随机或顺序，排除已做）
Step 2:  加载 SOP（按 Step 0b 路径列表：core/ + domains/ + indications/ + regulatory/）
         加载顺序: core/ → domains/ → indications/ → regulatory/（从通用到特定）
Step 3:  做题（运动员 Agent）
Step 4:  对答案（从 FDA Review 指定章节提取，章节由 branch config 定义）
Step 5:  评分（裁判 Agent × 3 盲评，维度由 branch config override）
Step 6:  分析差距（哪条规则缺失/错误）
Step 7:  更新 SOP（写入对应层级文件，由 branch config 的"SOP 写入目标"指导）
Step 8:  记录结果（results/{branch}/results.tsv）
```

### 三层 SOP 加载逻辑（评审补充）

```
题目 → 识别适应症（从 questions/ 文件 frontmatter 获取）
     → 映射 domains/（适应症→疾病大类映射表，在 case-config.json 中维护）
     → 映射 indications/（如果文件存在则加载，不存在则跳过）
     → 映射 regulatory/（如果题目涉及特殊路径则加载）

多 domains 情况：如果一个案例涉及多个 domains（如 ADC 药物），
加载所有匹配的 domains/ 文件，按字母序排列。
```

### SOP 版本管理

- 每个文件独立版本号（frontmatter `version: 1.0`）
- 训练每更新一次，patch 版本 +1
- `sop/CHANGELOG.md` 记录跨文件变更摘要

### 工作量估计
- AI 实际：3-4 小时

---

## Step 3: 评分标准 + 题库迁移

**输入**: `docs/training-loop/{evaluate.md, case-config.json, questions/, results.tsv}`
**输出**: `kb-engine/training/{evaluate.md, case-config.json, questions/, results/protocol-design/results.tsv}`

### 处理方式

| 文件 | 操作 | 说明 |
|------|------|------|
| `evaluate.md` v2.0 | 迁移 + 增强 | 添加 branch override 机制说明 |
| `case-config.json` | 迁移 + 增强 | 添加 `domain` 和 `indication` 映射字段 |
| `questions/`（21 套） | 迁移 + 增强 | 为 SAP 分支新增 frontmatter 字段（终点、入排、对照臂） |
| `results.tsv` | 迁移到 `results/protocol-design/` | — |
| `results/schema.md` | **新建** | 统一 TSV schema（round, case_id, branch, match_score, weighted_score, timestamp） |

### case-config.json 增强

```json
{
  "id": "01",
  "drug": "Inluriyo",
  "generic": "imlunestrant",
  "path": "2025/NDA218881-inluriyo",
  "domain": "oncology-solid",
  "indication": "breast-er-her2neg",
  "regulatory": null,
  "protocol_params": {
    "primary_endpoint": "PFS",
    "comparator": "SOC (physician's choice)",
    "population": "ER+/HER2- advanced breast cancer, ESR1 mutation",
    "design": "randomized, open-label, Phase 3"
  }
}
```

`protocol_params` 字段为 SAP 分支做题时的固定输入。

### 原 docs/training-loop/ 处理
- 保留原目录，添加 `MIGRATED.md` 指向 `shared/kb-engine/training/`
- 不删除（保留 git history + 归档价值）

### 工作量估计
- AI 实际：1-2 小时

---

## Step 4: Protocol-design 分支配置

**输出**: `kb-engine/training/branches/protocol-design/config.yaml` + `README.md`

### config.yaml（结构化格式，评审建议采纳）

```yaml
branch: protocol-design
version: 1.0
status: migrated  # from docs/training-loop/

sop:
  core: sop/core/protocol-design.md
  domains_mapping: case-config.json  # domain 字段
  indications_mapping: case-config.json  # indication 字段

answer_extraction:
  chapters:
    - "Clinical Review — Trial Design"
    - "Clinical Review — Inclusion/Exclusion"
    - "Statistical Review — Study Design"

scoring:
  dimensions:
    - 入排标准合理性
    - 终点选择
    - 对照组设计
    - 分层因素
    - 样本量逻辑
    - 适应症特定设计
    - FDA 先例一致性
    - 安全性监测
    - COA 选择
    - 统计方法框架

sop_write_targets:
  global: sop/core/protocol-design.md
  domain: "sop/domains/{domain}.md ## Trial Design"
  indication: "sop/indications/{indication}.md ## Protocol Design"
  regulatory: "sop/regulatory/{path}.md"

history:
  total_rounds: 20
  current_match: 0.74  # 校准后
  migrated_from: docs/training-loop/
```

### 工作量估计
- AI 实际：30 分钟

---

## Step 5: SAP-design 分支启动准备

**输出**:
- `kb-engine/training/branches/sap-design/config.yaml`
- `kb-engine/training/branches/sap-design/README.md`
- `kb-engine/sop/core/sap-design.md`（种子版，含 Step 1 分流的规则 + D2V 吸收内容）

### config.yaml

```yaml
branch: sap-design
version: 0.1
status: seed  # 种子版，待训练

sop:
  core: sop/core/sap-design.md
  depends_on: sop/core/protocol-design.md  # SAP 需要 Protocol 设计参数
  domains_mapping: case-config.json
  indications_mapping: case-config.json

answer_extraction:
  chapters:
    - "Statistical Review — Analysis Plan"
    - "Statistical Review — Multiplicity"
    - "Statistical Review — Interim Analysis"
    - "Statistical Review — Sample Size"           # 评审补充
    - "Statistical Review — Missing Data"           # 评审补充
    - "Statistical Review — Subgroup Analysis"      # 评审补充
    - "Clinical Review — Efficacy (分析集定义)"

scoring:
  dimensions:
    - 主分析方法选择
    - 多重性控制策略
    - 期中分析设计
    - 分析集定义
    - 缺失数据处理策略
    - 亚组分析预设
    - 敏感性分析设计
    - 样本量计算方法和假设
    - Estimand 框架（ICH E9(R1)）    # 评审新增

input_schema:
  description: "SAP 做题需要 Protocol 参数作为固定输入"
  source: case-config.json → protocol_params
  fields:
    - primary_endpoint
    - secondary_endpoints
    - comparator
    - population
    - design
    - stratification_factors

sop_write_targets:
  global: sop/core/sap-design.md
  domain: "sop/domains/{domain}.md ## SAP Design"
  indication: "sop/indications/{indication}.md ## SAP Design"
```

### D2V SOP 吸收计划

| 来源 | 吸收内容 | 目标 |
|------|---------|------|
| `kb/d2v-sop/BS/sop-bs-002` SAP 开发审批 | 流程框架（开发时间线、审批节点） | sap-design.md 流程部分 |
| `kb/d2v-sop/BS/wi-bs-001` SAP/TFL 编制指南 | 技术规范（如有） | sap-design.md 技术规则 |
| `kb/methods/sop/statistical-design-sop.md` | 统计方法决策逻辑 | sap-design.md 决策规则 |
| `kb/biostat/` 统计方法论 | **不吸收**，保留为参考层 | SOP 引用但不内联 |
| sop.md v2.2 Step 5（分流部分） | 多重性、期中分析、NI 设计规则 | sap-design.md 种子规则 |

**关键判断**：D2V SOP 提供**流程知识**（谁做、何时做），Training Loop 提供**决策知识**（选什么方法）。两者互补。

### 前置条件
- Step 1 完成（Step 5 统计规则已分流）
- Step 3 完成（case-config.json 含 protocol_params）

### 工作量估计
- config + 种子 SOP：2-3 小时
- 训练 10 轮（后续）：4-6 小时

---

## Step 6: 验证（评审加强版）

### 6a: Protocol Design 无退化验证

**案例选择**：5 个案例，每个 domain 至少 1 个：

| 案例 | Domain | 选择理由 |
|------|--------|---------|
| 01 Inluriyo | oncology-solid / breast | 触发 ESR1m 适应症规则 |
| 05 Vyloy | oncology-solid / gastric | 触发胃癌特定规则 |
| 09 Komzifti | oncology-heme / AML | 触发血液肿瘤规则 |
| 12 Sotyktu | autoimmune / psoriasis | 触发非肿瘤终点规则 |
| 13 Tavneos | autoimmune / ANCA | 触发罕见自免规则 |

**通过标准**：
- 平均 match ≥ **0.71**（不低于校准基线 0.74 超过 0.03）
- 单案例最低 match ≥ 0.60

**额外检查**：
- **规则加载覆盖率**：验证每个 domains/ 和 indications/ 文件至少被 1 个案例触发
- **规则清单覆盖率**：对照 Step 0 试分类表，确认所有规则在新结构中可被访问

### 6b: SAP Design Baseline

- 用种子 SOP（训练前）跑 3 个案例
- 记录 baseline match（预期 0.30-0.50）
- 确认 protocol_params 输入机制正常工作

### 工作量估计
- AI 实际：3-4 小时（含可能的 debug）

---

## Step 7: 9-SOP Roadmap（评审新增）

### 训练优先级（按工作流依赖链）

```
Phase 1: ✅ protocol-design（已完成 v2.2，本次迁移）
Phase 2: ▶️ sap-design + regulatory-strategy（与 Protocol 高度关联）
Phase 3:    efficacy-assessment + safety-assessment（并行，需要 Phase 1/2 SOP 作为前提）
Phase 4:    clinical-pharm + stat-analysis（专项，相对独立）
Phase 5:    labeling-review + post-marketing（下游，需要 Phase 3/4 完成）
```

### 预估时间线

| Phase | SOP | 预估启动 | 依赖 |
|-------|-----|---------|------|
| 1 | protocol-design | ✅ 已完成 | — |
| 2a | sap-design | 本次（Step 5） | Phase 1 迁移完成 |
| 2b | regulatory-strategy | Phase 2a 训练后 | Phase 1 |
| 3a | efficacy-assessment | Phase 2 完成后 | Phase 1 + 2a |
| 3b | safety-assessment | 与 3a 并行 | Phase 1 + 2a |
| 4a | clinical-pharm | Phase 3 中期 | Phase 1 |
| 4b | stat-analysis | Phase 2a 完成后 | Phase 2a |
| 5a | labeling-review | Phase 3+4 完成后 | Phase 3 + 4 |
| 5b | post-marketing | Phase 5a 之后或并行 | Phase 3 + 5a |

**关键路径**: protocol-design → sap-design → stat-analysis → efficacy/safety → labeling → post-marketing

### 题库复用

同一个 FDA Review 案例，不同分支从不同章节提取答案：
- 20 个案例 × 9 个分支 = **180 次训练机会**，不需要新题目
- 但需要为每个分支补充 case-config.json 的 `protocol_params` 等字段

---

## 执行顺序和时间线

```
Day 1:     Step 0（试分类表）+ training/ 目录实际创建
Day 2-3:   Step 1（Protocol Design 拆分）— 最重时步骤
Day 3-4:   Step 2（program.md v3）
Day 4:     Step 3（题库迁移 + case-config 增强）+ Step 4（protocol-design config）
Day 5-6:   Step 6a（无退化验证 5 案例）
Day 6-7:   Step 5（SAP 启动准备 + 种子 SOP）
Day 7-8:   Step 6b（SAP baseline）+ Step 7（Roadmap 文档化）
```

**总工作量**: AI 实际 ~18-24 小时，日历 ~7-8 天（含评审和缓冲）

---

## 风险和缓解

| 风险 | 影响 | 缓解 |
|------|------|------|
| core/ 拆分后 >200 行 | 违反设计原则 | Step 0 dry-run 验证；Fallback: shared-stats.md 共享层；硬上限 250 行 |
| sop.md 拆分后规则损失 | 能力退化 | 规则清单法 + 重组合 diff + Opus 审核 |
| program.md v3 引入 bug | 训练不可用 | 先用旧 program.md 跑一轮对照 |
| SAP 答案提取规则不准 | 训练效果差 | 先手动分析 3 个 FDA Review 的统计章节结构 |
| domains/ 拆分粒度不当 | 加载效率低 | 先粗后细——初始只建 4-5 个大类 |
| training/ 目录实际不存在 | Step 2-3 阻塞 | Step 0 前置创建 |
| 验证失败需要 debug | 时间超支 | 预留 2 天缓冲 |
| 跨分支 SOP 写入冲突 | 后续并行训练问题 | 当前串行训练，暂不处理；后续引入文件锁或 section 隔离 |

---

## 成功标准

| 指标 | 目标 |
|------|------|
| Protocol Design 三层加载后 match | ≥ 0.71（校准基线） |
| SAP Design baseline match | 有数据（任何值） |
| core/ SOP 文件数 | ≥ 2（protocol-design + sap-design 种子） |
| domains/ 文件数 | ≥ 4 |
| indications/ 文件数 | ≥ 5 |
| regulatory/ 文件数 | ≥ 2 |
| program.md v3 可运行 | 能成功跑完 1 轮训练 |
| 规则清单覆盖率 | 100%（零损失） |
| 9-SOP Roadmap | 完成并文档化 |

---

## kb-engine 长期演进路径

### 从 sop/ + training/ → 完整知识引擎

```
阶段 1（当前）: sop/ + training/           ← 只有 SOP 和训练引擎
阶段 2: + references/                      ← 训练过程中发现需要的参考知识从 kb/ 迁入
阶段 3: + methods/ + templates/（增强）     ← PM Agent 端到端交付所需的方法论和模板
阶段 4: Learner 写入目标从 kb/ → kb-engine  ← 需要 Learner AGENTS.md 改造
阶段 5: kb/ 退役                           ← 条件：所有 kb/ 文件标记 absorbed_by 且 6 个月无新写入
```

### kb/ 退役条件

- 所有 kb/ 文件被标记 `absorbed_by:` 或 `status: deprecated`
- 6 个月内无新写入（Learner 已切换到 kb-engine）
- kb-engine 的质量评分 ≥ kb/ 最终评分（B+ 85.3）
