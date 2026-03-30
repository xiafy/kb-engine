# My Answer: Inluriyo (Imlunestrant) [protocol-design]

## 1. 入排标准合理性

- ≥18岁，ER+(IHC≥1%)/HER2-，组织学确认
- ESR1突变：ctDNA-based NGS检测（非组织IHC）
- 局部晚期不可切除或转移性乳腺癌
- 既往≥1线内分泌治疗（含CDK4/6i联合方案）；既往化疗≤1线
- 允许既往CDK4/6i（作为分层因子）
- ECOG PS 0-2
- RECIST 1.1至少一个可测量病灶
- 排除：HER2+或TNBC、未控制脑转移、既往SERD类药物、QTc延长
- 5维度评分全✅（统计有效性高/入组可行/临床有效/FDA可接受）

## 2. 终点选择

- **Co-primary PFS**：ESR1-mut亚组(α=0.02) + ITT(α=0.005)，BICR评估
- 关键次要：OS(ESR1-mut→ITT→ORR→CBR→DoR→PRO-TTCD)
- OS即使非主要也预设分析计划
- PRO用TTCD形式（EORTC QLQ-C30 + BR45）
- Estimand 5属性定义：后续治疗→截尾；死亡→计入事件

## 3. 对照组设计

- 开放标签RCT，1:1随机
- 对照：IC of Endocrine Therapy（fulvestrant/AI/elacestrant预设列表）
- 研究者随机化前预先选定对照药物
- 不设安慰剂（有活性SOC）

## 4. 分层因素

4个因子：
1. ESR1突变状态（突变 vs 野生型）
2. 既往CDK4/6i治疗（是 vs 否）
3. 内脏转移（有 vs 无）
4. 地区（北美/欧洲 vs 亚太 vs 其他）

## 5. 样本量逻辑

- ESR1-mut: HR=0.61, 90% power, α=0.02双侧, ~220事件, N≈330
- ITT: HR=0.70, 90% power, α=0.005双侧, ~380事件, N≈600（驱动总样本量）
- 总样本量~600, ESR1-mut≥280-300
- 1次期中分析(~60%事件), O'Brien-Fleming边界

## 6. 适应症特定设计

- ctDNA NGS ESR1检测（血液，非组织活检），筛选期采血
- 伴随诊断CDx同步开发
- Co-primary设计：ESR1-mut + ITT双人群
- 开放标签豁免：非细胞毒口服ER拮抗剂，同类药物机制，inv-PFS bias较小（但仍用BICR）

## 7. FDA 先例一致性

- 与EMBER-3（elacestrant）高度一致：co-primary PFS, alpha分配, ctDNA NGS, IC of ET, 开放标签+BICR
- 单一pivotal试验可支持regular approval

## 8. 安全性监测

- IDMC每6个月审查
- LFT基线+每周期（肝毒性）
- ECG定期（QTc延长）
- 非新型生物制剂→不需step-up dosing/CRS/ICANS管理
- NCI CTCAE v5.0

## 9. COA 选择

- EORTC QLQ-C30 + BR45（TTCD形式，≥10分下降+确认）
- BPI-SF（疼痛）
- EQ-5D-5L（卫生经济学）
- eCOA采集，每周期前6个月后每2周期

## 10. 统计方法框架

- Graphical Approach多重性控制（ESR1-mut PFS→ITT PFS→OS→ORR）
- Alpha总量0.025单侧
- Stratified log-rank + stratified Cox（4个分层因子为协变量，揭盲前锁定）
- 期中分析：IA1(~60%事件有效性+无效性), IA2(~80%), 最终
- OS预设多次interim
- 分析集：ITT(主要) + ESR1-mut亚组 + Safety
