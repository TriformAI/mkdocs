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
