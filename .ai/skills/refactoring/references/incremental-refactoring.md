# Incremental refactoring (Phase 6)

- Execute the strategy from Phase 4 one small step at a time — each step should compile, pass
  existing tests, and leave the code in a coherent state before moving to the next.
- Run the relevant tests after each step, not just at the end. Catching a broken invariant one
  step in is far cheaper than catching it after ten steps.
- Don't mix refactoring steps with behavior changes in the same step — if you notice a bug while
  refactoring, note it separately rather than fixing it inline (see `.ai/rules/refactor/scope.md`).
- Don't "improve while you're in there" beyond the stated strategy — extra renames, extra
  reformatting, or extra structural changes not in the plan are scope creep.
- If a step reveals the strategy was wrong, stop, return to Phase 4, and update the plan rather
  than improvising a fix on top of a bad step.
