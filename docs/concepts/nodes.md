# Nodes

Nodes are Triform’s fundamental building blocks. Every piece of behavior—Agents, Flows, Actions, and even Projects as containers—appears as a Node on the Canvas.

## Properties of a Node
- **Inputs / Outputs** — Typed connection points that define data contracts.
- **Definition** — Purpose, requirements, constraints.
- **Content** — Implementation/configuration (varies by Node type).
- **Execute** — Run with a JSON payload; view results.
- **Observability** — Executions emit logs, traces, and metrics.

## Types of Nodes
- **Project** — A scoped workspace that contains top-level Agents/Flows.
- **Agent** — LLM-driven logic that can call tools (Actions, Flows, other Agents).
- **Flow** — A directed graph of Nodes connected by Edges.
- **Action** — Atomic Python logic.
- **Input / Output** — Special Nodes that mark Flow boundaries.

## Lifecycle
1. **Draft** — Define intent and I/O.
2. **Test** — Use Payloads and small runs.
3. **Compose** — Chain into Flows or add as Agent tools.
4. **Expose** — Promote top-level Agents/Flows to API/Schedule.
5. **Deploy** — Push current state; track changes over time.

!!! tip "Keep contracts stable"
    Name and type your Inputs/Outputs early. Stable interfaces reduce downstream refactors.
