# S3 Bucket Configuration (for Snowpipe Auto-Ingest)

## Bucket
- Name: <S3_BUCKET_NAME>
- Region: <AWS_REGION>
- Public Access: Blocked

## Prefix (Folder)
- <S3_PREFIX>/

## Event Notification
- Event type: s3:ObjectCreated:*
- Prefix filter: <S3_PREFIX>/
- Destination: SQS queue

## Resulting Flow
S3 → SQS → Snowpipe → Raw Table

Reference : [Snowflake_Doc](https://docs.snowflake.com/en/user-guide/data-load-snowpipe-auto-s3#option-1-creating-a-new-s3-event-notification-to-automate-snowpipe)