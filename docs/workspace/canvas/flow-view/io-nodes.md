# Flow View: Input & Output Nodes

Every Flow has a **mandatory** Input and Output Node.

## Add ports
- Click **＋** on Input/Output to create a named **connection point**.
- Choose a clear, stable name (e.g., `text`, `user_id`, `result`).

## Use ports
- Drag from an **Input** port to a Node’s input.
- Drag from a Node’s output to an **Output** port.

## Good practices
- Keep names **singular and typed** conceptually (e.g., `messages`, not `msgList`).
- Add only the ports you need—prune unused ones to reduce confusion.

!!! note "Where types and defaults live"
    Configure **types** and **default values** for inputs/outputs in **Properties → Input & Output**.
