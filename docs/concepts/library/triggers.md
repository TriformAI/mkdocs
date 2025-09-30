# Triggers

Triggers are entry points that start executions.

## Types
- **API** — Expose a top-level Agent/Flow as an HTTP endpoint.
- **Schedule** — Run on a cadence (cron-style).

## Where they live
- Triggers are managed at the **Project** surface when you **Expose** top-level Nodes.

## Best practices
- Keep request/response shapes **stable**.
- Validate inputs at the edge before invoking deeper logic.
- Use environment-specific configuration per Project.

!!! tip "Design for observability"
    Include correlation IDs or request metadata in your inputs for traceability across downstream Nodes.
