-- Initial backfill: latest record per order_id
-- run only once after creating the raw_orders and curated_orders tables
INSERT INTO curated_orders
SELECT
  data:order_id::STRING,
  data:customer_id::STRING,
  data:order_status::STRING,
  data:order_amount::NUMBER,
  data:currency::STRING,
  data:event_time::TIMESTAMP,
  data:updated_at::TIMESTAMP,
  file_name,
  load_time
FROM raw_orders
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY data:order_id::STRING
  ORDER BY data:updated_at::TIMESTAMP DESC
) = 1;


