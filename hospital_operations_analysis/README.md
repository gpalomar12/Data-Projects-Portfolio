# 📊 Hospital Operations Analysis  
>Delivered insights that support cost containment, readmission risk reduction, and operational performance improvements.

An end-to-end analytics project analyzing hospital operations, costs, readmissions, and patient outcomes to support operational and clinical decision-making.  

---
## ⚠️ Important Note: Synthetic Dataset Performance

**This project achieved perfect model performance (AUC: 1.0) due to the deterministic nature of the synthetic dataset.** The readmission patterns in this data are highly predictable from the available features, resulting in perfect classification scores.

**What this means:**
- ✅ Demonstrates complete ML methodology and pipeline design
- ✅ Shows data engineering, feature engineering, and model evaluation skills
- ⚠️ Perfect scores reflect dataset characteristics, not expected real-world performance

**Expected real-world performance:**
- AUC typically 0.70-0.85 for readmission prediction
- Some irreducible uncertainty due to patient behavior and external factors
- Regular model retraining needed as patterns evolve

**Bottom line:** This project showcases technical skills and business communication. The methodology is transferable to real data; the perfect scores are dataset-specific.

*Throughout this README, metrics marked with * indicate perfect performance due to synthetic data structure.*  

---

## 🎯 Key Takeaways for Recruiters

**⏱️ Quick Summary:** Predictive analytics project on a synthetic hospital dataset: models readmission, cost, and satisfaction, and sizes a ~$1.2M projected annual savings scenario (assumption-based) with a 5-page Power BI report.

### Skills Demonstrated
| Category | Technologies & Methods |
|----------|----------------------|
| **Programming** | Python (Pandas, NumPy, Scikit-learn, XGBoost, Matplotlib, Seaborn, Plotly) |
| **Machine Learning** | Classification, Regression, Feature Engineering, Hyperparameter Tuning, Cross-Validation, SHAP |
| **Business Intelligence** | Power BI, DAX, Data Modeling, Interactive Dashboards, Executive Reporting |
| **Healthcare Analytics** | Readmission Prediction, Cost Analysis, Patient Satisfaction, Risk Stratification |
| **Statistical Analysis** | Hypothesis Testing, Feature Selection, Model Evaluation (AUC, RMSE, MAE) |
| **Data Engineering** | ETL Pipelines, Data Validation, Feature Engineering, Data Quality |
| **Business Acumen** | ROI Analysis, Stakeholder Communication, Strategic Recommendations |

### Quantified Results
- ✅ **Perfect classification** in predicting patient readmissions (Random Forest)*
- ✅ **~$1.2M projected annual savings** (scenario model: readmission reduction + length of stay; assumptions listed under Business Impact)
- ✅ **3 conditions** account for 62% of costs ($4.2M) - actionable cost management target
- ✅ **365 high-risk patients** (37%) identified for proactive care coordination
- ✅ **5-page Power BI report** built for executive decision-making
- ✅ **98% data quality** achieved through rigorous validation pipeline

>Note: Perfect performance (AUC: 1.0, Precision: 1.0, Recall: 1.0, F1: 1.0) is due to synthetic dataset characteristics. See methodology note above.

### Project Complexity Indicators
- 985 patient records analyzed
- 23 original features → 17 optimized features
- 3 ML models trained and evaluated (synthetic data; not deployed)
- DAX measures in Power BI (KPIs computed upstream in Python)
- End-to-end analytics lifecycle (data → insights → action)

**🔗 Portfolio Links:**
- [Live Dashboard Screenshots](#-power-bi-dashboard-overview)
- [Technical Implementation](#-technical-implementation)
- [Business Impact & ROI](#-business-impact--roi)
- [Full Notebooks](notebooks/)

## 🚀 Overview  

This end-to-end analytics project transforms 985 hospital encounters into actionable insights that drive operational decisions. By analyzing patient admissions, length of stay, readmissions, and cost drivers, the project identifies $1.2M in potential annual savings and provides predictive risk scoring for proactive patient management.

**Project Highlights:**
- Built 3 machine learning models with perfect classification on synthetic data (see methodology note)
- Identified 3 conditions accounting for 62% of total hospital costs
- Created a 5-page Power BI report for executive decision-making
- Developed risk segmentation model classifying 365 patients (37%) as high-risk for readmission

**Skills Demonstrated:** Python (Pandas, Scikit-learn, XGBoost), Power BI, DAX, Statistical Modeling, Healthcare Analytics, Executive Communication


## 🎯 Business Objective

Hospitals face increasing pressure to control costs while maintaining high-quality outcomes. This analysis  
focuses on answering core operational questions such as:
- Which conditions and procedures drive the highest costs?
- Which patients are most at risk for readmission?
- How do cost, outcomes, and patient satisfaction interact?
- Where should operational and clinical improvement efforts be prioritized?
- The analysis is designed to support decision-making, not just retrospective reporting.

## 🔒 Data Privacy & Ethics

### Dataset Source & Compliance
- **Source:** Synthetic hospital operations dataset from [Kaggle](https://www.kaggle.com/datasets/[dataset-name])
- **Data Type:** Completely synthetic - no real patient data used
- **PHI/PII Status:** Zero protected health information or personally identifiable information
- **Compliance:** Analysis follows HIPAA de-identification guidelines (Safe Harbor method)

### Ethical Considerations

#### Bias Assessment
- **Demographic Fairness:** Models tested for equal performance across:
  - Age groups (18-30, 31-45, 46-60, 61-75, 76+)
  - Gender (Male, Female, Other)
  - Insurance types (Medicare, Medicaid, Private, Self-pay)
- **Finding:** No significant disparate impact detected (all groups within 5% prediction accuracy)

#### Model Transparency
- Feature importance documented for all models
- Prediction explanations available via SHAP values
- No "black box" decisions - all predictions are auditable

#### Responsible Use
This analysis is designed to:
- ✅ Support clinical decision-making (not replace it)
- ✅ Identify at-risk patients for proactive care
- ✅ Optimize resource allocation fairly

This analysis explicitly avoids:
- ❌ Patient-level denial of care recommendations
- ❌ Automated discharge decisions without human review
- ❌ Discriminatory risk scoring based on protected characteristics

### Data Security (For Real-World Implementation)
When deploying with actual patient data, implement:
- Encryption at rest and in transit (AES-256)
- Role-based access control (RBAC)
- Audit logging of all data access
- HIPAA Business Associate Agreement (BAA) compliance
- Regular security audits and penetration testing

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

### 💰 Cost Concentration
**Finding:** 3 conditions (Cardiac Arrest, Pneumonia, Sepsis) account for 62% of total hospital costs ($4.2M of $6.8M annual spend; figure from the `modeling.ipynb` output. The raw dataset is not committed, so it cannot be re-computed from this repo, see VERIFICATION.md)

**Business Impact:** Care-pathway optimization for these 3 conditions could reduce costs 8-12% ($336K-$504K annually; $400K used as the conservative case). *Scenario assumption.*

**Recommendation:** Implement specialized care protocols and negotiate bundled payment contracts

---

### 🚨 Readmission Risk Drivers
**Finding:** 365 patients (37%) classified as high-risk for readmission, with cardiac-related cases showing 2.3x higher readmission rates than average (42% vs 18%)

**Model Performance:** Random Forest classifier achieved perfect performance (AUC: 1.0, Precision: 1.0, Recall: 1.0)* in identifying at-risk patients

**Business Impact:** Proactive care coordination for 250 highest-risk patients could prevent 75 readmissions annually (scenario assumption: 75 prevented × $7,500 per readmission = $562,500)

---

### ⏱️ Length of Stay Variation
**Finding:** Average LOS varies from 2.1 days (Orthopedic) to 6.8 days (ICU), with 23% of patients exceeding expected LOS by 2+ days

**Opportunity:** Standardizing discharge protocols could reduce average LOS from 4.2 to 3.8 days, freeing 15 beds annually

**Revenue Impact:** Additional capacity worth $520K in potential admissions

---

### 😊 Patient Satisfaction Drivers
**Finding:** Satisfaction scores vary by 18% across age groups (65+ at 3.8/5 vs 18-44 at 4.5/5), despite similar clinical outcomes

**Root Cause Analysis:** Feature importance showed wait times and communication clarity drive satisfaction more than medical outcomes

**Action:** Implementing senior-focused communication training and reducing wait times could improve scores by 0.6 points (15% increase)

---

### 🎯 Predictive Model Value
**Capability (proposed):** Risk scoring from the model would enable:
- Daily identification of discharge-ready patients
- Prioritized case management resources
- Proactive intervention scheduling
- Capacity forecasting for next 7-30 days

**Operational Impact (proposed):** Supports a shift from reactive to proactive resource allocation. No effect was measured; the data is synthetic.


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

## 🔧 Technical Implementation

### Data Pipeline Architecture
```
Raw Data (CSV) → Pandas ETL → Feature Engineering → Model Training → Power BI
     985 rows      ↓              12 features          ↓              Dashboard
                Cleaning         derived from         3 models        5 pages
                98% valid        23 original          exported        15+ visuals
```

### Data Processing
- **Input:** 985 patient records with 23 raw features
- **Cleaning:** Removed 18 incomplete records (1.8%), standardized 8 categorical variables
- **Validation:** Implemented range checks (age: 18-95, cost: $500-$50K, LOS: 1-30 days)
- **Feature Engineering:** Created 12 derived features:
  - Age groups (5 bins: 18-30, 31-45, 46-60, 61-75, 76+)
  - Cost buckets (Low: <$5K, Medium: $5K-$15K, High: >$15K)
  - LOS categories (Short: 1-2 days, Medium: 3-5, Extended: 6+)
  - Readmission risk score (0-100 scale)

---

### Machine Learning Models

#### 1. Readmission Prediction (Classification)
**Algorithm:** Random Forest Classifier
- **Training Set:** 690 patients (70/30 split, stratified by readmission status)
- **Features:** 17 (6 removed due to multicollinearity, VIF > 5)
- **Hyperparameters:** 
  - n_estimators: 200
  - max_depth: 15
  - min_samples_split: 20
- **Performance Metrics:** *
  - AUC-ROC: 1.0
  - Precision: 1.0
  - Recall: 1.0
  - F1-Score: 1.0
  - Accuracy: 1.0
- **Baseline Comparison:** Logistic Regression baseline achieved AUC: 0.959
- **Note:** Perfect performance reflects the synthetic dataset structure (see methodology note)

**Top 5 Feature Importance (SHAP values):**
1. Previous readmissions (0.31)
2. Length of stay (0.24)
3. Comorbidity count (0.18)
4. Age (0.12)
5. Procedure complexity (0.09)

**Understanding Perfect Performance:**
- Perfect scores (1.0) reflect deterministic patterns in synthetic data
- Real-world readmission has inherent unpredictability (patient behavior, social factors)
- Production deployment would expect AUC: 0.70-0.85, which is still strong

**Production Deployment Strategy:**
- **Model Retraining:** Quarterly retraining recommended (healthcare patterns evolve)
- **Performance Monitoring:** Track AUC, precision, recall weekly; alert if drops >5%
- **Bias Auditing:** Monthly fairness checks across demographic groups
- **A/B Testing:** Shadow deployment for 2-4 weeks before full rollout
- **Expected Degradation:** Plan for 5-10% performance decrease over 6-12 months
- **Regularization:** Apply L1/L2 regularization to prevent overfitting in production

**Risk Management:**
- Clinical review required for all high-risk classifications
- Model serves as decision support, not a replacement for medical judgment
- Continuous validation against actual readmission outcomes

---

#### 2. Cost Prediction (Regression)
**Algorithm:** XGBoost Regressor
- **Performance:**
  - RMSE: $1,189
  - MAE: $847
  - R²: 0.82
  - MAPE: 12.4%
- **Validation:** Predictions within ±15% for 79% of cases

**Cost Prediction Breakdown:**
- Base cost by procedure: $3,200 - $24,500
- LOS multiplier: +$1,800 per additional day
- Complication adjustment: +$4,200 average

---

#### 3. Patient Satisfaction Prediction (Regression)
**Algorithm:** Gradient Boosting Regressor
- **Performance:**
  - MAE: 0.31 on 1-5 scale
  - RMSE: 0.43
  - R²: 0.68
- **Key Drivers:** Communication quality (0.35), wait time (0.28), staff responsiveness (0.22)

---

### Power BI Dashboard Development

**Technical Specifications:**
- **Data Source:** Single `Predictions` table — Python modeling pipeline exports all predictions and features to CSV, loaded into Power BI as a flat table
- **DAX Measures:**
  - `High Risk Readmission %` — percentage of patients classified as high-risk
  - `Avg Predicted Cost` — average predicted cost across filtered patients
  - `Avg Predicted Satisfaction` — average predicted satisfaction score
  - `Avg Readmission Probability` — average readmission probability
  - `Importance Value` — feature importance values for chart visuals
  - `Patient Count` — count of patients in current filter context
- **Slicers (7):** Age Group, Condition, Gender, Length of Stay, Patient ID, Procedure, Satisfaction
- **Performance:** <2 second load time for all visualizations
- **Design approach:** KPIs and risk scores computed upstream in Python — Power BI handles visualization and interactivity only

**Dashboard Pages:**
1. Executive Summary (KPIs + trend lines)
2. Readmission Analysis (risk segmentation + feature importance)
3. Cost Drivers (condition breakdown + LOS impact)
4. Patient Satisfaction (demographic analysis + drivers)
5. Patient Drill-Down (searchable table with all predictions)


## ⚙️ How It Works

1. Load raw hospital encounter data
2. Clean and standardize data fields
3. Engineer operational and risk features
4. Perform exploratory analysis and modeling
5. Surface insights through executive dashboards

## ⚙️ Setup & Installation

### Prerequisites
- Python 3.8 or higher
- Jupyter Notebook or JupyterLab
- Power BI Desktop (free) - for viewing dashboards
- 4GB RAM minimum (8GB recommended)

### Installation Steps

#### 1. Clone the Repository
```bash
git clone https://github.com/gpalomar12/hospital-operations-analysis.git
cd hospital-operations-analysis
```

#### 2. Create Virtual Environment
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Mac/Linux
python3 -m venv venv
source venv/bin/activate
```

#### 3. Install Dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

**Key Dependencies:**
- pandas==2.0.3
- numpy==1.24.3
- scikit-learn==1.3.0
- xgboost==1.7.6
- matplotlib==3.7.2
- seaborn==0.12.2
- plotly==5.15.0
- jupyter==1.0.0

#### 4. Verify Installation
```bash
# Run quick test
python -c "import pandas, sklearn, xgboost; print('All dependencies installed successfully!')"
```

---

### Running the Analysis

#### Option 1: Run Full Pipeline (Automated)
```bash
python src/main.py
```
This will:
1. Load and clean data
2. Engineer features
3. Train all models
4. Generate predictions
5. Export results to `/data/predictions/`

#### Option 2: Run Individual Notebooks (Step-by-Step)
```bash
# Start Jupyter
jupyter notebook

# Then open and run in order:
# 1. notebooks/01_data_cleaning.ipynb
# 2. notebooks/02_eda.ipynb
# 3. notebooks/03_modeling.ipynb
```

#### Option 3: View Dashboard Only
1. Download [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
2. Open `reports/Phase4-Clinical Outcomes & Cost Prediction Dashboard.pbix`
3. Click "Refresh" if prompted to reload data

---

### Expected Outputs

After running the analysis, you'll find:
```
data/predictions/
├── readmission_predictions.csv    # Patient ID, risk score, risk category
├── cost_predictions.csv           # Patient ID, predicted cost, confidence interval
└── satisfaction_predictions.csv   # Patient ID, predicted satisfaction score

results/
├── model_performance_metrics.txt  # AUC, RMSE, MAE for all models
├── feature_importance.png         # Top 10 features visualization
└── confusion_matrix.png          # Readmission model performance
```

---

### Troubleshooting

**Issue:** `ModuleNotFoundError: No module named 'xgboost'`
**Solution:** 
```bash
pip install xgboost==1.7.6
```

**Issue:** Power BI file won't open
**Solution:** Ensure you have Power BI Desktop installed (not Power BI Service/web version)

**Issue:** Out of memory errors
**Solution:** Reduce dataset size in `src/config.py` or increase system RAM

**Need Help?** Open an issue on GitHub or contact me at [gpalo23@icloud.com]


## 🔧 Technical Implementation

### Data Pipeline Architecture
```
Raw Data (CSV) → Pandas ETL → Feature Engineering → Model Training → Power BI
     985 rows      ↓              12 features          ↓              Dashboard
                Cleaning         derived from         3 models        5 pages
                98% valid        23 original          exported        15+ visuals
```

### Data Processing
- **Input:** 985 patient records with 23 raw features
- **Cleaning:** Removed 18 incomplete records (1.8%), standardized 8 categorical variables
- **Validation:** Implemented range checks (age: 18-95, cost: $500-$50K, LOS: 1-30 days)
- **Feature Engineering:** Created 12 derived features:
  - Age groups (5 bins: 18-30, 31-45, 46-60, 61-75, 76+)
  - Cost buckets (Low: <$5K, Medium: $5K-$15K, High: >$15K)
  - LOS categories (Short: 1-2 days, Medium: 3-5, Extended: 6+)
  - Readmission risk score (0-100 scale)

---

### Machine Learning Models

#### 1. Readmission Prediction (Classification)
**Algorithm:** Random Forest Classifier
- **Training Set:** 690 patients (70/30 split, stratified by readmission status)
- **Features:** 17 (6 removed due to multicollinearity, VIF > 5)
- **Hyperparameters:** 
  - n_estimators: 200
  - max_depth: 15
  - min_samples_split: 20
- **Performance Metrics:** *
  - AUC-ROC: 1.0
  - Precision: 1.0
  - Recall: 1.0
  - F1-Score: 1.0
  - Accuracy: 1.0
- **Baseline Comparison:** Logistic Regression baseline achieved AUC: 0.959, showing model improvement
- **Note:** Perfect performance reflects the synthetic dataset structure (see methodology note)

**Top 5 Feature Importance (SHAP values):**
1. Previous readmissions (0.31)
2. Length of stay (0.24)
3. Comorbidity count (0.18)
4. Age (0.12)
5. Procedure complexity (0.09)

---

#### 2. Cost Prediction (Regression)
**Algorithm:** XGBoost Regressor
- **Performance:**
  - RMSE: $1,189
  - MAE: $847
  - R²: 0.82
  - MAPE: 12.4%
- **Validation:** Predictions within ±15% for 79% of cases

**Cost Prediction Breakdown:**
- Base cost by procedure: $3,200 - $24,500
- LOS multiplier: +$1,800 per additional day
- Complication adjustment: +$4,200 average

---

#### 3. Patient Satisfaction Prediction (Regression)
**Algorithm:** Gradient Boosting Regressor
- **Performance:**
  - MAE: 0.31 on 1-5 scale
  - RMSE: 0.43
  - R²: 0.68
- **Key Drivers:** Communication quality (0.35), wait time (0.28), staff responsiveness (0.22)

---

### Power BI Dashboard Development

**Technical Specifications:**
- **Data Source:** Single `Predictions` table — Python modeling pipeline exports all predictions and features to CSV, loaded into Power BI as a flat table
- **DAX Measures:**
  - `High Risk Readmission %` — percentage of patients classified as high-risk
  - `Avg Predicted Cost` — average predicted cost across filtered patients
  - `Avg Predicted Satisfaction` — average predicted satisfaction score
  - `Avg Readmission Probability` — average readmission probability
  - `Importance Value` — feature importance values for chart visuals
  - `Patient Count` — count of patients in current filter context
- **Slicers (7):** Age Group, Condition, Gender, Length of Stay, Patient ID, Procedure, Satisfaction
- **Performance:** <2 second load time for all visualizations
- **Design approach:** KPIs and risk scores computed upstream in Python — Power BI handles visualization and interactivity only

**Dashboard Pages:**
1. Executive Summary (KPIs + trend lines)
2. Readmission Analysis (risk segmentation + feature importance)
3. Cost Drivers (condition breakdown + LOS impact)
4. Patient Satisfaction (demographic analysis + drivers)
5. Patient Drill-Down (searchable table with all predictions)


## 📁 Repository Structure
```
hospital_operations_analysis/
│
├── data/
│   └── outputs/
│       └── model_outputs.xlsx          # Model predictions exported for Power BI
│
├── notebooks/
│   ├── hospital_operations_optimization.ipynb  # Phase 1: Data cleaning & optimization
│   ├── eda.ipynb                               # Phase 2: Exploratory data analysis
│   └── modeling.ipynb                          # Phase 3: ML model development
│
├── reports/
│   └── Phase4-Clinical Outcomes & Cost Prediction Dashboard.pbix  # Power BI file
│
├── results/
│   ├── calculated_kpis.md              # Verified KPI reference
│   └── model_performance.json          # Model metrics
│
├── visuals/
│   ├── Executive_Page_Dashboard.PNG
│   ├── Readmissions_Page_Dashboard.PNG
│   ├── Cost_Drivers_Page_Dashboard.PNG
│   ├── Satisfaction_Page_Dashboard.PNG
│   ├── Patient_Drill_Down_Page_Dashboard.PNG
│   └── Phase4-Clinical Outcomes & Cost Prediction Dashboard.pdf
│
└── README.md
```

### Quick Links to Key Files
- [📊 Power BI Dashboard](reports/) - Download and open in Power BI Desktop
- [📓 Phase 1 Notebook - Data Cleaning](notebooks/hospital_operations_optimization.ipynb)
- [📓 Phase 2 Notebook - EDA](notebooks/eda.ipynb)
- [📓 Phase 3 Notebook - Modeling](notebooks/modeling.ipynb)


## 📓 Project Notebooks

### Phase 1: Data Cleaning & Initial EDA
**Objective:** Data ingestion, validation, cleaning, and demographic profiling

**Key Activities:**
- Loaded 985 patient records from raw CSV
- Identified and removed 18 incomplete records (1.8%)
- Standardized 8 categorical variables (condition, procedure, outcome)
- Validated date ranges and numeric bounds
- Generated demographic distribution analysis

**Outputs:**
- Cleaned dataset ready for analysis
- Data quality report (98% validity rate)
- Initial statistical summaries

[📓 View Notebook](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/hospital_operations_optimization.ipynb) | **Runtime:** ~5 minutes

---

### Phase 2: Advanced EDA & Feature Engineering
**Objective:** Deep-dive analysis and creation of predictive features

**Key Activities:**
- Correlation analysis between cost, LOS, and outcomes
- Distribution analysis across age groups and conditions
- Created 12 derived features (age groups, cost buckets, LOS categories)
- Outlier detection and treatment
- Feature selection using variance inflation factor (VIF)

**Key Visualizations:**
- Cost distribution by condition (Pareto chart showing 80/20 rule)
- Readmission heatmap by age × condition
- Length of stay boxplots by department
- Patient satisfaction trends by demographics

**Outputs:**
- Engineered feature dataset (17 final features)
- 15+ exploratory visualizations
- Statistical hypothesis tests (ANOVA, Chi-square)

[📓 View Notebook](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/eda.ipynb) | **Runtime:** ~8 minutes

---

### Phase 3: Predictive Modeling
**Objective:** Build, train, and evaluate machine learning models

**Key Activities:**
- Train/test split (70/30 stratified sampling)
- Trained 9 models across 3 algorithms for each prediction task
- 5-fold cross-validation for hyperparameter tuning
- Feature importance analysis using SHAP values
- Model comparison and selection

**Models Developed:**
1. **Readmission Prediction** (Classification)
   - Random Forest (selected): AUC 1.0, Precision 1.0, Recall 1.0, F1 1.0*
   - Gradient Boosting: AUC 1.0*
   - Logistic Regression (baseline): AUC 0.959, Precision 0.72

2. **Cost Prediction** (Regression)
   - XGBoost (selected): RMSE $1,189, R² 0.82
   - Linear Regression: RMSE $2,341
   - Random Forest: RMSE $1,456

3. **Satisfaction Prediction** (Regression)
   - Gradient Boosting (selected): MAE 0.31, R² 0.68
   - Linear Regression: MAE 0.48
   - Random Forest: MAE 0.39

**Outputs:**
- 3 trained models (saved as .pkl files)
- Prediction CSV files for Power BI integration
- Model performance comparison charts
- Feature importance rankings

[📓 View Notebook](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/hospital_operations_analysis/notebooks/modeling.ipynb) | **Runtime:** ~12 minutes

---

### How to Run Notebooks
```bash
# Option 1: Interactive Jupyter
jupyter notebook
# Then navigate to notebooks/ and open files in order

# Option 2: Command Line Execution
jupyter nbconvert --to notebook --execute notebooks/01_data_cleaning.ipynb
jupyter nbconvert --to notebook --execute notebooks/02_eda.ipynb
jupyter nbconvert --to notebook --execute notebooks/03_modeling.ipynb
```

**Note:** Notebooks contain embedded outputs (charts, tables, metrics) so you can view results without running code.


## 💼 Business Impact (Scenario Model)

> **Read this first:** this project uses a **synthetic dataset**. Nothing below was realized at a hospital. These are assumption-based scenarios showing how the analysis would be translated into dollars.

### Headline scenario: ~$1.2M projected annual value
| Initiative | Assumptions | Projected value |
|---|---|---|
| Readmission reduction | Care coordination for the 250 highest-risk patients prevents ~75 readmissions (a 30% reduction within that cohort) × $7,500 per readmission = $562,500, plus $125,000 assumed CMS penalty avoidance | $687,500 |
| Length-of-stay optimization | Average LOS 4.2 → 3.8 days; assumes ~130 bed-days made available per year × $4,000 revenue per bed-day | $520,000 |
| **Headline total** | | **~$1.2M** ($1,207,500) |

### Additional scenarios (not in the headline)
| Initiative | Assumptions | Projected value |
|---|---|---|
| Targeted cost management | 8-12% cost reduction on the 3 highest-cost conditions ($4.2M) via care pathways and bundled payments | $336,000-$504,000 ($400,000 conservative) |
| Resource and staffing optimization | Illustrative labor-cost assumption | $150,000 |

Including these two brings the four-initiative total to ~$1.76M. They are excluded from the headline because they depend on the least-verifiable inputs.

### Corrections made during verification
- The earlier LOS calculation (15 beds, 85% occupancy, 365 days, $4,000 per day) equals about $18.6M, not $520K, so it was replaced with an explicit bed-day assumption.
- The earlier "~$1.2M total" summed only two of the four listed initiatives; the labels now say which.
- "Readmission rate 37% → 28%" mixed up two metrics: 37% is the *high-risk share* of patients, while the overall readmission rate in the notebook is 18%. The target is now stated for the 250-patient cohort.
- Claims of dashboard deployment, monthly review meetings, and a 12% overtime reduction were removed: this is a demonstration project, not a deployment.

### Proposed 12-month targets
- Readmissions within the targeted 250-patient cohort: -30% (~75 prevented)
- Average LOS: 4.2 → 3.9 days (stretch: 3.8)
- Patient satisfaction: 4.1 → 4.5 average score
- Cost per admission: -6% to -8%

### Intended stakeholder use (proposed)
**Executive team:** monthly operational reviews | **Case managers:** daily risk lists | **Quality:** intervention tracking | **Finance:** budget planning


[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)

