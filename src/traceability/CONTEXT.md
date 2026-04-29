# Inventory & Traceability Context

## Glossary

| Term | Definition | Not this |
|------|-----------|----------|
| **Material** | A physical item (ink or needle) used during a tattoo session. Has a manufacturer, supplier, batch number, and expiration date. | Not "Product" (reserved for Stripe subscription products). Not "supply" or "consumable." |
| **Ink** | A Material subtype. Tracked with binary status: in stock or empty (manually toggled by artist). | |
| **Needle** | A Material subtype. Tracked by quantity (e.g., box of 20). Auto-decremented on session usage, auto-marked empty at 0. | |
| **Batch** | A manufacturer's production run identifier for a Material. The key lookup field for recall searches. | |
| **Recall** | A manufacturer-initiated alert that a specific Batch is defective. The artist searches by Batch to find all affected Sessions and Customers. | |
| **Traceability Record** | The immutable, hash-sealed link between an Appointment, the Materials used, and the Customer who received the tattoo. Contains a **snapshot** of each Material at time of use (manufacturer, product name, batch number) — not a foreign key to inventory. Deleting or emptying a Material from inventory never breaks traceability. Recall search operates on batch number strings. | |
| **Session Record** | The finalized, immutable snapshot of an Appointment's traceability-relevant fields, sealed with a SHA-256 hash. Amendments create new versions (hash chain). The hash chain is **tamper-evident for honest participants** — catches accidental corruption and naive tampering, makes amendments auditable. Not cryptographically tamper-proof against a determined actor who controls the database. Good enough for EN 17169:2019 compliance. | |
