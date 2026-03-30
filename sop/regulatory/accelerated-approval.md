---
version: 1.0
source: sop.md v2.2 split
rule_count: 2
---

# Accelerated Approval

> version: 1.0 | source: sop.md v2.2 split

## Trial Design

### AA Endpoints and Design Requirements

IF regulatory_pathway == "Accelerated Approval":
→ Primary endpoint: ORR (BICR, RECIST 1.1) + DOR
→ ORR 95% CI lower bound > historical benchmark (benchmark varies greatly by indication/line of therapy)
→ Sample size 50-200 patients
→ Pre-specify Bayesian predictive probability for ongoing futility monitoring
→ Confirmatory trial must be initiated at time of NDA submission (assessing direct clinical benefit such as OS/EFS)
→ skip control_arm, skip stratification

### Confirmatory Trial Requirements

IF regulatory_pathway == "Accelerated Approval":
→ Confirmatory trial design must be agreed upon with FDA at time of NDA submission
→ Ideally confirmatory trial is already underway
→ Enrollment and completion timelines must be specified

## SAP Design

<!-- Append rules here during training (section-append convention) -->
