# Quality criteria (Phase 4 — Evaluate)

For each classified candidate, evaluate against these dimensions before drafting anything:

- **Persistence** — would a future AI session actually still need this?
- **Reusability** — does it apply beyond the current change, or is it a one-off detail?
- **Specificity** — is it a concrete, checkable fact/constraint, or vague enough to be useless?
- **Confidence** — was it directly observed/verified this session, or is it a guess?
- **Scope** — does it belong to one coherent topic, or does it span several (candidate for
  splitting per `.ai/rules/knowledge/quality.md`)?
- **Volatility** — how likely is this to change soon? Highly volatile facts are weak candidates.
- **Evidence** — what in the session or source backs this candidate? Cite it in the proposal
  (Phase 8).

A candidate that scores poorly on Persistence, Reusability, or Confidence should usually be
reclassified as **Ignore** rather than drafted.

## Final validation (Phase 11)

After the drafts are applied, re-check the whole affected set:

- No duplicates introduced.
- No contradictions between files.
- No broken references.
- No misclassified content (a rule stated as knowledge, or vice versa).
- No stale information left behind.
- No scope problems (a file now covering more than one topic).
