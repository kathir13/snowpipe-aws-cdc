## Azure to Snowflake Real-Time Ingestion

## Day 1: External Storage & Secure Ingestion Setup

### Objective
Set up a secure, production-style ingestion path from Azure Blob Storage into Snowflake using
storage integrations and external stages.

### Architecture Overview
1. JSON order event files land in Azure Blob Storage
2. Snowflake uses an account-level storage integration for secure access
3. An external stage in the RAW schema points to the blob container
4. Data is validated using LIST before ingestion

### Why This Design
- External storage decouples producers from Snowflake
- Storage integrations avoid hard-coded credentials
- RAW schema stages enforce separation of concerns
- This setup enables Snowpipe auto-ingestion in later steps

### Tech Stack
- Azure Blob Storage
- Snowflake
- SQL
