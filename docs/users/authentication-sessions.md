# Authentication & Sessions

Sign in with **Discord** or **GitHub** via OAuth.

## Sessions
- Persist across browser restarts until expired or revoked.
- **Re-authentication** is required when tokens expire or provider access is revoked.

## Logout
- Ends active tokens and clears the browser session.

## Troubleshooting
- **Popup blocked** — Allow popups for `app.triform.ai`.
- **Wrong account** — Sign out of the provider, then re-authenticate.
- **Stuck redirect** — Clear cookies for the domain or use a private window.

!!! tip "Security basics"
    Avoid shared accounts. Enable 2FA with your OAuth provider for stronger protection.
