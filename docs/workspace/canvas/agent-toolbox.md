# Canvas: Agent Toolbox View

Agents can use **tools** (Actions, Flows, or other Agents). The Agent Toolbox lists what the Agent can call.

## Characteristics
- Toolbox items are **not connected** by Edges.
- Tools are **available** for the Agent to invoke during execution.
- Tools can themselves contain other components.

## Creating tools
- Click the large **＋** to add a tool:
  - **Action** — atomic Python logic
  - **Flow** — orchestrated logic
  - **Agent** — nested agent for complex strategies

## Tips
- Keep tools **small and testable**.
- Prefer **descriptive names** (e.g., `fetch_user_profile`).
- Start with a few high-value tools; expand as needs grow.

!!! note "Execution control"
    The Agent decides **when** to use tools; you define **which** tools it *can* use by curating the toolbox.
