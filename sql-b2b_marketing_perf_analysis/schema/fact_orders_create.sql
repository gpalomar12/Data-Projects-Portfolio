DROP TABLE IF EXISTS fact_orders CASCADE;

CREATE TABLE fact_orders (
    order_id INT PRIMARY KEY,
    account_id INT NOT NULL REFERENCES dim_accounts(account_id),
    occurred_at TIMESTAMP NOT NULL,
    standard_qty INT,
    gloss_qty INT,
    poster_qty INT,
    total_qty INT,
    standard_amt_usd NUMERIC(12,2),
    gloss_amt_usd NUMERIC(12,2),
    poster_amt_usd NUMERIC(12,2),
    total_amt_usd NUMERIC(12,2)
);
