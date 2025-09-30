# Canvas: Overview

The Canvas is your **workspace**, **debugger**, and **execution surface**. You compose systems as **Nodes** connected by **Edges**.

## What you see
- **Nodes**: visual building blocks (Agents, Flows, Actions, Projects).
- **Edges**: connections that define data & control flow.

## Core interactions
- **Select**: click a Node.
- **Open**: double-click to drill into Projects, Agents, or Flows.
- **Context menu**: right-click a Node or the Canvas for actions.
- **Rearrange**: drag Nodes to clarify structure.

## Why Canvas
- Makes complex logic legible at a glance.
- Encourages modular, reusable patterns.
- Enables debugging without diving into raw logs.

!!! note "Where execution happens"
    You run Nodes from **Properties → Execute**. The Canvas reflects structure; the Properties panel manages configuration and runs.

## Best practices
- **Name Nodes clearly** (e.g., `Normalize Input`, `Route by Type`).
- **Group related Nodes** visually.
- Keep **flows shallow** where possible; compose via sub-Flows.
