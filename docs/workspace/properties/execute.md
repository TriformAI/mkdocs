# Properties → Execute

Run any component and inspect results.

## Run a component
1. Select a Node (Project, Flow, Agent, or Action).
2. Open **Execute**.
3. Edit the **JSON payload** (starting from the default).
4. Click **Run**.

## Project-level exposure
- **APIs/Schedules**: choose which **top-level** components to expose.
- **API key**: create and manage keys for access (Project scope).

## Tips
- Keep small, realistic **payload examples** for quick regression checks.
- Use **parallel inputs** thoughtfully (see Input & Output).

!!! note "Traceability"
    Executions emit logs, traces, and metrics that you can inspect later to understand runtime behavior.
