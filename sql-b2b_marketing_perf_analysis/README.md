# B2B Sales & Marketing Performance Analysis (PostgreSQL)

## Overview  

SQL-first analysis of US-based B2B sales, customers, and digital engagement data spanning 2013-2017. This project focuses on data modeling, analytical SQL, and business-driven insights without reliance on cloud data warehouses or BI publishing tools.

**Dataset Scale:** ~10.4M in total revenue across 10,428+ orders from 351 accounts with 9,273 web engagement events

## Key Skills Demonstrated
- PostgreSQL data modeling. Fact and dimension design
- Advanced SQL. CTEs, window functions, time-series analysis
- Revenue, customer, and sales performance analytics
- Marketing attribution and conversion timing analysis
- Data validation and quality assurance

## Business Questions Answered
- How is revenue trending over time?
- Which accounts and regions drive the most revenue?
- How do sales reps perform across regions?
- What is the relationship between web engagement and orders?
- How long does it take accounts to convert after the first interaction?

## Key Insights

Based on the analytical queries, this analysis revealed the following business-critical findings:

### Revenue Concentration & Risk
- **Top 10 accounts represent $1.59M (15.3%) of total revenue**, with Pacific Life alone contributing $252.7K
- Revenue concentration introduces significant dependency risk if key accounts churn or reduce spending
- The top account (Pacific Life at $252.7K) generates 18% more revenue than the #2 account (Core-Mark at $213.9K), indicating heavy reliance on individual relationships
- Regional distribution is highly uneven: Northeast generates **$3.60M (34.6%)** while Midwest contributes only **$1.36M (13.1%)**

### Sales Performance Drivers
- Regional performance gaps are substantial: **Northeast outperforms Midwest by 164%** in total revenue
- The Northeast-to-Midwest revenue ratio (2.64:1) far exceeds any reasonable territory size difference, suggesting strategic market differences rather than just geography
- Top-performing sales representatives demonstrate higher average order values rather than simply higher order counts
- Performance variation within regions suggests execution and strategy differences, not just market opportunity

### Customer Engagement Patterns
- **Direct traffic dominates web engagement with 5,149 events (55.5%)**, more than the next 4 channels combined
- Accounts typically engage through web channels multiple times before making their first purchase
- Direct channel's dominance (5,149 events vs 809 Facebook events) suggests strong brand recognition or existing customer behavior rather than new customer acquisition
- Conversion timing analysis reveals a predictable window between first digital interaction and first order, enabling targeted follow-up strategies

### Product & Order Composition
- **Standard paper products drive 73.2% of revenue** ($7.60M of $10.43M total), with Gloss and Poster combining for just 26.8%
- This 3:1 revenue ratio (Standard vs. other products combined) indicates significant opportunity cost if product mix could be shifted
- Average order composition shows bundling behavior rather than single-product purchases
- Revenue sensitivity to product mix suggests that small shifts toward higher-value product categories could materially impact total revenue without increasing order volume

### Growth & Seasonality
- Revenue grew from **$177K (Dec 2013)** to **$916K (Dec 2016)**, representing a **416% increase** over 3 years
- December 2016 peak ($916K) was 72% higher than the previous December ($532K), indicating accelerating year-end seasonality
- Month-over-month volatility ranges from **-30.67%** (largest decline) to **+25.31%** (largest increase)
- Rolling 3-month revenue peaked at **$2.06M** in December 2016, confirming sustained momentum rather than temporary spikes
- March 2015 showed anomalous spike (+104% MoM growth to $307K), worth investigating for causal factors

## Business Implications

These findings enable several actionable strategies:

### Account Risk Management
- **Immediate action:** Develop retention programs for the top 10 accounts representing $1.59M in revenue
- Monitor Pacific Life ($252.7K) relationship closely given its outsized contribution
- Create executive relationship mapping for accounts exceeding $150K annual revenue
- Consider diversification strategy to reduce concentration among top 20% of accounts

### Sales Territory Optimization
- **Investigate Northeast success factors** ($3.60M) for replication in Midwest ($1.36M)
- Rebalance territories based on account mix and revenue potential rather than geographic proximity alone
- Consider splitting high-performing territories (Northeast) to increase coverage density
- Analyze whether Midwest underperformance stems from market characteristics or execution gaps

### Rep Coaching & Development
- Focus coaching on deal sizing and value creation rather than just activity volume
- Study top performers' approaches to $150K+ accounts and document best practices
- Implement peer shadowing between Northeast and Midwest teams to transfer winning strategies
- Set performance targets based on average order value, not just order count

### Marketing Investment
- **Capitalize on direct traffic dominance** (5,149 events) by optimizing website conversion paths
- Allocate resources to the measurable conversion window; prioritize channels that precede orders
- Investigate why direct traffic (55.5%) so heavily outweighs paid channels (Facebook: 8.7%, AdWords: 8.0%)
- Consider whether paid channel underinvestment is leaving growth on the table

### Product Strategy
- **Analyze bundling opportunities** to shift mix from 73% Standard to more balanced portfolio
- Test pricing strategies that make Gloss (11.9% of revenue) and Poster (15.3%) more attractive
- Target 5-10% revenue shift toward non-Standard products, worth $380K-$760K annually
- Investigate why Standard dominates when other products might have higher margins

### Revenue Forecasting
- Leverage December seasonality pattern (peaks in 2015: $267K, 2016: $916K) for year-end planning
- Account for March volatility (2015 spike to $307K) in quarterly forecasts
- Use rolling 3-month trends ($2.06M peak) as leading indicator for sales capacity needs
- Build seasonal staffing models around predictable Q4 surge

## Data Model

The schema was designed to support scalable analytical queries and mirrors real-world enterprise data models.

**Fact Tables:**
- `fact_orders`: Order-level transaction records with product quantities and revenue amounts (10,428+ rows)
- `fact_web_events`: Digital engagement events by account and channel (9,273 rows)

**Dimension Tables:**
- `dim_accounts`: Account master data with sales rep assignment (351 accounts)
- `dim_sales_reps`: Sales representative information with regional assignment
- `dim_regions`: Regional hierarchy and attributes (4 regions: Northeast, Southeast, West, Midwest)

This fact/dimension structure enables efficient joins, maintains data integrity through foreign keys, and supports both detailed transactional queries and high-level aggregations.


## Data Source

US-based B2B commerce dataset containing accounts, orders, sales representatives, regions, and web engagement events. 

**Data Transformation Approach:**
- Raw data was loaded into PostgreSQL staging tables, mirroring the source CSV structure
- Schema design and normalization were performed to create an analytical data model
- Raw tables were transformed into dimension and fact tables using SQL-based ETL logic
- Data required cleaning, type conversion, and referential integrity enforcement

[Download Data from Kaggle](https://www.kaggle.com/datasets/yaminh/sales-dataset-of-different-regions?select=accounts.csv)


## Core SQL Analysis

The analysis demonstrates enterprise-level SQL capabilities including:

**Time-Series Analysis:**
- Monthly and rolling revenue trends using window functions
- Month-over-month growth calculations with LAG() functions
- Seasonal pattern identification

**Customer Analytics:**
- Account lifetime value aggregation
- Order frequency and cadence metrics
- Repeat purchase behavior analysis

**Sales Performance:**
- Sales rep and regional performance comparisons
- Revenue ranking within regions using PARTITION BY
- Contribution percentage calculations

**Product Analysis:**
- Product mix and order composition averages
- Revenue share by product type using UNION ALL
- Cross-product bundling patterns

**Marketing Attribution:**
- Web channel engagement tracking
- Temporal sequencing of events preceding orders
- Conversion lag measurement using time interval calculations

**Data Validation:**
- Row count reconciliation between raw and analytical tables
- Referential integrity checks across fact and dimension tables
- Null value and duplicate detection
- Date range and data consistency validation

All queries are located in:  
[Core Analysis Queries](./sql/core_analysis_queries.sql)  
[Data Validation Queries](./sql/data_validation_queries.sql)


### Highlighted Query: Revenue Contribution by Region

This query demonstrates window function mastery for calculating percentage contributions:

```sql
SELECT
    r.region_name,
    SUM(o.total_amt_usd) AS region_revenue,
    ROUND(
        SUM(o.total_amt_usd)
        / SUM(SUM(o.total_amt_usd)) OVER () * 100,
        2
    ) AS pct_of_total_revenue
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
JOIN dim_sales_reps s ON a.sales_rep_id = s.sales_rep_id
JOIN dim_regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY region_revenue DESC;
```

**Results:**
| region_name | region_revenue | pct_of_total_revenue |
|-------------|----------------|----------------------|
| Northeast   | $3,599,720     | 34.6%                |
| Southeast   | $2,990,085     | 28.7%                |
| West        | $2,475,455     | 23.8%                |
| Midwest     | $1,363,692     | 13.1%                |

**What this demonstrates:**
- Window function with OVER() for total revenue calculation without self-join
- Nested aggregation: SUM(SUM(...)) pattern for percentage calculations
- Multi-table joins across fact and dimension tables
- Clean business logic: "What percentage of revenue does each region contribute?"

This single query reveals the 2.6x performance gap between Northeast and Midwest, enabling immediate strategic discussion.

### Highlighted Query: Conversion Timing Analysis

This query uses multiple CTEs and date arithmetic to measure the conversion window:

```sql
WITH first_events AS (
    SELECT
        account_id,
        MIN(occurred_at) AS first_event_time
    FROM fact_web_events
    GROUP BY account_id
),
first_orders AS (
    SELECT
        account_id,
        MIN(occurred_at) AS first_order_time
    FROM fact_orders
    GROUP BY account_id
)
SELECT
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM (first_order_time - first_event_time)) / 86400
        ),
        2
    ) AS avg_days_to_first_order
FROM first_events e
JOIN first_orders o ON e.account_id = o.account_id;
```

**What this demonstrates:**
- Multiple CTEs for query organization and readability
- MIN() aggregation to identify first interactions
- Date arithmetic with EXTRACT(EPOCH FROM...) for precise time calculations
- Conversion from seconds (EPOCH) to days (÷ 86400) for business-friendly metrics

The query reveals how long accounts typically take to convert after initial web engagement, enabling marketing and sales teams to optimize follow-up timing and resource allocation during the conversion window.

## Why PostgreSQL & SQL-First

This project intentionally emphasizes SQL-based analysis and data modeling to demonstrate analytical depth in environments without cloud data warehouses or BI publishing access.

**PostgreSQL was chosen because:**
- It represents the most widely deployed open-source analytical database in enterprise environments
- Window functions, CTEs, and time-series capabilities directly translate to commercial databases (SQL Server, Oracle, Snowflake)
- The analytical patterns demonstrated are database-agnostic and applicable across platforms

**SQL-first approach demonstrates:**
- Ability to derive insights without dependency on visualization tools
- Deep understanding of data relationships and transformation logic
- Production-level analytical thinking: data modeling, validation, and query optimization
- Skills that translate directly to modern data stack roles (analytics engineering, data analysis, business intelligence)

This approach proves capability to work in resource-constrained environments, legacy systems, or greenfield projects where infrastructure decisions are still being made.
**SQL-first approach demonstrates:**
- Ability to derive insights without dependency on visualization tools
- Deep understanding of data relationships and transformation logic
- Production-level analytical thinking: data modeling, validation, and query optimization
- Skills that translate directly to modern data stack roles (analytics engineering, data analysis, business intelligence)

This approach proves capability to work in resource-constrained environments, legacy systems, or greenfield projects where infrastructure decisions are still being made.

## Design Decisions & Tradeoffs

**Schema Normalization:**
- Chose dimensional modeling over fully normalized 3NF to optimize for analytical query performance
- Accepted some data redundancy (e.g., region name in queries) to minimize join complexity for end users

**Attribution Logic:**
- Attribution is based on temporal sequencing of web events prior to orders
- This approach is directional and shows correlation, not causation
- More sophisticated multi-touch attribution would require additional business rules and weighting

**Data Granularity:**
- Maintained order-line-level detail in fact_orders to support product-level analysis
- Alternative approach would be pre-aggregated fact tables for performance, but this limits analytical flexibility

**Technology Constraints:**
- Local PostgreSQL instance limits scalability compared to cloud data warehouses
- No incremental load logic implemented; full refresh assumed for portfolio demonstration
- Production implementation would require CDC (change data capture) or timestamp-based incremental patterns

## Repository Structure

```
.
├── data_load/
│   ├── accounts_data_load.sql
│   ├── accounts_data_load_from_raw.sql
│   ├── orders_data_load.sql
│   ├── orders_data_load_from_raw.sql
│   ├── regions_data_load.sql
│   ├── regions_data_load_from_raw.sql
│   ├── sales_reps_data_load.sql
│   ├── sales_reps_data_load_from_raw.sql
│   ├── web_events_data_load.sql
│   └── web_events_data_load_from_raw.sql
│
├── schema/
│   ├── raw_accounts_create.sql
│   ├── raw_orders_create.sql
│   ├── raw_regions_create.sql
│   ├── raw_sales_reps_create.sql
│   ├── raw_web_events_create.sql
│   ├── dim_accounts_create.sql
│   ├── dim_regions_create.sql
│   ├── dim_sales_reps_create.sql
│   ├── fact_orders_create.sql
│   └── fact_web_events_create.sql
│
└── sql/
    ├── core_analysis_queries.sql
    └── data_validation_queries.sql
```
## Technical Environment

- **Database**: PostgreSQL 14+
- **SQL Features Used**: Window functions, CTEs, date arithmetic, aggregations, UNION operations
- **Data Volume**: 10,428 orders | 351 accounts | 9,273 web events | 4 regions
- **Total Revenue Analyzed**: $10.43M across 3+ years (2013-2017)
- **Query Performance**: All queries execute in <500ms on standard hardware

---

[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)


