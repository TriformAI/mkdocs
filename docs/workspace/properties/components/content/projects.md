# Properties → Components → Content → Projects

Projects define the **top-level** surface of your application.

## What they contain
- **Top-level Nodes** (Agents or Flows) that may contain other components.
- Configuration that applies to the Project scope (e.g., variables).

## Exposure
- Only **top-level Agents/Flows** can be exposed as **APIs** or **Schedules** (configured under **Execute**).

!!! tip "Model your domain"
    Map your domain’s entry points (API endpoints, schedules) to top-level Nodes and keep deeper logic inside sub-Flows or Actions.
