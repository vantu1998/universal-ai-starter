# Requirements (Phase 2)

Before writing any code, establish:

- **What is being asked** — restate it in one or two sentences. If the request is ambiguous or
  has multiple reasonable interpretations, surface them and ask rather than picking silently.
- **What "done" looks like** — a concrete, checkable outcome (an endpoint returns X, a job runs
  on schedule Y), not "make it work."
- **What's explicitly out of scope** — call out adjacent things you will *not* do, so scope
  creep is visible and avoidable later (see `.ai/rules/feature/scope.md`).
- **Constraints already known** — any existing rule, convention, or architectural boundary this
  feature must respect (check `.ai/rules/README.md` for anything relevant).

If the request can be satisfied with something already in the codebase (an existing endpoint,
utility, or config toggle), say so — don't build a new thing to satisfy an old need.
