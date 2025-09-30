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
