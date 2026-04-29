# Identity Context

## Glossary

| Term | Definition | Not this |
|------|-----------|----------|
| **Account** | The authentication identity. One person, one account. Has email/password or Google sign-in credentials. | |
| **Artist Profile** | A brand identity under an Account. Has its own handle, theme, Customers, inventory, and schedule. One Account can have multiple Artist Profiles. | Not "Account" (that's the auth layer). Not "User" (too generic). |
| **Handle** | The artist-chosen unique URL slug for a profile (`octattoo.app/artist/[handle]`). Lowercase, alphanumeric + underscores. Changeable, but old URL dies immediately. | |
| **Workplace** | A physical location where an artist works. Three visibility tiers: Private, Visible, Public. Has members (permanent or guest). Creator is admin. | Not "Studio" (too specific — includes guest spots, convention booths, home studios). |
| **Membership** | An artist's relationship to a Workplace. Type: permanent (start date, no end) or guest (start date + end date). Immutable once approved — extensions require a new request. | |
