# SOP Changelog

> Note: PD training rounds 1-20 were completed before migration to this repo.
> Historical SOP changes are reflected in the final rule state, not individual entries.
> From Round 21 onwards, each training round will have a CHANGELOG entry.

## 2026-03-30: Git PR model + SOP normalization

### training/program.md (v3.1 → v3.2)
- Added "Git Workflow (PR Model)" section: checkout → commit → PR → merge full operations
- Branch naming conventions + tag naming conventions
- Step 6b updated to Section-Append write convention
- Wrap-up flow added: tag + cleanup commits

### All domains/ + indications/ + regulatory/ + core/ files
- Removed all rule number references: `(#NN)` → deleted
- frontmatter `rules: [...]` → `rule_count: N`
- indications/ titles removed "Protocol Design Rules" suffix
- Compliant with SOP Design Principle #4 (no redundant metadata)

---

## 2026-03-30: Opus review fixes

### core/sap-design.md (v0.2 → v0.3)
- Removed rule-numbered headings (#40, #41 etc.), replaced with semantic Step numbers (Step 2-6)
- Compliant with SOP Design Principle #4 (no redundant metadata)
- frontmatter rules field changed to rule_count

### training/program.md (v3.0 → v3.1)
- Step 4 added independent judge Agent×3 blind evaluation mechanism (majority vote)
- Explicitly prohibited self-evaluation by the answering Agent (empirical: self-evaluation inflation ~25%)
- Added inter-rater κ < 0.5 calibration trigger condition

---

## 2026-03-30: v3.0 three-layer split migration

### core/protocol-design.md (v3.0)
- Split from sop.md v2.2, 28 global rules
- 152 lines, 8-step decision process
- Step 5 statistical rules partially migrated to sap-design.md

### core/sap-design.md (v0.2)
- Seed version: 7 rules migrated from sop.md v2.2 Step 5
- v0.2 enhancement: absorbed D2V SOP-BS-002 (process framework) + Estimand/missing data/subgroup analysis
- 145 lines, to be expanded after training

### domains/ (v1.0)
- 5 files: oncology-solid, oncology-heme, autoimmune, respiratory, rare-disease
- autoimmune is a framework placeholder

### indications/ (v1.0)
- 11 files: breast-er-her2neg, nsclc, gastric-gejc, aml, psoriasis, prostate-adt, anca-vasculitis, asthma, mds, lgg, npc

### regulatory/ (v1.0)
- 3 files: accelerated-approval, breakthrough, botanical-drug (placeholder)

### Zero-loss validation
- 42/42 keyword coverage test passed
- Trial classification table: all 65 rules mapped
