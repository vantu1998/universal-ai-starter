# Testing (Phase 7)

- Run the full existing test suite for every module touched — a refactor's entire purpose is
  "behavior unchanged," so every previously-passing test must still pass, unmodified in meaning.
- If Phase 5 found coverage gaps, add characterization tests that pin down current behavior
  *before* relying on them to verify the refactor — a test written after the fact to match new
  output isn't verifying anything.
- Don't edit an existing test's expectations to make it pass unless the invariants in Phase 3
  explicitly say that specific behavior was allowed to change — otherwise a "fixed" test is
  hiding a broken invariant.
- For a refactor touching a public contract or shared module, exercise it as a real caller would
  (integration test, real request) in addition to unit tests.
