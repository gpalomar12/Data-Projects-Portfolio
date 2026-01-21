DROP TABLE IF EXISTS dim_accounts CASCADE;

CREATE TABLE dim_accounts (
    account_id INT PRIMARY KEY,
    account_name TEXT NOT NULL,
    website TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    primary_poc TEXT,
    sales_rep_id INT NOT NULL REFERENCES dim_sales_reps(sales_rep_id)
);
