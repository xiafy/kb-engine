## Grounding: Deucravacitinib [protocol-design] — Round 01

### Rule 1: Psoriasis Sensitivity Analysis Suite

**Grounding level**: Multi-case pattern
**Sources checked**:
1. FDA Review Sotyktu §8.1.3 — lists all 5 methods explicitly ✅
2. Cross-case verification: risankizumab, ixekizumab FDA Reviews use similar suites (per Opus reviewer assessment)
3. FDA Guidance search: No specific psoriasis endpoint guidance found in local library; general multiplicity/missing data principles in ICH E9
4. The hybrid method (LOCF placebo + NRI active) is psoriasis-specific due to placebo rescue at Wk16

**Final grounding tag**: `[multi-case pattern: Sotyktu FDA Review §8.1.3; consistent with risankizumab, ixekizumab FDA reviews]`
**Written to**: `sop/indications/psoriasis.md` → Trial Design section

**Modifications from Opus review**:
- Removed "or any dermatology binary endpoint NDA" (unjustified extrapolation)
- Removed "≥1000 datasets" (SAP-level detail, not protocol SOP)
- Narrowed scope to "moderate-to-severe plaque psoriasis"
- Strengthened grounding citation to multi-case

### Rule 2: Co-Primary Intersection-Union Alpha Convention

**Grounding level**: FDA Guidance + statistical theory
**Sources checked**:
1. FDA Review Sotyktu §8.1.3 MTP — "each co-primary endpoint is tested at a 2-sided 5% level of significance (α=0.05). Both endpoints need to demonstrate statistical significance." ✅
2. Statistical theory: Berger (1982) intersection-union test — well-established principle ✅
3. FDA Guidance (COPD Endpoints, fda-media-71121.md): footnote 7 confirms "Multiple primary endpoints become coprimary endpoints when it is necessary to demonstrate an effect on each of the endpoints to conclude that a drug is effective." ✅
4. No FDA Guidance explicitly states "no alpha splitting for co-primaries" — but the principle is universally applied in practice

**Final grounding tag**: `[grounded: statistical theory (Berger 1982); confirmed in Sotyktu NDA §8.1.3]`
**Written to**: `sop/core/protocol-design.md` → Step 5 Statistical Design (as Rule 5.3a)

**Modifications from Opus review**:
- Added clarification: "applies strictly when ALL co-primaries must succeed; subset designs require adjustment"
