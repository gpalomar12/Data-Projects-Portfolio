# B2B Sales & Marketing Performance Analysis (PostgreSQL)

## Overview  

SQL-first analysis of US-based B2B sales, customers, and digital engagement data. This project focuses on  
data modeling, analytical SQL, and business-driven insights without reliance on cloud data warehouses or BI  
publishing tools.

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

**Revenue Concentration & Risk**
- Revenue is highly concentrated among a small subset of enterprise accounts, with the top 10 accounts representing a disproportionate share of total revenue
- This concentration introduces dependency risk if key accounts churn or reduce spending
- Regional distribution of high-value accounts is uneven, suggesting opportunity for territory rebalancing

**Sales Performance Drivers**
- Top-performing sales representatives demonstrate higher average order values rather than simply higher order counts
- Regional revenue differences appear driven more by account mix and deal size than by sales rep count alone
- Performance variation within regions suggests execution and strategy differences, not just market opportunity

**Customer Engagement Patterns**
- Accounts typically engage through web channels multiple times before making their first purchase, indicating a measurable conversion lag
- Direct traffic dominates web engagement preceding orders, suggesting strong brand recognition or existing customer behavior
- Conversion timing analysis reveals a predictable window between first digital interaction and first order, enabling targeted follow-up strategies

**Product & Order Composition**
- Product mix varies significantly across accounts, with certain product types driving disproportionate revenue contribution
- Average order composition shows bundling behavior rather than single-product purchases
- Revenue sensitivity to product mix suggests that small shifts toward higher-value product categories could materially impact total revenue without increasing order volume

**Growth & Seasonality**
- Revenue growth follows consistent patterns with identifiable seasonal cycles rather than volatile spikes
- Month-over-month growth analysis reveals predictable buying periods, enabling better forecasting and capacity planning
- Rolling 3-month revenue trends confirm sustained upward momentum rather than short-term anomalies

## Business Implications

These findings enable several actionable strategies:

- **Account Risk Management**: Identify and monitor high-concentration accounts; develop retention strategies for top revenue contributors
- **Sales Territory Optimization**: Rebalance territories based on account mix and revenue potential rather than geographic proximity alone
- **Rep Coaching & Development**: Focus coaching on deal sizing and value creation rather than just activity volume; study top performers' approaches to larger deals
- **Marketing Investment**: Allocate digital marketing resources to the measurable conversion window; prioritize channels that precede orders
- **Product Strategy**: Analyze product bundling opportunities; test pricing strategies that shift mix toward higher-margin categories
- **Revenue Forecasting**: Leverage seasonal patterns and rolling trends to improve forecast accuracy and resource planning


## Data Model

The schema was designed to support scalable analytical queries and mirrors real-world enterprise data models.

**Fact Tables:**
- `fact_orders`: Order-level transaction records with product quantities and revenue amounts
- `fact_web_events`: Digital engagement events by account and channel

**Dimension Tables:**
- `dim_accounts`: Account master data with sales rep assignment
- `dim_sales_reps`: Sales representative information with regional assignment
- `dim_regions`: Regional hierarchy and attributes

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

All queries are located in:  
[Core Analysis Queries](./sql/core_analysis_queries.sql)


### Highlighted Query: Conversion Timing Analysis

One representative query demonstrates the project's analytical depth:

**Average Time from First Web Event to First Order**

This query uses:
- Multiple CTEs for query organization and readability
- MIN() aggregation to identify first interactions
- Date arithmetic with EXTRACT(EPOCH FROM...) for precise time calculations
- Conversion from seconds to days for business-friendly metrics

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
- **Data Volume**: ~10K orders, ~350 accounts, ~9K web events (representative B2B scale)
- **Query Performance**: All queries execute in <500ms on standard hardware

---

[Home](https://github.com/gpalomar12/Data-Projects-Portfolio/blob/main/README.md)


