---
version: 1.0
source: sop.md v2.2 拆分
rule_count: 2
---

# 加速审批 (Accelerated Approval)

> version: 1.0 | source: sop.md v2.2 拆分

## Trial Design

### AA 终点与设计要求

IF regulatory_pathway == "Accelerated Approval":
→ 主要终点: ORR(BICR, RECIST 1.1) + DOR
→ ORR 95% CI 下限 > 历史 benchmark（benchmark 因适应症/线数差异极大）
→ 样本量 50-200 人
→ 预设 Bayesian predictive probability 持续 futility 监测
→ 需在 NDA 提交时已启动确证性试验（评估 OS/EFS 等直接临床获益）
→ skip control_arm, skip stratification

### 确证性试验要求

IF regulatory_pathway == "Accelerated Approval":
→ 确证性试验设计须在 NDA 提交时与 FDA 达成一致
→ 理想情况确证性试验已启动
→ 需明确入组和完成时间线

## SAP Design

<!-- 占位 — AA 路径 SAP 规则训练后填充 -->
<!-- futility 监测方法参考 core/sap-design.md -->
