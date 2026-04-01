# Pipeline v6.0 实施计划

> **状态**: Draft  
> **作者**: Helix  
> **日期**: 2026-04-01  
> **依据**: `docs/pipeline-v6-design.md`

---

## 1. 目标

将 Pipeline v6.0 从设计方案推进到可直接替换现有流程的训练执行系统。

本计划不采用 shadow mode，也不采用分阶段切换。策略改为：
- 先把所有基础能力一次性补齐
- 在正式切换前完成静态校验和单轮验收
- 满足门禁后直接切到 v6 主流程
- 若出现质量或执行异常，直接回退到 v5.1.1

---

## 2. 总体策略

### 2.1 实施原则

1. **先补齐全部基础设施，再整体切换**
2. **不做并行双跑，不做局部 cutover**
3. **默认保守，不做未经验证的自动降级**
4. **任何失败都必须有明确错误码和可回退路径**
5. **正式切换前只允许做静态检查、脚本自测和单轮验收，不保留长期双轨运行**

### 2.2 优先级

| 优先级 | 事项 | 原因 |
|--------|------|------|
| P0 | 文件契约 + schema 固化 | 不先固定结构，后续脚本都会脆弱 |
| P0 | `p0-prepare.sh` / `p6-finalize.sh` | 技术确定性高、收益立即可见 |
| P0 | 计分复核脚本 | 直接降低评分错误风险 |
| P1 | Phase prompt 模板 | 保证 LLM 行为稳定 |
| P1 | 整体切换前单轮验收 | 替代 shadow mode 的最后门禁 |
| P2 | `P5` 自动降级 | 收益高，但验证门槛最高 |

---

## 3. 实施阶段

## Phase 1：补齐基础设施

**目标**：让 v6 具备完整可运行能力。  
**周期建议**：1-2 天

### 任务 1：定义文件契约

新增文档：`docs/pipeline-v6-file-contract.md`

需要明确：
- `consensus-answer.md` 固定 10 个维度
- `fda-actual.md` 每个维度必须包含 `answer + evidence`
- `judge-*.md` 每个维度必须包含 `score + rationale`
- `scoring.md` 必须包含维度级最终判定和总计分
- `analysis.md` 必须区分 `facts / inference / rules`
- `finalize-report.json` 的字段定义

**交付物**：
- 文件契约文档 1 份
- 每个 phase 的最小 schema 示例

**验收标准**：
- 下游脚本无需依赖自由文本猜格式
- 同一文件可被脚本重复解析且结果一致

### 任务 2：实现 `scripts/p0-prepare.sh`

职责：
- 解析 `case-config.json`
- 生成 `workspace/sop-paths.txt`
- 复制 `question.md`
- 获取 `fda-raw-sections.md`
- 输出 `prepare-report.json`

**必须支持**：
- DocSearch 正常命中
- DocSearch miss 后回退到 `fda_review_path`
- 缺关键输入时直接失败退出

**验收标准**：
- 对至少 3 个历史 case 完成脚本自测
- 输出目录结构一致
- 缺失输入时返回明确错误码

### 任务 3：实现 `scripts/validate-scoring.sh`

职责：
- 从 `scoring.md` 提取四类计数
- 复核 `total_items`
- 复核 `match_score` / `weighted_score`
- 检查 10 个维度是否齐全

**验收标准**：
- 能发现算术错误
- 能发现维度缺失
- 能发现 `skip_count` 与分母不一致

### 任务 4：实现 `scripts/p6-finalize.sh`

职责：
- 校验必要文件存在
- 读取 `scoring.md` 和 `analysis.md`
- 追加 `training/protocol-design/results.tsv`
- 生成 `finalize-report.json`
- 执行收敛判断

**验收标准**：
- `results.tsv` 17 列与现有 program.md 一致
- 文件缺失时中止，不产生半成品结果
- 成功和失败都能输出 machine-readable report

---

## Phase 2：固化 LLM Phase 模板与执行门禁

**目标**：降低 LLM phase 漂移，并确保整体切换时可控。  
**周期建议**：0.5-1 天

### 任务 5：编写 phase prompt 模板

需要模板：
- `p2-consensus.md`
- `p3-fda-format.md`
- `p4-judge.md`
- `p4-scoring-merge.md`
- `p5-analysis.md`

每个模板必须写清楚：
- 输入文件
- 禁止读取内容
- 固定输出格式
- 失败时的占位写法
- 不允许擅自新增字段

**验收标准**：
- 同一输入重复运行，输出结构稳定
- 下游脚本不需要做模糊容错

### 任务 6：补齐 phase gate

需要在 orchestrator 或 runner 中加入：
- `P1` 至少 2 个 solver 成功，否则中止
- `P4` 至少 2 个 judge 成功，否则中止
- `P0` 获取不到 FDA Review 时整轮阻断
- 任一 phase schema 校验失败时不进入下游
- `P5` 默认 Opus，除非满足已明确定义的降级条件

**验收标准**：
- 不再出现“文件存在但不可解析还继续跑”的情况
- 所有失败都有确定状态码
- runner 能在任意 phase 失败时直接退出并保留现场文件

---

## Phase 3：整体切换前验收

**目标**：在不做 shadow mode 的前提下，完成一次性切换前的最后门禁。  
**周期建议**：0.5 天

### 任务 7：执行单轮验收

选择 1 个代表性 case，完整跑通 v6 流程，检查：
- 所有 phase 文件是否按契约生成
- `scoring.md` 是否可被脚本复核
- `results.tsv` 是否正确追加
- `analysis.md` / `grounding.md` / `sop-patch.md` 是否完整
- Git 和收敛判断是否工作正常

这一步是**正式切换前的验收跑**，不是长期 shadow mode，也不是双轨保留。

### 任务 8：出切换结论

仅在以下条件同时满足时允许切换：
- 整轮运行无中断
- 所有 schema 校验通过
- `results.tsv` 追加正确
- 无明显逻辑错误或人工肉眼可见的质量退化
- 回退命令和回退步骤已经预演

如果任一条件不满足：
- 修复问题
- 重新跑一次单轮验收
- 不进入正式切换

---

## Phase 4：直接切换到 v6

**目标**：停止使用 v5.1.1，主流程直接切换到 v6。  
**周期建议**：验收通过后立即执行

### 切换动作

1. 更新 `training/protocol-design/program.md`
2. 更新 `training/_shared/framework.md`
3. 切换 runner/orchestrator 到 v6 phase 编排
4. 启用 `p0-prepare.sh`、`validate-scoring.sh`、`p6-finalize.sh`
5. 正式训练轮次全部按 v6 执行

### 切换后要求

- 第一轮正式运行必须人工复核 round artifacts
- 若出现 phase 失败、schema 漂移、计分异常、规则漏产出，立即回退到 v5.1.1
- 不允许在“已知有问题”状态下继续累计训练轮次

---

## Phase 5：第二轮优化

**目标**：在 v6 稳定后继续降本增效。  
**周期建议**：正式切换稳定后再启动

### 优化方向 1：`P3` 脚本化

条件：
- DocSearch 输出足够稳定
- 可从固定 section 中抽取 10 维度

收益：
- 每轮再节省约 `$0.10`

### 优化方向 2：`P5` pre-classifier

目标：
- 提前识别“全 match”或“ALT/INFO-only”轮次
- 减少 Opus 使用次数

约束：
- 必须独立验证误判率
- 不能直接从 `scoring.md` 生硬推断 `KNOW/REG/STAT`

### 优化方向 3：维度级趋势监控

建议新增：
- 每个维度的 rolling average
- 每个维度的 `match/partial/miss` 趋势图
- 高风险维度单独告警

原因：
- 聚合 `match_score` 会掩盖局部退化

---

## 4. 关键风险与应对

| 风险 | 表现 | 应对 |
|------|------|------|
| 文件 schema 漂移 | 脚本解析失败或隐性误读 | 先固化 file contract，再跑 phase |
| `P3` 抽取不稳定 | `fda-actual.md` 证据缺失 | 强制 evidence 字段 + 抽样校验 |
| `P4` merge 出现算术错误 | 分数错误写入 `results.tsv` | 计分脚本复核，脚本结果优先 |
| `P5` 过早降级 | 漏掉应写入 SOP 的规则 | 默认 Opus，降级必须先验证 |
| DocSearch 命中不稳定 | `P0` 失败率高 | fallback 到 `fda_review_path` |
| 整体切换风险集中 | 一旦出错影响正式训练 | 切换前强化门禁；出问题立即整体回退 |

---

## 5. 回退方案

由于不采用 shadow mode 和分阶段切换，回退方案必须前置准备。

### 回退触发条件

任一触发即回退：
- 正式轮次中 `P0-P6` 任一关键 phase 失败
- `results.tsv` 写入错误
- `scoring.md` 与脚本复核结果不一致
- `analysis.md` 明显漏掉应有规则
- round artifacts 无法被下游解析

### 回退动作

1. 恢复 `training/protocol-design/program.md` 到 v5.1.1
2. 恢复 `training/_shared/framework.md` 到 v5.1.1 对应版本
3. runner/orchestrator 切回 v5.1.1 phase 编排
4. 暂停继续跑新轮次
5. 对本次失败轮次做问题定位和修复

### 回退要求

- 正式切换前必须明确回退命令
- 切换前必须记录 v5.1.1 基线 commit
- 回退后不得混用 v5.1.1 和 v6 artifacts

---

## 6. 交付清单

### 文档
- `docs/pipeline-v6-file-contract.md`
- `docs/implementation-plan-v6.md`

### 脚本
- `scripts/p0-prepare.sh`
- `scripts/validate-scoring.sh`
- `scripts/p6-finalize.sh`

### Prompt 模板
- `scripts/prompts/p2-consensus.md`
- `scripts/prompts/p3-fda-format.md`
- `scripts/prompts/p4-judge.md`
- `scripts/prompts/p4-scoring-merge.md`
- `scripts/prompts/p5-analysis.md`

### 代码/配置更新
- `training/protocol-design/program.md`
- `training/_shared/framework.md`
- 必要的 runner/orchestrator 调整

---

## 7. 建议执行顺序

1. 写 `pipeline-v6-file-contract.md`
2. 实现 `p0-prepare.sh`
3. 实现 `validate-scoring.sh`
4. 实现 `p6-finalize.sh`
5. 编写全部 phase prompts
6. 补齐 phase gate
7. 更新 `program.md` 和 `framework.md`
8. 跑一次正式切换前单轮验收
9. 记录回退基线 commit
10. 直接切换到 v6
11. 第一轮正式运行人工复核
12. 稳定后再评估 `P5` 降级

---

## 8. 成功标准

Pipeline v6.0 可视为落地成功，需要同时满足：

1. 单轮成本稳定在 `$2.5-$3.0` 区间
2. 与 v5.1.1 相比，无明显人工可见质量退化
3. 失败时可以定位到具体 phase 和错误码
4. `results.tsv` 与 round artifacts 可被脚本稳定解析
5. `P5` 未出现因降级导致的新规则漏产出
6. 正式切换后连续 2 轮无严重执行异常

---

## 9. 结论

在不做 shadow mode 和分阶段切换的前提下，v6 的实施风险会更集中，因此门禁、脚本校验、文件契约和回退预案必须比原计划更严格。

可以直接切换，但前提是：
- 结构已经固定
- 脚本已经补齐
- 单轮验收已通过
- 回退路径已准备好

否则就是把设计风险直接带入正式训练流程。
