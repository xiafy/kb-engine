## Grounding: Orgovyx [protocol-design] — Round 02

### R-NEW-1: ADT primary analysis = single-arm threshold (not RCT superiority)
- **Searched**: FDA Guidance INDEX for "GnRH", "gonadotropin", "prostate", "androgen", "castration" → No dedicated FDA Guidance found
- **Searched**: DocSearch for "GnRH analog prostate castration single-arm 90%" → 0 results in Guidance collection
- **Searched**: FDA Review library for degarelix/Firmagon (2008) → Not in our collection
- **Grounding level**: Single-case (FDA-Review-Orgovyx only)
- **Evidence**: MultidisciplineR lines 8660-8680: "the preferred FDA approach to evaluation of GnRH analogues is to consider only whether the single investigational arm demonstrates attainment of a castrate (<50 ng/dL) testosterone level"
- **Note**: The FDA Review references a "FDA draft guidance on developing gonadotropin-releasing hormone analogues" which we don't have in our library. This Guidance would elevate grounding to L1 (Guidance-level) if obtained.

### R-NEW-2: KM cumulative probability (not binary proportion) for castration rate
- **Grounding level**: Single-case (FDA-Review-Orgovyx)
- **Evidence**: MultidisciplineR lines 8720-8740: "cumulative probability of testosterone suppression to < 50 ng/dL... was estimated for each treatment group using the Kaplan-Meier method. The 95% CI for the Kaplan-Meier estimation was calculated using the exponential Greenwood formula via log-log transformation of the survival function."

### R-NEW-3: Age stratification cutoff ≤75/>75
- **Grounding level**: Single-case (FDA-Review-Orgovyx)
- **Evidence**: MultidisciplineR line 1079: "age (≤75 years old or >75 years old)"

### R-NEW-4: Taxane and brain met exclusions
- **Grounding level**: Single-case (FDA-Review-Orgovyx)
- **Evidence**: MultidisciplineR eligibility section: "Patients previously treated with taxanes or expected to receive taxanes within 2 months... were excluded" + "excluding metastases to the brain"

### Action Item
⚠️ Obtain FDA draft guidance "Developing Gonadotropin-Releasing Hormone Analogues for Patients with Advanced Prostate Cancer" — this would upgrade R-NEW-1 and R-NEW-2 from [single-case] to [grounded: FDA-Guidance].
