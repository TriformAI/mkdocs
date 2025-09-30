# Quick Reference

A compact cheat sheet for everyday Triform tasks.

## Navigation
- **Breadcrumbs** (Top Bar): Jump between Org → Project → Component.
- **Home** (logo): Go to Projects dashboard.
- **Profile**: Switch Organization, view Org settings, log out.

## Canvas basics
- **Click**: Select a Node.
- **Double-click**: Open Project/Agent/Flow internals.
- **Right-click**: Context actions on Canvas or Node.
- **Drag**: Reposition Nodes to clarify flow.

## Building blocks
- **Project View**: Top-level Agents/Flows eligible for API/Schedule.
- **Agent Toolbox**: Add tools (Actions/Flows/Agents) via **＋**.
- **Flow View**:
  - Input/Output Nodes always present.
  - **＋** on Input/Output to add named ports.
  - Drag from a connection point to create **Edges** or **new components**.

## Properties Panel
- **Global → Variables**: Project-scoped configuration values.
- **Components → Definition**: Intent, requirements, constraints.
- **Components → Content**:
  - **Agents**: Model, prompts, tools, advanced settings.
  - **Flows**: Arrange and connect sub-components.
  - **Actions**: `Action.py`, `README`, `requirements.txt`.
- **Execute**: Run with a JSON payload; project-level API/Schedule exposure and API key management.
- **Input & Output**: Define ports, types, defaults; toggle **Parallel**.

## Executions
- Start manually, via API/Schedule, or from another Node.
- Each run is **isolated**, **reproducible**, and **traceable**.
- Use **Payloads** to save examples and rerun tests quickly.

## Quotas at a glance
- **Execution-Based**: total runs, concurrency, duration, depth, recursion.
- **Resource-Based**: payload size, script size, stored Payloads, module size/deps.
- **API & Integrations**: request rate, endpoint concurrency, schedules, publishes.
- **Account-Specific**: environments, variables/secrets, alert/evaluation counts.

## Deployment & exposure
- **Deploy** (Top Bar) appears when local changes outpace last deploy.
- Expose **top-level** Agents/Flows as **APIs** or **Schedules** under **Execute**.
- Manage **API keys** at the Project level.

## Troubleshooting quick wins
- **Mismatched I/O**: Align port names and types on both ends.
- **Over-large payload**: Split into batches; toggle **Parallel**.
- **Rate limit (429)**: Retry with exponential backoff + jitter.
- **Agent drift**: Reduce tools, tighten System Prompt, re-test with saved Payloads.

!!! tip "Golden path for a new Flow"
    1) Input `text` → 2) Action `summarize_text` → 3) Output `summary`.  
    Save `minimal` and `edge` Payloads, validate, then wire it into a larger Flow or expose it as an API.
