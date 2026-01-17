CREATE TABLE raw_sales_reps(
	id INTEGER PRIMARY KEY,
	name VARCHAR(100),
	region_id INTEGER,
	
	CONSTRAINT fk_region
		FOREIGN KEY (region_id)
		REFERENCES raw_regions(id)

)