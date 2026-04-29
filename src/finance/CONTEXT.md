# Finance Context

## Glossary

| Term | Definition | Not this |
|------|-----------|----------|
| **Quote** | A pricing proposal sent to a Customer via secure link. Contains total price, session breakdown, deposit amount + method, validity period. Standalone entity — can exist with or without a Project. | |
| **Invoice** | An immutable financial document generated per payment event (including deposits). Gap-free sequential numbering per Artist Profile (PostgreSQL advisory lock). Errors corrected via Credit Notes only. | |
| **Credit Note** | A correction document that partially or fully reverses an Invoice. The only way to fix invoice errors (invoices are immutable). | |
| **Deposit** | An upfront payment collected when a Customer accepts a Quote. Method: online (Stripe) or manual (artist records later). | |
| **Freemium Gate** | The enforcement point for free-tier limits. Client actions (accepting a quote) are always honored from the client's perspective. The artist's project state transition is blocked until they upgrade or free a slot. The paywall is on the artist, never visible to the client. | |
