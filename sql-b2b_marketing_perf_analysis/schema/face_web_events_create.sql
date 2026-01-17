CREATE TABLE fact_web_events(
	web_event_id INTEGER PRIMARY KEY,
	account_id INTEGER REFERENCES dim_accounts(account_id),
	occurred_at TIMESTAMP,
	channel TEXT
)