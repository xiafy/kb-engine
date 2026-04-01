# Branch: Protocol Design

> **状态**: ✅ 历史训练完成；v6 文件驱动执行入口已就位
> **训练轮次**: 20（历史轮次已完成）
> **校准 Match**: 0.74 | **OOD**: 0.76

## 训练历史

- v1.0: 15 条规则（Round 1-10）
- v2.0: 41 条规则（Round 11-18，按决策流程重组）
- v2.1: 54 条规则（Round 19-20 + 结构评审）
- v2.2: 59 条规则（5 条补丁）
- v3.0: 三层拆分迁移到 kb-engine/sop/

## 关联 SOP 文件

- `sop/core/protocol-design.md` — 28 条全局规则
- `sop/core/sap-design.md` — 7 条分流规则（种子）
- `sop/domains/` — 5 个文件
- `sop/indications/` — 11 个文件
- `sop/regulatory/` — 3 个文件

## v6 执行入口

- `scripts/run-v6-round.sh prepare <round> [case_selector]` — 执行 P0，并渲染 P2-P5 prompt + run manifest
- `scripts/run-v6-round.sh status <round>` — 检查 round 产物状态
- `scripts/run-v6-round.sh finalize <round>` — 执行 P6 收尾
- `docs/pipeline-v6-design.md` — v6 架构设计
- `docs/pipeline-v6-file-contract.md` — 文件契约
- `docs/implementation-plan-v6.md` — 实施计划

## 下一步

当前分支训练已完成。后续迭代：
1. 用新三层结构重跑验证案例确认无退化
2. 实战项目（康缘/方宸 Protocol）反馈 → 更新 SOP
