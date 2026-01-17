CREATE TABLE raw_orders(
	id INTEGER PRIMARY KEY,
	account_id VARCHAR(5),
	occurred_at TIMESTAMP,
	standard_qty INTEGER,
	gloss_qty INTEGER,
	poster_qty INTEGER,
	total INTEGER,
	standard_amt_usd DECIMAL(10,2),
	gloss_amt_usd DECIMAL(10,2),
	poster_amt_usd DECIMAL(10,2),
	total_amt_usd DECIMAL(10,2)

)