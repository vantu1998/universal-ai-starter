# Completion (Phase 8)

Before reporting the refactor done, confirm:

- Every invariant from Phase 3 held — go back through them explicitly, don't just assume.
- Every risk flagged in Phase 5 was either mitigated or explicitly accepted.
- The full existing test suite passes, unmodified in meaning, for every module touched.
- No unrelated changes crept in (scope check against `.ai/rules/refactor/scope.md`) — no drive-by
  renames, reformatting, or "improvements" outside the stated strategy.
- Any bug noticed during the refactor was reported separately, not silently fixed inline.

Report using [`../templates/refactor-checklist.md`](../templates/refactor-checklist.md) as the
shape, filled in with what actually happened, not the template's placeholders.
