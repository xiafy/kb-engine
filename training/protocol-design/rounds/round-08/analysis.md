# Round 08 Analysis — Desmoid Tumor (Nirogacestat/DeFi)
## Pipeline v6 | Generated: 2026-04-01

---

## 1. Judge Score Summary & Reconciliation

| # | Item | Judge A | Judge B | Judge C | Final | Basis |
|---|------|---------|---------|---------|-------|-------|
| 1 | design_type | match | match | match | **match** | Unanimous |
| 2 | control_arm | match | match | match | **match** | Unanimous |
| 3 | primary_endpoint | match | match | match | **match** | Unanimous |
| 4 | endpoint_definition | partial | partial | partial | **partial** | Unanimous — BICR vs INV assessor |
| 5 | secondary_endpoints | partial | match | partial | **partial** | 2/3; see §2.2 |
| 6 | sample_size | match | match | match | **match** | Unanimous |
| 7 | stat_framework | partial | match | partial | **partial** | 2/3; see §2.3 |
| 8 | stratification | partial | match | match | **match** | 2/3; A used wrong denominator (see §2.4) |
| 9 | eligibility | match | partial | partial | **partial** | 2/3; see §2.5 |
| 10 | operational | partial | match | match | **match** | 2/3; dose specificity not expected in prospective design |

**Final: match=6, partial=4, miss=0**
**match_score: 0.60 | weighted_score: 0.80**

---

## 2. Disagreement Reconciliation

### 2.1 Item 4 — Endpoint Definition (unanimous partial, no reconciliation needed)
All three judges agree: BICR vs Investigator as primary PFS assessor is the core divergence. No dispute.

### 2.2 Item 5 — Secondary Endpoints (A+C partial, B match)
- **Judge B** argues key_coverage = 100% because ORR + PRO categories are all covered.
- **Judge C** identifies GODDESS (GOunder/Desmoid Tumor Research Foundation Desmoid Symptom/Impact Scale) as a missing disease-specific PRO instrument. Consensus names BPI-SF + EORTC QLQ-C30 but omits GODDESS, which was a key secondary PRO in the formal testing hierarchy.
- **Judge A** notes OS formal testing mismatch (FDA didn't test OS; consensus includes it).

**Resolution → partial.** GODDESS is a real gap — it was a key PRO measure in the DeFi hierarchical testing chain (PFS → ORR → PRO including GODDESS). Missing a disease-specific PRO instrument that was formally tested is material. B's coverage argument is too generous; category-level coverage doesn't capture instrument-level specificity. A's OS point is less material (consensus correctly included OS harm threshold per SOP §4.5).

### 2.3 Item 7 — Stat Framework (A+C partial, B match)
- **Judge B** argues IA presence/absence is not penalized under the rubric.
- **Judges A+C** correctly identify that adding a futility-only IA to a fixed design is a structural divergence. FDA planned 51 events with no formal IA — this was their final analysis, not an interim.

**Resolution → partial.** The rubric distinguishes fixed vs. GSD designs. Adding an IA that didn't exist is a real divergence. B's interpretation is too permissive.

### 2.4 Item 8 — Stratification (A partial, B+C match)
- **Judge A** calculates coverage = 1/2 = 50% using the consensus's 2 factors as denominator.
- **Judges B+C** correctly apply the rubric formula: coverage = AI hits on FDA factors / total FDA factors = 1/1 = 100%.

**Resolution → match.** A used the wrong denominator. The rubric's denominator is FDA's factor count. FDA had 1 factor (tumor location); consensus hit it → 100% coverage → match. Adding an extra factor (prior therapy) is not penalized by the coverage formula.

### 2.5 Item 9 — Eligibility (A match, B+C partial)
- **Judge A** scores match based on 3/3 sub-dimensions (biomarker, line, key exclusions all aligned). Considers ECOG 0-1 with ECOG 2 as exploratory cohort "aligned" with FDA's ≤2.
- **Judges B+C** identify ECOG 0-1 vs ≤2 as a meaningful eligibility divergence. C additionally flags that the consensus allows "clinical progression" as an alternative entry criterion, whereas FDA required RECIST progression only.

**Resolution → partial.** A is too generous on ECOG. The DeFi trial deliberately used ECOG ≤2 (more inclusive) for a rare disease with chronic oral therapy. Consensus chose ECOG 0-1 (more restrictive) — this narrows the enrollable population by ~5-10%. "ECOG 2 as exploratory cohort" is not equivalent to ECOG ≤2 in the primary analysis population.

### 2.6 Item 10 — Operational (A partial, B+C match)
- **Judge A** penalizes for missing dose specification (150 mg BID).
- **Judges B+C** note this is a prospective design exercise where the exact dose comes from Phase 2 data; the consensus appropriately defers to Phase 1/2 (SDP #9).

**Resolution → match.** In a design template for a hypothetical Phase 3, specifying the exact dose is not expected before Phase 2 completion. The consensus correctly flagged dose justification as a Strategy Decision Point.

---

## 3. Gap Classification

### Gap 1: BICR vs Investigator PFS Assessor (Item 4)

| Attribute | Value |
|-----------|-------|
| **Classification** | **REG** |
| **Impact** | All 3 judges scored partial; consensus systematically chose wrong assessor |
| **Root Cause** | SOP §4.1 and §4.7 conflict for double-blind placebo-controlled designs |

**Detail**: SOP §4.1 states: "IF double-blind → PFS may use investigator assessment as primary endpoint." But SOP §4.7 lists a condition: "Switch to BICR primary IF: … (4) Placebo control." The DeFi trial was both double-blind AND placebo-controlled. The solvers followed §4.1 (double-blind → inv-PFS ok) without checking §4.7 condition (4) (placebo → BICR primary).

Additionally, §4.1 has a note under the open-label branch: "This exemption does NOT apply to: … any setting where progression assessment has significant subjective component (e.g., soft tissue measurement, clinical progression)." While this note is under the open-label branch, the DeFi trial's PFS included clinical progression (inherently subjective) and soft tissue measurement — both factors that FDA would want BICR oversight for, even in a double-blind design.

**Why FDA used BICR**: DT PFS had clinical progression (Amendment 5) as a component — a subjective endpoint requiring independent adjudication. BICR provided an extra layer of credibility for a novel mechanism in a rare disease with no prior approved therapy.

### Gap 2: GODDESS PRO Instrument Missing (Item 5)

| Attribute | Value |
|-----------|-------|
| **Classification** | **KNOW** |
| **Impact** | 2/3 judges scored partial; disease-specific PRO omitted from secondary hierarchy |
| **Root Cause** | No knowledge of GODDESS scale in SOP or indication file |

**Detail**: GODDESS (GOunder/Desmoid Tumor Research Foundation Desmoid Symptom/Impact Scale) is a validated, DT-specific patient-reported outcome instrument. It was a key secondary endpoint in the DeFi hierarchical testing chain (PFS → ORR → PRO including GODDESS). The consensus included generic PROs (BPI-SF, EORTC QLQ-C30) but missed this disease-specific instrument.

GODDESS was developed specifically to capture DT-related symptoms (pain, physical functioning, limitation of activities) that generic instruments may not adequately assess. For rare diseases, disease-specific PROs carry more weight with FDA because they demonstrate understanding of the patient experience.

### Gap 3: Interim Analysis Over-Engineering (Item 7)

| Attribute | Value |
|-----------|-------|
| **Classification** | **STAT** |
| **Impact** | 2/3 judges scored partial; consensus added IA to a fixed design |
| **Root Cause** | Consensus used 75 target events (above SOP threshold of 50-60), triggering IA inclusion; but FDA planned only 51 events with no IA |

**Detail**: SOP rare-disease.md states: "IF rare disease target events ≤50-60: May omit interim analysis." FDA planned 51 events — squarely within the "may omit" range. But the consensus used different sample size assumptions (HR=0.50 instead of HR=0.40, control mPFS=15mo) that yielded 75 events, pushing above the threshold and triggering IA inclusion.

The deeper issue: the consensus's HR=0.50 (benchmarked from sorafenib's 0.49) was more conservative than FDA's planned HR=0.40 — resulting in a larger trial that "needed" an IA. But the actual trial succeeded spectacularly with HR=0.29 at 49 events. The lesson: for a novel GSI in a rare disease with strong Phase 2 signal, HR=0.40 was appropriate and led to a more efficient fixed design.

**Cascade**: sample size assumptions → event count → IA decision. This is not just a STAT gap — it traces to the HR assumption.

### Gap 4: ECOG 0-1 vs ≤2 (Item 9)

| Attribute | Value |
|-----------|-------|
| **Classification** | **REG** |
| **Impact** | 2/3 judges scored partial; consensus was more restrictive than FDA |
| **Root Cause** | No SOP rule for ECOG selection in rare disease chronic oral therapies |

**Detail**: FDA's DeFi trial used ECOG ≤2. The consensus chose ECOG 0-1, citing "conservative registration choice." But for a rare disease with limited enrollment pool and a chronic oral therapy with manageable toxicity, ECOG ≤2 is the pragmatic and FDA-accepted choice. The consensus over-restricted eligibility without regulatory necessity.

The rare-disease domain SOP has no guidance on ECOG relaxation. SOP §2.1 mentions the 5-dimension scoring framework but doesn't provide domain-specific defaults.

---

## 4. Items Not Requiring SOP Action

| Gap | Classification | Rationale for No Action |
|-----|---------------|------------------------|
| Prior therapy stratification (extra factor in Item 8) | INFO | Not penalized by rubric; adding a clinically reasonable extra stratification factor is conservative over-specification, not an error. No SOP change needed. |
| OS formal testing inclusion (Item 5, A's concern) | INFO | Consensus correctly included OS harm threshold per SOP §4.5. FDA didn't formally test OS because DT is rarely fatal. The consensus was being thorough, not wrong. |
| Dose specificity (Item 10, A's concern) | INFO | Prospective design templates appropriately defer dose to Phase 2 data. SDP #9 correctly flags this. |
| Hepatobiliary exclusion (Item 9, B's concern) | ALT | FDA excluded hepatobiliary disease due to nirogacestat-specific hepatotoxicity profile. This is drug-specific, not generalizable to "GSI class." A generic protocol design wouldn't predict this. |

---

## 5. Proposed SOP Rules

### Rule 1: BICR Primary for Placebo-Controlled Trials with Clinical Progression (→ core/protocol-design.md §4.7)

**Current §4.7 text** (relevant excerpt):
> Default: Investigator PFS primary + BICR secondary. Switch to BICR primary IF: (1) FDA Meeting requires; (2) CRL cited inv bias; (3) Open-label + highly subjective endpoint; (4) Placebo control.

**Problem**: §4.1 ("IF double-blind → PFS may use investigator assessment") conflicts with §4.7 condition (4) for double-blind placebo-controlled designs. Solvers followed §4.1 and ignored §4.7(4).

**Proposed addition** (append to §4.7):
```
### 4.7a BICR precedence for placebo-controlled or clinical-progression PFS
IF placebo-controlled design (including double-blind) → BICR is primary assessor for PFS, regardless of blinding status. §4.1 double-blind allowance for inv-PFS is overridden when control is placebo.
IF PFS definition includes clinical progression (non-radiographic events) → BICR + independent clinical review committee is required as primary assessor; investigator-assessed PFS is sensitivity only.
IF soft tissue tumor (e.g., desmoid, GIST, STS) where measurement variability is high → BICR preferred as primary even in double-blind.
Rationale: DeFi trial (NDA 217677) used BICR primary in double-blind placebo-controlled design; FDA required independent assessment for clinical progression events.
[source: Round 08 training; nirogacestat NDA 217677]
```

**Priority**: HIGH — this caused a unanimous partial across all 3 judges and reflects a systematic SOP contradiction.

### Rule 2: GODDESS PRO for Desmoid Tumors (→ indications/desmoid-tumor.md)

**Current state**: Placeholder file with no content.

**Proposed addition** (under `## Trial Design`):
```
### DT-Specific PRO: GODDESS Scale Required
Desmoid tumor trials must include the GODDESS (GOunder/Desmoid Tumor Research Foundation Desmoid Symptom/Impact Scale) as a disease-specific PRO secondary endpoint alongside general instruments (BPI-SF, EORTC QLQ-C30). GODDESS captures DT-specific symptom burden (pain, physical functioning, activity limitation) validated in the DeFi trial population.
PRO hierarchy in DT: GODDESS (disease-specific) + BPI-SF (pain) + EORTC QLQ-C30 (general QoL).
[source: Round 08 training; NDA 217677 DeFi trial secondary endpoints]
```

**Priority**: MEDIUM — disease-specific KNOW gap; only relevant for DT indication but demonstrates the pattern of needing disease-specific PRO instruments.

### Rule 3: ECOG ≤2 Default for Rare Disease Chronic Oral Therapies (→ domains/rare-disease.md)

**Current state**: No ECOG guidance in rare-disease domain SOP.

**Proposed addition** (under `## Trial Design`):
```
### Rare Disease ECOG Default: ≤2 for Chronic Oral Therapies
IF rare disease + chronic oral therapy + manageable toxicity profile:
→ Default ECOG ≤2 (not 0-1) to maximize enrollment feasibility
→ Precedent: DeFi trial (nirogacestat, NDA 217677) used ECOG ≤2
→ ECOG 0-1 restriction should only be applied when drug toxicity profile requires it (e.g., high-dose IV therapy, significant myelosuppression)
Rationale: Rare disease enrollment pools are limited; unnecessary ECOG restriction (0-1) reduces eligible population by ~5-10% without regulatory benefit. FDA accepted ECOG ≤2 for DT.
[source: Round 08 training; NDA 217677]
```

**Priority**: MEDIUM — rare disease enrollment feasibility matters; ECOG restriction was a tangible gap.

### Rule 4: DeFi Precedent Data for Desmoid Tumor Trials (→ indications/desmoid-tumor.md)

**Proposed addition** (populate the placeholder):
```
### DeFi Trial Reference Parameters (NDA 217677, Nirogacestat)
| Parameter | FDA Actual | Notes |
|-----------|-----------|-------|
| Design | Phase 3, DB, PC, 1:1 | Single pivotal |
| N planned / enrolled | 118 / 142 | Event-driven: 51 PFS events |
| HR assumed / actual | 0.40 / 0.29 | Strongly positive |
| Control mPFS | 8 mo assumed / 15.1 mo actual | Key: placebo arm mPFS was much longer than assumed |
| Primary assessor | BICR | Not investigator |
| Stratification | Tumor location only (1 factor) | Intra-abdominal vs extra-abdominal |
| ECOG | ≤2 | Inclusive for rare disease |
| Entry criterion | RECIST ≥20% progression within 12 mo | No clinical progression as entry (only as PFS event) |
| Key PROs | GODDESS, BPI-SF, EORTC QLQ-C30 | GODDESS is DT-specific |
| IA | None (fixed design, 51 events) | Below rare-disease IA threshold |

### DT Entry Criterion: Radiographic Progression Required
DeFi required RECIST v1.1 ≥20% progression within 12 months for enrollment. Clinical progression was only added as a PFS event component (Amendment 5), NOT as an enrollment criterion. Future DT trials should distinguish:
- Entry: radiographic progression (RECIST) — objective, verifiable
- PFS event: radiographic OR clinical progression — broader, with IRC adjudication
[source: Round 08 training; NDA 217677]
```

**Priority**: HIGH — populates the empty indication file with authoritative precedent data.

---

## 6. Cascade Analysis

The four gaps are not independent. They share a common upstream driver:

```
No DeFi precedent data in SOP
    ├── Gap 1: BICR vs INV → SOP §4.1/§4.7 contradiction not resolved with DeFi data
    ├── Gap 2: GODDESS missing → No DT-specific knowledge anywhere in SOP
    ├── Gap 3: IA over-engineering → HR=0.50 assumption (not 0.40) → larger N → more events → IA triggered
    └── Gap 4: ECOG 0-1 → No rare disease ECOG default → solvers chose conservative over pragmatic
```

**Root fix**: Populating `indications/desmoid-tumor.md` with DeFi trial parameters (Rule 4) would have prevented or mitigated all four gaps. Disease-specific indication files are the highest-leverage SOP improvement for rare disease cases.

---

## 7. Summary

| Metric | Value |
|--------|-------|
| **Total items** | 10 |
| **match** | 6 |
| **partial** | 4 |
| **miss** | 0 |
| **weighted_score** | **0.80** |
| **Gaps identified** | 4 |
| **Gap classifications** | REG: 2 (Items 4, 9), KNOW: 1 (Item 5), STAT: 1 (Item 7) |
| **SOP rules proposed** | 4 |
| **Judge disagreements reconciled** | 5 (Items 5, 7, 8, 9, 10) |
| **Scoring corrections** | Item 8: A's partial → match (wrong denominator); Item 10: A's partial → match (dose not expected) |

**Overall assessment**: Strong performance (0.80 weighted) with no misses. The consensus correctly identified all major design elements (design type, control arm, primary endpoint, sample size, stratification direction). The four partial gaps are all addressable through SOP updates — primarily by populating the empty desmoid-tumor indication file and resolving the §4.1/§4.7 BICR contradiction.

---

*Analysis complete. Round 08 | v6 pipeline | 2026-04-01*
