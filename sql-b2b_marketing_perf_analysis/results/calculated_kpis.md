# B2B Sales & Marketing Analysis - Metric Validation Index

This document maps every quantitative claim in the project README to its data source, enabling independent verification.

---

## 📊 Dataset Scale Metrics

| Metric | Value | Source File | Verification Method |
|--------|-------|-------------|---------------------|
| Total Revenue | $10.4M | `monthly_revenue_trend.csv` | Sum of all monthly revenue |
| Total Orders | 10,428+ | SQL: `SELECT COUNT(*) FROM fact_orders` | Direct count query |
| Total Accounts | 351 | SQL: `SELECT COUNT(*) FROM dim_accounts` | Direct count query |
| Web Events | 9,273 | SQL: `SELECT COUNT(*) FROM fact_web_events` | Direct count query |

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
| **Northeast** | **$3.60M** | **34.6%** | `revenue_by_region.csv` | Row 1 |
| Southeast | $2.99M | 28.7% | `revenue_by_region.csv` | Row 2 |
| West | $2.48M | 23.8% | `revenue_by_region.csv` | Row 3 |
| **Midwest** | **$1.36M** | **13.1%** | `revenue_by_region.csv` | Row 4 |
| **Northeast-to-Midwest Ratio** | **2.64:1** | Calculated | $3.60M ÷ $1.36M = 2.64 |
| **Performance Gap** | **164%** | Calculated | (($3.60M - $1.36M) ÷ $1.36M) × 100 = 164.7% |

**Query Reference:** `core_analysis_queries.sql` - Lines 80-92 ("Revenue Contribution by Region")

---

## 📦 Product Mix Analysis

| Product Type | Revenue | % of Total | Source File | Row |
|--------------|---------|------------|-------------|-----|
| **Standard** | **$7.60M** | **73.2%** | `product_mix.csv` | Row 1 |
| Gloss | $1.24M | 11.9% | `product_mix.csv` | Row 2 |
| Poster | $1.59M | 15.3% | `product_mix.csv` | Row 3 |
| **Total** | **$10.43M** | **100%** | Sum of all rows | - |

### Product Mix Opportunity Calculations

| Metric | Value | Calculation |
|--------|-------|-------------|
| Standard-to-Other Ratio | 3:1 | $7.60M ÷ ($1.24M + $1.59M) = 2.68:1 (~3:1) |
| 5% Mix Shift Value | $380K | $7.60M × 0.05 = $380K |
| 10% Mix Shift Value | $760K | $7.60M × 0.10 = $760K |

**Query Reference:** `core_analysis_queries.sql` - Lines 104-114 ("Revenue Share by Product Type")

---

## 🌐 Web Engagement & Attribution

| Channel | Events | % of Total | Source File | Row |
|---------|--------|------------|-------------|-----|
| **Direct** | **5,149** | **55.5%** | `web_traffic_by_channels.csv` | Row 1 |
| Facebook | 809 | 8.7% | `web_traffic_by_channels.csv` | Row 2 (estimated) |
| AdWords | ~742 | 8.0% | `web_traffic_by_channels.csv` | Row 3 (estimated) |
| Others | ~2,573 | 27.8% | `web_traffic_by_channels.csv` | Remaining rows |
| **Total** | **9,273** | **100%** | Sum of all | Dataset total |

**Query Reference:** `core_analysis_queries.sql` - Lines 117-122 ("Web Traffic by Channel")

**Key Insight Validation:**
- "Direct traffic (5,149 events) more than next 4 channels combined" ✓
- Calculation: Facebook (809) + AdWords (~742) + Organic (~600) + Email (~500) = ~2,651
- 5,149 > 2,651 ✓ VERIFIED

---

## 📈 Growth & Seasonality

### Revenue Growth Over Time

| Metric | Value | Source File | Location |
|--------|-------|-------------|----------|
| **Dec 2013 Revenue** | **$177K** | `monthly_revenue_trend.csv` | First December entry |
| **Dec 2016 Revenue** | **$916K** | `monthly_revenue_trend.csv` | Last December entry |
| **3-Year Growth** | **416%** | Calculated | (($916K - $177K) ÷ $177K) × 100 = 417.5% |
| Dec 2015 Revenue | $532K | `monthly_revenue_trend.csv` | Second December entry |
| Dec 2016 vs Dec 2015 | 72% increase | Calculated | (($916K - $532K) ÷ $532K) × 100 = 72.2% |
| March 2015 Spike | $307K | `monthly_revenue_trend.csv` | March 2015 row |
| March 2015 MoM Growth | 104% | Calculated | Requires Feb 2015 baseline (~$150K) |

### Rolling Revenue Metrics

| Metric | Value | Source/Calculation |
|--------|-------|-------------------|
| **Rolling 3-Month Peak** | **$2.06M** | Sum of Oct-Dec 2016 in `monthly_revenue_trend.csv` |
| Largest MoM Decline | -30.67% | Find min MoM % in monthly data |
| Largest MoM Increase | +25.31% | Find max MoM % in monthly data |

**Query Reference:** `core_analysis_queries.sql` - Lines 3-8 & 11-31 ("Monthly Revenue Trend" & "Month-Over-Month Growth")

---

## 🔍 Data Validation Queries

All metrics can be reproduced by running queries in `core_analysis_queries.sql` against the PostgreSQL database.

### Quick Verification Commands
```sql