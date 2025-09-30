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
