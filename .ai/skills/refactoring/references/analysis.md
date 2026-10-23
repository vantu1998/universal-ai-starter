# Analysis (Phase 2)

Before deciding how to refactor, establish:

- **What the code currently does** — read it fully, don't infer behavior from naming or
  comments alone. If behavior is unclear, trace it rather than assuming.
- **Why it needs to change structurally** — the concrete pain point (duplicated logic, a class
  doing too much, a dependency that makes testing hard) — not "it looks messy."
- **Who calls it** — every caller, direct and indirect, including other modules, event
  consumers, and tests. A refactor that misses a caller is a behavior change in disguise.
- **What's explicitly out of scope** — adjacent code that could also be improved but isn't part
  of this refactor (see `.ai/rules/refactor/scope.md`).

If the request is actually asking for different behavior (a bug fix, a new option), it's a
feature or a fix, not a refactor — say so rather than smuggling a behavior change in under the
"refactor" label.
