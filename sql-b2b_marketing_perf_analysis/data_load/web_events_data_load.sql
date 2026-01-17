COPY raw_web_events
FROM 'C:/src/sql-ecommerce-analytics/data/web_events.csv'
DELIMITER ','
CSV HEADER;