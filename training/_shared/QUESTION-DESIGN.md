# Question Design Process

> 选题标准由训练目标决定，不硬编码。本文件定义统一流程。

## Selection Process

### Step 1: 定义训练目标

由 Boss 或 Helix 确定本次训练的聚焦方向。

**输出**：选题过滤条件，例：
```yaml
training_goal: "肿瘤 RCT 设计能力加强"
filters:
  indication_domain: [oncology-solid, oncology-heme]
  design_type: [RCT]
  regulatory_pathway: [regular, accelerated]
  approval_year: [2022, 2023, 2024, 2025]
  data_quality: [high, medium]  # MultidisciplineR.md 必须存在且内容充足
```

### Step 2: 从 FDA Review 库筛选候选池

扫描 `shared/data/fda-reviews/`（3400+ Reviews），按过滤条件输出候选列表。

**自动筛选条件**：
- MultidisciplineR.md 存在
- 文件大小 >100KB（内容充足）
- 匹配训练目标的适应症/路径/设计类型

**输出**：候选列表，每个标注：
- 药物名/适应症/设计类型/审批路径/年份
- 数据完整度评级（high/medium/low）

### Step 3: 按覆盖矩阵选取

在训练目标范围内最大化覆盖：
- 每个目标 domain 至少 2-3 个案例
- 设计类型尽量多样
- 难度梯度排序（简单→复杂）

### Step 4: 生成题目文件

从 FDA Review 提取题目信息：
- Drug Information（药物名/MOA/剂型）
- Proposed Indication（适应症/人群/线数）
- Disease Background（疾病背景/SOC/未满足需求）
- Task（按训练分支要求的维度输出）

**⚠️ 信息泄露检查**：
- 题目中**不得包含**：试验设计、对照组选择、终点选择、样本量、统计方法
- 题目中**可以包含**：药物机制、适应症、疾病流行病学、当前 SOC、未满足需求
- 独立 Agent 检查：扫描题目文件，确认无 FDA 实际方案泄露

### Step 5: 写入仓库

```
training/{branch}/questions/{id}-{drug}.md
training/{branch}/case-config.json  ← 追加新案例元数据（每分支独立维护）
```

---

## Answer Source and Quality Control

### 答案 = FDA 获批时的实际试验设计

来源：`data/fda-reviews/md/{path}/MultidisciplineR.md`

**提取章节**：由分支 config.yaml 的 `answer_extraction.chapters` 指定。

### 答案质控

| 风险 | 对策 |
|------|------|
| 章节名不匹配 | 模糊搜索关键词（Trial Design / Study Design / Eligibility） |
| 提取的不是获批方案 | FDA Assessment 优先于 Applicant Description |
| FDA Review 信息不完整 | case-config.json 标注 `data_quality`，low 质量案例标记为探索性 |

---

## Coverage Management

每 20 个案例为一个覆盖单元。长期目标覆盖矩阵：

| Domain | 当前覆盖 | 扩展目标 |
|--------|---------|---------|
| oncology-solid | 8 | 12-15 |
| oncology-heme | 2 | 5-8 |
| autoimmune | 2 | 5-8 |
| respiratory | 1 | 3-5 |
| rare-disease | 3 | 5-8 |
| CNS | 2 | 3-5 |
| CV | 0 | 3-5 |
| infection | 0 | 2-3 |
| endocrine/metabolic | 0 | 2-3 |
| biosimilar | 0 | 2-3 |
