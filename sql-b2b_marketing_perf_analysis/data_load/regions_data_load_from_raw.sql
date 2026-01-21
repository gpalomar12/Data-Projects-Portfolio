INSERT INTO dim_regions(region_id, region_name)
SELECT 
	id::INTEGER,
	name
FROM raw_regions