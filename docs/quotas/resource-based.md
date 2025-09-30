# Resource-Based Quotas

These quotas constrain the size and number of artifacts that executions read and write.

## Dimensions

### Payload Size (input/output)
- **What**: Max size for input requests and produced outputs.
- **Why**: Keeps requests responsive and storage efficient.
- **Symptoms**: Validation error on submit or truncated output rejection.

### Script Size (per Action)
- **What**: Limit on `Action.py` and supporting code footprint.
- **Why**: Ensures fast packaging and predictable build times.
- **Symptoms**: Build fails with size error.

### Stored Payloads (per Node)
- **What**: Number of saved example Payloads retained per Node.
- **Why**: Encourages curation of high-value test cases.
- **Symptoms**: Cannot save additional Payloads until you prune.

### Module Size / Dependencies
- **What**: Limit on Module package size and number of dependencies.
- **Why**: Keeps deployments lightweight and secure.
- **Symptoms**: Module publish fails; dependency validation error.

## Design patterns
- **Stream or paginate** external data instead of sending mega-payloads.
- **Summarize or hash** large intermediate artifacts; persist the source elsewhere.
- **Refactor helpers** into Modules to avoid duplicating code across Actions.
- **Curate Payloads**: keep `minimal`, `typical`, and a few `edge_case_*` variants.

!!! warning "Binary dependencies"
    Only **pure-Python** dependencies are supported for Actions/Modules. Packages requiring binary system installs are not available in the build image.
