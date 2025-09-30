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
