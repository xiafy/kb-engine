# Analysis: Inluriyo [protocol-design] — Validation Round V0

## 差异归类

| Item | Score | 差异类型 | 说明 |
|------|-------|---------|------|
| 1 design_type | partial | ALT | 3-arm 设计含联合臂是 Sponsor 商业策略决策，无法从公开信息预测 |
| 4 endpoint_definition | miss | KNOW | SOP 有 inv-PFS 豁免规则（oncology-solid.md），但做题 Agent 选择了 BICR。规则被"开放标签 PFS 需 BICR"覆盖，而非被豁免条件覆盖 |
| 5 secondary_endpoints | partial | KNOW | FDA 的 OS 涉及 3-arm 结构，AI 未捕捉联合臂对应的比较 |
| 6 sample_size | partial | STAT | N=600 vs N=874，主要因为 AI 未设计 3-arm 导致样本量低估 |
| 8 stratification | partial | KNOW | ESR1m 不应是分层因子。SOP breast-er-her2neg.md 列出 ESR1 作为推荐分层因子，但 FDA 实际未用——SOP 规则可能需要修正 |

## 根因分析

### 核心问题：Item 4 endpoint_definition miss

**问题**：SOP 同时包含两条矛盾规则：
1. `protocol-design.md Step 4.1`: "IF open-label → PFS 主要终点通常需 BICR"
2. `oncology-solid.md`: "非细胞毒开放标签 inv-PFS 豁免...FDA 可接受 inv-PFS（先例 EMBER-3）"

做题 Agent 应用了规则 1（通用），未正确应用规则 2（特定豁免）。

**建议**：在 protocol-design.md Step 4.1 增加显式交叉引用：
"IF open-label AND 非细胞毒同类药物机制 → 见 domains/oncology-solid.md inv-PFS 豁免条件"

### 次要问题：Item 8 ESR1m 分层因子

**问题**：SOP breast-er-her2neg.md 推荐"ESR1 状态"作为分层因子，但 EMBER-3 实际未将其用作分层因子。
**原因**：ESR1m 是 co-primary 亚组定义，不是随机化分层。SOP 规则可能来自训练过程中的误学。
**建议**：验证完成后修正 SOP：ESR1 状态从分层因子改为亚组定义。

## SOP 加载审计

| 加载层 | 文件 | 行数 | 状态 |
|--------|------|------|------|
| core/ | protocol-design.md | 152 | ✅ 加载 |
| domains/ | oncology-solid.md | 46 | ✅ 加载 |
| indications/ | breast-er-her2neg.md | 30 | ✅ 加载 |
| regulatory/ | — | — | ⬜ 不适用（非加速审批）|

**总加载行数**: 228 行（3 文件）
**预期加载文件**: 3 ✅（case-config domain=oncology-solid, indication=breast-er-her2neg, regulatory=null）

## 验证判定（V0 校准轮）

- match_score: **0.50** — 低于预期 ≥0.90 基线
- weighted_score: **0.70**
- 主要原因：Item 4 miss（BICR vs INV）+ 3-arm 无法预测（ALT）
- **裁判校准偏差**：独立裁判比校准自评严格 ~0.25

## 对后续验证的影响

1. Item 4 的 BICR vs INV 问题可能影响所有 open-label 案例（V1-V5 中至少 Lumakras 也是开放标签）
2. ESR1m 分层误用是 Inluriyo 特定问题，不影响其他案例
3. 3-arm 设计是 EMBER-3 特有的商业策略，ALT 类型，不计入退化评估
