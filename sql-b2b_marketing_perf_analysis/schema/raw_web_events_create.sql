CREATE TABLE raw_web_events (
    id INTEGER PRIMARY KEY,
    account_id INTEGER,
    occurred_at TIMESTAMP,
    channel VARCHAR(50),
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
        REFERENCES raw_accounts(id)
);

