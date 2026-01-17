CREATE TABLE raw_accounts(
	id TEXT PRIMARY KEY,
	name VARCHAR(50),
	website TEXT,
	lat DOUBLE PRECISION,
	long DOUBLE PRECISION,
	primary_poc VARCHAR(30),
	sales_rep_id VARCHAR(7)
)


