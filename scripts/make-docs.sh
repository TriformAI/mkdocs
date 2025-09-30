#!/usr/bin/env bash
set -euo pipefail

ROOT="docs"

mk() {
  local rel="$1"
  local title="$2"
  local path="$ROOT/$rel"
  mkdir -p "$(dirname "$path")"
  if [[ -f "$path" ]]; then
    echo "skip  $path (exists)"
  else
    cat > "$path" <<MD
# $title

> Coming soon. This page is a stub created by the bootstrap script.
MD
    echo "create $path"
  fi
}

# --- Top level ---
mk "index.md"                                  "Welcome"
mk "changelog.md"                              "Changelog"
mk "roadmap.md"                                "Roadmap"
mk "faq.md"                                    "FAQ"
mk "troubleshooting.md"                        "Troubleshooting"
mk "glossary.md"                               "Glossary"

# --- Tutorials ---
mk "tutorials/getting-started.md"              "Getting started"
mk "tutorials/build-your-first-agent.md"       "Build your first agent"
mk "tutorials/build-a-flow.md"                 "Build a flow"
mk "tutorials/expose-via-api-and-schedule.md"  "Expose via API & schedule"

# --- How-to ---
mk "how-to/navigate-with-breadcrumbs.md"       "Navigate with breadcrumbs"
mk "how-to/use-chat-triton.md"                 "Use Chat (Triton)"
mk "how-to/manage-variables.md"                "Manage variables"
mk "how-to/create-actions.md"                  "Create Actions"
mk "how-to/compose-flows.md"                   "Compose Flows"
mk "how-to/configure-agents.md"                "Configure Agents"
mk "how-to/deploy-changes.md"                  "Deploy changes"
mk "how-to/expose-components.md"               "Expose components"
mk "how-to/organization-admin.md"              "Organization admin"
mk "how-to/projects-list.md"                   "Projects list"
mk "how-to/troubleshoot-runs.md"               "Troubleshoot runs"

# --- Concepts ---
mk "concepts/projects-agents-flows-actions.md" "Objects & relationships"
mk "concepts/canvas-and-context.md"            "Canvas & context"
mk "concepts/inputs-outputs-types.md"          "Inputs, outputs, types"
mk "concepts/execution-model.md"               "Execution model"
mk "concepts/deployment-and-context.md"        "Deployment & context"
mk "concepts/security-and-keys.md"             "Security & keys"
mk "concepts/roles-and-permissions.md"         "Roles & permissions"

# --- Reference ---
mk "reference/ui-topbar.md"                    "Top Bar"
mk "reference/ui-chat.md"                      "Chat"
mk "reference/ui-properties-panel.md"          "Properties Panel"
mk "reference/component-reference/project.md"  "Component: Project"
mk "reference/component-reference/agent.md"    "Component: Agent"
mk "reference/component-reference/flow.md"     "Component: Flow"
mk "reference/component-reference/action.md"   "Component: Action"
mk "reference/api-reference.md"                "API"
mk "reference/scheduling.md"                   "Scheduling"
mk "reference/json-payloads.md"                "JSON payloads"

# --- Admin ---
mk "admin/organizations.md"                    "Organizations"
mk "admin/accounts.md"                         "Accounts (coming soon)"
mk "admin/auth.md"                             "Auth"

echo "Done."
