# kb-engine — CRO AI Knowledge Engine

> 可执行 SOP + 闭环训练系统
> Karpathy Autoresearch 理念：做题 → 对答案 → 优化 SOP → 循环

## 架构（v5.0）

```
kb-engine/
├── sop/                    ← 可执行 SOP（所有训练分支共享，通过 main 同步）
│   ├── core/               ← Global decision SOPs (protocol-design + sap-design)
│   ├── domains/            ← 疾病大类知识（5 文件）
│   ├── indications/        ← 适应症特定知识（14 文件）
│   ├── regulatory/         ← 监管路径知识（3 文件）
│   └── templates/          ← 交付模板（PM Agent 用）
│
├── training/               ← 闭环训练系统
│   ├── _shared/            ← 通用骨架 + 跨分支共享工具
│   │   ├── framework.md    ← 通用流程骨架（Step 名 + I/O 契约 + 全局不变量）
│   │   ├── LANGUAGE.md     ← 语言规范
│   │   ├── QUESTION-DESIGN.md ← 选题规范
│   │   └── SUPERSEDED.md   ← 旧版文件标记（program.md v4.1 / evaluate.md / ROLES.md）
│   │
│   ├── protocol-design/    ← PD 训练分支（完整自包含）
│   │   ├── program.md      ← PD 训练程序 v5.0
│   │   ├── evaluate.md     ← PD 评分标准（10 维度）
│   │   ├── case-config.json← PD 案例配置
│   │   ├── config.yaml     ← PD 分支配置
│   │   ├── questions/      ← 21 套题目
│   │   ├── results.tsv     ← 训练记录
│   │   └── rounds/         ← 每轮产出
│   │
│   ├── sap-design/         ← SAP 训练分支（待创建 program.md）
│   └── {future}/           ← 每个新分支独立编写 program.md + evaluate.md
│
├── docs/                   ← 设计文档
├── data                    ← symlink → 本地 data 目录（FDA Reviews + D2V 资料）
├── ROADMAP.md              ← 9-SOP 训练路线图
└── README.md               ← 本文件
```

## v5.0 架构核心

1. **framework.md**（不变）：定义流程骨架（Step 0→8 的名称 + 输入/输出契约 + 6 条全局不变量）
2. **每分支 program.md**（可变）：完整训练程序——评分维度、分析策略、优化策略、做题配置均由分支自主定义
3. **Owner Agent 架构**：做题 Agent 读 SOP 自行决定编排方式，训练引擎不硬编码 CRO 角色

## 新训练创建流程

```
Phase 0: 训练方案设计（目标→范围→需求→评分体系→Boss 确认）
    ↓ 产出: docs/{branch}-training-design.md
Phase 1: 生成流程文档（program.md / evaluate.md 是方案的产出，不是起点）
Phase 2: 验证 & 训练
```

**program.md 等流程文档是训练方案设计的产出，不能跳过 Phase 0 直接编写。**

**指导原则**（docs/guiding-principles.md）：
- SOP 唯一消费者 = AI Agent
- 训练引擎不掺杂业务逻辑
- Sub-Agent 目的 = 优化上下文、减少幻觉
- 训练引擎与业务逻辑分离

## Git 工作流（PR 模型）

- 每轮训练 = 从 main checkout 短分支 → commit → PR → squash merge
- main = 训练主线 + tag 标记稳定版
- SOP 写入遵循 section-append 约定

```bash
git checkout main && git pull
git checkout -b train/pd-round-{NN}
# 执行训练...
git commit -m "pd-round-{NN}: +{N} rules, match {score}"
gh pr create --base main && gh pr merge --squash --delete-branch
```

## 关键文件

| 文件 | 用途 |
|------|------|
| `training/_shared/framework.md` | 通用流程骨架 v1.0 |
| `training/{branch}/program.md` | 分支完整训练程序（PD v5.0） |
| `training/{branch}/evaluate.md` | 分支评分标准 |
| `training/{branch}/config.yaml` | 分支配置 |
| `docs/guiding-principles.md` | 4 条指导原则 |
| `ROADMAP.md` | 9-SOP 训练优先级和时间线 |

## 相关仓库

| 仓库 | 定位 |
|------|------|
| [xiafy/d2v_cro_base](https://github.com/xiafy/d2v_cro_base) | 知识库 + 原始数据（KB entries, FDA Reviews） |
| [xiafy/helix-memory](https://github.com/xiafy/helix-memory) | Helix Agent 记忆 + 设计文档 |

## Setup

```bash
git clone https://github.com/xiafy/kb-engine.git
cd kb-engine
ln -s /path/to/d2v_cro_base/data data
```
