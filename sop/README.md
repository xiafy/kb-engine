# SOP Service Catalog — PM Agent Routing Table

> **Version**: v1.0 | **Updated**: 2026-03-30

## Service Overview

| # | core/ SOP | Capability Description | Training Status | FDA Review Answer Section |
|---|-----------|----------------------|----------------|--------------------------|
| 1 | `protocol-design.md` | Protocol Design (8-step decision process) | ✅ v2.2 (59 rules, 20 cases) | Clinical Review — Trial Design |
| 2 | `sap-design.md` | SAP Statistical Design | ⬜ Pending training | Statistical Review |
| 3 | `stat-analysis.md` | Statistical Analysis Execution | ⬜ Pending training | Statistical Review |
| 4 | `clinical-pharm.md` | Clinical Pharmacology Assessment | ⬜ Pending training | Clinical Pharmacology Review |
| 5 | `efficacy-assessment.md` | Efficacy Evaluation | ⬜ Pending training | Clinical Review — Efficacy |
| 6 | `safety-assessment.md` | Safety Evaluation | ⬜ Pending training | Clinical Review — Safety |
| 7 | `regulatory-strategy.md` | Regulatory Strategy Decisions | ⬜ Pending training | Throughout |
| 8 | `labeling-review.md` | Labeling Review | ⬜ Pending training | Labeling Review |
| 9 | `post-marketing.md` | Post-marketing Requirements Forecast | ⬜ Pending training | PMR/PMC sections |

## PM Agent Routing Rules

```
Receive client request
    ↓
Identify task type → Match core/ SOP (see table above)
    ↓
Check training status:
  ✅ → Load SOP + domains/ + indications/ + regulatory/ → Execute
  ⬜ → Inform client that this capability is not yet available, or fall back to generic LLM response
    ↓
Execute SOP → Format output per templates/ → Deliver
```

## Loading Example

```
Task: "Review an ER+/HER2- Breast Cancer Phase 3 Protocol"

Load:
  1. sop/core/protocol-design.md          ← Required
  2. sop/domains/oncology-solid.md         ← Disease category
  3. sop/indications/breast-er-her2neg.md  ← Indication-specific

Output: Per sop/templates/protocol-review-report.md format
```

## Workflow Dependencies

```
Protocol Design ──→ SAP Design ──→ Stat Analysis
       │                                  │
       ↓                                  ↓
Regulatory Strategy              Efficacy Assessment
       │                         Safety Assessment
       ↓                                  │
  Labeling Review ←───────────────────────┘
       │
       ↓
  Post-marketing
```

## Directory Conventions

- `core/` — Each file ≤200 lines, organized by decision steps, no appendices
- `domains/` — Each file ≤200 lines, multi-dimension sections (Trial Design / Safety / CRF)
- `indications/` — Each file ≤100 lines, grows automatically during training
- `regulatory/` — Each file ≤100 lines
- `templates/` — One delivery template per core/ SOP
