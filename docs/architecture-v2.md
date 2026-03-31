# kb-engine 架构设计 v2.0

> **版本**: v2.0 | **日期**: 2026-03-30 | **Owner**: Helix-Core
> **来源**: Boss + Helix 讨论（Discord #sop-md 线程，10:51-11:54）
> **状态**: ⚠️ **部分被 v5.0 架构替代** — training/ 目录结构已变更，见 `v5.0-redesign.md`
> **前版**: kb-engine-execution-plan.md v1.1（架构部分被本文件替代）
>
> **v5.0 变更**（2026-03-31）：
> - `_shared/program.md` + `_shared/evaluate.md` → 每分支独立维护（`_shared/SUPERSEDED.md`）
> - 新增 `_shared/framework.md`（通用流程骨架）
> - 每个分支有独立 `program.md` + `evaluate.md` + `case-config.json`
> - Git 工作流、SOP 架构、核心设计决策 D1-D5 仍然有效

---

## 核心设计决策

| # | 决策 | 结论 | 确认 |
|---|------|------|------|
| D1 | 训练分支模型 | **PR 模型**：每轮 = 从 main checkout → commit → PR → merge | Boss 确认 |
| D2 | main 角色 | **训练主线 + tag 标记稳定版**，PM Agent 指向 tag | Boss 确认 |
| D3 | 跨分支知识同步 | **所有分支都能改 domains/indications** + section-append 约定 | Boss 确认 |
| D4 | 仓库独立性 | **kb-engine 独立仓库**，不在 d2v_cro_base 内 | Boss 确认 |
| D5 | 训练目录结构 | **每个分支有独立训练目录**（题目/过程/结果） | Boss 确认 |

### 设计原则

1. **Git-native**：版本控制不是附加功能，是核心架构。每轮训练 = 一个 commit + PR。
2. **SOP 是共享资产**：所有分支通过 main 共享 sop/，知识自动同步。
3. **训练是分支专属的**：题目、过程记录、结果跟着分支走，互不干扰。
4. **可审计**：git log = 完整训练历史，git diff = 精确变更，git tag = 稳定版快照。

---

## 仓库架构

### 独立仓库：`xiafy/kb-engine`

```
kb-engine/                          ← 独立 Git 仓库
│
├── sop/                            ← 可执行 SOP（所有分支共享，通过 main 同步）
│   ├── README.md                   ← PM Agent 路由表
│   ├── CHANGELOG.md                ← SOP 变更记录
│   ├── core/                       ← 全局决策 SOP
│   │   ├── protocol-design.md      ← ≤200 行，8 步决策流程
│   │   └── sap-design.md           ← SAP 统计设计
│   ├── domains/                    ← 疾病大类知识（5 文件）
│   ├── indications/                ← 适应症特定知识（14 文件）
│   ├── regulatory/                 ← 监管路径知识（3 文件）
│   └── templates/                  ← 交付模板（PM Agent 用）
│
├── training/                       ← 训练系统
│   ├── _shared/                    ← 通用骨架 + 跨分支共享（v5.0 重构）
│   │   ├── framework.md            ← 通用流程骨架（Step 名 + I/O 契约 + 不变量）
│   │   ├── LANGUAGE.md             ← 语言规范
│   │   ├── QUESTION-DESIGN.md      ← 选题规范
│   │   ├── SUPERSEDED.md           ← 旧版文件标记
│   │   ├── program.md              ← [SUPERSEDED] 保留供参考
│   │   └── evaluate.md             ← [SUPERSEDED] 保留供参考
│   │
│   ├── protocol-design/            ← PD 训练分支（v5.0 完整自包含）
│   │   ├── program.md              ← PD 训练程序 v5.0
│   │   ├── evaluate.md             ← PD 评分标准（10 维度）
│   │   ├── case-config.json        ← PD 案例配置
│   │   ├── config.yaml             ← 分支配置 v2.0
│   │   ├── questions/              ← PD 专属题目（21 套）
│   │   ├── rounds/                 ← 每轮训练记录
│   │   │   └── round-01/           ← B1R1: answer-A/B/C + consensus + scoring + analysis
│   │   └── results.tsv             ← 汇总评分（17 列）
│   │
│   ├── sap-design/                 ← SAP 训练分支
│   │   ├── config.yaml
│   │   ├── README.md
│   │   ├── questions/              ← SAP 专属题目（含 protocol_params 输入）
│   │   ├── rounds/
│   │   └── results.tsv
│   │
│   └── {future-branch}/            ← 从 _branch-template 创建
│
├── data                            ← symlink → d2v_cro_base/data（或 submodule）
├── ROADMAP.md                      ← 9-SOP 训练路线图
└── README.md                       ← 全局索引
```

### 与 d2v_cro_base 的关系

```
d2v_cro_base/                       ← 知识库 + 原始数据仓库
├── kb/                             ← KB entries（已有 460+ 文件）
├── data/                           ← FDA Reviews（3400+）+ D2V 资料
│   ├── fda-reviews/
│   └── d2v/
└── ...

kb-engine/                          ← 可执行 SOP + 训练系统
├── data -> ../d2v_cro_base/data    ← symlink 引用数据
└── ...
```

| 仓库 | 定位 | 写入者 | Git 策略 |
|------|------|--------|---------|
| d2v_cro_base | 知识库 + 原始数据 | Helix, Learner, PM, 收敛 cron | 常规 push to main |
| kb-engine | 可执行 SOP + 训练 | 训练流程（PR 模型） | PR → merge → tag |

---

## Git 工作流

### PR 模型

```bash
# 每轮训练
git checkout main && git pull
git checkout -b train/pd-round-12

# 执行训练（program.md 流程）
# - 做题 → answer.md
# - 对答案 → FDA actual
# - 裁判评分 → scoring.md
# - 差异分析 → analysis.md
# - 更新 SOP → sop/ 对应文件
# - 追加 results.tsv

git add -A
git commit -m "pd-round-12: +2 rules oncology-solid, match 0.78"
gh pr create --base main --title "PD Round 12: +2 rules, match 0.78"
gh pr merge --squash --delete-branch
```

### 分支命名

| 模式 | 用途 | 示例 |
|------|------|------|
| `train/{branch}-round-{NN}` | 训练轮次 | `train/pd-round-12` |
| `experiment/{描述}` | 短期实验 | `experiment/stats-nested-v2` |

### Tag 命名

| 模式 | 用途 | 示例 |
|------|------|------|
| `{branch}-batch{N}-stable` | 训练批次收敛 | `pd-batch1-stable` |
| `v{X.Y}-release` | 正式稳定版 | `v4.0-release` |

### Section-Append 写入约定

修改 sop/domains/ 和 sop/indications/ 时：

1. **写入对应主题 section**（如 `## Trial Design`、`## SAP Design`）
2. **只追加不修改**已有规则
3. **不删除**：旧规则错了 → 追加修正 + `[supersedes: 旧规则摘要]`
4. **清洗在 main**：训练收敛后做清洗 commit（合并重复、删除 superseded）

---

## Questions 设计

### 共享 vs 分支专属

| 资源 | 位置 | 说明 |
|------|------|------|
| 案例元数据 | `_shared/case-config.json` | 药品、路径、domain/indication 映射 — 所有分支共享 |
| 题目 prompt | `{branch}/questions/` | 每个分支有自己的题目格式和内容 |

### 题目差异示例

**Protocol Design** — `questions/01-inluriyo.md`:
```markdown
# Case 01: Inluriyo (imlunestrant)
## 背景信息
[药品 MOA、适应症、未满足需求...]
## 任务
设计一个 Phase 3 Protocol，包括：入排标准、终点、对照组、分层因子、样本量依据...
```

**SAP Design** — `questions/01-inluriyo.md`:
```markdown
# Case 01: Inluriyo (imlunestrant)
## Protocol 参数（固定输入）
- 主要终点：PFS (BICR)
- 对照：IC of endocrine therapy
- 分层因子：ESR1 + CDK4/6i + 内脏转移 + 地区
- 样本量：N=874
## 任务
写一个 SAP，包括：Estimand 定义、主要分析方法、期中分析设计、缺失数据策略...
```

---

## 每轮训练产出

```
rounds/round-12/
├── answer.md       ← 做题 Agent 的完整输出
├── scoring.md      ← 裁判评分详情
│                     - 3 裁判 × N 维度的独立评分
│                     - 多数票结果
│                     - 裁判间一致性 κ
└── analysis.md     ← 差异分析
                      - partial/miss 项的归类（KNOW/REG/STAT/ALT/INFO）
                      - SOP 更新决策（改了哪个文件、追加了什么规则）
                      - 本轮学到的关键洞察
```

---

## 新分支创建流程

```bash
# 1. 从模板创建
cp -r training/_shared/_branch-template training/clinical-pharm

# 2. 编辑配置
vi training/clinical-pharm/config.yaml
# 设置：sop.core, answer_extraction.chapters, scoring.dimensions 等

# 3. 生成专属题目
# 基于 _shared/case-config.json + 分支特定 prompt 模板
# 可脚本化或手动创建

# 4. 写 README
vi training/clinical-pharm/README.md

# 5. 提交
git add training/clinical-pharm/
git commit -m "init: clinical-pharm training branch"
```

---

## 迁移计划

从当前状态（kb-engine 在 d2v_cro_base/kb-engine/ 内）到目标状态（独立仓库）：

### Phase 1：创建独立仓库 + 迁移文件

1. GitHub 创建 `xiafy/kb-engine` 仓库
2. 从 d2v_cro_base/kb-engine/ 复制文件到新仓库
3. 重构 training/ 目录（共享 → _shared/，分支独立目录）
4. 迁移 20 轮历史训练数据到 protocol-design/rounds/
5. 创建 data symlink
6. 更新 README.md

### Phase 2：更新引用

1. d2v_cro_base 中删除 kb-engine/ 目录，添加 `MIGRATED.md` 指向新仓库
2. 更新 Helix workspace 的 MEMORY.md / 执行计划中的路径引用
3. 更新 program.md 中的文件路径

### Phase 3：验证

1. Step 6 验证（5 案例无退化测试）— 使用新 Git PR 流程实际运行
2. 确认 data symlink 可用
3. 确认 PR 工作流端到端可执行

---

## 升级路径

| 阶段 | 条件 | 操作 |
|------|------|------|
| 当前 | 训练串行（PD → SAP） | PR 模型，零冲突 |
| 中期 | 并行 ≤3 分支 | Section-append + 日常 merge |
| 长期 | 并行 >3 或冲突频繁 | 引入 develop 分支做缓冲 |
| 终态 | PM Agent 上线 | PM checkout tag 指定版本的 SOP |
