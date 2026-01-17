CREATE TABLE fact_orders(
	order_id INTEGER PRIMARY KEY,
	account_id INTEGER REFERENCES dim_accounts(account_id),
	occured_at TIMESTAMP,
	standard_qty INTEGER,
	gloss_qty INTEGER,
	poster_qty INTEGER,
	total_qty INTEGER,
	standard_amt_usd NUMERIC(12,2),
	gloss_amt_usd NUMERIC(12,2),
	poster_amt_usd NUMERIC(12,2),
	total_amt_usd NUMERIC(12,2)

)