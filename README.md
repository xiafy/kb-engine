# kb-engine — CRO AI Knowledge Engine

> 可执行 SOP + 闭环训练系统
> Karpathy Autoresearch 理念：做题 → 对答案 → 优化 SOP → 循环

## 架构

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
│   ├── _shared/            ← 跨分支共享（program.md, evaluate.md, case-config.json）
│   ├── protocol-design/    ← PD 训练分支（questions/ + rounds/ + results.tsv）
│   ├── sap-design/         ← SAP 训练分支
│   └── {future}/           ← 从 _branch-template 创建
│
├── data                    ← symlink → 本地 data 目录（FDA Reviews + D2V 资料，见下方 Setup）
├── ROADMAP.md              ← 9-SOP 训练路线图
└── README.md               ← 本文件
```

## Git 工作流（PR 模型）

- 每轮训练 = 从 main checkout 短分支 → commit → PR → merge
- main = 训练主线 + tag 标记稳定版
- SOP 写入遵循 section-append 约定

```bash
git checkout main && git pull
git checkout -b train/pd-round-12
# 执行训练...
git commit -m "pd-round-12: +2 rules, match 0.78"
gh pr create --base main && gh pr merge --squash --delete-branch
```

## 关键文件

| 文件 | 用途 |
|------|------|
| `training/_shared/program.md` | 训练主程序 v3.2 |
| `training/_shared/evaluate.md` | 评分标准 v2.0（裁判×3 盲评） |
| `training/{branch}/config.yaml` | 分支配置（评分维度、答案提取、SOP 路径） |
| `sop/README.md` | PM Agent SOP 路由表 |
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

# 创建 data symlink（指向你本地的 d2v_cro_base/data 目录）
ln -s /path/to/d2v_cro_base/data data
```
