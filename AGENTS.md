## Agent skills

### Issue tracker

GitHub Issues via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

Default label vocabulary (needs-triage, needs-info, ready-for-agent, ready-for-human, wontfix). See `docs/agents/triage-labels.md`.

### Domain docs

Multi-context layout — `CONTEXT-MAP.md` at root points to per-context `CONTEXT.md` files. See `docs/agents/domain.md`.

### Domain language

Use terms from the relevant `CONTEXT.md` glossary in code (class names, variables, comments). See `CONTEXT-MAP.md` for the context map.

## Git workflow

### Branch cleanup

After merging a PR from a `feat/` branch to `main`, **always** delete the remote and local feature branch immediately. Keep the branch list clean.
