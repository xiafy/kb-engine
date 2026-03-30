# Training Guide — kb-engine

> For any AI Agent to participate in CRO knowledge training.

## What This Repo Is

A closed-loop training system for CRO (Contract Research Organization) clinical trial knowledge. You learn by designing FDA protocols, comparing against actual approved designs, and refining SOP rules.

## Setup

```bash
git clone https://github.com/xiafy/kb-engine.git
cd kb-engine
ln -s /path/to/fda-reviews-data data    # FDA Review files
gh auth status                           # GitHub CLI required
```

## Your Task

Pick an assigned case from `training/{branch}/questions/`, design a clinical trial protocol using only the SOP files, then compare your design against the actual FDA-approved protocol.

## Inputs

| Resource | Path | Usage |
|----------|------|-------|
| Branch config | `training/{branch}/config.yaml` | Scoring dimensions, answer extraction chapters |
| SOP files | `sop/core/`, `sop/domains/`, `sop/indications/`, `sop/regulatory/` | Your knowledge base — load per case-config mapping |
| Case metadata | `training/_shared/case-config.json` | Maps case → domain/indication/regulatory/answer path |
| Question | `training/{branch}/questions/{id}-{drug}.md` | The case to solve |
| Scoring rubric | `training/_shared/evaluate.md` | How to evaluate your answer vs FDA actual |
| FDA Review | `data/fda-reviews/md/{path}/MultidisciplineR.md` | The answer — read ONLY after completing your design |
| Language policy | `training/_shared/LANGUAGE.md` | All training content in English |

## Outputs

Submit as a PR to `main` with the following files:

```
training/{branch}/rounds/round-{NN}/
├── answer.md           — Your protocol design (closed-book, SOP-only)
├── fda-actual.md       — Extracted FDA actual design
├── scoring.md          — Your answer vs FDA actual, scored per evaluate.md
└── analysis.md         — Difference classification + proposed SOP updates
```

Append one row to `training/{branch}/results.tsv`.

## Rules

1. **Closed-book**: Design your protocol using ONLY the loaded SOP files + question info. Do NOT read the FDA Review until after you finish your design.
2. **English only**: All outputs in English (see LANGUAGE.md).
3. **Do NOT modify SOP files directly**. Propose changes in `analysis.md` under "Proposed SOP Updates".
4. **Do NOT merge your PR**. Submit it for review.
5. **Score honestly** per `evaluate.md`. Match = matching FDA actual, not answer quality.

## Difference Classification

When your answer differs from FDA actual, classify each difference:

| Code | Meaning | SOP Action |
|------|---------|------------|
| KNOW | You didn't know something | Propose SOP rule |
| REG | Regulatory pathway error | Propose SOP rule |
| STAT | Statistical method error | Propose SOP rule |
| ALT | Both answers are reasonable | Record only — do NOT propose SOP change |
| INFO | Question lacked needed info | Record only |

## Quality Gate

Your PR will be reviewed against these criteria:
- All required output files present and complete
- Scoring follows evaluate.md rules (with judgment table references)
- Difference classifications are justified with FDA Review evidence
- Proposed SOP updates cite specific FDA Review sections
- No information leakage (answer.md written before reading FDA Review)

## Branch Naming

```
train/{branch}-round-{NN}     — Training round
validation/{description}       — Validation run
experiment/{description}       — Experiment
```

## Reference Docs

| Doc | Purpose |
|-----|---------|
| `training/_shared/ROLES.md` | Role specifications and isolation requirements |
| `training/_shared/QUESTION-DESIGN.md` | How questions are selected |
| `training/_shared/program.md` | Full orchestrated training program (reference only) |
