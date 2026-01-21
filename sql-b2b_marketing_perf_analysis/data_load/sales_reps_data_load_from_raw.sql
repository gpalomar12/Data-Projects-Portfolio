INSERT INTO dim_sales_reps (sales_rep_id, sales_rep_name, region_id)
SELECT 
	id:: INTEGER,
	name,
	region_id::INTEGER
FROM raw_sales_reps;