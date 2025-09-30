# Quotas

Quotas define the operational boundaries of your Organization, Projects, and components. They exist to provide **predictability** (know what will run), **fairness** (shared resources), and **safety** (avoid runaway executions).

While specific thresholds may vary by plan or tier, this section explains each quota dimension, how usage is counted, typical symptoms when you hit limits, and ways to design within constraints.

## Quota categories
- **Execution-Based (Organization)** — totals and concurrency of runs.
- **Resource-Based** — payload sizes, script sizes, stored artifacts.
- **API & Integrations** — request rates, schedules, publish/build operations.
- **Account-Specific** — environments, variables/secrets, custom alerts/evaluations.

## How limits are enforced
- **Hard limits**: Requests are rejected (e.g., HTTP 429 or a validation error).
- **Soft limits**: You receive warnings and are encouraged to reduce usage.
- **Windows**: Most rolling counters reset after a defined time window.

## Monitoring your usage
- Inspect **execution history** and **metrics** to understand run counts and durations.
- Review **project surfaces** (APIs/Schedules) for request rates and failures.
- Keep a small **dashboard Flow** to periodically snapshot usage into a log or table.

!!! tip "Design for headroom"
    Target 70–80% of allowed limits under peak load so you can absorb traffic spikes without breaching quotas.

## When you hit a limit
- Backoff and retry (exponential) for rate-limit errors.
- Reduce payload sizes or split work into batches.
- Consider **parallel fan-out** with smaller items rather than single large payloads.
- Upgrade your plan if sustained traffic requires more capacity.
