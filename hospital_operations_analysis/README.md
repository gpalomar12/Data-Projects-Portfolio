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

## 📊 Dashboard Plan

The dashboard will be structured to support hospital operations and leadership decisions. Proposed pages:

### Page 1: Operations Overview
- High-level KPIs:
  - Average Cost
  - Average LOS
  - Readmission Rate
  - Average Satisfaction
- Bar charts:
  - Cost by Condition
  - LOS by Condition
- Filters:
  - Condition, Procedure, Age Group, Gender

### Page 2: Cost and Length of Stay Analysis
- Box plot or bar chart:
  - Cost by Procedure
- Scatterplot:
  - Length of Stay vs Cost, colored by Condition
- Table:
  - Top 10 most expensive condition–procedure combinations

### Page 3: Readmission and Outcomes
- Bar chart:
  - Readmission Rate by Condition
- Stacked bar:
  - Outcome (Recovered vs Stable) by Condition or Age Group
- Feature importance chart (imported / static):
  - Top predictors of readmission
- Filter panel:
  - Age Group, Gender, Condition

### Page 4: Patient Satisfaction
- Bar or line chart:
  - Satisfaction score by Condition and Procedure
- Comparison:
  - Satisfaction vs Outcome
- Highlight:
  - Conditions with good clinical outcomes but lower satisfaction

---

## 🤖 Modeling Plan

### Readmission Prediction Model

**Objective:**  
Identify patients at higher risk of readmission based on demographics, condition, procedure, cost, and LOS.

**Target Variable:**  
`Readmission` (Yes/No)

**Features (examples):**
- Age (and Age Group)
- Gender
- Condition
- Procedure
- Cost
- Length_of_Stay
- Outcome (if using only predictors available at discharge, exclude any post-discharge values)

**Steps:**
1. Encode categorical features using one-hot or label encoding.
2. Split data into training and test sets.
3. Train baseline logistic regression model.
4. Compare with tree-based models:
   - Random Forest
   - Gradient Boosting (e.g., XGBoost or similar, if available)
5. Evaluate performance with:
   - Accuracy
   - Precision
   - Recall
   - F1 Score
   - Confusion matrix
6. Extract and visualize feature importance.
7. Translate model insights into plain language:
   - For example, “Stroke and Heart Attack patients with longer stays show higher readmission risk.”

### Cost or LOS Regression Model (Optional)

**Objective:**  
Understand which factors drive higher costs or longer stays.

**Target Variable:**
- `Cost` or `Length_of_Stay`

**Features (examples):**
- Age, Gender
- Condition, Procedure
- Readmission (if used as an explanatory signal)
- Outcome

**Steps:**
1. Handle skewness (log-transform cost if heavily skewed).
2. Train Linear Regression as a baseline.
3. Train Random Forest Regressor or Gradient Boosting Regressor.
4. Evaluate with:
   - R²
   - RMSE
5. Visualize feature importance to show cost drivers.

---

## 🧠 Key Deliverables

- Cleaned and well-documented dataset  
- EDA notebook with visualizations and narrative commentary  
- Predictive model notebooks with evaluation and feature importance  
- Tableau or Power BI dashboard (with screenshots)  
- Project README and executive summary highlighting business impact  

---

## 🔚 Closing Statement

This project demonstrates how hospital operations data can be transformed into actionable insights that support cost control, quality improvement, and patient-centered care. By combining exploratory analysis, predictive modeling, and interactive dashboards, it showcases the full analytics lifecycle from raw data to strategic recommendations.

---

