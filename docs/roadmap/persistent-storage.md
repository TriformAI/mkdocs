# Persistent Storage — Upcoming

Integrated storage options for durable state that complements your Flows and Actions.

## Planned backends
- **Object Storage (S3)** — Large blobs and file artifacts.
- **Vector Storage (Qdrant)** — Embeddings, indexing, similarity search.
- **Relational (Postgres)** — Structured data with transactional guarantees.

## Usage patterns
- **Object**: Persist artifacts (e.g., pre/post-transformation files), attach object IDs to Execution logs.
- **Vector**: Store embeddings for retrieval-augmented generation; query during Agent tool calls.
- **Relational**: Keep normalized tables for user/config state; reference keys in Actions.

## Data lifecycle
- Define retention for logs and artifacts per environment.
- Tag records with Project/Execution IDs for traceability.
- Provide idempotent upserts to prevent duplication.

## Next steps
- Unified credentials/config via Variables.
- Node-level connectors with simple read/write APIs.
- UI explorers to browse buckets, collections, and tables.

!!! tip "Prefer references"
    Store **references** (IDs, URIs) in your payloads and logs; fetch the heavy data on demand.
