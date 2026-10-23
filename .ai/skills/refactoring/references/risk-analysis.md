# Risk analysis (Phase 5)

Before executing the strategy, identify:

- **Callers affected** — every caller found in Phase 2 analysis, and whether the strategy in
  Phase 4 changes what they see.
- **Test coverage gaps** — parts of the current behavior that aren't covered by an existing
  test. A refactor of uncovered code is higher risk because there's nothing to catch a mistake;
  add characterization tests first if coverage is thin.
- **Cross-module/shared-code risk** — if the refactor touches a module used by more than one
  feature, treat it like the "significant" tier in `workflow.md` regardless of how small the
  diff looks.
- **Confidence in the invariants** — if Phase 3's invariants were hard to state precisely, that
  itself is a risk signal; low confidence means slower, smaller steps.
- **Risk level** — low / medium / high, with the reasoning, using the same shape as
  [`../templates/impact-analysis.md`](../templates/impact-analysis.md).

A high-risk refactor should not proceed without human confirmation, even if the invariants look
sound on paper (see `.ai/rules/refactor/safety.md`).
