# Flow View: Basics

A Flow connects Nodes (Actions, Agents, sub-Flows) with Edges to define execution.

## Anatomy
- **Input Node**: entry points for data.
- **Processing Nodes**: Actions/Agents/Flows.
- **Output Node**: exit points for results.

## Typical pattern
1. Data enters via **Input**.
2. One or more **Nodes** transform or route it.
3. Data leaves via **Output**.

## Working inside a Flow
- **Create components** (right-click → **＋**).
- **Connect** components by dragging from a connection point.
- **Execute** the Flow from **Properties → Execute**.

!!! tip "Start minimal"
    Begin with a single Action between Input and Output. Add parallel branches or conditions after the basic path works.
