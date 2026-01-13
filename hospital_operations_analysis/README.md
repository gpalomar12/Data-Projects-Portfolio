# 📊 Hospital Operations Analysis  
A data analysis project exploring hospital operations, utilization, and performance through real hospital  
datasets.

## 🚀 Overview

This project investigates key hospital operational metrics such as patient admissions, length of stay,  
readmissions, resource utilization, and cost drivers. The goal is to uncover insights that could help hospital  
administrators and operations teams make data-driven decisions about capacity planning, efficiency improvements,  
and quality of care.

## 📝 Table of Contents  
1. About
2. Motivation
3. Data
4. Methods
5. Key Insights
6. Visuals
7. How it Works
8. Tech Stack
9. Installation
10. Usage
11. Results
12. Contributing


## 🎯 About

Hospital operations analysis is vital for understanding how care is delivered, where bottlenecks occur, and  
how resources are used. This project performs exploratory analysis and visualization on hospital activity data  
to highlight trends in admissions, patient throughput, and departmental performance. It helps reveal issues like  
unusually high readmissions, long stay durations, or variation in service utilization.

## 🧠 Motivation

Hospital systems face increasing pressure to optimize operational efficiency while maintaining high-quality  
outcomes. This analysis aims to:
- Understand patterns in patient admissions and readmissions
- Measure length of stay across departments
- Identify capacity constraints or utilization inefficiencies
- Provide actionable insights for operational improvements

## 📊 Data
**Data sources:**
This project uses one or more hospital dataset files containing records of patient encounters, admissions,  
discharges, departments, and costs. The raw data includes variables such as:
- Patient ID, Hospital ID
- Admission date/time, Discharge date/time
- Department or service unit
- Procedure codes, Diagnostic codes
- Charges or billing amounts

(Add real dataset links or file names here)

**Data Preparation:**
- Clean inconsistent datetime values
- Filter out incomplete records
- Standardize categorical labels (e.g., admission types)
- Derive useful fields such as length of stay

### Standard Python Libraries  

```

import pandas as pd
import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt

# Reading in .csv file into a data frame and previewing the dataframe output

hospital_df = pd.read_csv('../data/raw/hospital data analysis.csv')
hospital_df.head()

```
Output Preview of hospital_df

<img width="920" height="191" alt="Hospital_Python_Data_Preview" src="https://github.com/user-attachments/assets/aa5f4d39-5c2e-45a2-b77d-19bb9c312b98" />

---
### Reviewing the data
In this section, we want to review the column data and identify any discrepancies, such as
missing data or data types that require modification.  We also want to review the average values
for the numeric columns, which allows us to identify outliers and address them in the data cleaning
process.

```
hospital_df.info()
```

<img width="851" height="327" alt="Hospital_Python_Data_Info" src="https://github.com/user-attachments/assets/366256f5-7d8e-4c55-a918-eb1bf2864926" />  

```
hospital_df.describe().transpose()
```

<img width="951" height="198" alt="Hospital_Python_Data_Describe" src="https://github.com/user-attachments/assets/5d5058f0-bdf0-4ed5-99ae-f57e3a1d8481" />

### Distribution Review

```
# Setup the figure layout
fig, axes = plt.subplots(1,3, figsize=(15, 4))
fig.suptitle('Demographic Overview', fontsize=16, fontweight ='bold')

# Age Distribution
sns.histplot(data=hospital_df, x='age_group', bins=age_bins, hue='gender', ax=axes[0],kde=True, color='steelblue', edgecolor='black')
axes[0].set_title('Age Distribution')
axes[0].set_xlabel('Age Group')
axes[0].set_ylabel('Count')

# Cost Distribution
sns.histplot(data=hospital_df, x='cost_bucket', bins=cost_bins, ax=axes[1], hue='gender', kde=True, color='steelblue', edgecolor='black')
axes[1].set_title('Cost Distribution')
axes[1].set_xlabel('Cost')
axes[1].set_ylabel('Count')

# Length of Stay Distribution
sns.histplot(data=hospital_df, x='length_of_stay', bins=15, ax=axes[2], hue='gender', kde=True, color='steelblue', edgecolor='black')
axes[2].set_title('LOS Distribution')
axes[2].set_xlabel('Length of Stay')
axes[2].set_ylabel('Count')

plt.show()

```
<img width="1151" height="373" alt="Hospital_Python_Data_distribution_plots" src="https://github.com/user-attachments/assets/13b285ca-a77c-4933-9b5b-b7b14aa3f41d" />

```
# Plot a histogram illustrating the distribution between genders
sns.histplot(data= hospital_df, x='gender', hue='gender', legend=False);
```
<img width="1143" height="420" alt="Hospital_Python_gender_distribution_plots" src="https://github.com/user-attachments/assets/773ae863-63fe-40da-9d06-f36eecdb48fd" />

### Summary

The gender distribution is nearly even, with a slightly higher proportion of females. Age patterns differ by gender.  
Male patients are primarily concentrated between ages 40 and 70, while female patients show two distinct peaks, one  
between ages 30 and 40 and another between 50 and 60.  

Length of stay is similar across genders, though females show a slightly higher frequency overall. Across the population,  
the shortest stays average around 15 days, longer stays typically extend up to about 60 days, and the mean length of stay  
is approximately 40 days. These patterns align with the summary statistics observed in the underlying data.

**The snippets above are only a preview, to review all the Python code refer to the link below**  
[Phase 1 Notebook](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/hospital_operations_optimization.ipynb)


## 🛠 Methods
The analysis workflow includes:
1. Data ingestion and profiling
2. Cleaning and transformation
3. Exploratory data analysis (EDA)
4. Metric computation (e.g., readmission rates, avg stay)
5. Visualizations and reporting





The project identifies patterns and anomalies in how hospitals manage patients and resources. Tools such as  
Python, pandas, and visualization libraries were used to clean, explore, and visualize the data.

## 📈 Key Insights  
Here are some representative findings from the analysis:
- Average patient length of stay trends and outliers
- Readmission patterns by department or patient subgroup
- High-cost services or procedures that impact operations
- Bottlenecks in specific departments or times of day

(Customize with your actual results and numbers)

## 📸 Visuals

Include charts that show operational patterns:
[Admissions Over Time](images/admissions_over_time.png)
Add captions for each visual and what the chart reveals.

## ⚙️ How It Works
This section outlines the high-level process:
1. Load raw hospital data into a DataFrame
2. Clean and standardize columns
3. Compute derived metrics like length of stay
4. Group and summarize data by department, date, or patient category
5. Visualize trends and patterns in plots

*You can include a workflow diagram if you like.*

## 🧰 Tech Stack
|Component|Tool|
|---------|---------|
|Data Processing| Python (Pandas, Numpy)|
|Visualizations| Matplotlib, Seaborn, Plotly|
|BI tools| Power BI|
|Notebook| Jupyter Notebook|
|Version control| Git & GitHub|

---

## Understanding Data and Initial Exploration



## 📔 Jupyter Notebooks
Explore each phase of the Python data exploration to modeling code.  Each Phase is separated to 
different notebooks for simplicity.

  
[Phase 2 Data Exploration ](hospital_operations_analysis/notebooks/eda.ipynb)  
[Phase 3 Data Modeling](hospital_operations_analysis/notebooks/modeling.ipynb)  





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

  
<img width="1331" height="768" alt="Executive_Page_Dashboard" src="https://github.com/user-attachments/assets/18e2f83a-115b-4b56-9aed-f9d88259dab5" />


---

### Readmissions Analysis

- Readmission probability by condition and procedure
- Feature importance for readmission prediction
- Distribution of patient readmission risk
  

<img width="1326" height="767" alt="Readmissions_Page_Dashboard" src="https://github.com/user-attachments/assets/4142211c-f764-4ea2-8f02-315b0d4577f7" />


---

### Cost Drivers Analysis

- Predicted cost by condition
- Predicted cost by procedure
- Cost trends by length of stay
- Identification of the highest-cost condition and procedure combinations
  

<img width="1329" height="765" alt="Cost_Drivers_Page_Dashboard" src="https://github.com/user-attachments/assets/8e3d47fb-894a-487a-980c-9d1398639882" />

---

### Patient Satisfaction Insights

- Predicted satisfaction by age group
- Satisfaction by condition and procedure
- Feature importance explaining satisfaction predictions
  

<img width="1323" height="762" alt="Satisfaction_Page_Dashboard" src="https://github.com/user-attachments/assets/f9535929-868d-4fa6-ab81-17c13fa03770" />

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


<img width="1325" height="760" alt="Patient_Drill_Down_Page_Dashboard" src="https://github.com/user-attachments/assets/51a136c3-4dd6-40a4-a348-08ecfdeb5980" />


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
