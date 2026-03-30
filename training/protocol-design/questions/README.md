# Training Loop Questions — 标准化题目库

## 目的

从 FDA Review 中提取最小化"初始条件"，供 AI 独立设计 Protocol + SAP。

## 题目模板

每个题目包含以下字段（即 AI "做题"时唯一可用的输入）：

| 字段 | 说明 | 来源 |
|------|------|------|
| drug_name | 商品名 + 通用名 | Review 首页 |
| sponsor | 申办方 | Review 首页 |
| moa | 作用机制（一句话） | Product Introduction |
| formulation | 剂型 + 给药途径 | Review 首页 |
| indication | 适应症（一句话） | Applicant Proposed Indication |
| target_population | 目标人群描述 | Therapeutic Context |
| line_of_therapy | 治疗线数 | Therapeutic Context |
| biomarker_requirement | 生物标志物要求（如有） | Indication/Population |
| disease_background | 流行病学 + 疾病特征（3-5 句） | Analysis of Condition |
| current_soc | 当前标准治疗（简述） | Analysis of Current Treatment |
| unmet_need | 未满足的医学需求（1-2 句） | Analysis of Condition |
| regulatory_pathway | NDA/BLA + Standard/Priority/Accelerated | Review 首页 |
| app_number | 申请号 | Review 首页 |
| approval_year | 获批年份 | Review 首页 |

## ⚠️ 禁止包含

- 试验设计（randomization, arms, blinding）
- 主要/次要终点
- 样本量
- 统计方法
- 试验结果
- FDA 的具体评价

## 文件命名

`{序号:02d}-{drug_name_lower}.md`（如 `01-inluriyo.md`）

## 案例清单

| # | Drug | Indication | App# | Year |
|---|------|-----------|------|------|
| 01 | Inluriyo | ER+/HER2- BC (ESR1m) | NDA218881 | 2025 |
| 02 | Hernexeos | HER2m NSCLC | NDA219042 | 2025 |
| 03 | Hyrnuo | HER2m NSCLC | NDA219972 | 2025 |
| 04 | Datroway | HR+/HER2- BC | BLA761394 | 2025 |
| 05 | Vyloy | CLDN18.2+ Gastric | BLA761365 | 2024 |
| 06 | Retevmo | RET+ Thyroid/NSCLC | NDA213246 | 2020 |
| 07 | Orserdu | ER+/HER2- BC | NDA217639 | 2023 |
| 08 | Truqap | HR+/HER2- BC | NDA218197 | 2023 |
| 09 | Komzifti | R/R AML | NDA220305 | 2025 |
| 10 | Kimmtrak | Uveal Melanoma | BLA761228 | 2022 |
| 11 | Loqtorzi | NPC | BLA761240 | 2023 |
| 12 | Sotyktu | Psoriasis | NDA214958 | 2022 |
| 13 | Tavneos | ANCA Vasculitis | NDA214487 | 2021 |
| 14 | Airsupra | Asthma | NDA214070 | 2023 |
| 15 | Orgovyx | Prostate Cancer | NDA214621 | 2020 |
| 16 | Ogsiveo | Desmoid Tumors | NDA217677 | 2023 |
| 17 | Rytelo | MDS | NDA217779 | 2024 |
| 18 | Voranigo | Low-grade Glioma | NDA218784 | 2024 |
| 19 | Lumakras | KRAS G12C NSCLC | NDA214665 | 2021 |
| 20 | Modeyso | DIPG/DMG | NDA219876 | 2025 |
