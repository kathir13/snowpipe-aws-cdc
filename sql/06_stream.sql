-- CDC stream on raw table
CREATE OR REPLACE STREAM raw_orders_stream
ON TABLE raw_orders;
