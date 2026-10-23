# Conflict resolution (Phase 7)

Triggered when a candidate conflicts with existing knowledge/rules found during Phase 5–6.

Never silently overwrite. Report the conflict with:

- **Existing statement** — what the current file says.
- **New statement** — what the candidate says.
- **Evidence** — what in the session/source backs the new statement.
- **Scope** — how broadly each statement applies (is one more specific/current than the other?).
- **Conflict** — the exact nature of the disagreement.
- **Recommendation** — keep existing / replace with new / merge / needs human judgment.

Guidance for the recommendation:

- Prefer the more specific, more recently verified source. If the session directly observed the
  current behavior (e.g. read the actual code path), that outweighs an older, unverified note.
- Don't drop existing content just because it wasn't the focus of the current session — only
  recommend replacing it once it's demonstrably outdated or wrong.
- If you can't tell which is correct, recommend "needs human judgment" — don't resolve it
  unilaterally.
- Never merge two conflicting facts into one vague statement that hides the disagreement.
