# Workflow tiering

Not every review needs every phase at full depth. Use the size and risk of the change to decide.

## Trivial (typo fix, comment change, formatting)

- Requirements: confirm the stated intent matches the diff.
- Correctness: quick read-through.
- Skip: code quality, testing, security, performance, compatibility deep dives — note explicitly
  that they were skipped and why.

## Small (single file/module, localized logic change, bug fix)

- Requirements, correctness, code quality: full pass.
- Testing: check the fix/change has a covering test.
- Security/performance/compatibility: quick check for obvious red flags; skip deep analysis
  unless the diff touches auth, input handling, or a hot path.

## Medium (new feature, multiple files, new endpoint/service call)

- All phases at full depth.

## Large/high-risk (cross-module, shared contract, schema change, auth/security-sensitive)

- All phases at full depth, plus:
  - Explicit compatibility analysis for every consumer of the changed contract.
  - Explicit security pass even if the change doesn't look security-related on its face.
  - Findings report must call out risk tier and recommend whether a second reviewer is warranted.

When unsure which tier applies, default up a tier rather than down.
