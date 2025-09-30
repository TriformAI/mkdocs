# Properties → Input & Output

Define what data a component accepts and emits.

## Controls
- **Parallel (toggle)** — when ON, the component expects a **list** of inputs and executes each in **parallel**.
- **Inputs/Outputs** — add or remove ports (unless they’re fixed).
- **Typing** — annotate the expected type for each I/O.
- **Defaults** — set default input values used at execution time.

## Usage examples
- Add input `text: string` with default `"hello"`.
- Add output `summary: string`.
- Toggle **Parallel** ON to process an array of `text` items concurrently.

!!! tip "Keep contracts stable"
    Changing I/O shapes breaks downstream edges. Stabilize names and types early to reduce refactors.
