# Invariants (Phase 3)

State explicitly what must not change as a result of this refactor:

- **Observable behavior** — inputs produce the same outputs, side effects happen in the same
  cases, error conditions still error the same way.
- **Public contracts** — method signatures, API shapes, event payloads that other code/services
  depend on, unless the refactor's whole point is changing an internal-only contract.
- **Performance characteristics** — if the code is on a hot path, note the current performance
  as a baseline; a refactor that regresses it needs to be caught, not just structurally verified.
- **Existing test outcomes** — every test that passed before must still pass after, with the same
  meaning (not modified to match new behavior).

If a change requires breaking one of these invariants, it is no longer a pure refactor — flag it
and confirm with the human whether it should be split into a refactor plus a separate,
explicitly-scoped behavior change.
