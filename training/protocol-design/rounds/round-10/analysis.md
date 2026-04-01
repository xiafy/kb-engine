## Analysis: Kimmtrak [protocol-design] — Round 10

### Difference Classification

| Item | AI vs FDA | Code | Explanation | SOP Action? |
|------|-----------|------|-------------|-------------|
| 1. design_type | AI: 1:1 randomization / FDA: 2:1 (tebentafusp:IC) | ALT | Both ratios are legitimate for confirmatory oncology trials. SOP correctly identified this as a Strategy Decision Point. 2:1 is a sponsor choice to maximize patients on experimental arm — neither is objectively superior. | No — SDP by design |
| 2. control_arm | AI: IC from 5 options (pembro, nivo, ipi, ipi+nivo, dacarbazine/TMZ) / FDA: IC from 3 (dacarbazine, ipi, pembro) | KNOW | AI over-specified the IC menu. Nivolumab is redundant with pembrolizumab (same PD-1 class, not separately studied in mUM). Ipi+nivo combination lacks evidence base in mUM to warrant inclusion. Temozolomide not part of mUM standard practice. Core SOP §3.1 says "pre-specified 2-3 options" which FDA's 3-agent list follows exactly. | Yes — indication SOP |
| 3. primary_endpoint | Both: OS | — | Match. No analysis needed. | — |
| 4. endpoint_definition | AI: 234 events, 1 IA at 50%, one-sided α=0.025 / FDA: 250 events, 2 IAs (3-stage GSD at 60%/80%), two-sided α=0.045 | INFO | The 2-sided α=0.045 (not 0.05) arose from FDA's RAS (Rash Analysis Set) co-primary analysis that allocated α=0.005 to RAS OS, with potential transfer to ITT. This RAS mechanism was trial-specific and not inferable from the question. Event count (250 vs 234) and IA structure (3-stage vs 2-stage) are downstream of the alpha allocation. | No — info not available |
| 5. secondary_endpoints | AI: BICR-assessed PFS as key secondary / FDA: investigator-assessed PFS as key secondary | KNOW | AI over-applied SOP §4.1 BICR rule (bispecific antibody exclusion from inv-PFS exemption) to a secondary endpoint. FDA accepted inv-assessed PFS when OS was primary — the BICR mandate in §4.1 targets PFS-as-primary settings where assessor bias could determine the trial outcome. Under OS-primary, the bias risk to the trial's primary conclusion is mitigated. | Yes — core SOP |
| 6. sample_size | Both: N=378 | — | Match. No analysis needed. | — |
| 7. stat_framework | AI: 2-step hierarchy (OS→PFS), 1 IA / FDA: 3-step hierarchy (OS→PFS→BOR), 2 IAs, RAS alpha transfer | INFO | Dominant differences driven by RAS analysis population (alpha split 0.005/0.045 with transfer) which was not inferable. The 3-step hierarchy adding BOR is a minor extension. Number of IAs (1 vs 2) is a design choice, but here driven by the 3-stage GSD tied to RAS alpha strategy. | No — info not available |
| 8. stratification | Both: LDH status only, centrally measured | — | Match. No analysis needed. | — |
| 9. eligibility | Both: HLA-A*02:01 central, treatment-naïve mUM, ECOG 0-1 | — | Match. No analysis needed. | — |
| 10. operational | Both: step-up dosing 20/30/68 mcg, 16h monitoring, global multi-center | — | Match. No analysis needed. | — |

### Proposed SOP Updates

**Rule 1 — Indication SOP: IC options for mUM** (KNOW, single-case grounding)

- **Target**: `sop/indications/uveal-melanoma.md` → Trial Design section
- **Rule**: "IC control arm for mUM: 3 pre-specified agents — dacarbazine, ipilimumab, pembrolizumab. Do not include combination immunotherapy (e.g., ipi+nivo) absent mUM-specific evidence. Nivolumab is redundant with pembrolizumab (same PD-1 class). Temozolomide not standard in mUM practice."
- **Grounding**: Kimmtrak BLA761228 (single case). FDA assessment: "The comparator arm consisting of Investigator's choice of dacarbazine, ipilimumab or pembrolizumab is considered appropriate and consistent with current standard of care."
- **Confidence**: Medium — single-case but logically consistent with SOP §3.1 ("pre-specified 2-3 options") and mUM treatment landscape.

**Rule 2 — Core SOP: BICR vs investigator PFS by endpoint role** (KNOW, single-case + logical)

- **Target**: `sop/core/protocol-design.md` §4.1 or §4.7
- **Rule**: "The BICR requirement for bispecific antibodies/T-cell engagers (§4.1 exclusion) applies when PFS is the **primary** endpoint. When PFS is a key **secondary** endpoint under an OS-primary design, investigator-assessed PFS is acceptable as the primary PFS analysis method, with BICR as sensitivity analysis. Rationale: assessor bias risk to the trial's primary conclusion is mitigated when OS (objective, unbiased) is the primary endpoint."
- **Grounding**: Kimmtrak BLA761228 — FDA accepted investigator-assessed PFS as key secondary, stating PFS difference was "not clinically meaningful" but did not object to the assessment method. Single-case, but logically sound: BICR protects against bias determining the primary trial outcome; when OS is primary, this concern is structurally addressed.
- **Confidence**: Medium-high — the logic generalizes beyond this single case. However, await a second case for full confirmation.

### Rejected Rules

**Randomization ratio rule (from design_type)**: Not proposed. 1:1 vs 2:1 is inherently a Strategy Decision Point — both are valid, and the SOP already correctly handles this via SDP flagging. Mandating either ratio would over-constrain sponsor flexibility.

**3-stage GSD rule (from stat_framework/endpoint_definition)**: Not proposed. The 3-stage GSD with 2 interim analyses was driven by the RAS/ITT alpha split mechanism, which is trial-specific. The current SOP guidance on interim analysis (rare-disease.md: "may omit IA if events ≤50-60") is appropriate; the choice of 2 vs 1 IA for larger trials is a design parameter, not a SOP rule.

### Notes
- match_score: 0.50, weighted: 0.75
- delta_codes: KNOW:2, ALT:1, INFO:2
- new_rules: 2
- ⚠️ Scoring summary in scoring.md reports "partial: 4" but per-item count is 5 partial items (design_type, control_arm, endpoint_definition, secondary_endpoints, stat_framework). Weighted score should be 0.75, not 0.70. This analysis uses per-item scores as authoritative.
