CREATE TABLE dim_accounts(
	account_id INTEGER PRIMARY KEY,
	account_name TEXT,
	website TEXT,
	latitude DOUBLE PRECISION,
	longitude DOUBLE PRECISION,
	primary_poc TEXT,
	sales_rep_id INTEGER REFERENCES dim_sales_reps(sales_rep_id)

)