# Flows

Flows connect Nodes (Actions, Agents, sub-Flows) into an executable graph.

## Building blocks
- **Input Node** — Named entry ports.
- **Processing Nodes** — Actions/Agents/Flows.
- **Output Node** — Named exit ports.
- **Edges** — Data/control movement between Nodes.

## Patterns
- **Linear** — Input → Action → Output.
- **Branching** — Route by condition into multiple paths.
- **Parallel** — Fan-out work; aggregate results downstream.

## Practices
- Keep Flows **legible** left-to-right.
- Favor **shallow** graphs; compose via sub-Flows for depth.
- Remove unused ports and edges to reduce confusion.

!!! tip "Design for testing"
    Save example Payloads at the Flow level to lock in expected shapes and make regression checks easy.
