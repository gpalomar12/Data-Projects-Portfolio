INSERT INTO fact_orders (
    order_id,
    account_id,
    occurred_at,
    standard_qty,
    gloss_qty,
    poster_qty,
    total_qty,
    standard_amt_usd,
    gloss_amt_usd,
    poster_amt_usd,
    total_amt_usd
)
SELECT
    id::INT,
    account_id::INT,
    occurred_at::TIMESTAMP,
    standard_qty::INT,
    gloss_qty::INT,
    poster_qty::INT,
    total::INT,
    standard_amt_usd::NUMERIC(12,2),
    gloss_amt_usd::NUMERIC(12,2),
    poster_amt_usd::NUMERIC(12,2),
    total_amt_usd::NUMERIC(12,2)
FROM raw_orders;
