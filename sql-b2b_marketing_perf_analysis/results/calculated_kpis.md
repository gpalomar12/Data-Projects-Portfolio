# B2B Sales & Marketing Analysis - Metric Validation Index

This document maps every quantitative claim in the project README to its data source, enabling independent verification.

---

## 📊 Dataset Scale Metrics

| Metric | Value | Source File | Verification Method |
|--------|-------|-------------|---------------------|
| Total Revenue | $10.4M | `monthly_revenue_trend.csv` | Sum of all monthly revenue |
| Total Orders | 4,050 | SQL: `SELECT COUNT(*) FROM fact_orders` | Direct count query |
| Total Accounts | 351 | SQL: `SELECT COUNT(*) FROM dim_accounts` | Direct count query |
| Web Events | 8,273 | SQL: `SELECT COUNT(*) FROM fact_web_events` | Direct count query |

---

## 💰 Revenue Concentration & Risk

### Top 10 Accounts Analysis

| Metric | Value | Source File | Row/Calculation |
|--------|-------|-------------|-----------------|
| **Top 10 Account Revenue** | **$1.59M** | `top_10_accounts.csv` | Sum of rows 1-10 |
| Top 10 Revenue % | **15.3%** | Calculated | $1.59M ÷ $10.4M = 0.153 |
| #1 Account (Pacific Life) | $252.7K | `top_10_accounts.csv` | Row 1 |
| #2 Account (Core-Mark) | $213.9K | `top_10_accounts.csv` | Row 2 |
| Pacific Life vs Core-Mark Gap | 18% more | Calculated | ($252.7K - $213.9K) ÷ $213.9K = 0.181 |

**Query Reference:** `core_analysis_queries.sql` - Lines 38-43 ("Customer and Account Performance Top 10")

---

## 🌎 Regional Performance

| Region | Revenue | % of Total | Source File | Row |
|--------|---------|------------|-------------|-----|
| **Northeast** | **$3.60M** | **34.5%** | `revenue_by_region.csv` | Row 1 |
| Southeast | $2.99M | 28.7% | `revenue_by_region.csv` | Row 2 |
| West | $2.48M | 23.7% | `revenue_by_region.csv` | Row 3 |
| **Midwest** | **$1.36M** | **13.1%** | `revenue_by_region.csv` | Row 4 |
| **Northeast-to-Midwest Ratio** | **2.64:1** | Calculated | $3.60M ÷ $1.36M = 2.64 |
| **Performance Gap** | **164%** | Calculated | (($3.60M - $1.36M) ÷ $1.36M) × 100 = 164.0% |

**Query Reference:** `core_analysis_queries.sql` - Lines 80-92 ("Revenue Contribution by Region")

---

## 📦 Product Mix Analysis

| Product Type | Revenue | % of Total | Source File | Row |
|--------------|---------|------------|-------------|-----|
| **Standard** | **$7.60M** | **72.9%** | `core_analysis_queries.sql` (revenue by product) | Row 1 |
| Gloss | $1.24M | 11.9% | `core_analysis_queries.sql` (revenue by product) | Row 2 |
| Poster | $1.59M | 15.2% | `core_analysis_queries.sql` (revenue by product) | Row 3 |
| **Total** | **$10.43M** | **100%** | Sum of all rows | - |

### Product Mix Opportunity Calculations

| Metric | Value | Calculation |
|--------|-------|-------------|
| Standard-to-Other Ratio | ~2.7:1 | $7.60M ÷ ($1.24M + $1.59M) = 2.69:1 |
| 5% of Standard revenue | $380K | $7.60M × 0.05 (sizing benchmark, not a forecast) |
| 10% of Standard revenue | $760K | $7.60M × 0.10 (sizing benchmark, not a forecast) |

**Query Reference:** `core_analysis_queries.sql` - Lines 104-114 ("Revenue Share by Product Type")

---

## 🌐 Web Engagement & Attribution

| Channel | Events | % of Total | Source File |
|---------|--------|------------|-------------|
| **Direct** | **5,149** | **62.2%** | `web_traffic_by_channels.csv` |
| Facebook | 809 | 9.8% | `web_traffic_by_channels.csv` |
| Organic | 785 | 9.5% | `web_traffic_by_channels.csv` |
| AdWords | 743 | 9.0% | `web_traffic_by_channels.csv` |
| Banner | 397 | 4.8% | `web_traffic_by_channels.csv` |
| Twitter | 390 | 4.7% | `web_traffic_by_channels.csv` |
| **Total** | **8,273** | **100%** | Sum of all rows |

**Key Insight Validation:** Direct (5,149) exceeds all other channels combined (3,124). ✓ VERIFIED


## 📈 Growth & Seasonality

### Revenue Growth Over Time

| Metric | Value | Calculation |
|--------|-------|-------------|
| Dec 2013 Revenue | $177K | `monthly_revenue_trend.csv`, Dec 2013 row |
| Dec 2016 Revenue | $916K | `monthly_revenue_trend.csv`, Dec 2016 row |
| 3-Year Growth | 417% | ($915,979 ÷ $177,254) - 1 = 416.8% |
| Dec 2015 Revenue | $267K | `monthly_revenue_trend.csv`, Dec 2015 row |
| Nov 2016 Revenue | $532K | `monthly_revenue_trend.csv`, Nov 2016 row |
| Dec 2016 vs Nov 2016 | +72% | ($915,979 ÷ $531,740) - 1 = 72.3% |
| Dec 2016 vs Dec 2015 | 3.4x (+243%) | $915,979 ÷ $267,006 |
| March 2015 | $307.7K, +103.9% MoM | Feb 2015 baseline $150.9K |


### Rolling Revenue Metrics

| Metric | Value | Source/Calculation |
|--------|-------|-------------------|
| **Rolling 3-Month Peak** | **$2.06M** | Sum of Oct-Dec 2016 in `monthly_revenue_trend.csv` |
| Largest MoM Decline | -30.7% (May 2015; excludes partial Jan 2017) | Min MoM % in monthly data |
| Largest MoM Increase | +103.9% (March 2015) | Max MoM % in monthly data |

**Query Reference:** `core_analysis_queries.sql` - Lines 3-8 & 11-31 ("Monthly Revenue Trend" & "Month-Over-Month Growth")

---

## 🔍 Data Validation Queries

All metrics can be reproduced by running queries in `core_analysis_queries.sql` against the PostgreSQL database.

### Quick Verification Commands
```sql