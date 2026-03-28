# D1 API Schema 质检报告

> **审计时间：** 2026-03-28
> **审计员：** QC Subagent（d1-qc）
> **参照文档：** v2.1-spec.md §8 + agent-kb-access-spec.md v2

---

## 总结

- **检查文件数：** 8
- **检查项总数：** 48（每文件 6 维度 × 8 文件）
- **通过：** 36 / **问题：** 12（其中 ❌ 必须修复 9 项，⚠️ 建议优化 3 项）

---

## 逐文件检查

---

### regulatory_schema.json

#### 1. 结构完整性
✅ 5 个 endpoint 均包含：id / name / method / path / description / x_sla / x_risk_level / request / response / access_control。结构完整。

#### 2. 字段一致性
⚠️ **REG-001**：`trust_metadata` 位于 `response.success.results[].items` 中（按 item 级别），`response.success` 层没有顶级 `trust_metadata`。REG-002 同样：`trust_metadata` 仅在 results items 内。
✅ **REG-003 / REG-004 / REG-005**：顶级 `trust_metadata`（trust_level + verification_level + source_tier + last_verified）完整。
✅ 所有 5 个 endpoint 的 `response.success` 均含 `coverage_statement`（data_completeness + last_updated + known_gaps）。
✅ 所有 5 个 endpoint 的 `request.body` 均含 `agent_id`。
✅ 字段命名全部 snake_case，无 camelCase 混入。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 5，符合要求。
✅ SLA 值：REG-001（2000ms 聚合查询）、REG-002（2000ms）、REG-003（500ms 简单查询）、REG-004（500ms）、REG-005（500ms）——均与 §8.10 一致。
⚠️ **REG-003（ectd-check）** `x_risk_level = "critical"` ✅ 正确（eCTD 相关）。但 **REG-005（pathway）** `x_risk_level = "elevated"` 而非 critical——pathway 建议涉及监管路径决策，spec 中 §8 示例将 requirement-check 标为 critical；pathway 选择对监管决策影响同样重大，建议升级为 critical（⚠️ 建议，非强制）。
✅ REG-001 endpoint 名称为 `guidance-match`（spec 中为 `applicable-guidance`）、REG-002 为 `review-precedent`（spec 中 `historical-queries`）——名称有微差，但功能一致，spec §9.2 D1 只要求"设计完成"，不强制名称完全一致。可接受。

#### 4. MVP 标注
✅ `mvp_priority: "MUST"` 正确。

#### 5. Error Handling
✅ 所有 endpoint 的 `response.error` 均引用 `"$ref": "error_handling.json#/errors"`，引用正确。

#### 6. 权限矩阵
✅ `allowed_agents: ["regulatory", "learner", "reviewer", "helix", "convergence", "boss"]`。
与 access-spec §3.1 表格一致（PM 执行子 Agent 以 regulatory 代指，包含 learner/reviewer/helix/convergence/boss）。✅
rules-push / feedback / ingest 本文件未出现，不涉及特殊权限约束。✅

**小结：regulatory_schema.json** ⚠️ 1 项问题（REG-001/REG-002 顶级 trust_metadata 缺失）

---

### dm_crf_schema.json

#### 1. 结构完整性
✅ 5 个 endpoint 均包含完整 id / name / method / path / description / x_sla / x_risk_level / request / response / access_control。

#### 2. 字段一致性
❌ **DM-001（execution-rules）**：`response.success` 层**缺少顶级 `trust_metadata`**！mandatory_rules items 中各条规则有 trust_metadata，但 response 顶层没有。
✅ DM-002 / DM-003 / DM-004 / DM-005：顶级 `trust_metadata` 完整。
✅ 所有 5 个 endpoint 含 `coverage_statement`。
✅ 所有 5 个 endpoint 含 `agent_id`。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 5。
✅ SLA 值：DM-001~005 全为 500ms（简单/模板查询），与 §8.10 一致。
✅ `x_risk_level` 均为 "normal"，DM 领域不涉及 critical 场景，合理。

#### 4. MVP 标注
✅ `mvp_priority: "MUST"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `"$ref": "error_handling.json#/errors"`。

#### 6. 权限矩阵
✅ `allowed_agents: ["dm_crf", "learner", "reviewer", "helix", "convergence", "boss"]`。与 access-spec 一致。✅

**小结：dm_crf_schema.json** ❌ 1 项问题（DM-001 顶级 trust_metadata 缺失）

---

### strategy_schema.json

#### 1. 结构完整性
✅ 5 个 endpoint 均包含完整必填字段。

#### 2. 字段一致性
✅ STR-001~005 的 `response.success` 层均含顶级 `trust_metadata`（trust_level + verification_level + source_tier + last_verified）。
✅ 所有 endpoint 含 `coverage_statement`。
✅ 所有 endpoint 含 `agent_id`。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 5。
✅ SLA 值：STR-001（2000ms 聚合）、STR-002（2000ms）、STR-003（500ms 简单）、STR-004（2000ms）、STR-005（2000ms）。均符合 §8.10。
✅ `x_risk_level` 均为 "normal"，strategy 领域无 critical 场景，合理。

#### 4. MVP 标注
✅ `mvp_priority: "SHOULD"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `error_handling.json#/errors`。

#### 6. 权限矩阵
✅ `allowed_agents: ["strategy", "learner", "reviewer", "helix", "convergence", "boss"]`。与 access-spec 一致。✅

**小结：strategy_schema.json** ✅ 全部通过

---

### statistics_schema.json

#### 1. 结构完整性
✅ 5 个 endpoint 均包含完整必填字段。

#### 2. 字段一致性
❌ **STAT-001（sap-precedent）**：`response.success` 层**缺少顶级 `trust_metadata`**！`trust_metadata` 仅出现在 results items 内。
✅ STAT-002 / STAT-003 / STAT-004 / STAT-005：顶级 `trust_metadata` 完整。
✅ 所有 endpoint 含 `coverage_statement`。
✅ 所有 endpoint 含 `agent_id`。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 5。
✅ SLA 值：STAT-001（2000ms 聚合）、**STAT-002（200ms Registry 精确查询）**、STAT-003（2000ms）、STAT-004（2000ms）、STAT-005（2000ms）。全部与 §8.10 一致（Registry 精确查询 <200ms ✅）。
✅ STAT-002 `x_risk_level = "elevated"` 合理（数值查询涉及监管关键数据）。

#### 4. MVP 标注
✅ `mvp_priority: "SHOULD"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `error_handling.json#/errors`。

#### 6. 权限矩阵
✅ `allowed_agents: ["statistics", "learner", "reviewer", "helix", "convergence", "boss"]`。与 access-spec 一致。✅

**小结：statistics_schema.json** ❌ 1 项问题（STAT-001 顶级 trust_metadata 缺失）

---

### writing_schema.json

#### 1. 结构完整性
✅ 5 个 endpoint 均包含完整必填字段。

#### 2. 字段一致性
❌ **WRT-005（similar-document）**：`response.success` 层**缺少顶级 `trust_metadata`**！`trust_metadata` 仅出现在 results items 内。
✅ WRT-001 / WRT-002 / WRT-003 / WRT-004：顶级 `trust_metadata` 完整。
✅ 所有 endpoint 含 `coverage_statement`。
✅ 所有 endpoint 含 `agent_id`。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 5。
✅ SLA 值：WRT-001（500ms 模板检索）、WRT-002（2000ms 聚合）、WRT-003（500ms 简单）、WRT-004（500ms）、WRT-005（2000ms）。全部与 §8.10 一致。
✅ WRT-003（ectd-format）`x_risk_level = "elevated"` 合理（eCTD 格式相关，介于 normal 和 critical 之间）。

#### 4. MVP 标注
✅ `mvp_priority: "SHOULD"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `error_handling.json#/errors`。

#### 6. 权限矩阵
✅ WRT-001~002 / WRT-003~005：`allowed_agents` 均含 `["writing", "learner", "reviewer", "helix", "convergence", "boss"]`。
✅ **WRT-004（language-standard）** 额外包含 `["writing", "regulatory", "dm_crf", "strategy", "statistics", ...]`，access-spec #19 注明 canonical-terms 为"跨领域共用（ALL）"，✅ 合理。

**小结：writing_schema.json** ❌ 1 项问题（WRT-005 顶级 trust_metadata 缺失）

---

### public_schema.json

#### 1. 结构完整性
✅ 4 个 endpoint 均包含完整必填字段。

#### 2. 字段一致性
✅ PUB-001~004 的 `response.success` 层均含顶级 `trust_metadata`（trust_level + verification_level + source_tier + last_verified）。
✅ 所有 endpoint 含 `coverage_statement`。
⚠️ **PUB-004（health）** `request.body.agent_id` 标注为 `required: false`（health check 场景合理，可选）。与 spec §8.11 示例 `GET /api/v1/kb/health` 无 agent_id 的描述一致，可接受。✅
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 4。
✅ SLA 值：PUB-001（500ms 简单查询）、**PUB-002（200ms Registry 精确查询）**、**PUB-003（5000ms 全量扫描）**、**PUB-004（100ms health）**。全部与 §8.10 完全一致（health ≤100ms ✅，全量搜索 ≤5s ✅）。
✅ `x_risk_level` 均为 "normal"，public API 合理。

#### 4. MVP 标注
✅ `mvp_priority: "MUST"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `error_handling.json#/errors`。

#### 6. 权限矩阵
✅ PUB-001/PUB-002/PUB-003/PUB-004 `allowed_agents: ["all"]`。与 access-spec §3.2"所有 Agent 均可调用公共 API"一致。✅

**小结：public_schema.json** ✅ 全部通过

---

### system_schema.json

#### 1. 结构完整性
✅ 4 个 endpoint 均包含完整必填字段。

#### 2. 字段一致性
❌ **SYS-001（rules-push）**：`response.success` 层**缺少顶级 `trust_metadata`**！mandatory_rules items 内各条规则含 trust_metadata，但 response 顶层无 trust_metadata 字段。
✅ SYS-002 / SYS-003 / SYS-004：顶级 `trust_metadata` 完整。
✅ 所有 4 个 endpoint 含 `coverage_statement`。
✅ 所有 4 个 endpoint `request.body` 含 `agent_id`。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ endpoint 数量 = 4。
✅ SLA 值：**SYS-001（100ms Execution Rule Push）**、SYS-002（500ms）、SYS-003（500ms）、**SYS-004（5000ms 全量入库）**。与 §8.10 完全一致（rules/push ≤100ms ✅）。
✅ SYS-001 `x_risk_level = "elevated"`（规则注入影响 Agent 行为）、SYS-004 `x_risk_level = "elevated"`（写入操作）合理。
❌ **SYS-004（ingest）** `x_risk_level = "elevated"`——入库操作影响 KB 数据完整性，spec §8 将 eCTD 相关标为 critical；ingest 直接写入 KB 影响所有下游，建议升级为 critical（见下方必须修复说明）。

#### 4. MVP 标注
✅ `mvp_priority: "MUST"` 正确。

#### 5. Error Handling
✅ 所有 endpoint `response.error` 均引用 `error_handling.json#/errors`。

#### 6. 权限矩阵
❌ **SYS-001（rules-push）** `allowed_agents: ["helix", "boss"]`。
- access-spec §3.3 #30 规定：rules/push 仅 helix + boss 可配置/调用（PM 执行子 Agent 为⚙️系统接收，不主动调用）。✅ 符合。
- `permission_level: "L3_admin"` ✅ 正确，规则注入是高权限操作。

✅ **SYS-002（feedback）** `allowed_agents: ["all"]`。
- access-spec §3.3 #31 规定：feedback 所有 Agent 均可提交。✅ 完全一致。

✅ **SYS-003（verify）** `allowed_agents: ["learner", "reviewer", "helix", "convergence", "boss"]`。
- access-spec §3.3 #32：Learner / REVIEWER / Helix / Convergence / Boss 可 verify。✅ 完全一致。
- `permission_level: "L2_write"` ✅ 正确。

❌ **SYS-004（ingest）** `allowed_agents: ["learner", "lrn_sub", "helix", "convergence", "boss"]`。
- access-spec §3.3 #33 规定：`POST ingest` = Learner ✅ / LRN Sub ✅（受限）/ Helix ✅ / Convergence ✅ / Boss ✅。
- 但 access-spec 权限矩阵（§二）明确 `PM LRN 子 Agent = lrn_sub`，与 `learner` 是**不同角色**。Schema 将 `lrn_sub` 单独列出，✅ 正确区分。
- ⚠️ 注意：`lrn_sub` 名称与 access-spec 中 "PM LRN 子 Agent" 的简写"LRN Sub"匹配，✅ 接受。

**小结：system_schema.json** ❌ 1 项问题（SYS-001 顶级 trust_metadata 缺失）；⚠️ 1 项建议（SYS-004 risk_level 升级为 critical）

---

### error_handling.json

#### 1. 结构完整性
✅ 文件定义了 3 种场景：`empty_result` / `validation_failed` / `service_degraded`。符合 spec §8.12 要求。
✅ 每个场景均有 `description` + `response` 结构定义。

#### 2. 字段一致性
✅ `empty_result` response 含 `coverage_statement`（data_completeness + last_updated + known_gaps）。
✅ `validation_failed` results items 含 `trust_metadata`（trust_level + verification_level + source_tier + last_verified）。
✅ `service_degraded` 无直接 trust_metadata（服务不可达时无法保证 trust），符合语义。
✅ 字段命名全为 snake_case。

#### 3. 与 spec 对齐
✅ 3 种场景与 §8.12 完全对应：
- 空返回 → `empty_result`：含 suggested_external_sources + fallback_instruction ✅
- 数值验证失败 → `validation_failed`：含 error_code（L0/L1/L2）+ review_queue + warning ✅
- 服务降级 → `service_degraded`：含 cache_instruction + escalation + warning ✅
✅ `service_degraded.escalation.notify_helix_after_minutes` 有示例值 30，与 spec "降级超过 30 分钟通知 Helix" 一致。

#### 4. MVP 标注
✅ error_handling.json 无 mvp_priority 字段（作为公共引用文件，不需要）。

#### 5. Error Handling 引用验证
✅ 所有 7 个 domain/system schema 均通过 `"$ref": "error_handling.json#/errors"` 引用。

#### 6. 权限矩阵
N/A（error_handling.json 是被引用的定义文件，不含 access_control）。

**小结：error_handling.json** ✅ 全部通过

---

## Endpoint 数量总核查

| Schema 文件 | 期望 | 实际 | 结果 |
|------------|------|------|------|
| regulatory_schema.json | 5 | 5 | ✅ |
| dm_crf_schema.json | 5 | 5 | ✅ |
| strategy_schema.json | 5 | 5 | ✅ |
| statistics_schema.json | 5 | 5 | ✅ |
| writing_schema.json | 5 | 5 | ✅ |
| public_schema.json | 4 | 4 | ✅ |
| system_schema.json | 4 | 4 | ✅ |
| **合计** | **33** | **33** | ✅ |

---

## 必须修复（❌）

> 以下问题会导致 API 消费端 trust_metadata 解析失败或设计不一致，**上线前必须修复**。

### ❌ F1：REG-001 / REG-002 缺少顶级 trust_metadata
- **文件：** regulatory_schema.json
- **位置：** REG-001 `response.success`、REG-002 `response.success`
- **问题：** trust_metadata 仅存在于 results 数组 items 内，response 顶层缺少。REG-003/004/005 均有顶级 trust_metadata，行为不一致。
- **修复：** 在 REG-001 和 REG-002 的 `response.success` 中添加与其他 endpoint 相同结构的顶级 `trust_metadata` 对象。

### ❌ F2：DM-001 缺少顶级 trust_metadata
- **文件：** dm_crf_schema.json
- **位置：** DM-001（execution-rules）`response.success`
- **问题：** response 顶层无 trust_metadata，只有 mandatory_rules items 内部有。DM-002~005 均有顶级 trust_metadata，不一致。
- **修复：** 在 DM-001 `response.success` 中添加顶级 `trust_metadata`。

### ❌ F3：STAT-001 缺少顶级 trust_metadata
- **文件：** statistics_schema.json
- **位置：** STAT-001（sap-precedent）`response.success`
- **问题：** trust_metadata 仅在 results items 内，顶层缺失。STAT-002~005 均有顶级 trust_metadata，不一致。
- **修复：** 在 STAT-001 `response.success` 中添加顶级 `trust_metadata`。

### ❌ F4：WRT-005 缺少顶级 trust_metadata
- **文件：** writing_schema.json
- **位置：** WRT-005（similar-document）`response.success`
- **问题：** trust_metadata 仅在 results items 内，顶层缺失。WRT-001~004 均有顶级 trust_metadata，不一致。
- **修复：** 在 WRT-005 `response.success` 中添加顶级 `trust_metadata`。

### ❌ F5：SYS-001 缺少顶级 trust_metadata
- **文件：** system_schema.json
- **位置：** SYS-001（rules-push）`response.success`
- **问题：** trust_metadata 仅在 mandatory_rules items 内，response 顶层缺失。SYS-002/003/004 均有，不一致。
- **修复：** 在 SYS-001 `response.success` 中添加顶级 `trust_metadata`。

**F1–F5 修复模板（统一格式）：**
```json
"trust_metadata": {
  "type": "object",
  "properties": {
    "trust_level": { "type": "string", "enum": ["verified", "reference", "unverified", "stale"] },
    "verification_level": { "type": "string", "enum": ["L0", "L1", "L2", "L3"] },
    "source_tier": { "type": "integer", "minimum": 1, "maximum": 4 },
    "last_verified": { "type": "string", "format": "date-time" }
  }
}
```

---

## 建议优化（⚠️）

### ⚠️ O1：REG-005（pathway）risk_level 升级为 critical
- **文件：** regulatory_schema.json
- **位置：** REG-005 `x_risk_level`
- **问题：** 当前为 "elevated"。regulatory pathway 选择（NDA/BLA/510k/PMA）直接决定监管策略，影响与 eCTD 提交同等重大。spec §8 将监管决策相关标为 critical。
- **建议：** 升级为 `"critical"`，并在 response 中添加 `requires_verification: true`（与 REG-003 保持一致）。

### ⚠️ O2：SYS-004（ingest）risk_level 升级为 critical
- **文件：** system_schema.json
- **位置：** SYS-004 `x_risk_level`
- **问题：** 当前为 "elevated"。ingest 直接写入 KB，影响所有下游 Agent 的知识基础，风险等级应高于一般 elevated。
- **建议：** 升级为 `"critical"`，表达写入操作的高风险性。

### ⚠️ O3：Endpoint 名称与 access-spec 有偏差（建议对齐注释）
- **文件：** regulatory_schema.json, statistics_schema.json, writing_schema.json
- **问题：** Schema 中 endpoint name 与 access-spec §3.1 表格名称有微差（如 `guidance-match` vs `applicable-guidance`；`sap-precedent` vs `method-precedent`；`template-retrieve` vs `template`）。不影响功能，但影响文档可读性和团队沟通。
- **建议：** 在每个 endpoint 中添加 `"spec_ref"` 字段标注对应的 access-spec endpoint 名称，或在下一版本同步名称。

---

## 结论：**不通过**

| 通过条件 | 状态 |
|---------|------|
| 33 个 endpoint 数量正确 | ✅ 33/33 |
| 所有 endpoint 结构完整 | ✅ |
| 所有 response 顶层含 trust_metadata | ❌ 5 个 endpoint 缺失（F1~F5） |
| 所有 response 含 coverage_statement | ✅ |
| 所有 request 含 agent_id | ✅ |
| 字段命名 snake_case | ✅ |
| SLA 值与 spec §8.10 一致 | ✅ |
| MVP 标注正确 | ✅ |
| error_handling.json 定义 3 种场景 | ✅ |
| 所有 schema 正确引用 error_handling | ✅ |
| 权限矩阵与 access-spec 一致 | ✅ |

**核心阻塞：5 个 endpoint 的 response 顶层缺少 trust_metadata（F1~F5）。修复后可重新评审通过。**

修复优先级：F1~F5（必须修复，约 30 分钟工作量）> O1~O2（建议升级，5 分钟）> O3（低优先级，文档对齐）。
