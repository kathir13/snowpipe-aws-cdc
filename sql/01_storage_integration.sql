-- =========================================================
-- File: 01_storage_integration.sql
-- Purpose: Create Azure storage integration for Snowflake
-- Scope: ACCOUNT LEVEL (requires ACCOUNTADMIN)
-- =========================================================

USE ROLE ACCOUNTADMIN;

-- Create storage integration for Azure Blob Storage
CREATE OR REPLACE STORAGE INTEGRATION azure_orders_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = AZURE
ENABLED = TRUE

-- Azure Tenant ID where the storage account exists
-- Replace with your own tenant ID before execution
-- you can find this in Azure Portal under Azure Active Directory > Properties
AZURE_TENANT_ID = '<AZURE_TENANT_ID>'

-- Allowed storage locations for Snowflake access
-- Replace <storage_account_name> accordingly

STORAGE_ALLOWED_LOCATIONS = (
  'azure://<storage_account_name>.blob.core.windows.net/orders'
);

-- Verify integration creation
DESC INTEGRATION azure_orders_int;
