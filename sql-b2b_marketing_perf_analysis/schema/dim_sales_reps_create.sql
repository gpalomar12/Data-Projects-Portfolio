CREATE TABLE dim_sales_reps(
	sales_rep_id INTEGER PRIMARY KEY,
	sales_rep_name TEXT,
	region_id INTEGER REFERENCES dim_regions(region_id)

)