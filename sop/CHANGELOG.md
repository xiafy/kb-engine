# SOP Changelog

> Note: PD training rounds 1-20 were completed before migration to this repo.
> Historical SOP changes are reflected in the final rule state, not individual entries.
> From Round 21 onwards, each training round will have a CHANGELOG entry.

## 2026-03-30: Git PR model + SOP normalization

### training/program.md (v3.1 → v3.2)
- 新增"Git 工作流（PR 模型）"章节：checkout → commit → PR → merge 完整操作
- 分支命名约定 + tag 命名约定
- Step 6b 更新为 Section-Append 写入约定
- 收尾流程新增 tag + 清洗 commit

### 全部 domains/ + indications/ + regulatory/ + core/ 文件
- 移除所有规则编号引用：`（#NN）` → 删除
- frontmatter `rules: [...]` → `rule_count: N`
- indications/ 标题去除"Protocol Design 规则"后缀
- 符合 SOP 设计原则第 4 条（无冗余元数据）

---

## 2026-03-30: Opus 评审修复

### core/sap-design.md (v0.2 → v0.3)
- 移除规则编号标题（#40, #41 等），改为语义化 Step 编号（Step 2-6）
- 符合 SOP 设计原则第 4 条（无冗余元数据）
- frontmatter rules 字段改为 rule_count

### training/program.md (v3.0 → v3.1)
- Step 4 补充独立裁判 Agent×3 盲评机制（多数票决定）
- 明确禁止做题 Agent 自评（实证：自评通胀 ~25%）
- 新增裁判间 κ < 0.5 校准触发条件

---

## 2026-03-30: v3.0 三层拆分迁移

### core/protocol-design.md (v3.0)
- 从 sop.md v2.2 拆分，28 条全局规则
- 152 行，8 步决策流程
- Step 5 统计规则部分分流到 sap-design.md

### core/sap-design.md (v0.2)
- 种子版：7 条从 sop.md v2.2 Step 5 分流的规则
- v0.2 增强：吸收 D2V SOP-BS-002（流程框架）+ Estimand/缺失数据/亚组分析
- 145 行，待训练后扩充

### domains/ (v1.0)
- 5 个文件：oncology-solid, oncology-heme, autoimmune, respiratory, rare-disease
- autoimmune 为框架占位

### indications/ (v1.0)
- 11 个文件：breast-er-her2neg, nsclc, gastric-gejc, aml, psoriasis, prostate-adt, anca-vasculitis, asthma, mds, lgg, npc

### regulatory/ (v1.0)
- 3 个文件：accelerated-approval, breakthrough, botanical-drug(占位)

### 零损失验证
- 42/42 关键词覆盖测试通过
- 试分类表 65 条规则全映射
