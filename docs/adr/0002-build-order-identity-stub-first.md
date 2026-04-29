# ADR-002: Build Order — Identity Stub First

**Date:** 2026-04-29
**Status:** Accepted

**Context:** ADR-001 established the build order as Scaffold + Loop → Customer → Inventory → Traceability. However, the data model requires every record to be scoped by `artistProfileId`. Building modules without a real profile ID means either hard-coding fakes (tech debt, risk of missing a spot during retrofit) or building Identity as a thin shell first.

## Decision

Build a minimal Identity stub as the true first module after the scaffold. Just enough to:

- Create an account (email/password only)
- Create an artist profile (returns a real `artistProfileId`)
- Authenticate requests (so endpoints are scoped from day one)

No Google sign-in, no onboarding wizard, no handle management, no profile switching yet. Those come when Identity is fleshed out later.

## Build Order (Final)

```
Scaffold + Loop → Identity (stub) → Customer → Inventory → Traceability (golden path) → Identity (full) → Secure Links → ...
```

## Consequences

- Every module built after the stub has a real `artistProfileId` — no retrofitting.
- The golden path test (Customer → Appointment → Materials → Traceability Record → Recall) runs with real auth from the start.
- Identity (full) is deferred until after the core value chain is proven, keeping focus on the differentiator.
