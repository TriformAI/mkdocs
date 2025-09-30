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
