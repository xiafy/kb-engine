# SUPERSEDED — _shared/program.md v4.1

> **日期**: 2026-03-31
> **原因**: v5.0 架构重构——拆分为 framework.md（通用骨架）+ 每分支独立 program.md
> **替代文件**:
>   - `training/_shared/framework.md` — 通用流程骨架
>   - `training/protocol-design/program.md` — Protocol Design 训练程序 v5.0
> **旧文件保留**: `_shared/program.md` 和 `_shared/evaluate.md` 保留供参考，不再使用
> **case-config.json**: 已复制到各分支独立维护

## 变更摘要

v4.1 试图用一套 program.md + config.yaml override 适配所有训练场景。
v5.0 认识到不同分支（Protocol Design / SAP Design / ...）在评分维度、分析策略、优化策略上存在逻辑层面的差异，不是配置能覆盖的。

核心变更：
1. framework.md 定义不变的流程骨架（Step 名 + 输入/输出契约）
2. 每个分支有独立的 program.md / evaluate.md / case-config.json
3. Owner Agent 架构：做题 Agent 读 SOP 自行决定编排方式
4. 训练引擎不再硬编码 CRO 角色（Clinical/Biostat）
