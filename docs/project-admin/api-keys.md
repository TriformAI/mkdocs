# API Keys

API Keys authorize access to your Project’s exposed APIs.

## Manage keys
- Go to **Project → Properties → Execute** to create/revoke keys.
- Store keys securely; rotate on a schedule.

## Scope & usage
- Keys are scoped to the **Project**.
- Send keys via an **Authorization** header or the mechanism your gateway specifies.

## Good hygiene
- Separate keys by environment (dev/test/prod).
- Log key **ID** (not the secret) alongside requests for traceability.
- Revoke keys immediately if leaked.

!!! warning "Never commit keys"
    Do not embed keys in code or client apps. Use server-side storage or a secrets manager.
