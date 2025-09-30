# Expose Components (API & Schedule)

Only **top-level** Agents/Flows can be exposed as APIs or Schedules.

## API exposure
- Select the Project and open **Properties → Execute**.
- Choose a top-level Agent/Flow to **Expose as API**.
- Confirm request/response shapes (based on the Node’s I/O).

## Schedule exposure
- From **Properties → Execute**, pick a top-level Agent/Flow.
- Configure a **Schedule** (cron-style cadence).

## Best practices
- Keep API payloads **explicitly typed**.
- Perform basic validation at the edge.
- Use **Payloads** that mirror your API contract for local testing.

!!! note "Non top-level components"
    Sub-Flows and Actions can’t be exposed directly. Wrap them in a top-level Flow/Agent.
