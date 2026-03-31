# 9-SOP Training Roadmap

> **创建**: 2026-03-30 | **Owner**: Helix-Core

## Training Priority（按工作流依赖链）

```
Phase 1: ✅ protocol-design（v5.0 架构：20 轮闭卷 + B1R1 开卷 match 0.70，独立 program.md）
Phase 2: ▶️ sap-design → regulatory-strategy
Phase 3:    efficacy-assessment + safety-assessment（并行）
Phase 4:    clinical-pharm + stat-analysis（专项，相对独立）
Phase 5:    labeling-review + post-marketing（下游）
```

## 详细时间线

| Phase | SOP | 状态 | 预估启动 | 依赖 | 预估训练轮次 |
|-------|-----|------|---------|------|-------------|
| 1 | protocol-design | ✅ v5.0 | — | — | 20 闭卷 + 1 开卷（进行中） |
| 2a | sap-design | 🌱 种子就绪 | 即刻 | Phase 1 | 10-15 |
| 2b | regulatory-strategy | ⬜ 待创建 | Phase 2a 完成后 | Phase 1 | 10-15 |
| 3a | efficacy-assessment | ⬜ 待创建 | Phase 2 完成后 | Phase 1+2a | 10 |
| 3b | safety-assessment | ⬜ 待创建 | 与 3a 并行 | Phase 1+2a | 10 |
| 4a | clinical-pharm | ⬜ 待创建 | Phase 3 中期 | Phase 1 | 10 |
| 4b | stat-analysis | ⬜ 待创建 | Phase 2a 完成后 | Phase 2a | 10 |
| 5a | labeling-review | ⬜ 待创建 | Phase 3+4 完成后 | Phase 3+4 | 10 |
| 5b | post-marketing | ⬜ 待创建 | Phase 5a 之后 | Phase 3+5a | 10 |

## 关键路径

```
protocol-design → sap-design → stat-analysis → efficacy/safety → labeling → post-marketing
```

最长路径约 5 个串行 Phase × 10-15 轮/Phase = 50-75 轮训练。

## 题库复用

同一 FDA Review 案例（20 个），不同分支从不同章节提取答案：
- 20 案例 × 9 分支 = **180 次训练机会**
- 不需要新建题目（可选扩展到 360 案例）
- 每个分支需在 config.yaml 定义自己的 answer_extraction.chapters

## New Branch Launch Checklist

### Phase 0: 训练方案设计（先于一切流程文档）

1. [ ] **明确训练目标**：这个分支要让 Agent 具备什么能力？解决什么问题？
2. [ ] **定义训练范围**：覆盖哪些决策维度？边界在哪？与已有分支的本质差异？
3. [ ] **梳理需求**：需要什么数据源（FDA Review 哪些章节）、领域知识、工具？
4. [ ] **设计评分体系**：维度定义 + 每维度的评分标准 + 判例（至少 3 个/维度）
5. [ ] **产出训练方案文档** → `docs/{branch}-training-design.md`
6. [ ] **Boss 确认**训练方案

### Phase 1: 生成流程文档（基于训练方案）

7. [ ] 基于 framework.md + 训练方案编写 `training/{branch}/program.md`
8. [ ] 编写 `training/{branch}/evaluate.md`（从训练方案的评分体系细化）
9. [ ] 创建 `training/{branch}/case-config.json`（从题库映射答案路径 + 域）
10. [ ] 创建 `training/{branch}/config.yaml`
11. [ ] 创建 `training/{branch}/README.md`
12. [ ] 创建种子 `sop/core/{branch}.md`（从 kb/ + D2V SOP 吸收）

### Phase 2: 验证 & 训练

13. [ ] 运行 3 个案例 baseline
14. [ ] 启动正式训练
15. [ ] 训练后 SOP 清洗 + 版本标记

## D2V SOP 按需吸收映射

| 分支 | D2V SOP 来源 | 吸收内容 |
|------|-------------|---------|
| sap-design | BS/sop-bs-002 | ✅ 已吸收（流程框架） |
| regulatory-strategy | RA/ | 提交流程、FDA 会议准备 |
| efficacy-assessment | — | 无直接 D2V SOP，从 FDA Review 学习 |
| safety-assessment | PV/ | SAE 报告流程、SUSAR 时限 |
| clinical-pharm | — | 从 KB clinical-pharmacology/ 吸收 |
| stat-analysis | BS/wi-bs-001 | TFL 编制指南 |
| labeling-review | RA/ | 标签审核流程 |
| post-marketing | PV/ | PMR/PMC 管理 |
