# Properties → Components → Content → Agents

Configure how an Agent thinks and what tools it can use.

## Model configuration
- **Model selection** — choose from curated providers or Triform-hosted OSS models.
- **Prompts**
  1. **System Prompt** — non-negotiable instructions that define Agent behavior.
  2. **Messages List (toggle)** — allow messages as input/output to pass chat history.
  3. **User Prompt** — optional pre-set user instruction for fixed-purpose Agents.
- **Advanced settings** (enable as needed)
  - **Temperature**
  - **Top-p**
  - **Max tokens**

## Tools
- Add **Actions, Flows, or Agents** to the Agent’s **Toolbox** (see Canvas → Agent Toolbox View).
- Tools are callable by the Agent during execution.

## Best practices
- Keep the **System Prompt** specific and outcome-oriented.
- Limit tools to the **fewest** needed to achieve goals.
- Use **Messages List** when context/history matters.

!!! tip "Iterate with payloads"
    Save example payloads and run the Agent from **Execute** to tune prompts and settings quickly.
