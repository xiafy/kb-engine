# Training Guide — kb-engine

> For any AI Agent (Codex, Claude Code, OpenClaw, etc.) to execute training rounds.
> Read this file completely before starting.

## Prerequisites

```bash
# 1. Clone the repo
git clone https://github.com/xiafy/kb-engine.git
cd kb-engine

# 2. Set up data symlink (FDA Reviews)
ln -s /path/to/fda-reviews-data data
# Verify: ls data/fda-reviews/md/  should list year directories

# 3. Verify GitHub CLI auth
gh auth status
```

## Quick Start (Single Round)

```bash
# 1. Get latest main
git checkout main && git pull

# 2. Create training branch
git checkout -b train/pd-round-{NN}

# 3. Read this guide's "Execution Steps" section below
# 4. Execute the training round
# 5. Commit and submit PR (do NOT merge — Helix reviews)
git add -A
git commit -m "pd-round-{NN}: {summary}"
gh pr create --base main --title "PD Round {NN}: {summary}"
```

---

## Execution Steps

### Step 0: Load Configuration

```
Read: training/protocol-design/config.yaml
Extract: sop.core, answer_extraction.chapters, scoring.dimensions
```

### Step 1: Resolve SOP Files

```
Read: training/_shared/case-config.json
Find the case for this round (by execution order or assignment).
Extract: domain, indication, regulatory fields.

Build SOP load list:
  1. sop/core/{config.sop.core}           — always load
  2. sop/domains/{domain}.md              — if domain exists
  3. sop/indications/{indication}.md      — if file exists
  4. sop/regulatory/{regulatory}.md       — if regulatory is set

Record the actual files loaded (for audit).
```

### Step 2: Read Question

```
Read: training/protocol-design/questions/{id}-{drug}.md
Extract: drug info, indication, population, SOC, unmet need
```

### Step 3: Answer (Closed-Book)

⚠️ **STRICT RULES**:
- Do NOT read any FDA Review files yet
- Do NOT use web search
- Use ONLY the SOP files + question info

Produce answers for each scoring dimension defined in config.yaml.

Output → `training/protocol-design/rounds/round-{NN}/answer.md`

Format:
```markdown
## My Answer: {drug_name} [protocol-design]

### 1. {dimension_1}
[Your answer]

### 2. {dimension_2}
[Your answer]
...
```

### Step 4: Extract FDA Actual

NOW you may read the FDA Review.

```
Path: data/fda-reviews/md/{case.path}/MultidisciplineR.md
Search for chapters listed in config.yaml answer_extraction.chapters
Extract the actual trial design for each scoring dimension
```

Output → `training/protocol-design/rounds/round-{NN}/fda-actual.md`

### Step 5: Self-Score (Simplified Mode)

Read: `training/_shared/evaluate.md`

Score each dimension: match / partial / miss / skip

Follow evaluate.md rules strictly:
- Score MATCH quality, not answer quality
- FDA actual = ground truth
- Border cases → partial (not match)
- Use judgment tables when available

Output → `training/protocol-design/rounds/round-{NN}/scoring.md`

Format:
```markdown
| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | match/partial/miss | specific reason |
...

match_score = {match_count} / {total_items}
weighted_score = ({match}×1 + {partial}×0.5) / {total_items}
```

### Step 6: Analyze Differences

For each partial/miss, classify:
- **KNOW**: Domain knowledge gap → suggest SOP rule to add
- **REG**: Regulatory pathway error → suggest SOP rule to add
- **STAT**: Statistical method error → suggest SOP rule to add
- **ALT**: Reasonable alternative (both valid) → record only, do NOT update SOP
- **INFO**: Insufficient question info → record only

Output → `training/protocol-design/rounds/round-{NN}/analysis.md`

### Step 7: Propose SOP Updates (Do NOT Write Directly)

⚠️ **External Agents: Do NOT modify SOP files directly.**

Instead, list proposed changes in analysis.md:

```markdown
## Proposed SOP Updates

### Rule 1
- Target file: sop/indications/nsclc.md
- Target section: ## Trial Design
- Proposed text: "IF KRAS G12C NSCLC → dual CDx required (tissue PCR + plasma ctDNA NGS)"
- Evidence: FDA Review Section X, page Y
- Classification: KNOW
```

Helix will review and apply approved changes.

### Step 8: Record Results

Append one line to `training/protocol-design/results.tsv`:

```
round	branch	case_id	drug_name	pathway	match_score	weighted_score	match_count	partial_count	miss_count	skip_count	total_items	new_rules	sop_total	delta_codes	notes	timestamp
{NN}	protocol-design	{id}	{drug}	{pathway}	{score}	{weighted}	{m}	{p}	{miss}	{s}	{total}	{new}	{sop}	{codes}	{notes}	{date}
```

### Step 9: Commit and Submit PR

```bash
git add -A
git commit -m "pd-round-{NN}: +{N} rules proposed, match {score}"
gh pr create --base main \
  --title "PD Round {NN}: {drug_name}, match {score}" \
  --body "## Summary
- Case: {id}-{drug}
- Match: {score} / Weighted: {weighted}
- Delta: {delta_codes}
- Proposed rules: {count}
- SOP loaded: {file_list}"
```

⚠️ **Do NOT merge the PR.** Helix reviews and merges after L4 audit.

---

## Full Mode vs Simplified Mode

| Mode | Agents | Who Can Run | Merge |
|------|--------|-------------|-------|
| **Simplified** (this guide) | 1 agent (do + self-score) | Any agent (Codex, Claude Code, etc.) | PR only, Helix reviews |
| **Full** (program.md v3.5) | 3 athletes + consensus + 3 judges + L4 audit | Helix orchestration | Auto-merge after L4 pass |

External agents use Simplified Mode. Helix uses Full Mode.

Simplified Mode results are still valuable:
- Exercises the SOP loading pipeline end-to-end
- Generates training data (answer + FDA actual)
- Proposes SOP updates (reviewed by Helix)
- Scores are self-assessed (inflate ~25%, adjust accordingly)

---

## Branch Naming

```
train/pd-round-{NN}        — Protocol Design round
train/sap-round-{NN}       — SAP Design round
train/{branch}-round-{NN}  — Other branches
validation/{description}    — Validation runs
experiment/{description}    — Experiments
```

## File Structure Reference

```
kb-engine/
├── sop/                         — Executable SOPs (shared, read during training)
│   ├── core/                    — Global decision SOPs
│   ├── domains/                 — Disease domain knowledge
│   ├── indications/             — Indication-specific knowledge
│   └── regulatory/              — Regulatory pathway knowledge
├── training/
│   ├── _shared/                 — Shared resources
│   │   ├── program.md           — Full training program (Helix mode)
│   │   ├── evaluate.md          — Scoring rubric v2.0
│   │   ├── case-config.json     — Case metadata
│   │   ├── ROLES.md             — Role specifications
│   │   ├── QUESTION-DESIGN.md   — Question selection process
│   │   └── LANGUAGE.md          — Language policy (English for training)
│   ├── protocol-design/         — PD training branch
│   │   ├── config.yaml          — Branch configuration
│   │   ├── questions/           — Question files
│   │   ├── rounds/              — Training round outputs
│   │   └── results.tsv          — Score history
│   └── sap-design/              — SAP training branch
├── data                         — Symlink to FDA Reviews
└── README.md
```

## Language Policy

All training content (SOP, questions, answers, scoring) in **English**.
See `training/_shared/LANGUAGE.md` for details.
