# Strategy (Phase 4)

Decide the approach before touching code:

- **Technique** — extract method/class, inline, move, rename, introduce interface, change
  dependency direction, etc. Name it explicitly rather than refactoring ad hoc.
- **Order of steps** — sequence the change so each step leaves the code in a working,
  test-passing state. Prefer many small verifiable steps over one large rewrite.
- **Rollback point** — know which prior step you'd revert to if a later step reveals the
  approach was wrong.
- **Alternative considered** — if there was a simpler technique that would satisfy the same
  goal, note why it wasn't chosen (or choose it).

Don't start moving code before this is decided — a strategy decided mid-refactor tends to leave
half-migrated code in an inconsistent state.
