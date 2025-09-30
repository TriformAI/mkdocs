# Chat Panel (Triton)

The Chat Panel is your conversational interface with Triform’s AI, **Triton**. Use it to create, edit, connect, or execute components.

## What you can do
- **Author** components (“Create a Flow named *ingest* with input `text`”).
- **Wire** connections (“Connect `Input.text` to `normalize.input`”).
- **Run** executions (“Run the Flow with `{ "text": "hello" }`”).
- **Explain** structures (“What does this Flow do?”).

## @-context
- Type `@` to **reference a component** (e.g., `@summarize_text`).
- Triton focuses actions and answers on what you mention.

## Activity updates
- Triton posts status messages when it performs changes or runs tasks.

!!! tip "Be explicit"
    Include component names and ports in your messages to avoid ambiguity and speed up Triton’s actions.
