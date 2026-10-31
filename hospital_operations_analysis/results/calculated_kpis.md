# Hospital Operations Analysis — Verified KPIs

All metrics sourced directly from notebook outputs (`modeling.ipynb`) and validated calculations. See individual notebooks for full reproducibility.

---

## 📊 Dataset

| Metric | Value |
|--------|-------|
| Total Patient Records | 985 |
| Records Removed (incomplete) | 18 (1.8%) |
| Clean Records | 967 |
| Data Quality Rate | 98.2% |
| High-Risk Patients | 365 (37.1%) |

---

## 🤖 Readmission Prediction Model

**Algorithm:** Random Forest Classifier | **Split:** 70/30 stratified | **Features:** 17

> ⚠️ This dataset is synthetic with deterministic readmission patterns, producing perfect classification scores. Expected AUC in production: 0.70–0.85.

| Model | AUC | Precision | Recall | F1 | Accuracy |
|-------|-----|-----------|--------|----|----------|
| Random Forest | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |
| Gradient Boosting | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |
| Logistic Regression (baseline) | 0.959 | 0.720 | 1.0 | 0.837 | 0.883 |

### Top Feature Importance (Random Forest)

| Rank | Feature | Importance |
|------|---------|------------|
| 1 | Age | 0.361 |
| 2 | Cost | 0.147 |
| 3 | Heart Disease | 0.100 |
| 4 | Heart Attack | 0.063 |
| 5 | Gender (Male) | 0.058 |

---

## 💰 Cost Prediction Model

**Algorithm:** Random Forest / Gradient Boosting

> Cost values are fixed per condition/procedure in this synthetic dataset, resulting in near-perfect regression scores.

| Model | RMSE | MAE | R² |
|-------|------|-----|----|
| Random Forest | 0 | 0 | 1.0 |
| Gradient Boosting | $91,082 | $261 | 0.999 |
| Linear Regression | ~$0 | ~$0 | 1.0 |

### Top Feature Importance (Random Forest)

| Rank | Feature | Importance |
|------|---------|------------|
| 1 | Surgery & Chemotherapy | 0.169 |
| 2 | Cancer | 0.166 |
| 3 | Heart Disease | 0.117 |
| 4 | Prostate Cancer | 0.105 |
| 5 | Heart Attack | 0.099 |

---

## 😊 Patient Satisfaction Model

**Algorithm:** Gradient Boosting Regressor

| Model | MAE | RMSE | R² |
|-------|-----|------|----|
| Gradient Boosting | 0.036 | 0.002 | 0.997 |
| Linear Regression | 0.093 | 0.027 | 0.966 |
| Random Forest | 0 | 0 | 1.0 |

### Top Feature Importance (Random Forest)

| Rank | Feature | Importance |
|------|---------|------------|
| 1 | Age | 0.680 |
| 2 | Stroke | 0.037 |
| 3 | CT Scan & Medication | 0.030 |
| 4 | Prostate Cancer | 0.027 |
| 5 | Delivery & Postnatal Care | 0.026 |

---

## 💼 Business Impact (scenario model, synthetic data)

| Initiative | Projected Savings | In headline? |
|-----------|------------------|--------------|
| Readmission Reduction (75 prevented × $7,500 = $562,500, plus $125,000 CMS penalties) | $687,500 | Yes |
| Length of Stay Optimization (~130 bed-days × $4,000) | $520,000 | Yes |
| **Headline total** | **$1,207,500 (~$1.2M)** | |
| Targeted Cost Management (8-12% on top 3 conditions; $400K conservative) | $336,000-$504,000 | No |
| Resource & Staffing Optimization (illustrative) | $150,000 | No |
| Four-initiative total | ~$1.76M | No |

---


## 🔍 Key Insight Verification

| Claim | Calculation | Result |
|-------|-------------|--------|
| 37% high-risk | 365 ÷ 985 | 37.06% ✓ |
| 62% of costs from 3 conditions | $4.2M ÷ $6.8M | 61.8% (arithmetic ✓; inputs come from the notebook, raw data not committed) |
| Cardiac 2.3x readmission rate | 42% ÷ 18% | 2.33x ✓ |

---

**Source:** `notebooks/modeling.ipynb` | **Last Updated:** February 2026
