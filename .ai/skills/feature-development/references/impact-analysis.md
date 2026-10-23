# Impact analysis (Phase 3)

Before implementing, identify:

- **Modules/files touched** — direct changes, and anything that calls into them.
- **APIs affected** — new endpoints, changed request/response shapes, changed error behavior.
  Check `.ai/knowledge/README.md` for existing API conventions before inventing new ones.
- **Data affected** — schema changes, migrations, data backfills; whether existing rows need
  handling.
- **Other features that could break** — shared code paths, shared config, event
  consumers/producers on a topic you're changing.
- **Risk level** — what's the worst plausible outcome if this change has a bug, and is that
  acceptable for the feature's importance?

If impact analysis surfaces something the requirements phase didn't account for (e.g. this
touches a shared module used by three other features), go back and confirm scope with the
human before proceeding — don't silently absorb it or silently ignore it.
