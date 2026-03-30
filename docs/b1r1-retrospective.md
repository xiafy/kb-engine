# Batch 1 Round 1 复盘：执行与改进决策

> **日期**: 2026-03-30 | **Case**: 12-sotyktu (psoriasis, autoimmune, RCT)
> **触发**: B1R1 执行完成后 Boss 要求逐项复盘
> **结果**: program.md v4.0 → v4.1（3 项改进）
> **讨论频道**: Discord #pd-batch-1-round-1-sotyktu-psoriasis-rct

---

## 一、执行结果

| Metric | Value |
|--------|-------|
| match_score | 0.70 |
| weighted_score | 0.85 |
| match | 7（Items 1,3,5,6,8,9,10） |
| partial | 3（Items 2,4,7） |
| miss | 0 |
| new SOP rules | 2 |

对比 v2.2 闭卷同题（match 0.40 → 0.70），提升 +0.30。核心提升来源：开卷允许 Agent 从 ClinicalTrials.gov 获取注册信息。

3 个 Partial 原因：
- Item 2 (control_arm): AI 加了 "double-dummy"，FDA Review 未显式提及 → ALT
- Item 4 (endpoint_definition): 漏了完整 sensitivity analysis 套件 → KNOW
- Item 7 (stat_framework): 误用 α=0.025 做 co-primary；FDA 实际 α=0.05（IUT 原则）→ KNOW

新增 SOP：Rule 5.3a IUT alpha（core/）+ Psoriasis 敏感性分析套件（indications/）

---

## 二、关键发现：Agent B 超时分析

Agent B 在 5min timeout 内未完成答案。Session history 分析（46 steps）揭示：

**执行路径**：
- 情报收集正常（7 次 web_search + 1 次 web_fetch）
- 样本量计算用 scipy 做精确计算，但迭代 3 次修正公式（ratio 参数方向搞反）
- 写答案写到 Section 2 时被 timeout 杀掉
- 重试阶段连续 4 次 429 rate limit（3 Agent 并行消耗 API 配额）

**根因**：不是搜索太深，是两个问题叠加——精确计算耗时 + 429 阻断重试。

**关键洞察**：Agent B 的做法更接近 CRO 真实工作流（Biostatistician 独立做精确样本量计算），但现有架构没有为这种分工提供支持。

---

## 三、Boss 提出的两个洞察

### 洞察 1："不要放过任何一次失败或异常"

> 往往能够有重大发现。

**讨论结论**：
- 执行阶段只做记录（L1/L2），不做决策判断
- 架构/流程改进决策在 Batch 复盘中由 Boss 发起
- "催生多角色方案"这类决策不是 AI Agent 能自主做的

### 洞察 2："多个 Agent 并行做题时，随机行为引发 SOP 优化"

> 很多时候高分不是因为既有 SOP 做的好，而是因为 Agent 随机执行了我们没考虑过的动作。

**讨论结论**：
- 现阶段不需要人为制造多样性，利用模型自然随机性即可
- 关注三件事：(1) SOP 理解一致性；(2) SOP 违反/跳过；(3) SOP 之外的额外行为
- 只记录事实，不做决策判断

Boss 纠正了 Helix 的过度设计倾向（策略多样性 Prompt 方案被否决——"SOP 基础还没做好，不需要主动制造随机性"）。

---

## 四、三项改进决策

### 决策 1: R-FAIL 偏差事件记录

**问题**：program.md v4.0 只有结果层面的异常检测（match=1.0 自检等），对过程层面异常完全没有规定。

**方案**：
- SYS 偏差（超时/429/crash）→ L1 记录（类型 + 状态 + 原因）
- DEV 偏差（tool call 差异/答案分歧/SOP 跳过/额外行为）→ L2 记录（session history 分析）
- 记录位置：analysis.md ## Deviation Events
- 复盘由 Boss 发起

### 决策 2: 行为变异捕捉

**问题**：3 Agent 共识合并只关注"答案是否一致"，没有关注"过程是否一致"。

**方案**：analysis.md 新增 ## Agent Behavior Variance
- SOP Consistency：对同一规则的执行是否一致
- SOP Deviations：是否跳过了 SOP 要求的步骤
- Extra-SOP Actions：做了 SOP 没要求的事

### 决策 3: 多角色做题（Clinical + Biostat）

**问题**：Agent B 暴露的不是方法问题，而是缺少专业角色。一个通才 Agent 既做临床设计又做精确统计计算，必然顾此失彼。

**方案**：
- Phase 1: 3 Clinical Agent 并行（Item 1-5, 8-10，timeout 300s）
- Phase 2: 1 Biostat Agent 串行（Item 6-7，scipy/R 精确计算，timeout 180s）
- Phase 3: 共识合并（Clinical 多数票 + Biostat 为准）

**取舍**：
- 选了方案 A（最小拆分：Clinical + Biostat），不选方案 C（完整 CRO 团队），因为现阶段 SOP 基础还在建设中
- 未来演进方向确认为方案 C

---

## 五、对应代码变更

| 文件 | 变更 | Commit |
|------|------|--------|
| program.md | v4.0 → v4.1：Step 2 重构 + R-FAIL + 行为变异 + Round 输出格式 | `b7ba61f` |
| sop/core/protocol-design.md | v4.0 → v4.1：+Rule 5.3a IUT alpha | `a292d93` |
| sop/indications/psoriasis.md | v1.0 → v1.1：+sensitivity analysis suite | `a292d93` |

---

## 六、流程改进备忘

Boss 指出：改 program.md 之前应该先写设计文档。以后流程：

```
讨论确认 → 写设计文档 → Boss 确认 → 改 program.md/SOP → commit
```

本次是事后补写（本文档）。
