DROP TABLE IF EXISTS dim_sales_reps CASCADE;

CREATE TABLE dim_sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name TEXT NOT NULL,
    region_id INT NOT NULL REFERENCES dim_regions(region_id)
);