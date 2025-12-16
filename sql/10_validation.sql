-- Raw data check
SELECT COUNT(*) FROM raw_orders;

-- Curated data check
SELECT * FROM curated_orders ORDER BY ingestion_time DESC;

-- Stream visibility (should be empty after merge)
SELECT * FROM raw_orders_stream;
