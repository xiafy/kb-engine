# 训练角色规范（ROLES）

## 角色定义

| 角色 | 职责 | 执行者 | 隔离要求 |
|------|------|--------|---------|
| **调度者** | 编排训练流程、Git 操作、共识合并、整体质控 | Helix | 无（全局可见） |
| **做题者 ×3** | 闭卷做题，按 SOP 输出答案 | 独立 subagent session | 严格隔离 |
| **裁判 ×3** | 盲评 consensus-answer vs FDA actual | 独立 subagent session | 严格隔离 |
| **更新审核** | 审核准备写入 SOP 的每条规则 | 独立 subagent session | 严格隔离 |
| **审核者** | Batch 间 SOP 审核、收敛判断 | Helix + Opus subagent | — |

---

## 做题者规范

### 输入（仅以下内容）
- SOP 文件列表（core/ + domains/ + indications/ + regulatory/，由 Step 0b 确定）
- 题目文件（`training/{branch}/questions/{id}-{drug}.md`）
- 分支 config.yaml 的 scoring.dimensions（告知按哪些维度输出）

### 禁止
- ❌ 查看 FDA Review / MultidisciplineR.md
- ❌ 使用 web_search / web_fetch / browser
- ❌ 查看其他做题者的答案
- ❌ 查看历史训练结果（results.tsv / rounds/）

### 输出
- `answer-{A/B/C}.md`：按 scoring.dimensions 的 N 个维度输出答案

### 保证隔离的技术手段
- 每个做题者 = 一个 `sessions_spawn` 独立 session
- Prompt 中只传入 SOP 文件内容 + 题目内容
- 不传入仓库路径（防止自行读取其他文件）

---

## 裁判规范

### 输入（仅以下内容）
- `consensus-answer.md`（共识合并后的答案，不是个体答案）
- `fda-actual.md`（FDA 实际方案提取结果）
- `evaluate.md`（评分标准 v2.0）
- 分支 config.yaml 的 scoring override（如有）

### 禁止
- ❌ 查看做题者的推理过程或 SOP 文件
- ❌ 查看题目原文（避免裁判自行脑补答案）
- ❌ 查看其他裁判的评分
- ❌ 查看历史训练结果

### 输出
- 10 项（或分支自定义维度）逐项评分：match / partial / miss / skip + 理由
- match_score + weighted_score

### 保证隔离的技术手段
- 每个裁判 = 一个 `sessions_spawn` 独立 session
- Prompt 中只传入 consensus-answer + fda-actual + evaluate.md
- scoring.md 中记录每位裁判的 session ID

---

## 共识合并规范（调度者执行）

### 输入
- answer-A.md, answer-B.md, answer-C.md

### 合并规则
对每个评分维度：
- **3/3 一致** → 直接采纳，标注 `[consensus: 3/3]`
- **2/3 一致** → 采纳多数意见，标注 `[consensus: 2/3, dissent: Agent X 认为...]`
- **3/3 各不同** → 列出所有选项 + 理由，标注 `[no-consensus]`

### SOP 质量信号
- `[no-consensus]` 项 → 记录到 analysis.md 的 `sop_ambiguity` 部分
- 连续 3 轮同一维度出现 `[no-consensus]` → 触发 SOP 澄清任务

### 输出
- `consensus-answer.md`

---

## L4 更新审核规范

### 输入
- 准备追加的规则（完整文本）
- 写入目标文件和 section
- 差异归类理由 + FDA 原始证据

### 禁止
- ❌ 查看做题者的完整答案
- ❌ 查看裁判评分详情
- ❌ 查看 SOP 当前内容（避免确认偏误）

### 判定
- ✅ 同意追加
- ⚠️ 需修改（附修改建议）
- ❌ 拒绝追加（归类错误/规则不准确/证据不足）

---

## 调度者（Helix）职责

### 每轮训练
1. 确定本轮案例（按 execution_order）
2. 执行 Step 0a/0b（配置加载 + SOP 路径解析）
3. Spawn 3 做题 Agent + 等待完成
4. 共识合并 → consensus-answer.md
5. 提取 FDA 答案 → fda-actual.md
6. Spawn 3 裁判 Agent + 等待完成
7. 汇总多数票 → scoring.md
8. 差异归类
9. Spawn L4 审核 Agent（如有 KNOW/REG/STAT 差异）
10. 执行 SOP 更新（仅审核通过的规则）
11. Git commit → PR → merge
12. 记录结果 → results.tsv + rounds/

### Batch 间
- 输出收敛报告
- 发起 SOP 清洗（如需要）
- 向 Boss 汇报状态
- Boss 确认后继续下一 Batch

### 紧急停止
- Boss 随时可发"暂停训练"
- Helix 立即停止当前轮次，报告状态
- 已 merge 的变更保留（可 git revert）
