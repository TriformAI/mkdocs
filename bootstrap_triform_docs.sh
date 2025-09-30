#!/usr/bin/env bash
set -Eeuo pipefail

echo
echo "==========================================================="
echo "  Triform Docs Bootstrapper (Bash)"
echo "  This will create/overwrite files under ./docs"
echo "  Run from your MkDocs project root (where mkdocs.yml is)."
echo "==========================================================="
echo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$SCRIPT_DIR"
DOCS="$ROOT/docs"

if [[ ! -f "$ROOT/mkdocs.yml" ]]; then
  echo "⚠️  mkdocs.yml not found in: $ROOT"
  echo "   We'll still generate docs under: $DOCS"
  echo
fi

mkdir -p "$DOCS"

write_doc () {
  # usage: write_doc 'relative/path.md' <<'EOF'
  local rel="$1"
  local path="$DOCS/$rel"
  mkdir -p "$(dirname "$path")"
  # Read stdin into file
  cat > "$path"
  echo "[WROTE] docs/$rel"
}

# --------------------------
# Welcome
# --------------------------
write_doc 'index.md' <<'EOF'
# Welcome to Triform

Triform is a visual platform for building, running, and monitoring AI-powered systems. Instead of stitching together code and configs, you **compose logic on a Canvas** as Nodes (Agents, Flows, Actions) and connect them with Edges.

## Who this guide is for
- Engineers building end-to-end AI workflows
- Product teams iterating quickly on prototypes
- Non-technical collaborators reviewing and testing behavior

## What you can build
- Tool-using **Agents** that call Actions/Flows
- **Flows** that orchestrate multi-step logic
- **Actions** that run precise pieces of Python
- APIs or scheduled jobs that expose top-level components

## How Triform is organized
- **Organizations** → top-level ownership & access
- **Projects** → focused workspaces inside an Organization
- **Library** → reusable building blocks (Actions, Flows, etc.)
- **Canvas** → the visual surface where you design and debug

## Five-minute Quickstart
1. **Sign in** at `app.triform.ai` with Discord or GitHub.
2. You land in your first **Project** with the **Canvas** open.
3. **Create** a Flow or Agent from the Canvas.
4. **Connect** Nodes with Edges to shape behavior.
5. **Execute** it from the **Properties → Execute** panel.

!!! tip "Fastest first success"
    Start with a Flow: *Input → Action → Output*. Use the Execute panel to run a small JSON payload.

## Need help?
- Use the **Chat Panel (Triton)** to create, connect, or run components conversationally.
- Invite teammates from **Profile → Organization → View**.
- Share feedback any time—your input shapes our roadmap.

---
EOF

# --------------------------
# Getting Started
# --------------------------
write_doc 'getting-started/login.md' <<'EOF'
# Login & Registration

You sign in to Triform using OAuth with **Discord** or **GitHub**.

## Sign in
1. Go to **app.triform.ai**.
2. Choose **Discord** or **GitHub**.
3. Approve OAuth and you’ll be redirected to your Canvas.

## First-time registration
- A **personal Organization** is created automatically.
- A **default Project** is provisioned and opened.

## Re-authentication & logout
- If your session expires or OAuth access is revoked, you’ll be prompted to sign in again.
- **Logout** terminates active tokens and clears your browser session.

## Permissions & identity
- Your **display name** comes from the provider (editable later).
- **Email** is used for invitations and notifications.
- You may connect **GitHub** to publish components (when enabled).

!!! note "Multiple Organizations"
    You can belong to multiple Organizations. Switch via **Profile → Organization**.

## Troubleshooting
- **Popup blocked**: allow popups for `app.triform.ai`.
- **Wrong account**: sign out of the provider, then sign in with the intended account.
- **Stuck redirect**: clear cookies for `app.triform.ai` or try a private window.
- **2FA issues**: resolve with the provider, then repeat OAuth.

If problems persist, contact your Org Owner or reach us via the community channel.
EOF

write_doc 'getting-started/workspace-overview.md' <<'EOF'
# First Launch & Layout Overview

When you sign in, you land in your **first Project** with the **Canvas** open.

## The workspace at a glance
- **Top Bar** — breadcrumbs, home, profile, deploy.
- **Canvas** — where you build and debug visually.
- **Chat Panel (Triton)** — conversational control and status.
- **Properties Panel** — configuration, inputs, execution.

## Your first choices
- **Create a Project** or **Create an Agent** on the Canvas.
- Or open existing **Flows/Actions/Agents** to explore structure.

## Orientation tips
- **Click** to select a Node.
- **Double-click** any Node to open it (Project/Agent/Flow).
- **Right-click** for context menus (on Canvas or Node).

## What’s next
- Learn the **Top Bar** for navigation and deploys.
- Master the **Canvas** to construct systems.
- Use the **Properties Panel** to execute with payloads.
- Ask **Triton** to automate routine setup.

!!! tip "A simple first build"
    Create a Flow with: *Input → Action (returns a message) → Output*. Execute it with a small JSON payload to verify your end-to-end loop.
EOF

# --------------------------
# Workspace
# --------------------------
write_doc 'workspace/top-bar.md' <<'EOF'
# Top Bar

The Top Bar helps you navigate context quickly and manage deployments.

## Breadcrumbs
- Always shows your current context (e.g., **Org / Project / Flow**).
- **Click any crumb** to jump directly to that level.

## Home
- Click the Triform logo to go to the **Projects** dashboard.

## Profile Menu
- **Organization** — switch active Org or open Organizations overview.
- **Account** — account overview (coming soon).
- **Log out** — end session and clear tokens.

## Deploy button
- Appears when local changes are **ahead** of the last deployed state.
- Click to deploy the **latest** changes for your current Project.

!!! tip "When in doubt, use breadcrumbs"
    Breadcrumbs are the fastest way to move between Project view, Flow view, and back to the Org without losing your place.
EOF

write_doc 'workspace/canvas/overview.md' <<'EOF'
# Canvas: Overview

The Canvas is your **workspace**, **debugger**, and **execution surface**. You compose systems as **Nodes** connected by **Edges**.

## What you see
- **Nodes**: visual building blocks (Agents, Flows, Actions, Projects).
- **Edges**: connections that define data & control flow.

## Core interactions
- **Select**: click a Node.
- **Open**: double-click to drill into Projects, Agents, or Flows.
- **Context menu**: right-click a Node or the Canvas for actions.
- **Rearrange**: drag Nodes to clarify structure.

## Why Canvas
- Makes complex logic legible at a glance.
- Encourages modular, reusable patterns.
- Enables debugging without diving into raw logs.

!!! note "Where execution happens"
    You run Nodes from **Properties → Execute**. The Canvas reflects structure; the Properties panel manages configuration and runs.

## Best practices
- **Name Nodes clearly** (e.g., `Normalize Input`, `Route by Type`).
- **Group related Nodes** visually.
- Keep **flows shallow** where possible; compose via sub-Flows.
EOF

write_doc 'workspace/canvas/project-view.md' <<'EOF'
# Canvas: Project View

Project View lists the **top-level components** (Agents or Flows) for the Project.

## Key points
- Items are **not connected** here; it’s an overview/list.
- Only **top-level Agents/Flows** can be **exposed** via API or Schedule.
- Top-level components can **contain** other components.

## Common actions
- **Open** a top-level Agent/Flow to work inside it.
- **Create** a new Agent or Flow from the Canvas.
- **Rename** and organize to reflect your domain.

!!! tip "Design for exposure"
    If you plan to expose something as an API or Schedule, keep it **top-level** and give it a stable name early.
EOF

write_doc 'workspace/canvas/agent-toolbox.md' <<'EOF'
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
EOF

# Flow View pages
write_doc 'workspace/canvas/flow-view/basics.md' <<'EOF'
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
EOF

write_doc 'workspace/canvas/flow-view/io-nodes.md' <<'EOF'
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
EOF

write_doc 'workspace/canvas/flow-view/create-connect.md' <<'EOF'
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
EOF

write_doc 'workspace/canvas/flow-view/node-interactions.md' <<'EOF'
# Flow View: Node Interactions

Use simple gestures to keep Flows readable and manageable.

## Move & arrange
- Drag Nodes to align and reduce crossing Edges.

## Inspect
- Click a Node to view its configuration in **Properties**.

## Open
- Double-click to open an Action, Agent, or sub-Flow.

## Context menu
- Right-click a Node for context-specific actions (options vary by Node type).

!!! tip "Declutter early"
    As a Flow grows, periodically rearrange Nodes to preserve left-to-right data flow and reduce cognitive load.
EOF

write_doc 'workspace/chat-panel.md' <<'EOF'
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
EOF

write_doc 'workspace/properties/overview.md' <<'EOF'
# Properties Panel: Overview

The Properties Panel adapts to your selection and is where you **configure** and **run** components.

## Sections
- **Global** — Organization/Project-level settings available to all components in the Project (e.g., Variables).
- **Components** — Definition/Information and Content for the selected Node.
- **Execute** — Run the selected Node with a JSON payload.
- **Input & Output** — Define inputs/outputs, types, defaults, and parallel execution behavior.

!!! note "Context aware"
    The Properties Panel shows only the sections relevant to your current selection (Project, Flow, Agent, or Action).
EOF

write_doc 'workspace/properties/global-variables.md' <<'EOF'
# Properties → Global Variables

Define **Variables** that components in the Project can use.

## What to store
- Configuration values (e.g., feature flags, dataset names).
- Non-secret constants used across Actions and Flows.

## Referencing variables
- Use variables in your Actions and configuration to avoid duplicating values.

## Tips
- Prefer **descriptive names** (e.g., `default_temperature`, `region`).
- Scope values **per Project** to keep experiments isolated.

!!! warning "Secrets"
    Store sensitive credentials in your secure mechanism of choice. Avoid committing secrets directly as plain variables.
EOF

write_doc 'workspace/properties/components/definition.md' <<'EOF'
# Properties → Components → Definition & Information

Capture intent and requirements for the selected component.

## What to include
- **Description** — what the component does and why it exists.
- **Requirements** — inputs expected, dependencies, or assumptions.
- **Constraints** — limits, known edge cases, or quotas to consider.

## Why it matters
- Creates shared understanding across the team.
- Speeds up onboarding and troubleshooting.
- Serves as living documentation close to the code.

!!! tip "Write for the next person"
    Assume the reader has context on Triform but not on your domain. Short, precise, and example-driven descriptions work best.
EOF

write_doc 'workspace/properties/components/content/agents.md' <<'EOF'
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
EOF

write_doc 'workspace/properties/components/content/flows.md' <<'EOF'
# Properties → Components → Content → Flows

Flows contain components executed in a defined order or pattern.

## Configure behavior
- Arrange sub-components (Actions/Agents/Flows) on the Canvas.
- Use **Input/Output** ports to define data entering and leaving the Flow.
- Optionally design **parallel** paths (see Input & Output → Parallel).

## When to use a Flow
- Multistep transformations
- Branching logic
- Orchestration of tool calls

!!! note "Composability"
    A Flow can be used as a Node inside another Flow or as a tool for an Agent.
EOF

write_doc 'workspace/properties/components/content/actions.md' <<'EOF'
# Properties → Components → Content → Actions

Actions are **atomic** executable units written in Python.

## Structure
- **Action.py** — the Python implementation.
- **README** — technical documentation of purpose, I/O, examples.
- **requirements.txt** — Python dependencies (pure-Python only; no binary installs in the image).

## Guidelines
- Keep Actions **small** and **single-purpose**.
- Define a clear **input → output** contract.
- Pin dependencies conservatively in `requirements.txt`.

## Testing
- Use **Execute** with small payloads to validate behavior in isolation.
- Save payloads as examples for reproducibility.

!!! warning "Dependencies"
    Only dependencies that do **not** require binary installations are supported in the build image.
EOF

write_doc 'workspace/properties/components/content/projects.md' <<'EOF'
# Properties → Components → Content → Projects

Projects define the **top-level** surface of your application.

## What they contain
- **Top-level Nodes** (Agents or Flows) that may contain other components.
- Configuration that applies to the Project scope (e.g., variables).

## Exposure
- Only **top-level Agents/Flows** can be exposed as **APIs** or **Schedules** (configured under **Execute**).

!!! tip "Model your domain"
    Map your domain’s entry points (API endpoints, schedules) to top-level Nodes and keep deeper logic inside sub-Flows or Actions.
EOF

write_doc 'workspace/properties/execute.md' <<'EOF'
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
EOF

write_doc 'workspace/properties/input-output.md' <<'EOF'
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
EOF

# --------------------------
# Core Concepts
# --------------------------
write_doc 'concepts/nodes.md' <<'EOF'
# Nodes

Nodes are Triform’s fundamental building blocks. Every piece of behavior—Agents, Flows, Actions, and even Projects as containers—appears as a Node on the Canvas.

## Properties of a Node
- **Inputs / Outputs** — Typed connection points that define data contracts.
- **Definition** — Purpose, requirements, constraints.
- **Content** — Implementation/configuration (varies by Node type).
- **Execute** — Run with a JSON payload; view results.
- **Observability** — Executions emit logs, traces, and metrics.

## Types of Nodes
- **Project** — A scoped workspace that contains top-level Agents/Flows.
- **Agent** — LLM-driven logic that can call tools (Actions, Flows, other Agents).
- **Flow** — A directed graph of Nodes connected by Edges.
- **Action** — Atomic Python logic.
- **Input / Output** — Special Nodes that mark Flow boundaries.

## Lifecycle
1. **Draft** — Define intent and I/O.
2. **Test** — Use Payloads and small runs.
3. **Compose** — Chain into Flows or add as Agent tools.
4. **Expose** — Promote top-level Agents/Flows to API/Schedule.
5. **Deploy** — Push current state; track changes over time.

!!! tip "Keep contracts stable"
    Name and type your Inputs/Outputs early. Stable interfaces reduce downstream refactors.
EOF

write_doc 'concepts/projects.md' <<'EOF'
# Projects

A Project is a focused workspace within an Organization. It holds top-level components and their context.

## What a Project contains
- **Top-level Nodes** — Agents or Flows that may be exposed as APIs/Schedules.
- **Configuration** — Project-scoped settings like Variables.
- **Artifacts** — Actions, sub-Flows, Agents that support the top-level surface.

## Why Projects
- **Isolation** — Experiment safely within a bounded scope.
- **Access control** — Limit who can see or change components.
- **Deployment unit** — Deploy and expose from the Project surface.

## Typical workflow
1. Create or open a Project.
2. Model top-level entry points (Agents/Flows).
3. Compose sub-Flows and Actions beneath them.
4. Save Payloads, validate behavior, and **Deploy**.
5. **Expose** selected top-level Nodes via API or Schedule.

!!! note "Only top-level gets exposed"
    You can call sub-components internally, but only top-level Agents/Flows are eligible for API/Schedule exposure.
EOF

write_doc 'concepts/agents.md' <<'EOF'
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
EOF

write_doc 'concepts/actions.md' <<'EOF'
# Actions

Actions are atomic units of executable Python code. They should do one thing well.

## Structure
- **Action.py** — Implementation.
- **README** — Purpose, I/O, examples.
- **requirements.txt** — Pure-Python dependencies (no binary installs).

## Contract
- **Inputs** — Typed, minimal, documented.
- **Outputs** — Deterministic structure; document edge cases.
- **Side effects** — Avoid hidden state; log clearly if necessary.

## Workflow
1. Define input/output and write `Action.py`.
2. Pin dependencies in `requirements.txt`.
3. Test with small **Payloads** via **Execute**.
4. Reuse across Flows and as Agent tools.

!!! warning "Dependencies"
    Only packages that do **not** require binary installs in the build image are supported.
EOF

write_doc 'concepts/flows.md' <<'EOF'
# Flows

Flows connect Nodes (Actions, Agents, sub-Flows) into an executable graph.

## Building blocks
- **Input Node** — Named entry ports.
- **Processing Nodes** — Actions/Agents/Flows.
- **Output Node** — Named exit ports.
- **Edges** — Data/control movement between Nodes.

## Patterns
- **Linear** — Input → Action → Output.
- **Branching** — Route by condition into multiple paths.
- **Parallel** — Fan-out work; aggregate results downstream.

## Practices
- Keep Flows **legible** left-to-right.
- Favor **shallow** graphs; compose via sub-Flows for depth.
- Remove unused ports and edges to reduce confusion.

!!! tip "Design for testing"
    Save example Payloads at the Flow level to lock in expected shapes and make regression checks easy.
EOF

write_doc 'concepts/library/overview.md' <<'EOF'
# Library (Overview)

The Library is your Organization’s shared catalog of building blocks.

## What lives in the Library
- **Actions, Flows, Agents**
- **Triggers** (entry points like APIs/Schedules)
- **Modules** (importable utility code)
- **Variables** (shared configuration values)
- **Payloads** (saved examples)

## Why a unified Library
- **Discoverability** — Find and reuse components.
- **Consistency** — Share patterns across Projects.
- **Composability** — Build bigger systems from proven parts.

## Versioning & reuse
- Treat Library items as **reusable artifacts**.
- Prefer small, well-documented pieces with clear contracts.

!!! note "Project vs. Library"
    Project-scoped Variables live under **Properties → Global Variables**. Library Variables are organizational and reused across Projects.
EOF

write_doc 'concepts/library/triggers.md' <<'EOF'
# Triggers

Triggers are entry points that start executions.

## Types
- **API** — Expose a top-level Agent/Flow as an HTTP endpoint.
- **Schedule** — Run on a cadence (cron-style).

## Where they live
- Triggers are managed at the **Project** surface when you **Expose** top-level Nodes.

## Best practices
- Keep request/response shapes **stable**.
- Validate inputs at the edge before invoking deeper logic.
- Use environment-specific configuration per Project.

!!! tip "Design for observability"
    Include correlation IDs or request metadata in your inputs for traceability across downstream Nodes.
EOF

write_doc 'concepts/library/modules.md' <<'EOF'
# Modules

Modules are importable utilities (Python) that Actions can reuse.

## Use cases
- Common helpers (validation, formatting)
- Lightweight adapters (API clients, data loaders)
- Constants and enums shared across Actions

## Guidelines
- Keep Modules **pure-Python** and dependency-light.
- Document public functions; avoid tight coupling to specific Actions.
- Version functions cautiously to preserve compatibility.

!!! tip "Refactor to Modules"
    If you copy a helper between Actions twice, it’s time to promote it into a Module.
EOF

write_doc 'concepts/library/variables.md' <<'EOF'
# Variables

Variables store reusable configuration values.

## Scopes
- **Project Variables** — Set under **Properties → Global Variables** for use within a Project.
- **Library Variables** — Organizational values reused across Projects.

## What to store
- Non-secret configuration: feature flags, dataset names, region identifiers, default thresholds.

## Practices
- Use clear names (`region`, `default_temperature`).
- Keep secrets out of plain Variables; use your secure mechanism of choice.

!!! warning "Secrets"
    Don’t store API keys or credentials as plain Variables.
EOF

# --------------------------
# Executions & Testing
# --------------------------
write_doc 'executions/executions.md' <<'EOF'
# Executions

An **Execution** runs a Node (Action or Flow) with a defined input and produces one or more outputs, along with logs, traces, and metrics.

## How executions start
- **Manual** — Run from **Properties → Execute**.
- **API/Schedule** — Triggered externally (for exposed top-level Nodes).
- **Internal** — Invoked by another Node within a Flow.

## Characteristics
- **Isolated** — No shared state between runs.
- **Reproducible** — Inputs, modifiers, and context are logged.
- **Traceable** — Inspect logs, traces, and metrics historically.
- **Evaluated** — Optionally score outputs with Evaluations.

## Flow of an execution
1. **Trigger** — Manual, schedule, or API.
2. **Input** — JSON payload (from trigger or saved Payload).
3. **Process** — Node(s) execute and pass data along Edges.
4. **Output** — Result returned or stored.
5. **Feedback** — Observability data recorded.

## Practical tips
- Save **Payloads** for common scenarios.
- Keep inputs **small** and **typed** for easier regression.
- Use consistent correlation fields to stitch traces across components.

!!! note "Parallelism"
    For components with **Parallel** ON, provide a list of inputs; each item is executed concurrently and aggregated downstream.
EOF

write_doc 'executions/payloads.md' <<'EOF'
# Payloads

Payloads are saved examples of inputs (and expected outputs) used to test components quickly and reproducibly.

## Why Payloads
- **Speed** — One-click reruns for common cases.
- **Reproducibility** — Lock in known-good inputs as your baseline.
- **Documentation** — Show how a component is intended to be used.

## Good Payloads include
- Minimal required fields with realistic values.
- Edge-case variants (empty, large, malformed types).
- Comments or README references for context.

## Workflow
1. Create a Payload for a Node (Action/Flow).
2. Refine the Node until the output is acceptable.
3. Keep the Payload as a **regression check** when you iterate.

!!! tip "Name by intent"
    Prefer names like `minimal`, `typical_customer`, `edge_empty_messages` over `test1`, `test2`.
EOF

write_doc 'executions/evaluations.md' <<'EOF'
# Evaluations

Evaluations assess outputs from Executions against criteria you define.

## Use cases
- Score the **quality** of LLM outputs (e.g., relevance, completeness).
- Enforce **constraints** (e.g., schema validity).
- Compare **variants** (prompt or parameter changes).

## Approaches
- **Rule-based** — Deterministic checks (types, ranges, required fields).
- **Model-assisted** — LLM-based grading with rubrics.
- **Hybrid** — Rules + brief LLM check for subjective aspects.

## Where to define
- Add Evaluations as part of a Node’s configuration or as small Actions invoked post-execution.

## Tips
- Keep rubrics **simple and consistent**.
- Store evaluation results with the Execution for later review.
- Use Payloads to compare scores across iterations.

!!! note "Intent over precision"
    Evaluations guide iteration; they need to be consistent more than they need to be perfect.
EOF

# --------------------------
# Project Administration
# --------------------------
write_doc 'project-admin/projects-list.md' <<'EOF'
# Projects List View

Create and navigate Projects from the dashboard.

## Create a Project
1. Open the Projects page (Top Bar → Home).
2. Click **＋** and provide a **name** (and optional description).
3. Open the new Project to start building on the Canvas.

## Manage Projects
- **Open** to continue work.
- **Describe** concisely so teammates can find the right Project.
- **Switch** active Organization from Profile if needed.

## Tips
- Organize Projects by **product surface** or **team**, not by single feature.
- Keep descriptions current to reflect scope.

!!! note "Default Project"
    New users start with a default Project that’s ready for immediate use.
EOF

write_doc 'project-admin/deployments.md' <<'EOF'
# Deployments

Deployment publishes your Project’s current state so exposed surfaces (APIs/Schedules) reflect the latest changes.

## When you see "Deploy"
- The **Deploy** button appears in the Top Bar when you have local changes ahead of the last deployed state.

## What deploy does
- Captures current Node definitions and wiring.
- Makes exposed top-level Agents/Flows use the latest configuration.

## Recommended flow
1. Finalize changes on the Canvas.
2. Re-run **Payloads** for sanity checks.
3. Click **Deploy**.
4. Re-hit APIs/Schedules if applicable.

## Troubleshooting
- **Mismatched inputs** — Verify Input/Output port names.
- **Toolbox drift** — Ensure Agent tools are up to date pre-deploy.
- **Missing variables** — Double-check required Project Variables.

!!! tip "Deploy in small steps"
    Smaller, frequent deploys make issues easier to pinpoint and roll forward from.
EOF

write_doc 'project-admin/expose.md' <<'EOF'
# Expose Components (API & Schedule)

Only **top-level** Agents/Flows can be exposed as APIs or Schedules.

## API exposure
- Select the Project and open **Properties → Execute**.
- Choose a top-level Agent/Flow to **Expose as API**.
- Confirm request/response shapes (based on the Node’s I/O).

## Schedule exposure
- From **Properties → Execute**, pick a top-level Agent/Flow.
- Configure a **Schedule** (cron-style cadence).

## Best practices
- Keep API payloads **explicitly typed**.
- Perform basic validation at the edge.
- Use **Payloads** that mirror your API contract for local testing.

!!! note "Non top-level components"
    Sub-Flows and Actions can’t be exposed directly. Wrap them in a top-level Flow/Agent.
EOF

write_doc 'project-admin/api-keys.md' <<'EOF'
# API Keys

API Keys authorize access to your Project’s exposed APIs.

## Manage keys
- Go to **Project → Properties → Execute** to create/revoke keys.
- Store keys securely; rotate on a schedule.

## Scope & usage
- Keys are scoped to the **Project**.
- Send keys via an **Authorization** header or the mechanism your gateway specifies.

## Good hygiene
- Separate keys by environment (dev/test/prod).
- Log key **ID** (not the secret) alongside requests for traceability.
- Revoke keys immediately if leaked.

!!! warning "Never commit keys"
    Do not embed keys in code or client apps. Use server-side storage or a secrets manager.
EOF

# --------------------------
# Organizations & Accounts
# --------------------------
write_doc 'orgs/overview.md' <<'EOF'
# Organizations (Overview)

An Organization is the top-level unit of collaboration, ownership, and governance in Triform.

## Responsibilities
- Holds **Users**, **Projects**, **Nodes**, **Variables**, and **API tokens**.
- Governs **access control** and **visibility** (public/private).
- Manages **GitHub linking**, billing, and Org-wide settings.

## Working across Orgs
- Users can belong to multiple Organizations.
- Switch the **active Organization** from the Profile menu.

!!! tip "Model the company"
    Mirror your company/team structure at the Organization level; keep sensitive Projects in separate Orgs if needed.
EOF

write_doc 'orgs/affiliations.md' <<'EOF'
# Affiliations

Affiliations define a user’s membership in Organizations and Projects.

## Scope
- **Organization affiliation** grants access to Projects and components within the Org.
- Users can hold different **roles** per Org.

## Typical patterns
- One personal Org (Owner) + one or more team Orgs (Member/Admin).
- Contractors invited as **Members** with limited permissions.

!!! note "Granularity"
    Roles apply at the Organization level; Projects inherit Org-level access policies.
EOF

write_doc 'orgs/roles-permissions.md' <<'EOF'
# Roles & Permissions

Each user in an Organization has one of three roles.

| Role   | Permissions |
|-------|-------------|
| **Owner** | Full access, including billing, GitHub linking, and user removal. |
| **Admin** | Manage Nodes, Projects, and users (except removing Owners). |
| **Member** | Create/edit/run Nodes; cannot manage users or billing. |

## Guidance
- Keep the number of **Owners** small.
- Promote trusted Members to **Admin** for day-to-day management.
- Review roles quarterly.

!!! tip "Principle of least privilege"
    Grant only the access required to perform the job effectively.
EOF

write_doc 'orgs/members.md' <<'EOF'
# Members & Invitations

Manage who can access your Organization.

## View members
- Profile → **Organization → View** to see current members and roles.

## Invite users
- From the Organization view, **Invite** by email or provider identity.
- Assign a role (**Member**, **Admin**, or **Owner** transfer when appropriate).

## Manage roles
- Promote/demote users as responsibilities change.
- Remove users who no longer require access.

!!! warning "Owner transfers"
    Transferring ownership grants full control, including billing and user removal. Proceed carefully.
EOF

write_doc 'orgs/github-integration.md' <<'EOF'
# GitHub Integration

Link a GitHub account to enable publishing components from within Triform.

## What linking enables
- Publish selected components (e.g., Actions/Flows) to GitHub.
- Keep an external, versioned record of important artifacts.

## Setup
1. From Organization settings, choose **Link GitHub**.
2. Approve OAuth for the Org-level GitHub account.
3. Select repositories to grant access.

## Practices
- Use a **service account** or Org app for stability.
- Keep READMEs and examples up-to-date for consumers.
- Review repository permissions regularly.

!!! note "Future expansion"
    As capabilities expand, you may publish versioned Flows or full component bundles to GitHub or other targets.
EOF

write_doc 'orgs/billing-settings.md' <<'EOF'
# Billing & Settings

Organization Owners manage billing and Org-wide settings.

## Billing
- View current plan and usage.
- Update payment method and invoices.
- Adjust limits by selecting a different tier when available.

## Settings
- **Visibility** — Public/Private defaults for new components (default: public).
- **Licensing** — Default license applied to components created under the Org.
- **Integrations** — Manage linked services (e.g., GitHub).

!!! tip "Audit periodically"
    Review visibility, licenses, and integrations quarterly to align with policy changes.
EOF

write_doc 'users/profile.md' <<'EOF'
# User Profile

Your profile represents your identity in Triform.

## Fields
- **Name** — Display name (sourced from provider or editable).
- **Auth Provider IDs** — Discord/GitHub identifiers used for OAuth.
- **Email** — For notifications and invitations.
- **Affiliations** — Organizations and roles.

## Good practices
- Keep your **email** current for invites and alerts.
- Use a consistent display name across Orgs to ease discovery.

!!! note "Multiple providers"
    You may authenticate with Discord or GitHub; link GitHub if you plan to publish components.
EOF

write_doc 'users/authentication-sessions.md' <<'EOF'
# Authentication & Sessions

Sign in with **Discord** or **GitHub** via OAuth.

## Sessions
- Persist across browser restarts until expired or revoked.
- **Re-authentication** is required when tokens expire or provider access is revoked.

## Logout
- Ends active tokens and clears the browser session.

## Troubleshooting
- **Popup blocked** — Allow popups for `app.triform.ai`.
- **Wrong account** — Sign out of the provider, then re-authenticate.
- **Stuck redirect** — Clear cookies for the domain or use a private window.

!!! tip "Security basics"
    Avoid shared accounts. Enable 2FA with your OAuth provider for stronger protection.
EOF

write_doc 'orgs/admin.md' <<'EOF'
# Organization Admin

Central place for Owners/Admins to manage the Organization.

## What you can do
- Switch the **active Organization**.
- View members, invite users, and change roles.
- Configure visibility, licensing, and integrations (e.g., GitHub).
- Review usage and plan details.

## Access
- Open **Profile → Organization → Overview / View**.

!!! tip "Delegate routine tasks"
    Give day-to-day responsibilities to **Admins**; reserve sensitive changes (billing, ownership) for **Owners**.
EOF

write_doc 'accounts/admin.md' <<'EOF'
# Account Admin (Coming Soon)

An upcoming page to manage personal account settings beyond the profile:
- Notification preferences
- Connected identities
- Security controls

Stay tuned as we expand account-level administration features.
EOF

# --------------------------
# Quotas
# --------------------------
write_doc 'quotas/index.md' <<'EOF'
# Quotas

Quotas define the operational boundaries of your Organization, Projects, and components. They exist to provide **predictability** (know what will run), **fairness** (shared resources), and **safety** (avoid runaway executions).

While specific thresholds may vary by plan or tier, this section explains each quota dimension, how usage is counted, typical symptoms when you hit limits, and ways to design within constraints.

## Quota categories
- **Execution-Based (Organization)** — totals and concurrency of runs.
- **Resource-Based** — payload sizes, script sizes, stored artifacts.
- **API & Integrations** — request rates, schedules, publish/build operations.
- **Account-Specific** — environments, variables/secrets, custom alerts/evaluations.

## How limits are enforced
- **Hard limits**: Requests are rejected (e.g., HTTP 429 or a validation error).
- **Soft limits**: You receive warnings and are encouraged to reduce usage.
- **Windows**: Most rolling counters reset after a defined time window.

## Monitoring your usage
- Inspect **execution history** and **metrics** to understand run counts and durations.
- Review **project surfaces** (APIs/Schedules) for request rates and failures.
- Keep a small **dashboard Flow** to periodically snapshot usage into a log or table.

!!! tip "Design for headroom"
    Target 70–80% of allowed limits under peak load so you can absorb traffic spikes without breaching quotas.

## When you hit a limit
- Backoff and retry (exponential) for rate-limit errors.
- Reduce payload sizes or split work into batches.
- Consider **parallel fan-out** with smaller items rather than single large payloads.
- Upgrade your plan if sustained traffic requires more capacity.
EOF

write_doc 'quotas/execution-based.md' <<'EOF'
# Execution-Based Quotas (Organization)

These quotas control how many and how intensively your components run.

## Dimensions

### Total Executions (per window)
- **What**: The count of Action/Flow runs initiated within a rolling window.
- **Why**: Protects the platform from unbounded load.
- **Symptoms**: New runs are rejected until the window resets.

### Concurrent Executions (max in-flight)
- **What**: The number of executions running at the same moment.
- **Why**: Prevents saturation and keeps latency predictable.
- **Symptoms**: Additional runs queue or fail fast with a concurrency error.

### Max Execution Duration (per run)
- **What**: The upper bound on runtime of a single Action/Flow.
- **Why**: Avoids hangs and runaway costs.
- **Symptoms**: The run is terminated when the limit is reached.

### Flow Depth (graph depth per run)
- **What**: The number of sequential Node steps allowed in one Flow execution.
- **Why**: Encourages composition and prevents overly deep graphs.
- **Symptoms**: Validation error before execution if the graph exceeds the limit.

### Recursion Depth (self/nested re-entry)
- **What**: The maximum allowed nested calls (Flows calling Flows/Agents recursively).
- **Why**: Stops infinite recursion and explosion of work.
- **Symptoms**: The triggering call is blocked beyond the threshold.

## Practical strategies
- **Batch & Bound**: Break large inputs into lists; toggle **Parallel** on the consumer Node.
- **Short-circuit**: Validate inputs early and exit fast on no-op paths.
- **Compose shallow**: Prefer sub-Flows for reuse but keep individual run paths short.
- **Time-box**: Use conservative duration expectations in Actions; handle partial progress gracefully.

!!! note "Reproduction aid"
    Save **Payloads** that reflect your highest-throughput and longest-duration cases so you can validate changes against quota-sensitive scenarios.
EOF

write_doc 'quotas/resource-based.md' <<'EOF'
# Resource-Based Quotas

These quotas constrain the size and number of artifacts that executions read and write.

## Dimensions

### Payload Size (input/output)
- **What**: Max size for input requests and produced outputs.
- **Why**: Keeps requests responsive and storage efficient.
- **Symptoms**: Validation error on submit or truncated output rejection.

### Script Size (per Action)
- **What**: Limit on `Action.py` and supporting code footprint.
- **Why**: Ensures fast packaging and predictable build times.
- **Symptoms**: Build fails with size error.

### Stored Payloads (per Node)
- **What**: Number of saved example Payloads retained per Node.
- **Why**: Encourages curation of high-value test cases.
- **Symptoms**: Cannot save additional Payloads until you prune.

### Module Size / Dependencies
- **What**: Limit on Module package size and number of dependencies.
- **Why**: Keeps deployments lightweight and secure.
- **Symptoms**: Module publish fails; dependency validation error.

## Design patterns
- **Stream or paginate** external data instead of sending mega-payloads.
- **Summarize or hash** large intermediate artifacts; persist the source elsewhere.
- **Refactor helpers** into Modules to avoid duplicating code across Actions.
- **Curate Payloads**: keep `minimal`, `typical`, and a few `edge_case_*` variants.

!!! warning "Binary dependencies"
    Only **pure-Python** dependencies are supported for Actions/Modules. Packages requiring binary system installs are not available in the build image.
EOF

write_doc 'quotas/api-integrations.md' <<'EOF'
# API & Integrations Quotas

Quotas here govern how frequently your surfaces can be hit and how often build/publish operations can occur.

## Dimensions

### API Request Rate
- **What**: Requests per second/minute to exposed APIs.
- **Why**: Guards latency and stability.
- **Symptoms**: HTTP 429 (Too Many Requests); advise retry with backoff.

### Endpoint Concurrency
- **What**: Max in-flight requests per exposed top-level Node.
- **Why**: Prevents hot-spot overload on a single endpoint.
- **Symptoms**: Requests queue or fail fast.

### External Trigger Frequency (Schedules)
- **What**: Minimum interval between scheduled invocations.
- **Why**: Limits fan-out and repeated runs.
- **Symptoms**: Skipped ticks or delayed triggers.

### Builds / Publish Actions
- **What**: Limit on number of build/publish operations per window.
- **Why**: Encourages batching of changes.
- **Symptoms**: Further publishes are deferred or rejected.

## Resilience patterns
- Implement **retry with jitter** on 429s (e.g., exponential backoff).
- Use **idempotency keys** to avoid duplicate processing on retries.
- Add **circuit breakers** around hot paths that call expensive tools.

!!! tip "Load shaping"
    Use lightweight validation Nodes at API edges to reject bad requests early and keep downstream capacity for real work.
EOF

write_doc 'quotas/account-specific.md' <<'EOF'
# Account-Specific Quotas

Quotas tied to admin and hygiene concerns for each Organization/Project.

## Dimensions

### Environments (per Organization)
- **What**: Max named environments (e.g., `dev`, `staging`, `prod`).
- **Why**: Keep management simple and costs predictable.
- **Symptoms**: Cannot create additional environments.

### Variables/Secrets (per environment)
- **What**: Total number of configuration entries.
- **Why**: Encourages consolidation and tidy configs.
- **Symptoms**: New entries rejected until you prune.

### Custom Alerts/Evaluations (per Project)
- **What**: Maximum number of alert rules/evaluation definitions.
- **Why**: Bounds cardinality and keeps monitoring snappy.
- **Symptoms**: Cannot add new rules until you archive old ones.

## Good hygiene
- Review Variables quarterly; remove dead flags and stale endpoints.
- Keep **secrets** in your chosen secure store; reference them, don’t duplicate.
- Tag Projects and Nodes with **owners** so quota notifications reach the right people.

!!! note "Naming convention"
    Adopt a consistent prefixing scheme (e.g., `SERVICE__ENV__KEY`) for Variables to avoid collisions and speed up discovery.
EOF

# --------------------------
# Roadmap
# --------------------------
write_doc 'roadmap/monitoring.md' <<'EOF'
# Monitoring — In Progress

Always-on observability to help you understand and improve runtime behavior.

## What Monitoring includes
- **Logs** — Detailed, structured runtime messages.
- **Traces** — Step-by-step paths with timing across Nodes.
- **Metrics** — Quantitative indicators (counts, durations, error rates).

## How you’ll use it
- Inspect an **Execution** to see its logs and trace waterfall.
- Drill from an erroring Node into its **Action** context.
- Compare **metrics** across Deploys to validate improvements.

## Current focus
- Consistent event schemas across Actions/Flows.
- Lightweight log ingestion with contextual fields (Node, Project, Execution).
- Trace propagation through Agent tool calls.

## Known limitations (while in progress)
- Partial cross-Project stitching if an API calls another Project.
- Limited custom dashboards (predefined views first).

## Next steps
- **Correlation IDs** surfaced at API edges.
- **Custom dimensions** and filters for logs/metrics.
- **Export hooks** for shipping telemetry to external sinks.

!!! tip "Log with intent"
    Emit concise, structured logs that capture **what** happened and **why**—future you will thank present you.
EOF

write_doc 'roadmap/alerts.md' <<'EOF'
# Alerts — Backlog

Receive proactive notifications when critical conditions occur so you can respond quickly.

## Target capabilities
- **Rules**: Define conditions on logs, metrics, or evaluation scores.
- **Channels**: Send to email, chat, and webhooks.
- **Policies**: Group, dedupe, and throttle noisy signals.
- **Runbooks**: Link alerts to remediation steps or dashboards.

## Example rules
- Error rate for a top-level Flow exceeds **N%** over **M** minutes.
- Evaluation score falls below threshold for **k** consecutive runs.
- Latency p95 exceeds **T ms** after a deploy.

## Planned UX
- Create/edit rules in Project settings.
- Preview firing conditions with recent data.
- Silence windows for planned maintenance.

## Next steps
- Provider integrations (email, chat, webhooks).
- Alert templates for common issues.
- Ownership & on-call escalation options.

!!! note "Keep it actionable"
    Alerts should point to a concrete next step—include links, IDs, and a brief “what changed” summary.
EOF

write_doc 'roadmap/persistent-storage.md' <<'EOF'
# Persistent Storage — Upcoming

Integrated storage options for durable state that complements your Flows and Actions.

## Planned backends
- **Object Storage (S3)** — Large blobs and file artifacts.
- **Vector Storage (Qdrant)** — Embeddings, indexing, similarity search.
- **Relational (Postgres)** — Structured data with transactional guarantees.

## Usage patterns
- **Object**: Persist artifacts (e.g., pre/post-transformation files), attach object IDs to Execution logs.
- **Vector**: Store embeddings for retrieval-augmented generation; query during Agent tool calls.
- **Relational**: Keep normalized tables for user/config state; reference keys in Actions.

## Data lifecycle
- Define retention for logs and artifacts per environment.
- Tag records with Project/Execution IDs for traceability.
- Provide idempotent upserts to prevent duplication.

## Next steps
- Unified credentials/config via Variables.
- Node-level connectors with simple read/write APIs.
- UI explorers to browse buckets, collections, and tables.

!!! tip "Prefer references"
    Store **references** (IDs, URIs) in your payloads and logs; fetch the heavy data on demand.
EOF

write_doc 'roadmap/community-library.md' <<'EOF'
# Community Library — Upcoming

A curated, open library of high-quality components built by the community.

## Goals
- Provide **ready-to-use** Actions and Flows for common tasks.
- Showcase **exemplars** with transparent performance metrics.
- Encourage **reuse** and consistent patterns.

## Submission guidelines (draft)
- Clear **README** with intent, I/O, and examples.
- Minimal, pure-Python dependencies.
- Payloads for **minimal**, **typical**, and **edge** cases.
- License compatibility and attribution.

## Review & quality bar
- Automated checks (lint, size, dependency hygiene).
- Human review for clarity and correctness.
- Versioning and changelog requirements.

## Roadmap
- Launch starter set (text preprocessing, validation, routing).
- Add rating and usage signals.
- Introduce “trusted” badges for vetted components.

!!! tip "Design to be remixed"
    Keep components small, well-named, and composable so others can slot them into their Flows with minimal changes.
EOF

# --------------------------
# Community
# --------------------------
write_doc 'community/join-discord.md' <<'EOF'
# Join the Conversation

We’re building Triform openly and value your feedback, ideas, and bug reports.

## Where to find us
- **Discord** — Chat with the team and community, share patterns, get help.
- **Roadmap thread** — Track progress and suggest features.

👉 Join here: https://www.notion.so/Roadmap-1fa0c5f9afca80fbba64e5d45d1bd951?pvs=21

## How to get the most out of the community
- Include **context**: Org/Project, component names, and a minimal Payload.
- Share **what you tried** and **what you expected**.
- Tag posts with **#help**, **#feature-request**, or **#show-and-tell**.

## Code of conduct
- Be respectful. Assume good intent.
- No sensitive data or secrets in public channels.
- Credit sources and contributors.

!!! tip "Help us help you"
    A small, reproducible example (one Flow, one Payload) dramatically speeds up assistance.
EOF

# --------------------------
# Appendix
# --------------------------
write_doc 'appendix/quick-reference.md' <<'EOF'
# Quick Reference

A compact cheat sheet for everyday Triform tasks.

## Navigation
- **Breadcrumbs** (Top Bar): Jump between Org → Project → Component.
- **Home** (logo): Go to Projects dashboard.
- **Profile**: Switch Organization, view Org settings, log out.

## Canvas basics
- **Click**: Select a Node.
- **Double-click**: Open Project/Agent/Flow internals.
- **Right-click**: Context actions on Canvas or Node.
- **Drag**: Reposition Nodes to clarify flow.

## Building blocks
- **Project View**: Top-level Agents/Flows eligible for API/Schedule.
- **Agent Toolbox**: Add tools (Actions/Flows/Agents) via **＋**.
- **Flow View**:
  - Input/Output Nodes always present.
  - **＋** on Input/Output to add named ports.
  - Drag from a connection point to create **Edges** or **new components**.

## Properties Panel
- **Global → Variables**: Project-scoped configuration values.
- **Components → Definition**: Intent, requirements, constraints.
- **Components → Content**:
  - **Agents**: Model, prompts, tools, advanced settings.
  - **Flows**: Arrange and connect sub-components.
  - **Actions**: `Action.py`, `README`, `requirements.txt`.
- **Execute**: Run with a JSON payload; project-level API/Schedule exposure and API key management.
- **Input & Output**: Define ports, types, defaults; toggle **Parallel**.

## Executions
- Start manually, via API/Schedule, or from another Node.
- Each run is **isolated**, **reproducible**, and **traceable**.
- Use **Payloads** to save examples and rerun tests quickly.

## Quotas at a glance
- **Execution-Based**: total runs, concurrency, duration, depth, recursion.
- **Resource-Based**: payload size, script size, stored Payloads, module size/deps.
- **API & Integrations**: request rate, endpoint concurrency, schedules, publishes.
- **Account-Specific**: environments, variables/secrets, alert/evaluation counts.

## Deployment & exposure
- **Deploy** (Top Bar) appears when local changes outpace last deploy.
- Expose **top-level** Agents/Flows as **APIs** or **Schedules** under **Execute**.
- Manage **API keys** at the Project level.

## Troubleshooting quick wins
- **Mismatched I/O**: Align port names and types on both ends.
- **Over-large payload**: Split into batches; toggle **Parallel**.
- **Rate limit (429)**: Retry with exponential backoff + jitter.
- **Agent drift**: Reduce tools, tighten System Prompt, re-test with saved Payloads.

!!! tip "Golden path for a new Flow"
    1) Input `text` → 2) Action `summarize_text` → 3) Output `summary`.  
    Save `minimal` and `edge` Payloads, validate, then wire it into a larger Flow or expose it as an API.
EOF

echo
echo "Done. All pages written under ./docs"
echo "If you haven't updated mkdocs.yml yet, paste the 'nav:' we prepared earlier."
echo "Then run:  mkdocs serve"
echo
