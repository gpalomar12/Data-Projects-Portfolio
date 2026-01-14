# 📊 Hospital Operations Analysis  
>Delivered insights that support cost containment, readmission risk reduction, and operational performance improvements.

An end-to-end analytics project analyzing hospital operations, costs, readmissions, and patient outcomes to support operational and clinical decision-making.  


## 🚀 Overview
> This project examines key hospital operational metrics, including patient admissions, length of stay, readmissions, cost drivers, and patient satisfaction.  

The objective is to transform raw hospital encounter data into actionable insights that help healthcare leaders improve efficiency, reduce costs, and enhance the quality of care.


## 🎯 Business Objective

Hospitals face increasing pressure to control costs while maintaining high-quality outcomes. This analysis  
focuses on answering core operational questions such as:
- Which conditions and procedures drive the highest costs?
- Which patients are most at risk for readmission?
- How do cost, outcomes, and patient satisfaction interact?
- Where should operational and clinical improvement efforts be prioritized?
- The analysis is designed to support decision-making, not just retrospective reporting.


## 📊 Data Overview

**Dataset**
- Synthetic hospital operations and patient outcomes data
- Grain: One record per hospital encounter

 >Data includes 985 hospital encounters covering multiple conditions and procedures.

**Data Source:** The data was downloaded from Kaggle.com
  
**Key Data Elements**
- Patient demographics: age, gender
- Clinical variables: condition, procedure
- Operational metrics: cost, length of stay
- Quality metrics: readmission, outcome, satisfaction score

**Data Preparation**

- Standardized categorical values
- Cleaned and validated datetime fields
- Removed incomplete records
- Derived features such as age groups, cost buckets, and length-of-stay categories




## 🔍 Analytical Approach  
The project follows a structured analytics workflow:
1. Data ingestion, validation, and cleaning
2. Exploratory data analysis to identify trends and outliers
3. Feature engineering for operational and risk segmentation
4. Predictive modeling for readmission risk, cost, and satisfaction
5. Executive-level reporting through interactive dashboards
Full technical implementation is available in the linked notebooks.


## 📈 Key Insights
- A small number of conditions and procedures account for a disproportionate share of total hospital
  costs, indicating clear opportunities for targeted cost management and process optimization.
- Approximately 37 percent of patients are identified as high risk for readmission, with cardiac-related
  cases consistently drive the highest risk. This highlights the need for focused care coordination and
  early intervention strategies.
- Length of stay varies significantly across departments and procedures, suggesting inconsistencies in
  patient throughput and opportunities to standardize care pathways.
- Patient satisfaction shows meaningful variation by age group and condition, even when clinical outcomes
  are similar. This indicates that operational and experience factors play a critical role alongside
  clinical effectiveness.
- Predictive risk segmentation enables hospital leadership to prioritize resources, proactively manage
  high-risk patients, and align operational planning with patient demand.


## 📊 Power BI Dashboard Overview

The interactive Power BI dashboard is designed for hospital leadership, operations teams, and analysts.  
It supports both high-level monitoring and detailed patient-level exploration.

### Executive Summary Page

- High-risk readmission percentage
- Average predicted cost
- Average predicted satisfaction
- Key insight highlights for leadership review
  
<img width="1331" height="768" alt="Executive_Page_Dashboard" src="https://github.com/user-attachments/assets/18e2f83a-115b-4b56-9aed-f9d88259dab5" />  

  
Power BI dashboard providing an executive-level view of cost trends, length of stay, and readmission risk,  
and patient satisfaction to support operational decision-making.

### Readmission Analysis
- Readmission probability by condition and procedure
- Feature importance for readmission prediction
- Distribution of patient risk profiles

<img width="1326" height="767" alt="Readmissions_Page_Dashboard" src="https://github.com/user-attachments/assets/4142211c-f764-4ea2-8f02-315b0d4577f7" />  


**Readmission Risk Segmentation**
  
Patient segmentation by readmission risk category, showing a high concentration of risk among  
cardiac-related cases and supporting targeted intervention strategies.

---

### Cost Drivers Analysis

- Predicted cost by condition and procedure
- Cost trends by length of stay
- Identification of the highest-cost condition and procedure combinations

<img width="1329" height="765" alt="Cost_Drivers_Page_Dashboard" src="https://github.com/user-attachments/assets/8e3d47fb-894a-487a-980c-9d1398639882" />  

**Cost Drivers by Condition**  

Total hospital cost distribution by condition, revealing a small number of diagnoses responsible  
for a disproportionate share of overall spend.

---

### Patient Satisfaction Insights

- Predicted satisfaction by age group
- Satisfaction trends by condition and procedure
- Feature importance explaining satisfaction drivers
  
<img width="1323" height="762" alt="Satisfaction_Page_Dashboard" src="https://github.com/user-attachments/assets/f9535929-868d-4fa6-ab81-17c13fa03770" />  

**Patient Satisfaction by Demographics**  

Comparison of patient satisfaction scores by age group and condition, demonstrating variability  
driven by operational and experience factors rather than clinical outcomes alone.


---

### Patient Drill-Down

- Patient-level table showing:
   - Patient-level view including age, condition, procedure, LOS
   - Predicted readmission risk, cost, and satisfaction
   - Interactive filters for targeted exploration
   

<img width="1325" height="760" alt="Patient_Drill_Down_Page_Dashboard" src="https://github.com/user-attachments/assets/51a136c3-4dd6-40a4-a348-08ecfdeb5980" />


---

## 🧰 Tech Stack
|Component|Tool|
|---------|---------|
|Data Processing| Python (Pandas, Numpy)|
|Visualizations| Matplotlib, Seaborn, Plotly|
|BI tools| Power BI|
|Notebook| Jupyter Notebook|
|Version control| Git & GitHub|

## ⚙️ How It Works

1. Load raw hospital encounter data
2. Clean and standardize data fields
3. Engineer operational and risk features
4. Perform exploratory analysis and modeling
5. Surface insights through executive dashboards


## 📓 Project Notebooks
- Phase 1. Data Cleaning and Initial EDA
  Covers ingestion, validation, cleaning, and demographic analysis.
[Phase 1](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/hospital_operations_optimization.ipynb)
- Phase 2. Advanced EDA 
  Covers feature engineering and insight generation.
[Phase 2](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/eda.ipynb)
- Phase 3. Predictive Modeling
  [Phase 3](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/modeling.ipynb)

Refer to the notebooks for full code, visualizations, and model details.


## 💼 Business Impact
This project demonstrates how hospital operations data can be transformed into actionable insights that  
support:
- Readmission reduction strategies
- Cost containment and resource planning
- Improved patient experience
- Data-informed clinical and operational decision-making

By combining exploratory analysis, predictive modeling, and executive-level dashboards, the project  
showcases a full analytics lifecycle aligned with real-world healthcare operations.

