# Platform Context

## Glossary

| Term | Definition | Not this |
|------|-----------|----------|
| **Secure Link** | A cryptographically random, time-limited URL for client-facing interactions. Base62 token (10 chars), type-specific path (`/quotelink/`, `/bookinglink/`, etc.). Tokens are never reused — once generated, permanently claimed regardless of expiration state. | Not "magic link" (implies auth). Not "short link" (implies URL shortener). |
| **Link Resolution** | The server-side process: catch route → look up token → validate (exists, not expired, active, ownership) → serve page or redirect to Flutter web. | |
