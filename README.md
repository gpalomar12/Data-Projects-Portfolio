<div align="center">

# 👨‍💻 Gabriel Palomarez | Data Analytics Portfolio
<img src="./assets/gp_head_shot_2.png" width="150" style="border-radius: 50%;" alt="Gabriel Palomarez"/>

**[LinkedIn](https://www.linkedin.com/in/gabrielpalomarez)** • **gpalo23@icloud.com** • **[Resume](./resume/Gabriel-Palomarez-Healthcare-Data-Analyst.pdf)**


## Data & Analytics Leader | Healthcare, Operations & Reporting Automation
*Transforming complex operational data into automated solutions that drive measurable business value*

</div>

---

## 🎯 About This Portfolio

This portfolio showcases my work in analytics automation, operational reporting, and data-driven decision support across healthcare and enterprise environments. Each project demonstrates end-to-end analytical capability from problem identification through solution deployment.

**What you'll find here:**
- 📊 **Interactive dashboards** and automated pipelines that cut multi-week analysis to days
- 🐍 **Python automation scripts** eliminating manual workflows
- 📈 **SQL analytics** uncovering operational insights
- 💡 **Business impact** with quantified results
- ✅ **Every number here is re-computed from data in this repo** by [`verification/verify_claims.py`](./verification/verify_claims.py); see [VERIFICATION.md](./VERIFICATION.md)

---

### ⭐ Featured Projects 

#### 📊 CMS Gaps in Care Dashboard
*Clinical reporting automation reducing weeks of work to days*

<img width="475" alt="dashboard_overview" src="https://github.com/user-attachments/assets/b042aba2-3053-48b7-ab4e-cf6c455fe3a0" />  

  
*Python consolidation pipeline + Excel/Power Query dashboard cutting analysis from 4-5 weeks to 2-3 days (~90%)*

**Problem:** Clinicians manually consolidated hundreds of files, requiring 4-5 weeks per cycle (reviews ran twice a year)

**Solution:** Python consolidation pipeline and Excel/Power Query dashboard, later productized as a monthly module

**Impact:**
- ⏱️ Cut analysis from 4-5 weeks to 2-3 days (~90%)
- 📈 Moved ACO reviews from twice a year to monthly (~30-day data lag)
- ✅ Consolidated 450+ files: 85 practices, 271 provider locations, 34 CMS measures

**Tech Stack:** Python, Pandas, Power Query, Excel

👉 [**View Full Project**](./CMS_Gaps_Dashboard/) | [**See Code**](./CMS_Gaps_Dashboard/Scripts/cms_report_deid.ipynb) 

#### 📈 B2B Sales & Marketing Performance Analysis (SQL)

<img width="475" alt="database_diagram" src="./sql-b2b_marketing_perf_analysis/visuals/db_diagram.png" />  

*PostgreSQL analysis revealing revenue concentration risks and 164% regional performance gaps*  

**Problem:** Sales leadership lacked visibility into account concentration risks, regional performance drivers, and the relationship between digital engagement and revenue conversion.

**Solution:** Built PostgreSQL data warehouse (fact/dimension model) analyzing $10.4M in revenue across 4,050 orders, 351 accounts, and 8,273 web events using advanced SQL (CTEs, window functions, time-series analysis).  

**Impact:**

- 🎯 **Identified concentration risk:** Top 10 accounts represent 15.3% of revenue ($1.59M), with #1 account at $252.7K
- 📊 **Revealed regional gaps:** Northeast ($3.60M) outperforms Midwest ($1.36M) by 164%, enabling territory optimization
- 💰 **Quantified growth:** 417% December-over-December revenue growth ($177K in Dec 2013 → $916K in Dec 2016), with year-end peaks
- 📈 **Uncovered product opportunity:** Standard drives 72.9% of revenue ($7.60M); each 5-10% of Standard revenue equals $380K-$760K, a sizing benchmark for mix-shift scenarios
- 🎯 **Mapped conversion patterns:** Direct traffic is 62.2% of 8,273 web events; accounts typically show web activity before their first order (median 2 events)

**Tech Stack:** PostgreSQL, SQL (CTEs, Window Functions, Temporal Analysis), Data Modeling

👉 [**View Full Project**](./sql-b2b_marketing_perf_analysis/README.md) | [**See Code**](./sql-b2b_marketing_perf_analysis/sql/core_analysis_queries.sql)


#### 🧠 Digital Wellness Behavioral Analysis

<img width="475" alt="dashboard_overview" src="./digital_wellness_behavioral_analysis/visuals/overall_dashboard_view_page1.png" />  

  
*Looker dashboards revealing user engagement patterns and wellness trends*  

**Problem:** Behavioral engagement data lacked structure, limiting insight into usage patterns and trends across digital wellness programs.

**Solution:** Structured behavioral data pipeline with Python analysis and Looker visualization to identify engagement patterns and user trends.

**Impact:**
  
- 📊 Analyzed 5,000 participants (public Kaggle dataset, 25 variables); regression model explains ~86% of mental health score variance (R² = 0.856)
- 🎯 Stress level was the strongest predictor (~2.5x the standardized effect of physical activity)
- 💡 Translated findings into feature-prioritization recommendations for wellness platforms
- ⚠️ Cross-sectional data: results show correlation, not causation

**Tech Stack:** Python, Pandas, Looker, Data Visualization, Statistical Analysis  
  

👉 [**View Full Project**](./digital_wellness_behavioral_analysis/README.md) | [**See Code**](./digital_wellness_behavioral_analysis/scripts/wellness_data_analysis.ipynb)


#### 🏥 Hospital Operations Analysis

<img width="475" alt="dashboard_overview" src="./hospital_operations_analysis/visuals/Executive_Page_Dashboard.PNG" />  

*Power BI dashboard identifying cost drivers and readmission patterns*  
  
**Problem:** Limited visibility into hospital cost drivers, readmissions, and operational bottlenecks made it difficult for leadership to prioritize improvement efforts.  

**Solution:** Comprehensive data analysis using Python(Pandas, Scikit-learn) and Power BI dashboards to visualize key operational metrics and trends.  

**Impact:**
- 🎯 Identified 37% of patients as high-risk for readmission
- 💰 Modeled ~$1.2M in projected annual savings (readmission reduction + length of stay; scenario assumptions)
- 📊 Revealed utilization patterns supporting data-driven capacity planning
- ⚡ 5-page Power BI report for executive decision-making
  
> 📋 **Note:** Uses a synthetic dataset for demonstration. Model scores are perfect because the data is deterministic (expect AUC 0.70-0.85 on real data). Savings are scenario estimates, not realized results.

👉 [**View Full Project**](./hospital_operations_analysis/README.md) | [**See Code**](./hospital_operations_analysis/notebooks/)


---

## 💻 Technical Capabilities
- Python (Pandas, NumPy, Seaborn, Sci-kit Learn)
- SQL (PostgreSQL, MySQL, SQL Server)
- Power Query
- Git and GitHub

### Business Intelligence and Visualization
- Power BI
- Tableau
- Excel (Pivot-Tables, Dashboards, Slicers, Power Query)
- Looker

### Analytics and Modeling
- Data cleaning and transformation
- Exploratory data analysis
- KPI development
- Dashboard design
- Requirements gathering

### What I Build
- **Automation Pipelines:** Cut multi-week reporting cycles to days
- **Executive Dashboards:** Power BI/Tableau solutions for C-suite decision-making  
- **Operational Analytics:** KPI development, performance tracking, process optimization  
- **Predictive Models:** Readmission risk, cost forecasting, capacity planning

### Domain Expertise
- Healthcare Analytics (Clinical reporting, operations, quality metrics)
- Process Automation (ETL pipelines, scheduled reporting, data integration)
- Stakeholder Communication (Translating technical insights for non-technical audiences)

---

## 🎯 What I'm Looking For

I'm seeking **Analytics Manager**, **Data Analyst**, **BI Analyst**, or **Business Analyst** roles where I can:
- Build scalable analytics solutions that eliminate manual processes
- Create executive-level dashboards driving strategic decisions
- Apply healthcare/operational domain expertise
- Lead cross-functional analytics initiatives

**Work Preferences:** Remote | Hybrid   
**Availability:** Immediate

---
### 📫 Let’s Connect

If you are interested in discussing analytics, automation, or operational improvement initiatives, please don't hesitate to connect.

📄 [Resume](./resume/Gabriel-Palomarez-Healthcare-Data-Analyst.pdf)  
💼 [LinkedIn](https://www.linkedin.com/in/gabrielpalomarez)  
📧 gpalo23@icloud.com

---
  
## 📂 Repository Structure

- **CMS_Gaps_Dashboard/** - Clinical reporting automation
- **digital_wellness_behavioral_analysis/** - Behavioral engagement analytics
- **hospital_operations_analysis/** - Hospital cost & readmission analysis
- **sql-b2b_marketing_perf_analysis/** - B2B marketing SQL analytics
- **README.md** - This file

---

<div align="center">

![GitHub last commit](https://img.shields.io/github/last-commit/gpalomar12/Data-Projects-Portfolio?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/gpalomar12/Data-Projects-Portfolio?style=flat-square)

⭐ **Star this repo if you find it helpful!**

*Thanks for stopping by!*
</div>
