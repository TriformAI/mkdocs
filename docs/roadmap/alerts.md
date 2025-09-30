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
