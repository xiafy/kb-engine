## Consensus Answer: Vyloy [protocol-design] — Round 03 v2 (v5.1 信息隔离)

> Solvers: A (kimi) / B (minimax) / C (minimax)
> All confirmed: NO zolbetuximab/Vyloy/SPOTLIGHT/GLOW information accessed

### 1. design_type
A: open-label, 2:1 | B: double-blind, 1:1 | C: open-label, 1:1
[divergence: 3/3 各不同 → Orchestrator 仲裁]

Orchestrator 判定：**双盲、1:1、安慰剂对照**
理由：SOP §3.1 add-on design + novel mAb with IV infusion → 双盲是标准做法（安慰剂匹配 IV infusion）。A 的开放标签理由（"实际可行性"）不充分——双盲在 IV mAb+chemo 组合中完全可行。B 正确。
[arbitrated: double-blind 1:1 placebo-controlled, per Solver B]

### 2. control_arm
A: placebo + chemo (no IO) | B: placebo + chemo ± PD-1 | C: placebo + chemo (no IO)
[consensus: 2/3 chemo only, dissent: Solver B allows IO]

Adopted: **Placebo + FP/platinum chemotherapy (mFOLFOX6 or CAPOX), no IO**
⚠️ SDP: IO in control arm flagged by all 3 Solvers as strategic decision point.

### 3. primary_endpoint
A: OS only | B: co-primary OS+PFS (IUT) | C: co-primary PFS+OS (IUT)
[divergence → Orchestrator 仲裁]

Orchestrator 判定：**PFS by BICR per RECIST 1.1**（单主终点，OS 作为关键次要）
理由：SOP §4.2 oncology endpoint hierarchy "OS > PFS > ORR"，但在 1L 胃癌 mOS ~12mo 的情况下，PFS 作为主终点是标准做法（事件更快，允许更早提交 NDA）。OS 作为关键次要在层级检验中保护。Co-primary IUT 是合理但更保守的选择。
[arbitrated: PFS primary, OS key secondary hierarchical]

### 4. endpoint_definition
A: OS definition (time to death) | B: PFS BICR RECIST 1.1 + OS | C: PFS INV RECIST 1.1
Given Item 3 arbitrated as PFS primary:
**PFS by BICR per RECIST 1.1; time from randomization to progression or death; ITT; stratified log-rank**
[arbitrated: BICR per B, consistent with double-blind design]

### 5. secondary_endpoints
All 3: OS as key secondary + ORR + DOR + PRO (EORTC QLQ-C30 + STO22)
B+C include TTCD; A includes OS subgroups
**Hierarchical: PFS → OS → ORR → DOR → TTCD (PRO)**
[consensus: 3/3 on OS + ORR + DOR + PRO; hierarchy order arbitrated]

### 6. sample_size
A: N=600 (2:1) | B: N=357 (1:1) | C: N=566 (1:1)
Given 1:1 design: A's 2:1 不适用。B 的 N=357 偏小（仅 90% power for OS at HR 0.774）。C 的 N=566 更合理。
[arbitrated: N≈565 (1:1), HR 0.75 for PFS, 90% power, per Solver C]

### 7. stat_framework
A: graphical multiplicity, 2 IA (OBF) | B: IUT co-primary, IA at 50%+75% | C: IUT, IA at 70%
Given PFS primary (not co-primary): **Hierarchical testing PFS → OS, OBF alpha spending, IA for PFS+OS**
[arbitrated: hierarchical per standard oncology framework]

### 8. stratification
A: Region + Mets + Gastrectomy (3 factors) | B: Region + Mets + Gastrectomy + PD-1 use (4 factors) | C: Region + Mets + Gastrectomy + Chemo choice (4 factors)
[consensus: 3/3 on SOP 3 factors; dissent on 4th factor]

Adopted: **Region (Asia/Non-Asia) + Metastatic sites (0-2/≥3) + Prior gastrectomy (Y/N)**
Per gastric-gejc SOP exactly. 4th factor not in SOP, not adopted.

### 9. eligibility
All 3 aligned on: CLDN18.2+ (≥75% IHC 2+/3+ VENTANA central), HER2-neg, 1L, ECOG 0-1, no gastric outlet, no CNS mets, adequate organ function. B adds LVEF ≥50%.
[consensus: 3/3]

### 10. operational
All 3: global (Asia ~40-50%+), central CLDN18.2 IHC (VENTANA CDx), screen failure ~60%.
A: 100mg flat dose Q2W? | B: 100mg flat dose Q2W-Q3W | C: 100mg flat dose Q2W
Dosing from question: "100mg IV infusion" — but actual dose regimen not specified in question.
[consensus: 3/3 on geography + CDx + global enrollment]
[note: dosing regimen uncertain — question only says "100mg formulation", not dose/schedule]
