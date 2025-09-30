# Agents

Agents combine an LLM with **prompts** and **tools** (Actions, Flows, or other Agents) to perform goal-directed, agentic execution.

## Anatomy
- **Model configuration** — Provider/model, temperature, top-p, max tokens.
- **Prompts**
  - **System Prompt** — Non-negotiable instructions.
  - **Messages List (toggle)** — Pass conversation history as input/output.
  - **User Prompt** — Optional pre-set prompt for fixed-purpose Agents.
- **Toolbox** — The set of callable tools made available to the Agent.

## Good patterns
- Keep System Prompts **specific** and **outcome-oriented**.
- Start with **few** high-leverage tools; expand gradually.
- Use Messages List when memory/context matters.

## Observability
- Executions emit **logs, traces, metrics** for inspection.
- Use Payloads to reproduce and compare runs after prompt changes.

!!! tip "Tool hygiene"
    Name tools by verb + object (`fetch_user`, `summarize_text`). Small, predictable tools make plans more reliable.
