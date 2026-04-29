# Context Map

This repo uses multiple bounded contexts. Each has its own `CONTEXT.md` glossary and may have its own `docs/adr/` for context-specific decisions.

System-wide ADRs live in `/docs/adr/`.

## Contexts

| Context | Path | Modules | Description |
|---------|------|---------|-------------|
| Identity | `src/identity/` | Identity, Theming, Public Profile, Workplace | Who the artist is and how they present themselves |
| Projects | `src/projects/` | Workflow, Forms, Customer, Scheduling | The project lifecycle from submission to aftercare |
| Inventory & Traceability | `src/traceability/` | Inventory, Traceability | The regulatory core — materials, batches, recall |
| Finance | `src/finance/` | Payment, Freemium, Export | Money, subscriptions, and data portability |
| Platform | `src/platform/` | Secure Links, Notification, Storage, i18n | Cross-cutting infrastructure |
