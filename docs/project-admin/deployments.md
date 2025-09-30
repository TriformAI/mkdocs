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
