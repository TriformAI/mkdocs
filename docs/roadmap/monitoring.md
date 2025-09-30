# Monitoring — In Progress

Always-on observability to help you understand and improve runtime behavior.

## What Monitoring includes
- **Logs** — Detailed, structured runtime messages.
- **Traces** — Step-by-step paths with timing across Nodes.
- **Metrics** — Quantitative indicators (counts, durations, error rates).

## How you’ll use it
- Inspect an **Execution** to see its logs and trace waterfall.
- Drill from an erroring Node into its **Action** context.
- Compare **metrics** across Deploys to validate improvements.

## Current focus
- Consistent event schemas across Actions/Flows.
- Lightweight log ingestion with contextual fields (Node, Project, Execution).
- Trace propagation through Agent tool calls.

## Known limitations (while in progress)
- Partial cross-Project stitching if an API calls another Project.
- Limited custom dashboards (predefined views first).

## Next steps
- **Correlation IDs** surfaced at API edges.
- **Custom dimensions** and filters for logs/metrics.
- **Export hooks** for shipping telemetry to external sinks.

!!! tip "Log with intent"
    Emit concise, structured logs that capture **what** happened and **why**—future you will thank present you.
