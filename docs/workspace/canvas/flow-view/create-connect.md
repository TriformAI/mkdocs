# Flow View: Creating & Connecting Components

Build Flows by combining components and wiring them with Edges.

## Create components
- **From a connection**: drag from an existing connection point and **release on empty Canvas**. Choose a component type and name it.
- **From context menu**: right-click the Canvas → **＋** to add a component without connections.

## Connect components
- Drag from a **source** connection point to a **target** connection point:
  - **Input → Node** to feed data into a step.
  - **Node → Node** to chain steps.
  - **Node → Output** to finalize results.

## Example
- Input has port **`text`**
- Create an **Action** named `summarize_text`
- Wire: `Input.text → summarize_text.input`
- Wire: `summarize_text.output → Output.summary`

!!! tip "Name as you connect"
    Naming ports and Nodes **at the moment you connect them** prevents ambiguity later.
