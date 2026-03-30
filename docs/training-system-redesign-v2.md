# 训练系统重设计 v2.0

> 日期: 2026-03-30 | 状态: 待审核
> 背景: 基于今天的 6 轮讨论，从第一性原理重新梳理

---

## 一、训练目标

**终极目标**: PM Agent 能独立产出通过 FDA 审评的临床试验文档（Protocol / SAP / CSR）。

**训练 = 模拟实战 + 积累可复用决策知识**

训练不是考试，是模拟 Amanda/Walt 的真实工作。给 Agent 一个药、一个适应症，让它用现有的一切资源产出方案，然后和 FDA 实际批准的方案对比。差距就是需要补充的知识。

**SOP 的定位**: 决策知识的载体。训练的副产品是不断完善的 SOP——每一轮训练都可能发现新规则、验证旧规则、修正错误规则。

---

## 二、训练场景（三级粒度）

| 级别 | 场景 | 输入 | 产出 | 耗时 | 用途 |
|------|------|------|------|------|------|
| **L1 端到端** | 给一个药，从零设计完整方案 | 药名 + 适应症 + MOA | 完整 Protocol/SAP 设计方案 | 长 | 综合能力验证 |
| **L2 模块级** | 给定背景，优化某个 Section | 已有方案草稿 + 具体问题 | 单 Section 优化建议 | 中 | 针对性提升某维度 |
| **L3 决策点** | 给定上下文，做一个具体决策 | 具体决策场景 | 决策 + 理由 | 短 | 最小粒度，快速迭代 |

**使用策略**:
- 初期以 L1 为主（发现全面的能力短板）
- 跑几轮 L1 后，针对高频 miss 的维度用 L2/L3 补强
- L2 示例: "这个入排标准要不要放宽？给出 5 维度分析"
- L3 示例: "PFS 评估者选 Investigator 还是 BICR？给出决策依据"

---

## 三、训练执行流程

### L1 端到端流程

#### Step 1: 情报收集
```
输入: 题目（药名 + 适应症 + MOA + 基本条件）
Agent 可用资源:
  - sop/ 全部文件
  - data/fda-guidelines/markdown/ （FDA/ICH 指南原文）
  - data/fda-reviews/md/ 中同适应症其他药物的 Review（非本题答案）
  - 外部搜索（ClinicalTrials.gov、PubMed 等）

产出: 疾病背景 + 竞品设计要素汇总 + 相关 FDA 指南要点

唯一限制: 不能查看本题药物的 FDA Review（那是 Step 4 的答案）
```

#### Step 2: 方案设计
```
输入: Step 1 情报 + 题目条件 + SOP + 模板
Agent 可用资源: 与 Step 1 相同，加上:
  - sop/ 全部文件（core/ + domains/ + indications/ + references/）
  - 模板（shared/kb/methods/templates/）

产出: 完整设计方案（按分支 config 的 scoring dimensions 输出）
```

#### Step 2b: 共识合并（多 Agent 模式）
```
3 Agent 各自独立完成 Step 1-2
调度者逐维度合并:
  3/3 一致 → [consensus: 3/3]
  2/3 一致 → [consensus: 2/3, dissent: ...]
  3/3 各不同 → [no-consensus] ← SOP 歧义信号
```

#### Step 3: 质量自审
```
Agent 对照 sop/references/quality/ 中的检查清单自审:
  - FDA 审评教训清单
  - SDP 15 项检查
  - 12 项自审 checklist
标记需要修正的项目，修正后形成最终方案
```

#### Step 4: 对答案
```
读取本题药物的 FDA Review（MultidisciplineR.md）
按 config.yaml 指定章节提取 FDA 实际方案
格式化为 fda-actual.md
```

#### Step 5: 独立裁判评分
```
3 名裁判 Agent（独立 session，互不可见）
输入: consensus-answer.md + fda-actual.md + evaluate.md
输出: 逐维度 match/partial/miss + match_score + weighted_score
```

#### Step 6: 差异归类 + 规则溯源（Step 5c）
```
对 partial/miss 项归类: KNOW / REG / STAT / ALT / INFO
对 KNOW/REG/STAT 项执行规则溯源:
  1. 查 FDA Guidance/ICH → 写通用规则 [grounded: FDA-Guidance-xxx]
  2. 查历史训练多案例 → [multi-case: ...]
  3. 仅本案例 → [single-case, low-confidence]
```

#### Step 7: SOP 更新（经 L4 审核）
```
L4 审核 Agent 审查每条新规则:
  ✅ 同意 → 写入对应 SOP 文件
  ⚠️ 需修改 → 调整后写入
  ❌ 拒绝 → 记录到 analysis.md
写入遵循 section-append 约定，标注来源
```

#### Step 8: 记录结果
```
保存到 rounds/round-{NN}/
追加 results.tsv
循环检查收敛/发散信号
```

### L2 模块级流程

```
Step 1: 读题（含已有方案草稿 + 要优化的模块）
Step 2: 模块优化（开卷，可用全部资源）
Step 3: 对答案（仅对比对应模块）
Step 4: 评分（仅评对应维度）
Step 5: SOP 更新（如有新规则）
```

### L3 决策点流程

```
Step 1: 读题（具体决策场景 + 上下文）
Step 2: 做决策（给出决策 + 理由 + 替代方案分析）
Step 3: 对答案（FDA 在这个点上怎么做的）
Step 4: 如果决策不同 → 分析原因 → 是否需要更新 SOP
```

---

## 四、SOP 组织结构

### 当前结构（保持不变，不做拆分）

```
sop/
├── core/                         ← 核心决策流程（永远加载）
│   ├── protocol-design.md        ← Protocol 设计 Step 1-8 + SDP + FDA 教训
│   └── sap-design.md             ← SAP 设计 Step 0-9 + 统计方法 + 对标
│
├── domains/                      ← 疾病大类规则（按 domain 加载）
│   ├── oncology-solid.md
│   ├── oncology-heme.md
│   ├── autoimmune.md
│   ├── rare-disease.md
│   └── respiratory.md
│
├── indications/                  ← 适应症特定规则（按 indication 加载）
│   ├── breast-er-her2neg.md
│   ├── nsclc.md
│   └── ... (14 files)
│
├── regulatory/                   ← 监管路径规则（按 pathway 加载）
│   ├── accelerated-approval.md
│   ├── botanical-drug.md
│   └── breakthrough.md
│
└── templates/                    ← 模板索引（指向 shared/kb/methods/templates/）
    └── README.md
```

### 文件大小策略

- **训练初期不设行数红线**
- 训练跑完每个 Batch 后手动 review：合并重复规则、精简表述、必要时拆分
- 后期引入多 Agent 分工（情报 Agent + 设计 Agent + 统计 Agent + 质审 Agent），天然分散 context 压力
- 如果单个文件确实超出 context 可承受范围（>500 行），再按渐进式披露原则拆分为 core + references

### SOP 加载规则

```
L1 端到端: 加载 core/ + domains/{domain}.md + indications/{indication}.md + regulatory/{pathway}.md
L2 模块级: 加载 core/{相关文件} + 相关 domain/indication
L3 决策点: 仅加载 core/{相关文件} 的相关 Section

所有级别均可访问:
  - data/fda-guidelines/markdown/（FDA/ICH 指南）
  - data/fda-reviews/md/（同适应症其他药物 Review）
  - shared/kb/methods/templates/（模板）
```

---

## 五、与 program.md 当前版本的差异

| 项目 | program.md v3.6（当前） | v4.0（本方案） |
|------|----------------------|---------------|
| Step 2 定义 | 闭卷，不得查看答案文件，不得使用外部搜索 | 开卷，可用全部资源（SOP+指南+模板+搜索），唯一限制不看本题 Review |
| 训练粒度 | 仅 L1 端到端 | L1/L2/L3 三级 |
| 文件行数限制 | core/ >200 行触发合并 | 不设红线，Batch 结束后手动 review |
| 3 Agent 做题 | 各自闭卷基于 SOP | 各自开卷使用全部资源，差异来自采样多样性 |
| SOP 加载 | 固定加载 core/ + domain/ + indication/ | 同上，但 Agent 可主动读取 templates/ 和 FDA 指南 |
| Step 5c 溯源 | 已有（v3.6 新增） | 保留不变 |
| 评分标准 | 仅评决策匹配度 | 同时评方案的完整性和专业深度 |

---

## 六、关键设计决策记录

| 决策 | 选择 | 理由 |
|------|------|------|
| 闭卷 vs 开卷 | **开卷** | 训练=模拟实战，Amanda 工作时用一切可用资源 |
| KB→SOP 是否迁移 | **已迁移 33 条规则** | 决策即知识，Amanda 的实战经验应预装 |
| SOP 文件行数 | **不设红线** | 初期快速增长，手动优化比自动压缩更有效 |
| 训练粒度 | **L1/L2/L3 三级** | 从完整端到端到优化单个决策点，灵活组合 |
| 规则溯源 | **FDA Guidance/ICH 优先** | KB 质量不稳定，降级为辅助参考 |
| 模板使用 | **训练时可用** | 模板提供结构骨架，决策仍靠 SOP |

---

*版本: v2.0 | 待 Opus 独立审核后定稿*
