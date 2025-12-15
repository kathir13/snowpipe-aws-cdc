-- =========================================================
-- File: 02_external_stage.sql
-- Purpose: Create external stage pointing to Azure Blob Storage
-- Scope: SCHEMA LEVEL (RAW)
-- =========================================================

USE ROLE ACCOUNTADMIN;

-- Use correct database and schema
-- Replace PROJECT_2 if your database name differs
USE DATABASE PROJECT_2;

CREATE SCHEMA IF NOT EXISTS RAW;

USE SCHEMA RAW;

-- Create external stage using Azure storage integration
CREATE OR REPLACE STAGE ORDERS_STAGE
URL = 'azure://<storage_account_name>.blob.core.windows.net/orders'
STORAGE_INTEGRATION = azure_orders_int
FILE_FORMAT = (TYPE = JSON);

-- Validate stage access
LIST @ORDERS_STAGE;
