SELECT COUNT(*) FROM raw_orders;
SELECT COUNT(*) FROM fact_orders;

SELECT COUNT(*) FROM raw_web_events;
SELECT COUNT(*) FROM fact_web_events;

SELECT COUNT(*)
FROM fact_orders o
LEFT JOIN dim_accounts a ON o.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT COUNT(*)
FROM dim_accounts a
LEFT JOIN dim_sales_reps s ON a.sales_rep_id = s.sales_rep_id
WHERE s.sales_rep_id IS NULL;
