CREATE OR REPLACE STAGE my_s3_stage
URL = 's3://<bucket>/<prefix>/'
STORAGE_INTEGRATION = s3_int
FILE_FORMAT = json_ff;

-- Connectivity test
LIST @my_s3_stage;
