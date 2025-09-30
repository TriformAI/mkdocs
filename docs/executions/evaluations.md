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
