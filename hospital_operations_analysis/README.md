# 🏥 Hospital Operations Optimization: Cost, Readmission, and Patient Outcomes Analysis

## Project Overview

This project analyzes hospital operations and patient encounter data to identify the key drivers of cost, length of stay, readmission risk, and patient satisfaction.

Using exploratory analysis, predictive modeling, and an interactive Power BI dashboard, the project demonstrates how healthcare organizations can use data to improve operational efficiency, manage risk, and support patient-centered decision-making.

## 📋 Project Type
- Descriptive Analytics
- Exploratory Data Analysis (EDA)
- Predictive Modeling
- Dashboard Development

## ⚙️ Tools Used
- **Python:** Pandas, Scikit-learn
- **Visualization:** Matplotlib, Seaborn
- **BI & Reporting:** Power BI

---

## 🎯 Business Objective

Hospitals face increasing pressure to reduce costs while maintaining quality outcomes. This project focuses  
on answering operational questions that hospital leadership routinely faces:

- Which conditions and procedures drive the highest costs?
- Which patients are most at risk for readmission?
- How do cost, outcomes, and patient satisfaction interact?
- Where should operational and clinical improvement efforts be prioritized?
- The analysis is designed to support actionable insights, not just retrospective reporting.

---

## 🧾 Dataset Overview

- **Dataset:** Synthetic hospital operations and patient outcomes data
- **Grain:** One record per hospital encounter

**Included Data Elements**
- **Patient demographics:** Age, Gender  
- **Clinical variables:** Condition, Procedure  
- **Operational metrics:** Cost, Length of Stay  
- **Quality metrics:** Readmission, Outcome, Satisfaction  

This structure enables analysis across operational, clinical, and patient experience dimensions.
---

## Key Performance Indicators (KPIs)
- Average cost per encounter
- Average length of stay (LOS)
- Readmission rate
- Outcome distribution (Recovered vs Stable)
- Average patient satisfaction score

These KPIs are surfaced prominently in the executive dashboard to enable rapid performance assessment.

---

## 🔍 Analytical Approach

### Data Preparation
- Standardized categorical values for conditions and procedures
- Created derived features, including:
   - Age groups
   - Cost buckets
   - Length-of-stay categories

These features enabled segmentation, trend analysis, and predictive modeling.

### Exploratory Data Analysis (EDA)
- EDA focused on understanding variation across conditions, procedures, and demographics:
   - Cost and LOS distributions
   - Readmission patterns by condition and procedure
   - Satisfaction trends by outcome and age group

These findings informed feature selection for modeling and dashboard design.

### Feature Engineering
- Encode categorical variables (Condition, Procedure, Gender).
- Create combined risk features if appropriate (for example, age × condition group).
- Prepare modeling datasets for:
  - Readmission prediction (Yes/No)
  - Cost or LOS regression (optional)

### Predictive Modeling
**Readmission Risk Prediction**
- **Target Variable:** Readmission (Yes or No)
- **Models:** Logistic Regression, Random Forest, Gradient Boosting
- **Evaluation Metrics:** Accuracy, precision, recall, F1 Score, ROC AUC

Feature importance analysis highlighted that age, cardiac conditions, procedure type, cost, and length of stay were the strongest predictors of readmission risk.

[Dashboard Image Placeholder: Readmission Feature Importance Chart]

 ### **Cost Prediction:**  
  - **Target Variable:** Predicted cost per encounter
  - **Models:** Linear Regression, Random Forest, Gradient Boosting
  - **Evaluation Metrics:** R², RMSE

The models identified surgery combined with chemotherapy, cardiac procedures, and cancer-related  
treatments as the largest contributors to higher predicted costs.

[Dashboard Image Placeholder: Top Drivers of Predicted Cost]


### Patient Satisfaction Modeling

**Target Variable:** Predicted satisfaction Score  
**Models:** Tree-based regressors and linear baselines  

Analysis showed that age emerged as the dominant driver of satisfaction, while clinical and procedural  
variables played a secondary role.

[Dashboard Image Placeholder: Satisfaction Feature Importance Chart]

---

## 📊 Power BI Dashboard Overview

The interactive Power BI dashboard is designed for hospital leadership, operations teams, and analysts. It  
supports both high-level monitoring and patient-level exploration.

### Executive Summary Page

- High-risk readmission percentage
- Average predicted cost
- Average predicted satisfaction
- Summary insights highlighting:
   - Cardiac conditions as primary readmission drivers
   - Surgery and chemotherapy as major cost drivers
   - Lower satisfaction scores among cardiac patients

[Dashboard Image Placeholder: Executive Summary Page]

---

### Readmissions Analysis

- Readmission probability by condition and procedure
- Feature importance for readmission prediction
- Distribution of patient readmission risk

[Dashboard Image Placeholder: Readmissions Analysis Page]

---

### Cost Drivers Analysis

- Predicted cost by condition
- Predicted cost by procedure
- Cost trends by length of stay
- Identification of the highest-cost condition and procedure combinations

[Dashboard Image Placeholder: Cost Drivers Page]

---

### Patient Satisfaction Insights

- Predicted satisfaction by age group
- Satisfaction by condition and procedure
- Feature importance explaining satisfaction predictions

[Dashboard Image Placeholder: Satisfaction Insights Page]

---

### Patient Drill-Down

- Patient-level table showing:
   - Age, condition, procedure
   - Length of stay
   - Readmission probability
   - Predicted cost
   - Predicted satisfaction
- Interactive filters for age group, condition, procedure, and LOS

This view enables analysts and care teams to explore individual risk profiles and cost drivers.

[Dashboard Image Placeholder: Patient Drill-Down Page]


---

### Key Takeaways

- Approximately 37 percent of patients are identified as high risk for readmission, with cardiac conditions
  driving the majority of risk.
- A small number of procedures account for a disproportionate share of total cost.
- Patient satisfaction varies significantly by age and condition, even when clinical outcomes are positive.
- Predictive modeling combined with interactive dashboards provides decision-makers with both
  explanatory insight and forward-looking guidance.

---

### Business Impact

This project demonstrates how healthcare operations data can be transformed into actionable insights that
support:
- Readmission reduction strategies
- Cost containment and resource planning
- Improved patient experience
- Data-informed clinical and operational decision-making

By combining exploratory analysis, predictive modeling, and executive-level dashboards, the project 
showcases a full analytics lifecycle aligned with real-world healthcare operations.
