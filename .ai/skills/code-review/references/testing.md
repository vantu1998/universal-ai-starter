# Testing

## Check coverage matches the change

Every new behavior and every bug fix should have a test that would fail without the change. If
it doesn't exist, that's a finding — name the specific scenario that's untested.

## Check the tests actually test something

- A test that can't fail (assertions that are trivially true, mocks that stub out the exact
  behavior being tested) is worse than no test — it gives false confidence.
- A test that duplicates another test in a different name isn't added coverage.

## Check edge cases from `correctness.md` are covered

If the correctness pass identified edge cases (empty input, boundary values, error paths),
check whether tests actually exercise them.

## Run the tests if possible

Prefer running the test suite over reading test code and assuming it passes. If you can't run
it, say so explicitly.

## Don't require tests for untestable trivia

Don't demand a test for a one-line formatting change or a comment update. Match the testing bar
to the risk tier from `workflow.md`.
