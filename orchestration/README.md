# Orchestration — PM Agent 编排指令

> **状态**: 空白模板 | **填充时机**: PM Agent 灰度切换时
> **原则**: 训练程序（training/）永远不碰此目录

本目录存放 PM Agent 的工作流编排指令（HOW），与领域 SOP（sop/，WHAT）分离。

## 文件规划

| 文件 | 用途 | 状态 |
|------|------|------|
| protocol-design-workflow.md | 收到 Protocol 设计任务后的完整工作流 | ⬜ 待填充 |
| tools-registry.md | 可用工具列表 + 使用场景 | ⬜ 待填充 |
| escalation-rules.md | 什么情况下停下来问人 | ⬜ 待填充 |

## 边界

- **领域 SOP**（sop/）回答："psoriasis 用什么终点？"
- **编排指令**（orchestration/）回答："收到 Protocol 任务后先做什么？spawn 哪些 sub-agent？"
- **训练程序**（training/）回答："如何通过训练改进 SOP？" → 只写 sop/，绝不碰 orchestration/
