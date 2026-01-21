-- Monthly Revenue Trend

SELECT
    DATE_TRUNC('month', occurred_at) AS revenue_month,
    SUM(total_amt_usd) AS total_revenue_usd
FROM fact_orders
GROUP BY revenue_month
ORDER BY revenue_month;


-- Month-Over-Month Revenue Growth

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', occurred_at) AS revenue_month,
        SUM(total_amt_usd) AS total_revenue
    FROM fact_orders
    GROUP BY revenue_month
)
SELECT
    revenue_month,
    total_revenue,
    total_revenue - LAG(total_revenue) OVER (ORDER BY revenue_month) AS mom_revenue_change,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY revenue_month))
        / NULLIF(LAG(total_revenue) OVER (ORDER BY revenue_month), 0) * 100,
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY revenue_month;

-- Customer and Account Performance Top 10

SELECT
    a.account_name,
    SUM(o.total_amt_usd) AS lifetime_revenue
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
GROUP BY account_name
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- Average Order Value by Account

SELECT
    a.account_name,
    ROUND(AVG(o.total_amt_usd), 2) AS avg_order_value
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
GROUP BY account_name
ORDER BY avg_order_value DESC;

-- Repeat Order Frequency
SELECT
    a.account_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(
        COUNT(o.order_id)::NUMERIC
        / COUNT(DISTINCT DATE_TRUNC('month', o.occurred_at)),
        2
    ) AS avg_orders_per_month
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
GROUP BY account_name
ORDER BY avg_orders_per_month DESC;

-- Sales Performance by Sales Representative

SELECT
    s.sales_rep_name,
    r.region_name,
    SUM(o.total_amt_usd) AS total_revenue
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
JOIN dim_sales_reps s ON a.sales_rep_id = s.sales_rep_id
JOIN dim_regions r ON s.region_id = r.region_id
GROUP BY 1,2
ORDER BY total_revenue DESC;

-- Revenue Contribution by Region

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
GROUP BY 1
ORDER BY region_revenue DESC;

-- Average product mix per order

SELECT
    ROUND(AVG(standard_qty), 2) AS avg_standard_qty,
    ROUND(AVG(gloss_qty), 2) AS avg_gloss_qty,
    ROUND(AVG(poster_qty), 2) AS avg_poster_qty
FROM fact_orders;

-- Revenue Share by Product Type

SELECT
    'Standard' AS product_type,
    SUM(standard_amt_usd) AS revenue
FROM fact_orders
UNION ALL
SELECT
    'Gloss',
    SUM(gloss_amt_usd)
FROM fact_orders
UNION ALL
SELECT
    'Poster',
    SUM(poster_amt_usd)
FROM fact_orders;

-- Web Traffic by Channel

SELECT
    channel,
    COUNT(*) AS total_events
FROM fact_web_events
GROUP BY 1
ORDER BY total_events DESC;

-- Orders following a web interaction

SELECT
    w.channel,
    COUNT(DISTINCT o.order_id) AS orders_after_event
FROM fact_web_events w
JOIN fact_orders o
  ON w.account_id = o.account_id
 AND w.occurred_at <= o.occurred_at
GROUP BY 1
ORDER BY orders_after_event DESC;

-- Average Time from First Web Event to First Order

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
JOIN first_orders o
  ON e.account_id = o.account_id;

-- Rolling 3-month revenue

SELECT
    DATE_TRUNC('month', occurred_at) AS revenue_month,
    SUM(total_amt_usd) AS monthly_revenue,
    SUM(SUM(total_amt_usd)) OVER (
        ORDER BY DATE_TRUNC('month', occurred_at)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_revenue
FROM fact_orders
GROUP BY revenue_month
ORDER BY revenue_month;


-- Account Revenue Ranking with Region

SELECT
    r.region_name,
    a.account_name,
    SUM(o.total_amt_usd) AS total_revenue,
    RANK() OVER (
        PARTITION BY r.region_name
        ORDER BY SUM(o.total_amt_usd) DESC
    ) AS revenue_rank
FROM fact_orders o
JOIN dim_accounts a ON o.account_id = a.account_id
JOIN dim_sales_reps s ON a.sales_rep_id = s.sales_rep_id
JOIN dim_regions r ON s.region_id = r.region_id
GROUP BY region_name,account_name
ORDER BY r.region_name, revenue_rank;








