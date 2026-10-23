# Example — dependency refactor

Request: "The `payment` module directly imports `order` internals — invert the dependency so
`order` doesn't need to know about `payment`."

- **Tier:** Significant (per [`../references/workflow.md`](../references/workflow.md)) — crosses
  module boundaries and changes how modules depend on each other; highest risk tier by default.
- **Analysis:** `payment` reaches into `order`'s internal repository directly instead of going
  through `order`'s public API; every place doing this must be found, not just the obvious ones.
- **Invariants:** every existing call site's observable behavior (return values, side effects,
  error cases) stays identical; no new circular dependency is introduced by the inversion.
- **Strategy:** define an interface `order` exposes for what `payment` needs, implement it in
  `order`, have `payment` depend on the interface instead of the internal repository, remove the
  direct import last — only once nothing references it.
- **Risk analysis:** high — module boundary change affects build/dependency graph and every
  caller across both modules; full written risk analysis is mandatory, not optional, per
  `.ai/rules/refactor/safety.md`.
- **Testing:** full test suites for both `payment` and `order`, plus an integration test
  exercising the new interface boundary; done in small steps with tests run after each.
- **Completion:** direct import removed, interface in place, both modules' full suites pass,
  risk analysis's cross-module risk explicitly confirmed mitigated, human sign-off obtained given
  the high risk tier.
