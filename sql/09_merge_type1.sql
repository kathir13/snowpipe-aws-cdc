-- Incremental CDC merge using stream (Type-1 overwrite)

MERGE INTO curated_orders tgt
USING (
  SELECT
    data:order_id::STRING      AS order_id,
    data:customer_id::STRING   AS customer_id,
    data:order_status::STRING  AS order_status,
    data:order_amount::NUMBER  AS order_amount,
    data:currency::STRING      AS currency,
    data:event_time::TIMESTAMP AS event_time,
    data:updated_at::TIMESTAMP AS updated_at,
    file_name                  AS source_file,
    load_time                  AS ingestion_time
  FROM raw_orders_stream
  WHERE METADATA$ACTION = 'INSERT'
) src
ON tgt.order_id = src.order_id

WHEN MATCHED
AND src.updated_at > tgt.updated_at
THEN UPDATE SET
  customer_id    = src.customer_id,
  order_status   = src.order_status,
  order_amount   = src.order_amount,
  currency       = src.currency,
  event_time     = src.event_time,
  updated_at     = src.updated_at,
  source_file    = src.source_file,
  ingestion_time = src.ingestion_time

WHEN NOT MATCHED
THEN INSERT (
  order_id,
  customer_id,
  order_status,
  order_amount,
  currency,
  event_time,
  updated_at,
  source_file,
  ingestion_time
)
VALUES (
  src.order_id,
  src.customer_id,
  src.order_status,
  src.order_amount,
  src.currency,
  src.event_time,
  src.updated_at,
  src.source_file,
  src.ingestion_time
);
