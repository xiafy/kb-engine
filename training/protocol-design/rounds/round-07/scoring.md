# Judge A Scoring — Round 07

> **Drug:** Voranigo (vorasidenib) — IDH-Mutant Low-Grade Glioma  
> **FDA NDA:** NDA218784 | **Pivotal Study:** AG881-C-004 (INDIGO, NCT04164901)  
> **Scoring Date:** 2026-04-01  
> **Rubric Version:** v2.0

---

## Scoring Summary

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | design_type | **match** | AI: Phase 3, randomized, double-blind, placebo-controlled, 2-arm, superiority / FDA: Phase 3, global, multicenter, randomized, double-blind, placebo-controlled, 1:1. Design architecture identical (RCT, parallel, double-blind, placebo control). Randomization ratio (1:1) is an operational detail not scored per Item 1 rubric. |
| 2 | control_arm | **match** | AI: Placebo (replaces active surveillance), crossover allowed upon centrally confirmed PD / FDA: Placebo (vorasidenib-matched placebo), crossover allowed upon centrally confirmed radiographic PD by BIRC. Both placebo-controlled with identical crossover mechanism at PD. Direction and mechanism identical. |
| 3 | primary_endpoint | **match** | AI: PFS per RANO-LGG 2017 criteria / FDA: BIRC-assessed PFS per modified RANO-LGG. Per rubric Item 3: "只评终点的类型名称" — both PFS. Assessment method (BICR vs INV) belongs to Item 4. Endpoint type name identical. |
| 4 | endpoint_definition | **partial** | AI: Investigator-assessed PFS primary, BICR as sensitivity; censoring at last adequate assessment if new anti-cancer therapy starts before progression / FDA: BIRC-assessed PFS (central confirmation), censoring at date of last disease assessment. Assessment method differs (BICR primary vs INV primary) — this is a key difference per rubric Item 4. Event definition and RANO-LGG criteria align. |
| 5 | secondary_endpoints | **partial** | FDA key secondary: TTNI (sole key secondary). FDA other secondaries: TGR, OR (BOR, TTR, DOR), OS, HRQOL, PFS per Investigator. AI: Hierarchical: OS → Time to Next Intervention → ORR → DOR → PRO-TTCD. Key secondary coverage: TTNI mentioned but not prioritized as sole key secondary; OS elevated above TTNI in hierarchy. Key coverage <100% (TTNI not sole key; OS hierarchy reversed). Other coverage: ORR, DOR, OS, PFS captured; TGR, HRQOL, FACT-Br not mentioned (~50% other coverage). |
| 6 | sample_size | **miss** | AI: N=650 (325/arm), 194 events / FDA: N=331 enrolled, 164 PFS events target. Deviation = |650-331|/331 = 96.4%. FDA N < 300 (331 is borderline medium), threshold for miss is >50% for medium trials. 96% >> 50%. Consensus was more conservative (HR=0.65, longer mPFS=48mo) vs FDA actual (HR=0.6, mPFS placebo=18mo, treatment=30mo). Actual FDA assumptions were more optimistic. |
| 7 | stat_framework | **match** | AI: Stratified Cox; hierarchical testing (gatekeeping); 2 IAs (OBF spending) / FDA: Stratified Cox PH; stratified log-rank; fixed-sequence testing; 3-look group-sequential (Gamma family). Per rubric Item 7判例库: "Hierarchical testing = Graphical approach (gatekeeping) = match"; "GSD with O'Brien-Fleming = GSD with Lan-DeMets = match" — both group-sequential, both hierarchical/fixed-sequence multiplicity control. Number of IAs (2 vs 3) is spending function detail, not framework difference per rubric. |
| 8 | stratification | **match** | AI: 1p/19q co-deletion status + baseline tumor size (≥2cm vs <2cm T2/FLAIR) / FDA: 1p19q status (co-deleted vs not co-deleted) + baseline tumor size (longest diameter ≥2cm vs <2cm). Two stratification factors, clinical meaning identical (1p19q molecular status + tumor size prognostic factor). Coverage = 100% (2/2). |
| 9 | eligibility | **match** | AI: ≥12 years; Grade 2 IDH-mut glioma; post-surgery ≥4 weeks to ≤5 years; no prior RT/chemo; ECOG 0–1 / FDA: Age ≥12, weight ≥40kg; Grade 2 IDH-mut glioma; prior surgery ≥1 year and ≤5 years; no prior chemo/RT; not in immediate need of chemo/RT. 3 subdimensions: (1) Biomarker: IDH-mutant Grade 2 glioma = match; (2) Treatment line: no prior chemo/RT (observation-replacement) = match; (3) Key exclusion: prior chemo/RT excluded = match. Surgery timing window differs (≥4 weeks vs ≥1 year lower bound) but this is detail within same eligibility philosophy. ≥2/3 subdimensions aligned. |
| 10 | operational | **match** | Per rubric Item 10 (narrowed to 3 subdimensions): 1) Geographic scope: AI "Global (US/EU/Asia)" / FDA "global, multicenter" = match; 2) Biomarker detection: AI "Central testing required; local CLIA acceptable" / FDA "central laboratory testing; available 1p19q status by local testing using accredited laboratory" = match (both central+local hybrid); 3) Dosing regimen: AI oral daily dosing (implied) / FDA "orally QD" — not explicitly detailed in consensus but aligned. ≥2/3 subdimensions aligned. |

---

## Scoring Statistics

```
match: 7 | partial: 2 | miss: 1 | skip: 0
match_score: 7/10 = 0.70
weighted_score: (7 + 2*0.5)/10 = 8/10 = 0.80
```

---

## Detailed Rationale by Item

### Item 1: design_type — MATCH
**FDA Review text**: "Phase 3, global, multicenter, randomized, double-blind, placebo-controlled study. Eligible subjects were randomized in a 1:1 ratio to receive vorasidenib or vorasidenib-matched placebo orally QD."

**Consensus**: "Phase 3, randomized, double-blind, placebo-controlled, 2-arm, international multicenter, superiority"

**Analysis**: Design architecture completely aligned — both RCT, parallel-arm, double-blind, placebo-controlled. Randomization ratio (1:1) is explicitly excluded from Item 1 scoring per rubric ("不评什么: 随机化比例").  
**Score: match**

---

### Item 2: control_arm — MATCH
**FDA Review text**: "Placebo (vorasidenib-matched placebo) administered orally QD. Subjects randomized to placebo who achieved centrally confirmed radiographic progressive disease (PD) by BIRC were unblinded and allowed to cross over to receive vorasidenib"

**Consensus**: "Placebo (replaces active surveillance for low-risk IDH-mut LGG); crossover upon centrally confirmed disease progression"

**Analysis**: Both placebo-controlled with crossover mechanism at PD. Scientific rationale aligns (observation-replacement SOC). Direction and mechanism identical.  
**Score: match**

---

### Item 3: primary_endpoint — MATCH
**FDA Review text**: "BIRC-assessed progression-free survival (PFS) per modified Response Assessment in Neuro-Oncology for Low-Grade Gliomas (RANO-LGG) in the Full Analysis Set (FAS)"

**Consensus**: "PFS per RANO-LGG 2017 criteria, investigator-assessed (BICR as pre-specified sensitivity)"

**Analysis**: Per rubric Item 3: "只评终点的类型名称" — both PFS. Assessment method (BICR vs INV) explicitly belongs to Item 4 per rubric hard boundary: "评估方法（BICR vs INV）→ Item 4". Endpoint type name is identical.  
**Score: match**

---

### Item 4: endpoint_definition — PARTIAL
**FDA Review text**: "Time from date of randomization to the date of first occurrence of centrally confirmed radiographic PD by modified RANO-LGG assessed by the BIRC, or death from any cause, whichever occurred earlier. Subjects without confirmed radiographic PD or death were censored at the date of the last disease assessment."

**Consensus**: "Investigator-assessed PFS as primary (per SOP default for double-blind), BICR as pre-specified sensitivity analysis... Time from randomization to radiographic progression or death; treatment policy estimand (ITT); pre-specified censoring rules"

**Analysis**: Per rubric Item 4:评估方法 (BICR vs INV) and 评估标准 both scored. Key divergence: FDA uses BIRC (BICR) as primary assessor; consensus uses investigator-assessed as primary with BICR as sensitivity. This is a significant method difference per rubric "partial = 其中一个一致另一个不同". RANO-LGG criteria align (standard vs modified is minor wording). Event definition aligns (progression or death).  
**Score: partial**

---

### Item 5: secondary_endpoints — PARTIAL
**FDA Review key secondaries**: TTNI (sole key secondary, tested in fixed-sequence after PFS)  
**FDA Review other secondaries**: TGR, OR (BOR, TTR, DOR), OS, HRQOL (FACT-Br), PFS per Investigator

**Consensus hierarchy**: OS → Time to Next Intervention → ORR → DOR → PRO-TTCD; TTMT and safety as additional

**Analysis**: 
- Key secondary coverage: FDA has TTNI as sole key secondary. AI mentions TTNI ("Time to Next Intervention") but places OS higher in hierarchy. This is a key secondary hierarchy inversion — TTNI is not recognized as the sole key secondary.
- Other secondary coverage: AI captures OS, ORR, DOR, PFS per Investigator (implied), TTNI. Missing: TGR, HRQOL/FACT-Br specifically. PRO-TTCD is AI addition not in FDA list.
- Per rubric: "强制规则: 遗漏任何一个关键次要终点 → 最高只能给 partial". TTNI is mentioned but hierarchy differs (OS elevated above TTNI). Other coverage ~50% (3/6: OR, OS, PFS; missing TGR, HRQOL, fact-specific instrument).  
**Score: partial**

---

### Item 6: sample_size — MISS
**FDA Review**: "Enrolled: 331 patients randomized... 164 PFS events required"

**Consensus**: "Total enrollment: N = 650 (325 per arm)... Events required: ~194 progression/death events"

**Analysis**: 
- Deviation rate = |650-331|/331 = 96.4%
- FDA N=331 falls in 100≤N<300 (medium trial) per rubric thresholds
- Medium trial miss threshold: >50% deviation
- 96.4% >> 50% → miss

The divergence stems from different HR assumptions: FDA assumed HR=0.6 (more optimistic effect), consensus assumed HR=0.65 (more conservative). FDA control mPFS=18mo, consensus=48mo.  
**Score: miss**

---

### Item 7: stat_framework — MATCH
**FDA Review**: "1-sided stratified log-rank test at significance level of 0.025... Stratified Cox PH model... Group-sequential design: 3 prespecified analyses... Gamma family (−24) for efficacy boundaries... Fixed-sequence testing procedure — TTNI tested only if PFS reached statistical significance"

**Consensus**: "Stratified Cox; hierarchical testing; 2 IAs (OBF spending)... Fixed-sequence testing (gatekeeping)... stratified log-rank"

**Analysis**: Per rubric Item 7判例库:
- "Hierarchical testing = Graphical approach (gatekeeping) = match" ✓
- "GSD with O'Brien-Fleming = GSD with Lan-DeMets = match" ✓ (both group-sequential)

Both use stratified Cox, hierarchical/fixed-sequence multiplicity control, group-sequential design with spending functions. Number of looks (2 vs 3) is a spending function detail, not framework difference per rubric. Both superiority designs.  
**Score: match**

---

### Item 8: stratification — MATCH
**FDA Review**: "Randomization was stratified by: 1) Local 1p19q status: co-deleted or not co-deleted; 2) Baseline tumor size per local assessment: longest diameter ≥2 cm or <2 cm"

**Consensus**: "1p/19q co-deletion status + baseline tumor size (≥2cm vs <2cm T2/FLAIR)"

**Analysis**: Both stratification factors align perfectly in clinical meaning: 1p19q molecular status (strongest prognostic) + tumor size (≥2cm threshold). Coverage = 2/2 = 100%.  
**Score: match**

---

### Item 9: eligibility — MATCH
**FDA Review key elements**: Grade 2 IDH-mut glioma; prior surgery ≥1 year and ≤5 years; no prior chemo/RT; not in immediate need of chemo/RT; age ≥12

**Consensus**: Grade 2 IDH-mut glioma; post-surgery ≥4 weeks to ≤5 years; no prior RT/chemo; ECOG 0–1; age ≥12

**Analysis** per rubric Item 9 (3 subdimensions):
1. **Biomarker**: IDH-mutant Grade 2 glioma — both require this ✓
2. **Treatment line**: No prior chemo/RT (observation-replacement population) — both align ✓  
3. **Key exclusion**: Prior chemo/RT excluded — both align ✓

Surgery timing lower bound differs (≥4 weeks vs ≥1 year) but this falls within same eligibility philosophy (post-surgical observation window). ≥2/3 subdimensions aligned.  
**Score: match**

---

### Item 10: operational — MATCH
**FDA Review**: "BIRC... double-blind throughout... MRI every 12 weeks... crossover permitted... global, multicenter"

**Consensus**: "Global (US/EU/Asia); CDx co-development; BICR central review; DSMB; pediatric ≥12 included"

**Analysis** per rubric Item 10 narrowed scope (3 subdimensions):
1. **Geographic scope**: AI "Global (US/EU/Asia)" / FDA "global, multicenter" — match ✓
2. **Biomarker detection**: AI "Central testing required; local CLIA acceptable" / FDA "central laboratory testing; available 1p19q status by local testing using accredited laboratory" — match (both hybrid central+local) ✓
3. **Dosing regimen**: AI oral daily (implied by QD consensus context) / FDA "orally QD" — aligned (not contradicted) ✓

≥2/3 subdimensions aligned per rubric match criteria.  
**Score: match**

---

## Final Scores

| Metric | Value |
|--------|-------|
| **match** | 7 |
| **partial** | 2 |
| **miss** | 1 |
| **skip** | 0 |
| **match_score** | 0.70 (7/10) |
| **weighted_score** | 0.80 ((7+1)/10) |

---

## Judge Notes

1. **Key divergence**: Primary endpoint assessor (Item 4) — FDA used BICR as primary; consensus followed SOP default for double-blind trials (investigator primary). This reflects a legitimate protocol design decision point (SDP-02 flagged in consensus).

2. **Sample size (Item 6)**: Consensus was intentionally conservative (HR=0.65, mPFS=48mo) vs FDA actual (HR=0.6, mPFS placebo=18mo). The 96% deviation reflects different risk tolerances — consensus prioritized power protection; FDA had Phase 2 data supporting larger effect.

3. **Secondary endpoints (Item 5)**: Hierarchy inversion — FDA prioritized TTNI as sole key secondary; consensus elevated OS. Both clinically valid approaches; FDA's TTNI-first reflects LGG-specific clinical meaningfulness argument in review.

4. **Overall assessment**: Strong convergence on design architecture (Items 1,2,7,8), with divergence in effect size assumptions (Item 6) and endpoint assessment method (Item 4) — both areas where sponsor-FDA dialogue would naturally occur.
