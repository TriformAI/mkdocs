# Projects

A Project is a focused workspace within an Organization. It holds top-level components and their context.

## What a Project contains
- **Top-level Nodes** — Agents or Flows that may be exposed as APIs/Schedules.
- **Configuration** — Project-scoped settings like Variables.
- **Artifacts** — Actions, sub-Flows, Agents that support the top-level surface.

## Why Projects
- **Isolation** — Experiment safely within a bounded scope.
- **Access control** — Limit who can see or change components.
- **Deployment unit** — Deploy and expose from the Project surface.

## Typical workflow
1. Create or open a Project.
2. Model top-level entry points (Agents/Flows).
3. Compose sub-Flows and Actions beneath them.
4. Save Payloads, validate behavior, and **Deploy**.
5. **Expose** selected top-level Nodes via API or Schedule.

!!! note "Only top-level gets exposed"
    You can call sub-components internally, but only top-level Agents/Flows are eligible for API/Schedule exposure.
