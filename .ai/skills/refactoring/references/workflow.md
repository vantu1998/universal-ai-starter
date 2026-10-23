# Workflow overview

Six phases: Analysis → Invariants → Strategy → Risk analysis → Incremental refactoring → Testing
→ Completion, with this overview read first each time.

Not every refactor needs every phase at full depth:

- **Trivial** (rename, single-file extract-method, no external callers): Analysis and Completion
  only; invariants and risk are obvious enough to state in one line.
- **Small** (extract-class within a module, no cross-module callers change): all phases, lightly
  — a short plan, a short risk note.
- **Significant** (crosses modules, changes a shared interface, touches how modules depend on
  each other): all phases in full, written down, per the templates.

When unsure which tier a refactor falls into, default to the next tier up rather than down —
under-scoping risk analysis is the most common way a "pure" refactor quietly changes behavior.
