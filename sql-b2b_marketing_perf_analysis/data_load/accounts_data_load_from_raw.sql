INSERT INTO dim_accounts (
    account_id,
    account_name,
    website,
    latitude,
    longitude,
    primary_poc,
    sales_rep_id
)
SELECT
    id::INT,
    name,
    website,
    lat::NUMERIC,
    long::NUMERIC,
    primary_poc,
    sales_rep_id::INT
FROM raw_accounts;
