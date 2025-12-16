-- Must be run as ACCOUNTADMIN

CREATE OR REPLACE STORAGE INTEGRATION s3_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<AWS_ACCOUNT_ID>:role/snowflake_s3_role'
STORAGE_ALLOWED_LOCATIONS = ('s3://<bucket>/<prefix>/');

-- Verify Snowflake-generated values
DESC INTEGRATION s3_int;
