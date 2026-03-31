# program.md — SAP Design Training Program

> **Version**: v1.0 | **Date**: 2026-03-31 | **Branch**: sap-design
> **Skeleton**: training/_shared/framework.md (universal flow)
> **Design basis**: docs/sap-design-training-design.md
> **Principle**: Full independent statistical design before benchmarking; exec is the core tool.

---

## System Role

You are a statistical analysis expert AI completing FDA-level SAP design through simulated real-world workflows. Each training round simulates: input reception → statistical design → computational verification → answer benchmarking → rule extraction. You have access to all available resources (SOP, FDA Guidance, ICH guidelines, computational tools). The **only** restriction: you cannot view the FDA Review for the drug under evaluation (that is the answer).

You are NOT designing the trial — you are designing the **statistical analysis plan** for a trial whose design is already fixed. The protocol parameters (endpoints, comparator, population, design type, sample size, stratification) are given inputs. Your task is to determine HOW those endpoints will be analyzed.

---

## File Manifest

| File | Read | Write | Description |
|------|------|-------|-------------|
| `training/sap-design/program.md` | ✅ | ❌ | This file |
| `training/sap-design/evaluate.md` | ✅ | ❌ | Scoring rubric (9 dimensions) |
| `training/sap-design/config.yaml` | ✅ | ❌ | Branch configuration |
| `training/sap-design/case-config.json` | ✅ | ❌ | Case → answer path + domain mapping |
| `training/sap-design/case-params.json` | ✅ | ❌ | 20 case protocol parameters (fixed inputs) |
| `training/sap-design/questions/{id}-{drug}.md` | ✅ | ❌ | Question files (if present) |
| `training/sap-design/results.tsv` | ✅ | ✅ append | Per-round scoring records |
| `sop/core/sap-design.md` | ✅ | ✅ | **Mutable** — core statistical decision SOP |
| `sop/domains/{domain}.md` | ✅ | ✅ | **Mutable** — disease category knowledge |
| `sop/indications/{indication}.md` | ✅ | ✅ | **Mutable** — indication-specific knowledge |
| `sop/regulatory/{path}.md` | ✅ | ✅ | **Mutable** — regulatory pathway knowledge |
| `data/fda-guidelines/markdown/INDEX.md` | ✅ | ❌ | FDA/ICH guideline index |
| `data/fda-guidelines/markdown/fda/*.md` | ✅ | ❌ | FDA Guidance full text |
| `data/fda-guidelines/markdown/ich/*.md` | ✅ | ❌ | ICH guideline full text |

---

## Training Granularity

| Level | Scenario | Input | Output |
|-------|----------|-------|--------|
| **L1 end-to-end** | Given protocol parameters, produce a complete SAP | protocol_params + drug info | Complete 9-dimension SAP design |
| **L2 module** | Optimize a specific SAP section | SAP draft + specific question | Single-section recommendation |
| **L3 decision point** | Make a specific statistical decision | Decision context + constraints | Decision + rationale + alternatives |

**Strategy**: L1 as primary mode. After several rounds, use L2/L3 to reinforce high-frequency miss dimensions.

---

## Execution Order (20 cases, statistical complexity gradient)

The order is chosen by statistical complexity, not clinical domain:

```
Warm-up (simple statistical frameworks):
  Round 01: 12-sotyktu      (co-primary + 3-arm IUT — multiplicity entry point)
  Round 02: 15-orgovyx      (NI-like threshold + single endpoint — clean framework)
  Round 03: 10-kimmtrak     (RCT + single OS primary + IC comparator — simple GSD)

Intermediate (multiplicity + IA design):
  Round 04: 05-vyloy        (dual trial + hierarchical + 2 IAs — PFS→OS hierarchy)
  Round 05: 13-tavneos      (NI→superiority sequential — gatekeeping strategy)

Advanced (complex alpha allocation):
  Round 06: 18-voranigo     (PFS + rare disease + crossover censoring adjustment)
  Round 07: 04-datroway     (dual primary PFS+OS alpha split + recycling)
  Round 08: 08-truqap       (dual population graphical testing)
  Round 09: 07-orserdu      (family of endpoints + alpha recycling ESR1m + ITT)
  Round 10: 01-inluriyo     (3-arm + 3 comparisons + alpha partition)

Single-arm / accelerated (simpler statistics, different framework):
  Round 11: 19-lumakras     (single-arm ORR + Clopper-Pearson CI)
  Round 12: 02-hernexeos    (single-arm ORR + restricted primary population)
  Round 13: 03-hyrnuo       (single-arm ORR + multi-cohort)
  Round 14: 06-retevmo      (multi-cohort single-arm + multiple tumor types)
  Round 15: 20-modeyso      (integrated analysis single-arm)

RCT completion:
  Round 16: 11-loqtorzi     (NPC RCT + PFS primary + protocol amendment)
  Round 17: 14-airsupra     (time-to-event + 3-arm + variable-length + event-driven)
  Round 18: 16-ogsiveo      (rare disease RCT + PFS + small N)
  Round 19: 09-komzifti     (single-arm heme + CR/CRh exact method)
  Round 20: 17-rytelo       (MDS + RBC-TI + 2:1 randomization — terminal test)
```

---

## Batch Strategy

| Batch | Rounds | Mode | Human Review |
|-------|--------|------|--------------|
| **Batch 1** (Rounds 1-5) | 精做 (intensive) | Complete execution, detailed recording | After Round 5: SOP audit |
| **Batch 2** (Rounds 6-10) | 常规 (standard) | Normal execution | None |

> **Note**: Only 2 batches planned (vs PD's 4). SAP seed SOP starts with 38 rules; convergence target is 10 rounds.

---

## Per-Round Execution Flow

### Step 0: Load Configuration

```
Read training/sap-design/config.yaml
Read training/sap-design/case-config.json → find current case entry
Extract: id, drug, path, domain, indication, regulatory, protocol_params_ref

Build SOP load list:
  1. sop/core/sap-design.md                  ← REQUIRED
  2. sop/domains/{domain}.md                 ← if file exists
  3. sop/indications/{indication}.md         ← if file exists
  4. sop/regulatory/{regulatory}.md          ← if file exists (regulatory != null)

Load protocol parameters from case-params.json[id]:
  - primary_endpoint
  - comparator
  - population
  - design
  - sample_size
  - stratification_factors

⚠️ Configuration failure → STOP, do not continue.
```

### Step 1: Read Question

```
Load protocol_params for the current case from case-params.json
Extract all fields:
  - drug_name, generic_name
  - primary_endpoint (type + assessment method — GIVEN, do not redesign)
  - comparator (GIVEN)
  - population (GIVEN)
  - design (GIVEN — randomization ratio, blinding, phase)
  - sample_size (GIVEN — do not question)
  - stratification_factors (GIVEN list)

Also extract from case-config.json:
  - domain, indication, regulatory

⚠️ Understand what is FIXED INPUT vs what you must DESIGN:
  FIXED (given): endpoint type, comparator, population, design type, N, strat factors
  TO DESIGN: analysis method, multiplicity strategy, IA design, analysis sets,
             missing data handling, subgroup list, sensitivity analyses,
             sample size calculation method + assumptions, estimand framework
```

### Step 2: Design SAP (open-book)

**Simulate a real CRO statistical analysis plan development workflow. All resources available; the only restriction: do not view the FDA Review for this drug.**

#### Available Resources

- All SOP files (core/ + domains/ + indications/ + regulatory/)
- FDA Guidance / ICH guidelines full text (data/fda-guidelines/markdown/)
  - Key references: ICH E9(R1) [estimand], ICH E9 [stat principles], FDA missing data guidance
- Other drugs' FDA Reviews for the same indication (NOT this drug's review)
- External search: ClinicalTrials.gov, PubMed, FDA.gov
- **exec (Python/R): CORE TOOL** — use for sample size verification, spending function calculation, power analysis

#### Owner Agent Configuration

- **Count**: 2 (parallel, independent subagent sessions)
- **Input**: SOP file list + protocol_params + available resources + orchestration guidance
- **timeout**: 360s
- **Core tool**: exec (scipy, statsmodels, gsDesign/rpact)

Each Owner Agent reads the SOP and **independently decides** its workflow:
- Complete all 9 SAP dimensions
- Use exec to verify sample size calculations (verify the given N against stated assumptions)
- Use exec to compute exact alpha spending boundaries (gsDesign/rpact)
- Use web_search/web_fetch to find control arm historical parameters when needed for sensitivity

**program.md does NOT prescribe Owner Agent internal workflow** — that is what the SOP specifies, and what training validates.

#### Output Format (one per Owner Agent)

```markdown
## My Answer: {drug_name} [sap-design] — Owner {A/B}

### 1. primary_analysis_method
[Statistical method for primary endpoint analysis, including:
 - Method name (e.g., stratified log-rank test + Cox PH model)
 - Model parameters (covariates, stratification, censoring rules)
 - Software/package specification for reproducibility]

### 2. multiplicity_control
[Alpha allocation strategy:
 - Strategy type (Hierarchical / Graphical / Bonferroni / Fixed-Sequence)
 - Alpha allocation per endpoint (α values, recycling rules)
 - Testing order with gate conditions]

### 3. interim_analysis
[IA design:
 - Number of IAs (including final analysis)
 - Information fraction timing (e.g., 50%, 75%, 100%)
 - Alpha spending function (e.g., Lan-DeMets OBF)
 - Futility boundary (binding/non-binding, threshold)
 - Computed critical values (from exec if possible)]

### 4. analysis_sets
[Analysis set definitions:
 - Primary analysis set (ITT/FAS/mITT/PP) + rationale
 - Secondary analysis sets
 - NI trial special rule application if applicable]

### 5. missing_data
[Missing data strategy:
 - Primary method under assumed mechanism (MCAR/MAR/MNAR)
 - Sensitivity analysis 1 (method + assumption)
 - Sensitivity analysis 2 (method + assumption)
 - Tipping point analysis plan (if applicable)]

### 6. subgroup_analysis
[Pre-specified subgroup list:
 - List all subgroups (must include all stratification factors)
 - Interaction test specification (alpha level, test type)
 - Presentation format (forest plot)]

### 7. sensitivity_analyses
[Main analysis sensitivity analyses:
 - Sensitivity analysis 1: [description]
 - Sensitivity analysis 2: [description]
 - (additional as appropriate)]

### 8. sample_size_method
[Sample size calculation method + assumptions:
 - Formula/method used (e.g., Schoenfeld events-based)
 - Key assumptions table (HR, control median, dropout rate, accrual)
 - exec verification: computed vs stated N
 - 3 scenarios: Optimistic / Base Case / Conservative]

### 9. estimand_framework
[ICH E9(R1) estimand definition:
 - Target population
 - Treatment condition
 - Variable (endpoint precise definition)
 - Intercurrent event handling (list each IE + strategy)
 - Summary measure]
```

### Step 2b: Consensus Merge

Compare 2 answers dimension by dimension:

```
For each scoring dimension (9):
  IF 2/2 agree → adopt directly [consensus: 2/2]
  IF 2/2 differ → list both options + rationale [divergence]
    → Orchestrator selects more SOP-consistent answer [orchestrator-resolved]
    → Document the divergence as SOP ambiguity signal
```

**Value of [divergence]**:
- Two Owners interpret the same SOP rule differently → SOP wording is ambiguous
- One Owner used exec for sample size verification, the other did not → orchestration instruction unclear
- These are SOP improvement signals

Output: `consensus-answer.md`

### Step 2c: Behavioral Variance Record

Record during consensus merge:

1. **SOP interpretation consistency**: Did both Owners execute the same rule the same way?
2. **Tool usage differences**: Which Owner used exec? What did they compute?
3. **exec computation differences**: Did both reach the same numerical result?
4. **SOP violations / skips**: Did any Owner skip an SOP step?
5. **Extra behavior beyond SOP**: Actions SOP did not require

Record facts only, no decision judgments. Write to `analysis.md ## Agent Behavior Variance`.

### Step 3: Extract Ground Truth Answer

```
From case-config.json, find answer path:
  data/fda-reviews/md/{path}/MultidisciplineR.md

⚠️ Error handling:
  - File not found → record "ANSWER_NOT_FOUND", skip to Step 7
  - File > 200KB → read first 100KB + search for key sections

Extract chapters (per config.yaml answer_extraction.chapters):
  - "Statistical Review — Analysis Plan"
  - "Statistical Review — Multiplicity"
  - "Statistical Review — Interim Analysis"
  - "Statistical Review — Sample Size"
  - "Statistical Review — Missing Data"
  - "Statistical Review — Subgroup Analysis"
  - "Clinical Review — Efficacy"    ← for analysis set definitions, sensitivity

Format as 9-dimension fda-actual.md:
  Each dimension: [FDA approach] + [exact quote from review] + [page/section ref]

⚠️ For cases with FDA Review predating 2021 (estimand framework):
  dimension 9 may have implicit rather than explicit estimand definition.
  Extract intercurrent event handling from censoring rules and analysis approach.
  Mark as [implicit-estimand] rather than skip.
```

### Step 4: Judge Scoring

**⚠️ Owner Agents must NOT self-evaluate.** Self-evaluation inflates scores ~25% (empirical data).

**Judge configuration**:
- Count: 3 independent Agents (blind evaluation, mutually invisible)
- Decision: majority vote (≥2/3 consistent = adopted); if 3-way split, take middle value
- Each judge runs in an **independent subagent session**

**Judge input (ONLY the following)**:
- `consensus-answer.md` (final answer)
- `fda-actual.md`
- `evaluate.md` (this branch's scoring rubric)

**Prohibited inputs**: reasoning traces, SOP files, question text

**Scoring dimensions** (9 items, see evaluate.md for full rubric):

| # | Dimension | Evaluation Object |
|---|-----------|-------------------|
| 1 | `primary_analysis_method` | Statistical method for primary endpoint |
| 2 | `multiplicity_control` | Alpha allocation strategy + testing order |
| 3 | `interim_analysis` | IA count + timing + spending function |
| 4 | `analysis_sets` | Primary analysis set selection |
| 5 | `missing_data` | Primary method + sensitivity analyses |
| 6 | `subgroup_analysis` | Pre-specified subgroup coverage |
| 7 | `sensitivity_analyses` | Robustness sensitivity analysis design |
| 8 | `sample_size_method` | Calculation method + key assumptions |
| 9 | `estimand_framework` | ICH E9(R1) 5 attributes + IE strategies |

Each item scored: `match` / `partial` / `miss` / `skip`

```
match_score = match_count / (9 - skip_count)
weighted_score = (match * 1.0 + partial * 0.5) / (9 - skip_count)
```

**Anomaly checks**:
- `match_score = 1.0` → verify for information leakage or over-generous scoring
- `match_score < 0.2` → verify correct answer file was used
- Inter-judge κ < 0.5 → recalibrate scoring standard

### Step 5: Difference Analysis

For all `partial` and `miss` items, classify the cause:

| Difference Type | Code | Description | SOP Fixable? |
|-----------------|------|-------------|--------------|
| Statistical method wrong | `METH` | Wrong method choice (e.g., MMRM instead of LOCF; log-rank instead of CMH) | ✅ |
| Assumption unreasonable | `ASSUM` | Incorrect parameter assumptions (control arm median, dropout rate, HR) | ✅ |
| Implementation detail missing | `IMPL` | Missing specification (censoring rule, IE handling, exact boundary value) | ✅ |
| Reasonable but non-FDA choice | `ALT` | Methodologically valid but FDA chose differently (e.g., different spending function) | ⚠️ record |
| Protocol info insufficient | `INFO` | Protocol parameters do not provide enough information to determine correct choice | ❌ |

### Step 5c: Rule Grounding

**Execute only for METH / ASSUM / IMPL type differences.**

Ground rules in priority order:

```
1. FDA Guidance / ICH guidelines (highest authority)
   → Search INDEX.md → read source → write rule as general decision framework
   → Annotate [grounded: ICH-E9R1-Section-X] or [grounded: FDA-guidance-{name}]

2. Cross-case pattern (multi-case validation)
   → ≥3 cases show same pattern → annotate [multi-case: case1, case2, case3]
   → Write to domains/

3. Single case only (lowest confidence)
   → Annotate [single-case: FDA-Review-{drug}] + [low-confidence]
   → Write to indications/
```

### Step 5b: SOP Update Review

**Trigger condition**: METH / ASSUM / IMPL differences exist. All ALT / INFO → skip.

1. Spawn independent review Agent
2. Input: draft rule + grounding annotation + FDA source excerpt
3. Review Agent decides: ✅ approve / ⚠️ revise / ❌ reject
4. Rejected rules are **NOT written to SOP**; record in `analysis.md` under `rejected_rules`

### Step 6: SOP Write

**Write targets** (from config.yaml):
- Global rules → `sop/core/sap-design.md`
- Disease category → `sop/domains/{domain}.md ## SAP Design`
- Indication-specific → `sop/indications/{indication}.md ## SAP Design`
- Regulatory pathway → `sop/regulatory/{regulatory}.md`

**Write conventions**:
- Section-Append (append to end of corresponding section)
- Append only — never modify existing lines
- Old rule incorrect → append correction + `[supersedes: old rule summary]`
- Increment frontmatter version on each update

### Step 7: Record Results

**Round outputs** saved to `training/sap-design/rounds/round-{NN}/`:

```
rounds/round-{NN}/
├── answer-A.md          ← Owner Agent A output
├── answer-B.md          ← Owner Agent B output
├── consensus-answer.md  ← Consensus merge result
├── fda-actual.md        ← FDA ground truth (9 dimensions)
├── scoring.md           ← 3-judge majority-vote scoring
├── analysis.md          ← Difference classification + deviation events + behavior variance
└── grounding.md         ← Rule grounding record
```

**results.tsv append one row** (17 columns, consistent with PD branch format):
```
round, branch, case_id, drug_name, pathway, match_score, weighted_score,
match_count, partial_count, miss_count, skip_count, total_items,
new_rules, sop_total, delta_codes, notes, timestamp
```

Column definitions:
- `round`: integer (1, 2, …)
- `branch`: always "sap-design"
- `case_id`: from case-config.json (e.g., "12")
- `drug_name`: drug name
- `pathway`: regulatory pathway (or "standard")
- `match_score`: match_count / total_items (2 decimal places)
- `weighted_score`: (match + 0.5×partial) / total_items (2 decimal places)
- `match_count`, `partial_count`, `miss_count`, `skip_count`: integers
- `total_items`: 9 - skip_count
- `new_rules`: number of new rules added this round
- `sop_total`: cumulative SOP rule count after this round
- `delta_codes`: comma-separated difference codes (e.g., "METH,ASSUM,ALT")
- `notes`: brief note (e.g., "estimand implicit in 2021 review")
- `timestamp`: ISO 8601 (e.g., 2026-03-31T16:00:00+08:00)

**Git**:
```bash
git checkout main && git pull
git checkout -b train/sap-round-{NN}
git add -A
git commit -m "sap-round-{NN}: +{N} rules, match {score}"
gh pr create --base main --title "SAP Round {NN}: +{N} rules, match {score}"
gh pr merge --squash --delete-branch
```

**Branch naming**:
- `train/sap-round-{NN}` — SAP Design official training rounds
- `experiment/{description}` — short-term experiments, may be deleted on failure

### Step 8: Convergence Check

```
Convergence signals (any one → may conclude early):
  - 3 consecutive rounds match_score ≥ 0.65 AND new_rules_added ≤ 1
  - 5 consecutive rounds new_rules_added = 0

Divergence alert (any one → pause training, wait for human review):
  - 5-round rolling average match_score declining over 2 consecutive batches
  - 3 consecutive rounds new_rules_added ≥ 4

Normal loop → return to Step 0
```

---

## R-FAIL: Deviation Event Recording

Record facts only during execution. Architectural/process improvements are initiated by the Orchestrator in batch retrospectives.

### SYS Deviations

Agent timeout / API 429 / crash / network error → L1 record: type + final state + one-line cause

### DEV Deviations

Inter-agent behavioral differences → L2 record: read session history, extract tool call sequences, record differences

### exec Failures

Python/R execution error → record: error message + input parameters + fallback used (manual calculation or approximation)

### Record Location

`rounds/round-{NN}/analysis.md ## Deviation Events`

---

## Error Handling

| Error Scenario | Handling |
|----------------|----------|
| Answer file not found | Record ANSWER_NOT_FOUND, skip Steps 4-6 |
| Answer file > 200KB | Search config-specified chapters, extract relevant sections |
| match_score = 1.0 | Re-score with strict standards |
| match_score < 0.2 | Verify correct answer file |
| case-config missing domain/indication | Load core/ only |
| core/ SOP > 200 lines | Trigger rule merge (consolidate duplicates, remove superseded) |
| config.yaml missing field | Use defaults from evaluate.md |
| exec computation timeout | Record timeout; use manual calculation with explicit formula |
| estimand pre-2021 case | Mark [implicit-estimand]; extract from censoring rules; do not auto-skip |
| Statistical Review chapter missing | Search alternative chapters; record DATA_PARTIAL if partial only |

---

## Completion Flow

After all rounds are complete:

1. **Convergence report**: match_score trend, SOP rule change statistics, Top 3 difference types
2. **SOP cleanup**: merge duplicates, remove superseded, de-duplicate across sections
3. **Version tag**: update SOP version + CHANGELOG.md + Git tag `sap-batch{N}-stable`
