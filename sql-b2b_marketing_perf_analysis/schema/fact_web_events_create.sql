DROP TABLE IF EXISTS fact_web_events CASCADE;

CREATE TABLE fact_web_events (
    web_event_id INT PRIMARY KEY,
    account_id INT NOT NULL REFERENCES dim_accounts(account_id),
    occurred_at TIMESTAMP NOT NULL,
    channel TEXT NOT NULL
);
