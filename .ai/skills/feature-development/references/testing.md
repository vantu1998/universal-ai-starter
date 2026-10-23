# Testing (Phase 5)

- Write tests that verify the concrete "done" outcome defined in Phase 2 — not just that code
  compiles or runs without throwing.
- Cover the failure/edge cases surfaced in Phase 3's impact analysis, not only the happy path.
- Run the existing test suite for every module touched — a passing new test doesn't confirm
  nothing else broke.
- For a UI/API-facing feature, exercise it as a caller would (real request, real UI interaction)
  in addition to unit tests — passing tests verify correctness of the code, not of the feature as
  experienced by a user.
- If a test is hard to write because the code is hard to test, that's signal to reconsider the
  implementation — don't weaken the test to make it pass instead.
