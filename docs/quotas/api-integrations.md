# API & Integrations Quotas

Quotas here govern how frequently your surfaces can be hit and how often build/publish operations can occur.

## Dimensions

### API Request Rate
- **What**: Requests per second/minute to exposed APIs.
- **Why**: Guards latency and stability.
- **Symptoms**: HTTP 429 (Too Many Requests); advise retry with backoff.

### Endpoint Concurrency
- **What**: Max in-flight requests per exposed top-level Node.
- **Why**: Prevents hot-spot overload on a single endpoint.
- **Symptoms**: Requests queue or fail fast.

### External Trigger Frequency (Schedules)
- **What**: Minimum interval between scheduled invocations.
- **Why**: Limits fan-out and repeated runs.
- **Symptoms**: Skipped ticks or delayed triggers.

### Builds / Publish Actions
- **What**: Limit on number of build/publish operations per window.
- **Why**: Encourages batching of changes.
- **Symptoms**: Further publishes are deferred or rejected.

## Resilience patterns
- Implement **retry with jitter** on 429s (e.g., exponential backoff).
- Use **idempotency keys** to avoid duplicate processing on retries.
- Add **circuit breakers** around hot paths that call expensive tools.

!!! tip "Load shaping"
    Use lightweight validation Nodes at API edges to reject bad requests early and keep downstream capacity for real work.
