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

## Business Questions Answered
- How is revenue trending over time?
- Which accounts and regions drive the most revenue?
- How do sales reps perform across regions?
- What is the relationship between web engagement and orders?
- How long does it take accounts to convert after the first interaction?

## Data Model
- Fact Tables: orders, web events
- Dimension Tables: accounts, sales reps, regions


The schema was designed to support scalable analytical queries and mirrors real-world enterprise data  
models.  

## Core SQL Analysis
- Monthly and rolling revenue trends
- Account lifetime value and order cadence
- Sales rep and regional performance
- Product mix and order composition
- Web channel engagement and conversion lag

All queries are located in:  
/sql/core_analysis_queries.sql

## Repository Structure

```
.
├── sql/
│   ├── core_analysis_queries.sql
│   └── schema_transformations.sql
├── README.md

```




