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
