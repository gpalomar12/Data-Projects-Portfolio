# 🏥 Hospital Operations Optimization: Cost, Readmission, and Patient Outcomes Analysis

## 📋 Project Type
Descriptive Analytics · Exploratory Data Analysis (EDA) · Predictive Modeling · Dashboard Development

## ⚙️ Tools Used
Python, Pandas, Scikit-learn, Matplotlib, Seaborn, SQL (optional), Tableau or Power BI

---

## 🎯 Objective

The goal of this project is to analyze hospital operations data to understand how patient characteristics, clinical conditions, and procedures relate to:

- Treatment cost  
- Length of stay  
- Readmission likelihood  
- Patient outcomes and satisfaction  

Using this dataset, I aim to identify operational inefficiencies, cost drivers, and risk factors that can inform hospital management decisions and quality improvement initiatives.

---

## 🧾 Dataset Overview

**Dataset:** Hospital operations and patient outcomes (synthetic)  

Each record represents a hospital encounter and includes:

- Patient demographics (Age, Gender)  
- Clinical variables (Condition, Procedure)  
- Operational metrics (Cost, Length of Stay)  
- Quality metrics (Readmission, Outcome, Satisfaction)  

This structure makes the dataset ideal for analyzing resource utilization patterns, risk factors, and potential areas for operational optimization.

---

## ❓ Key Business Questions

1. **Cost and Resource Utilization**
   - Which conditions and procedures are associated with the highest average cost?
   - How does length of stay vary by condition, procedure, or age group?
   - Are high costs always associated with better outcomes?

2. **Quality and Outcomes**
   - Which conditions or procedures have the highest readmission rates?
   - How do outcomes (Recovered vs Stable) vary by condition and age?
   - What factors appear to influence patient satisfaction scores?

3. **Risk and Predictive Insights**
   - Can we predict the likelihood of readmission based on patient and treatment characteristics?
   - Which features are most strongly associated with higher cost or longer length of stay?

---

## 📌 KPIs (Key Performance Indicators)

- **Average Cost per Patient**  
  Broken down by condition, procedure, and age group.

- **Average Length of Stay (LOS)**  
  Overall and segmented by condition and procedure.

- **Readmission Rate**  
  Percentage of encounters marked as “Yes” for readmission, by condition and procedure.

- **Outcome Distribution**  
  Proportion of “Recovered” versus “Stable” outcomes for each condition.

- **Average Satisfaction Score**  
  By condition, procedure, and outcome.

These KPIs will be featured prominently in the dashboard to give stakeholders a quick view of operational performance.

---

## 🔍 Analysis and Approach

### 1. Data Cleaning and Preparation
- Handle any inconsistencies in categorical variables (e.g., condition and procedure labels).
- Create derived fields such as:
  - Age bands (e.g., 0–40, 41–60, 61+)
  - Cost buckets (e.g., low, medium, high)
  - LOS categories (short, medium, long)

### 2. Exploratory Data Analysis (EDA)
- Analyze distributions of cost, LOS, and satisfaction.
- Compare cost and LOS across conditions and procedures.
- Explore relationships between:
  - Age and LOS
  - Condition and readmission
  - Satisfaction and outcome

### 3. Feature Engineering
- Encode categorical variables (Condition, Procedure, Gender).
- Create combined risk features if appropriate (for example, age × condition group).
- Prepare modeling datasets for:
  - Readmission prediction (Yes/No)
  - Cost or LOS regression (optional)

### 4. Predictive Modeling
- **Readmission Model:**  
  - Target: `Readmission` (Yes/No)  
  - Algorithms: Logistic Regression, Random Forest, or Gradient Boosting  
  - Evaluate using accuracy, precision, recall, F1 score.

- **Cost or LOS Model (Optional):**  
  - Target: `Cost` or `Length_of_Stay`  
  - Algorithms: Linear Regression or Tree-based models  
  - Evaluate using R² and RMSE.

- Interpret feature importance to understand the main drivers of readmission and cost.

### 5. Dashboard and Visualization
- Build an interactive Tableau or Power BI dashboard that:
  - Highlights KPIs
  - Allows filtering by condition, procedure, gender, and age group
  - Shows cost, LOS, and readmission patterns
  - Visualizes feature importance and risk drivers

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

