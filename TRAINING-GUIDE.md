# 训练指南 — kb-engine

> 面向所有参与 CRO 知识训练的 AI Agent。
> 最后更新：2026-03-31 | 架构版本：v5.0

## 这个仓库是什么

一个闭环训练系统——通过"设计 FDA 级别的方案 → 对比 FDA 实际审批方案 → 提取规则优化 SOP"的循环，持续提升 AI Agent 在 CRO 临床试验领域的专业能力。

## 架构概述（v5.0）

```
kb-engine/
├── sop/                           ← 可执行 SOP（所有分支共享）
├── training/
│   ├── _shared/framework.md       ← 通用流程骨架（不变）
│   ├── protocol-design/           ← Protocol Design 训练分支
│   │   ├── program.md             ← 完整训练程序（可变）
│   │   ├── evaluate.md            ← 评分标准
│   │   ├── case-config.json       ← 案例配置
│   │   └── ...
│   ├── sap-design/                ← SAP Design 训练分支
│   │   ├── program.md             ← 完整训练程序（可变）
│   │   ├── evaluate.md            ← 评分标准
│   │   └── ...
│   └── {future}/                  ← 每个新分支独立编写
├── data/                          ← symlink → FDA Review 等数据
└── ROADMAP.md                     ← 9-SOP 训练路线图
```

**核心原则**：
- `framework.md` 定义流程骨架（Step 0→8，所有分支通用）
- 每个分支有独立的 `program.md`（评分维度、分析策略、做题配置完全自主）
- 流程文档是训练方案设计（Phase 0）的产出，不是起点

## 环境准备

```bash
git clone https://github.com/xiafy/kb-engine.git
cd kb-engine
ln -s /path/to/d2v_cro_base/data data    # FDA Review + FDA Guidance
gh auth status                             # 需要 GitHub CLI
```

## 你的任务

1. 从指定分支的 `program.md` 获取完整执行指令
2. 加载 SOP + 案例配置
3. 用 SOP 指导，独立完成方案设计（**开卷但信息隔离**：可用 SOP + 通用指南 + 同适应症其他药物信息，**严禁查看本题药物的任何信息**——包括 FDA Review、ClinicalTrials.gov、论文、新闻等所有渠道）
4. 完成后对比 FDA 实际审批方案
5. 评分、分析差异、提取 SOP 规则

## 输入资源

| 资源 | 路径 | 说明 |
|------|------|------|
| 分支训练程序 | `training/{branch}/program.md` | **起点**——完整执行指令 |
| 分支评分标准 | `training/{branch}/evaluate.md` | 评分维度 + 判例 + 校准规则 |
| 分支配置 | `training/{branch}/config.yaml` | Agent 配置、差异代码、收敛标准 |
| 案例配置 | `training/{branch}/case-config.json` | 案例→路径+域映射 |
| SOP 文件 | `sop/core/` + `sop/domains/` + `sop/indications/` + `sop/regulatory/` | 知识库——按 case-config 映射加载 |
| FDA/ICH 指南 | `data/fda-guidelines/markdown/` | 可在任何步骤使用 |
| FDA Review | `data/fda-reviews/md/{path}/` | **答案**——完成设计后才读 |
| 通用骨架 | `training/_shared/framework.md` | 流程参考（只读） |

## 输出文件

每轮训练产出保存到 `training/{branch}/rounds/round-{NN}/`：

```
rounds/round-{NN}/
├── solver-A.md          ← Solver A 输出
├── solver-B.md          ← Solver B 输出
├── solver-C.md          ← Solver C 输出
├── consensus-answer.md  ← 共识合并结果
├── fda-actual.md        ← FDA 实际方案（从 Review 提取）
├── scoring.md           ← 裁判评分
├── analysis.md          ← 差异归类 + 偏差事件 + 行为变异
└── grounding.md         ← 规则溯源记录
```

追加一行到 `training/{branch}/results.tsv`（17 列）。

## 关键规则

1. **本题药物信息隔离（v5.1）**：严禁通过任何渠道查看本题药物信息——包括 FDA Review（答案）、ClinicalTrials.gov 注册信息、公开论文、新闻、ASCO 摘要等。允许查看同适应症**其他药物**的所有信息。原理：训练测试的是 SOP 预测能力，不是情报检索能力。
2. **裁判隔离**：裁判在独立 session 中执行，不看做题推理过程
3. **开卷做题**：可用 SOP + FDA Guidance + 同适应症其他药物 + exec 工具
4. **英文执行**：所有训练内部产出用英文（LANGUAGE.md 规范）
5. **Section-Append**：SOP 只追加不修改已有行，避免 Git 冲突
6. **审核门控**：SOP 更新前必须经独立 Agent 审核
7. **Git PR 模型**：每轮一个分支 `train/{branch}-round-{NN}`，squash merge 到 main

## 分支差异

| 分支 | 评分维度 | 差异代码 | 核心工具 |
|------|---------|---------|---------|
| protocol-design | 10 项（设计/对照/终点/样本量...） | KNOW/REG/STAT/ALT/INFO | web_search |
| sap-design | 9 项（分析方法/多重性/IA/缺失数据...） | METH/ASSUM/IMPL/ALT/INFO | exec (Python/R) |

**每个分支的 program.md 是最终权威**——分支之间的差异全部定义在各自的 program.md 中。

## 新分支创建流程

```
Phase 0: 训练方案设计（目标→范围→评分体系→Boss 确认）
Phase 1: 生成流程文档（program.md / evaluate.md 是方案的产出）
Phase 2: 验证 & 训练
```

详见 `ROADMAP.md` 的 New Branch Launch Checklist。

## 术语表

| 术语 | 定义 |
|------|------|
| **SOP** | 可执行的标准操作规程——指导方案设计决策的规则集 |
| **Domain** | 疾病大类（如 oncology-solid, autoimmune, respiratory） |
| **Indication** | 具体适应症（如 breast-er-her2neg, anca-vasculitis） |
| **Branch** | 训练分支——每个分支有独立的 program.md / evaluate.md / 题库 / 结果 |
| **Round** | 一轮训练：做一道题 → 对答案 → 评分 → 分析 → 更新 SOP |
| **Owner Agent** | 做题 Agent——读 SOP 后自行决定工作流（可能 spawn sub-agent） |
| **match_score** | 严格匹配率：多少维度完全匹配 FDA 实际方案（0.0–1.0） |
| **weighted_score** | 加权得分：match×1 + partial×0.5（0.0–1.0） |
| **framework.md** | 通用流程骨架（Step 名 + I/O 契约 + 不变量），所有分支共享 |
| **CRO** | 合同研究组织——为药企管理临床试验的公司 |
| **FDA** | 美国食品药品监督管理局——其审批方案是训练的"标准答案" |
