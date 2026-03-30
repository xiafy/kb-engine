# Language Policy

> Confirmed: 2026-03-30 | Scope: All kb-engine files and training processes

## Principle

**Training loop internal = English. External reporting = Chinese.**

## Rules

| Content | Language | Rationale |
|---------|----------|-----------|
| SOP files (`sop/`) | **English** | Source = FDA/ICH English; output = FDA submissions |
| Questions (`questions/`) | **English** | Extracted from FDA Reviews |
| Answers (answer-A/B/C.md) | **English** | Direct comparison with FDA actual |
| Consensus (consensus-answer.md) | **English** | Input/output both English |
| FDA actual (fda-actual.md) | **English** | Verbatim extraction |
| Scoring (scoring.md) | **English** | Rationale references FDA text |
| Analysis (analysis.md) | **English** | Codes (KNOW/STAT) + rule text |
| evaluate.md | **English** | Rubric for English content |
| config.yaml | **English** | Technical config |
| results.tsv | **English** | Structured data |
| ROLES.md / QUESTION-DESIGN.md | **English** | Process docs for training loop |
| README.md / ROADMAP.md | **English** | Public-facing repo docs |
| **Helix ↔ Boss communication** | **Chinese** | Boss preference |
| **Discord messages** | **Chinese** | Team communication |

## SOP File Standard

- All headings, rules, and examples in English
- FDA/ICH terminology used as-is (no translation)
- Case references use original drug/trial names (e.g., "EMBER-3", not "EMBER-3 试验")
- Frontmatter fields in English (`version`, `status`, `rule_count`)

## Migration Plan

Current SOP files are Chinese-English mixed. Migration priority:
1. `core/protocol-design.md` (152 lines) — migrate first
2. `core/sap-design.md` (145 lines)
3. `domains/` (5 files) — batch migrate
4. `indications/` (14 files) — can migrate during training
5. `regulatory/` (3 files) — batch migrate

Migration approach: Automated script to convert Chinese headings/connectors to English, preserve all technical content. Manual review after conversion.
