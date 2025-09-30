# Executions

An **Execution** runs a Node (Action or Flow) with a defined input and produces one or more outputs, along with logs, traces, and metrics.

## How executions start
- **Manual** — Run from **Properties → Execute**.
- **API/Schedule** — Triggered externally (for exposed top-level Nodes).
- **Internal** — Invoked by another Node within a Flow.

## Characteristics
- **Isolated** — No shared state between runs.
- **Reproducible** — Inputs, modifiers, and context are logged.
- **Traceable** — Inspect logs, traces, and metrics historically.
- **Evaluated** — Optionally score outputs with Evaluations.

## Flow of an execution
1. **Trigger** — Manual, schedule, or API.
2. **Input** — JSON payload (from trigger or saved Payload).
3. **Process** — Node(s) execute and pass data along Edges.
4. **Output** — Result returned or stored.
5. **Feedback** — Observability data recorded.

## Practical tips
- Save **Payloads** for common scenarios.
- Keep inputs **small** and **typed** for easier regression.
- Use consistent correlation fields to stitch traces across components.

!!! note "Parallelism"
    For components with **Parallel** ON, provide a list of inputs; each item is executed concurrently and aggregated downstream.
