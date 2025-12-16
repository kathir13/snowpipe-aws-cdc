CREATE OR REPLACE PIPE orders_pipe
AUTO_INGEST = TRUE
AS
COPY INTO raw_orders (data, file_name)
FROM (
  SELECT
    $1,
    METADATA$FILENAME
  FROM @my_s3_stage
);

-- Pipe status check
SELECT SYSTEM$PIPE_STATUS('orders_pipe');

-- One-time backfill only (DO NOT use for auto-ingest testing)
-- ALTER PIPE orders_pipe REFRESH;
