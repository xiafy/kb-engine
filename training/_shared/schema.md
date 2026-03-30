# Training Results Schema

> 各分支 results.tsv 的统一列定义

## 基线列（所有分支必有）

| 列名 | 类型 | 说明 |
|------|------|------|
| round | int | 训练轮次 |
| case_id | string | 案例 ID（如 01-inluriyo） |
| branch | string | 分支名（如 protocol-design） |
| match_score | float | 严格匹配率 |
| weighted_score | float | 加权得分（partial=0.5） |
| timestamp | ISO-8601 | 训练时间 |

## Protocol-design 扩展列

| 列名 | 类型 | 说明 |
|------|------|------|
| match_count | int | match 项数 |
| partial_count | int | partial 项数 |
| miss_count | int | miss 项数 |
| skip_count | int | skip 项数 |
| total_items | int | 适用项总数 |
| new_rules_added | int | 本轮新增规则数 |
| sop_rule_count | int | 累计 SOP 规则数 |
| delta_codes | string | 差异类型（KNOW/REG/STAT/ALT/INFO） |
| notes | string | 备注 |

## 跨分支对比

使用基线列即可 JOIN 不同分支的结果：
- JOIN key: case_id（同一案例在不同分支的成绩）
- 分组: branch（按分支聚合统计）
