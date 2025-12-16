-- Current-state (Type-1) curated table
CREATE OR REPLACE TABLE curated_orders (
  order_id STRING,
  customer_id STRING,
  order_status STRING,
  order_amount NUMBER,
  currency STRING,
  event_time TIMESTAMP,
  updated_at TIMESTAMP,
  source_file STRING,
  ingestion_time TIMESTAMP
);
