## Event-Driven Data Ingestion with Snowpipe & CDC

## 📌 Problem Statement
Build a **production-grade, event-driven data ingestion pipeline** that automatically ingests semi-structured data from external cloud storage into a data warehouse, processes it incrementally, and maintains a curated current-state table using CDC principles.

---

## 🧰 Tech Stack
- **Cloud Storage:** <CLOUD_STORAGE_SERVICE>  
- **Message Queue:** <MESSAGE_QUEUE_SERVICE>  
- **Data Warehouse:** <DATA_WAREHOUSE>  
- **Ingestion:** Snowpipe (Auto-Ingest)  
- **CDC:** Streams  
- **Transformation:** ELT using SQL  

---

## 🔄 Data Flow
1. Data files land in `<CLOUD_STORAGE_SERVICE>` under a specific prefix.
2. Storage events trigger messages to `<MESSAGE_QUEUE_SERVICE>`.
3. Snowpipe auto-ingests data into a raw table without manual intervention.
4. Raw data is stored as semi-structured `VARIANT`.
5. A stream captures incremental changes.
6. MERGE logic updates a curated current-state table.

---

## 🗂️ Table Design

### Raw Table
- Stores data exactly as received
- Uses semi-structured `VARIANT`
- Captures file metadata and ingestion time

### Curated Table (Type-1 / Current State)
- One row per business key
- Latest version only
- Updated using `updated_at` timestamp
- No duplicates, no full reloads

---

## 🔁 CDC Strategy
- **Streams** track changes on the raw table
- Stream records are consumed once
- MERGE handles:
  - Inserts for new business keys
  - Updates for newer versions of existing keys

---

## ⚠️ Initial Backfill vs Incremental Load
This pipeline follows a **two-phase approach**:

1. **One-time backfill**
   - Loads the latest record per business key from raw data
2. **Incremental CDC**
   - All future changes processed via stream + MERGE

Streams are **not** used for historical backfill.

---

## 🚀 Why Snowpipe (Auto-Ingest)
- Fully event-driven
- No schedulers or cron jobs
- Scales automatically
- Native integration with cloud storage and message queues

---

## 🔐 Security Considerations
- Least-privilege IAM policy
- Restricted to specific storage prefix
- External ID used for secure role assumption
- No credentials stored in code or repository

---

## 🧪 Validation
- Auto-ingest verified without manual refresh
- New file upload triggers ingestion automatically
- CDC verified for both inserts and updates
- Stream consumption behavior validated

---

## 🧠 Key Learnings
- Event-driven ingestion differs fundamentally from batch pipelines
- CDC requires both an initial snapshot and incremental logic
- Streams are not replay mechanisms
- Correct cloud security configuration is critical for reliability

---

## 🔜 Next Enhancements
- SCD Type-2 implementation
- Task-based automation
- Warehouse-ready dimensional modeling
- Workflow orchestration

---

## ✅ Status
**Completed:** Event-driven ingestion + CDC (Type-1)  
**Next:** SCD Type-2 + automation

---

### 🔥 Final Note
This project demonstrates **real-world ingestion and CDC patterns**, validated end-to-end in a cloud environment, without relying on manual triggers or batch reloads.
