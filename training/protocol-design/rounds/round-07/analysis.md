# Round 07 Analysis — IDH-Mutant Low-Grade Glioma (Voranigo/INDIGO)

> **Analyst**: Analysis Agent (v6-pipeline) | **Date**: 2026-04-01
> **Drug**: Voranigo (vorasidenib) | **NDA**: NDA218784 | **Study**: INDIGO (AG881-C-004)

---

## 1. Difference Classification Table

| Item | Score (A/B) | Category | Root Cause | SOP Actionable? |
|------|-------------|----------|-----------|-----------------|
| 4 — Endpoint Definition | partial / partial | **REG** | SOP §4.1 vs §4.7(4) conflict: double-blind rule permits INV, but placebo-control rule triggers BICR. INDIGO used BICR primary despite double-blind design. CNS pseudoprogression complexity + BICR's dual role (PFS assessment + crossover eligibility) drove FDA choice. | **YES** — SOP clarification + LGG indication rule |
| 5 — Secondary Endpoints | partial / partial | **KNOW** | Consensus elevated OS above TTNI in hierarchy. FDA designated TTNI as sole key secondary — TTNI captures "deferral of treatment burden," the core clinical benefit in observation-replacement LGG. Consensus lacked LGG-specific endpoint hierarchy knowledge. | **YES** — LGG indication rule |
| 6 — Sample Size | miss / miss | **INFO + KNOW** | Control mPFS: consensus 48mo (observational literature from diagnosis) vs FDA actual 18mo (trial-setting). Observational cohort PFS ≠ clinical trial PFS due to different enrollment windows and progression ascertainment (scheduled MRI vs clinical detection). HR difference minor (0.65 vs 0.6). | **YES** — LGG indication rule (calibration data) |
| 10 — Operational | match / partial | **ALT** | Judge B flagged dosing schedule (28-day cycles vs continuous QD). This is a drug-specific operational detail unknowable without Phase 2 data. Not SOP-actionable. | No |

**Category Key**: KNOW = domain knowledge gap | REG = regulatory knowledge gap | STAT = statistical methodology gap | ALT = alternative design (equally valid or unknowable) | INFO = missing input data

---

## 2. Judge Disagreement Analysis

### Item 10 — Operational: Judge A (match) vs Judge B (partial)

**Judge A rationale**: 3 subdimensions evaluated — geographic (match), biomarker testing (match), dosing (aligned). ≥2/3 = match.

**Judge B rationale**: Same 3 subdimensions — geographic (match), biomarker testing (match), dosing (partial due to 28-day cycle vs continuous QD). States "2/3 sub-dimensions match, reaching ≥2 threshold → partial per rubric."

**Assessment**: **Judge A is correct.** Judge B's own analysis shows 2/3 subdimensions match. The rubric standard for Item 10 is ≥2/3 subdimensions aligned = match. Judge B applied the threshold correctly (2/3 ≥ 2) but drew the wrong conclusion ("partial" instead of "match"). This is a rubric application error. Furthermore, dosing schedule (28-day cycles with dose reduction mid-trial) is a drug-specific operational detail that no SOP can predict without Phase 2 PK data — it should not drive a partial score.

**Verdict**: Item 10 = **match** (Judge A correct, Judge B error).

### Judge B Summary Statistics Error

Judge B's item-by-item scores: match=6, partial=3, miss=1.
Judge B's reported summary: "match: 4 | partial: 4 | miss: 2 | weighted_score: 0.60."

**This is a counting error.** Recounting from Judge B's own table:
- match: Items 1, 2, 3, 7, 8, 9 = **6**
- partial: Items 4, 5, 10 = **3**
- miss: Item 6 = **1**
- Correct weighted_score: (6 + 3×0.5) / 10 = **0.75**

Judge B under-reported by 2 matches and over-reported by 1 partial and 1 miss. The summary statistics in judge-B.md are **unreliable** — the item-by-item scores should be used as ground truth.

---

## 3. Corrected Final Scores

After correcting Judge B's Item 10 (partial → match) and recounting:

| Metric | Judge A | Judge B (raw) | Judge B (corrected) | Agreed |
|--------|---------|---------------|---------------------|--------|
| match | 7 | 6 → **7** | 7 | 7 |
| partial | 2 | 3 → **2** | 2 | 2 |
| miss | 1 | 1 | 1 | 1 |
| weighted | 0.80 | 0.75 → **0.80** | 0.80 | **0.80** |

**After correction, Judges A and B agree on all 10 items.** Final round score: **0.80 weighted**.

---

## 4. Proposed SOP Updates

### 4.1 SOP Core: §4.1/§4.7 — Clarify BICR Override Priority

**Problem**: §4.1 says "IF double-blind → PFS may use investigator assessment as primary." §4.7 says "Switch to BICR primary IF … (4) Placebo control." These conflict for double-blind placebo-controlled trials (the most common pivotal design). The consensus agent followed §4.1; FDA followed the §4.7(4) logic.

**Proposed rule clarification** (amend §4.7):

```
### 4.7 PFS assessor decision tree (Investigator vs BICR)
Default: Investigator PFS primary + BICR secondary.
Switch to BICR primary IF ANY of:
  (1) FDA Meeting explicitly requires BICR
  (2) CRL cited investigator bias
  (3) Open-label + highly subjective endpoint
  (4) CNS/brain tumors (complex imaging criteria, pseudoprogression risk)

Note: §4.1 general rule (double-blind → INV acceptable) is a permissive default,
not an override. Conditions (1)-(4) above take priority when applicable.
Placebo-controlled trials per se do not mandate BICR; the driver is disease-specific
imaging complexity (especially CNS).
```

**Grounding**: INDIGO NDA218784 — double-blind placebo-controlled, but FDA used BIRC as primary due to RANO-LGG complexity and BIRC's dual role (PFS assessment + crossover PD confirmation). The original §4.7(4) "Placebo control" was too broad — it's CNS imaging complexity that drives the BICR need, not placebo control per se.

**Impact**: Resolves §4.1/§4.7 conflict; adds CNS-specific rationale.

---

### 4.2 SOP Indication (lgg.md): Key Secondary Endpoint Hierarchy

**Problem**: Consensus elevated OS above TTNI. FDA designated TTNI as sole key secondary for LGG observation-replacement trials.

**Proposed rule** (append to lgg.md `## Trial Design`):

```
### Key Secondary Endpoint for Observation-Replacement Trials
IF indication == "LGG observation-replacement" AND primary == PFS:
→ Key secondary: Time to Next Intervention (TTNI), tested in fixed-sequence after PFS
→ TTNI captures deferral of treatment-related toxicity burden — the core clinical
  benefit in indolent LGG where OS requires 10+ year follow-up
→ OS: additional secondary endpoint (not in key testing hierarchy for initial analysis)
[grounding: INDIGO NDA218784 — FDA agreed TTNI as sole key secondary;
 "selected to illustrate the clinical meaningfulness of delaying radiographic PD"]
```

---

### 4.3 SOP Indication (lgg.md): Control Arm mPFS Calibration

**Problem**: Consensus assumed mPFS = 48 months from observational literature (diagnosis-based cohorts). FDA actual: 18 months. A 2.7× overestimation drove the sample size miss (650 vs 331).

**Proposed rule** (append to lgg.md `## Trial Design`):

```
### Sample Size: Control Arm mPFS Calibration
Control arm median PFS for Grade 2 IDH-mut LGG in a clinical trial setting
(observation/placebo arm) is approximately 18 months — NOT the 4-5 year median
commonly cited from observational cohorts measured from initial diagnosis.

Key differences:
- Observational PFS: from diagnosis, variable follow-up, clinical progression detection
- Clinical trial PFS: from randomization (post-surgical window), scheduled MRI q12w,
  standardized RANO-LGG criteria → earlier radiographic PD detection

Reference sample size parameters (INDIGO):
  HR = 0.6, control mPFS = 18mo, treatment mPFS = 30mo,
  164 events, N = 331, power ≥ 90%, alpha = 0.025 one-sided
[grounding: INDIGO NDA218784 AG881-C-004; FDA Multi-Discipline Review]
```

---

### 4.4 SOP Indication (lgg.md): BICR as Primary Assessor

**Proposed rule** (append to lgg.md `## Trial Design`):

```
### PFS Assessor in LGG Pivotal Trials
LGG pivotal trials should use BICR-assessed PFS as primary endpoint,
even in double-blind designs, because:
  (1) RANO-LGG criteria involve complex T2/FLAIR assessment with
      pseudoprogression/treatment-effect confounders
  (2) BICR serves dual role: PFS assessment + crossover eligibility confirmation
  (3) FDA precedent (INDIGO) used BIRC with 2-reader double-read + adjudication
Investigator-assessed PFS: pre-specified as sensitivity/secondary analysis.
[grounding: INDIGO NDA218784 — "BIRC-assessed PFS per modified RANO-LGG in the FAS"]
```

---

### 4.5 SOP Indication (lgg.md): Surgery Time Window (Existing Rule Validation)

The existing lgg.md rule ("≥1 year ≤5 years") matches the FDA actual (INDIGO: "most recent surgery ≥1 year and ≤5 years before randomization"). The consensus overrode this to ≥4 weeks (from Solver C), but the SOP was already correct. **No change needed** — this validates the existing rule.

---

## 5. Root Cause Summary

| Rank | Impact | Root Cause | Fix |
|------|--------|-----------|-----|
| 1 | Item 6 miss (−1.0) | Control mPFS 48mo vs 18mo — observational vs trial-setting PFS confusion | LGG indication rule §4.3 above |
| 2 | Item 5 partial (−0.5) | TTNI not recognized as sole key secondary for LGG | LGG indication rule §4.2 above |
| 3 | Item 4 partial (−0.5) | SOP §4.1/§4.7 conflict on BICR for double-blind placebo trials | Core SOP clarification §4.1 + LGG rule §4.4 above |

**Total score loss**: 2.0 points (0.80 → theoretical 1.0 if all fixed)

If all 3 proposed SOP rules had been in place, the consensus agent would have:
- Used BICR as primary → Item 4 match
- Designated TTNI as sole key secondary → Item 5 match (partial → depends on TGR/FACT-Br coverage)
- Used mPFS = 18mo → Item 6 closer (N ≈ 331 if HR = 0.6; still an SDP if Phase 2 data unavailable)

Realistic recoverable score: **0.90–0.95** (Item 5 other-secondary coverage of TGR/FACT-Br still a gap; Item 6 HR assumption still an SDP without Phase 2 data).

---

## 6. Notes

1. **Solver B no-output**: Only 2/3 solvers produced output. This reduced consensus robustness but didn't cause the scored gaps (all gaps trace to SOP/knowledge gaps, not solver count).

2. **SDP quality**: The consensus flagged 5 SDPs, all legitimate. SDP-02 (PFS assessor) and SDP-03 (HR/sample size) correspond exactly to the partial/miss items. The SDP mechanism worked as designed — the issue is that the "default" path chosen by the consensus was wrong, not that the uncertainty was unrecognized.

3. **Judge B reliability**: Judge B had a summary statistics counting error (reported match=4 instead of actual match=6) and one rubric application error (Item 10). Judge B's item-by-item analysis text was otherwise sound. Recommend implementing automated score-counting validation in the judge pipeline to prevent summary mismatches.
