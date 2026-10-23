---
name: code-review
description: Assess a diff/PR/change for correctness, requirements coverage, code quality, testing, security, performance, and compatibility.
---

# Code Review

## Objective

Assess a change and report findings — this skill does not implement fixes.

The goal is not to nitpick style. The goal is to catch what matters before it merges: broken
behavior, unmet requirements, missing tests, security/performance risk, and compatibility
breaks — ranked so the author knows what's blocking versus optional.

---

# Workflow

## Phase 1 — Workflow overview

Read [`references/workflow.md`](references/workflow.md) once per review to confirm which phases
below actually apply — a one-line typo fix and a cross-service change don't need the same depth.

## Phase 2 — Requirements

Confirm what the change was supposed to do, and check it actually does that.

Read: [`references/requirements.md`](references/requirements.md)

## Phase 3 — Correctness

Check the logic itself: does it do what it claims, on the happy path and at the edges.

Read: [`references/correctness.md`](references/correctness.md)

## Phase 4 — Code quality

Assess structure, naming, duplication, and fit with existing conventions.

Read: [`references/code-quality.md`](references/code-quality.md)

## Phase 5 — Testing

Check whether the change is adequately covered and whether existing tests still make sense.

Read: [`references/testing.md`](references/testing.md)

## Phase 6 — Security

Check for injection, auth/authz, data exposure, and other OWASP-class risks.

Read: [`references/security.md`](references/security.md)

## Phase 7 — Performance

Check for regressions in hot paths, N+1 patterns, and unnecessary resource use.

Read: [`references/performance.md`](references/performance.md)

## Phase 8 — Compatibility

Check for breaking changes to public contracts, schemas, or downstream consumers.

Read: [`references/compatibility.md`](references/compatibility.md)

## Phase 9 — Findings

Consolidate everything into a ranked report.

Read: [`references/review-findings.md`](references/review-findings.md)

Draft with: [`templates/review-report.md`](templates/review-report.md) and
[`templates/finding.md`](templates/finding.md) per finding.

---

# Examples

- [`examples/feature-review.md`](examples/feature-review.md) — reviewing a new feature end to end.
- [`examples/bugfix-review.md`](examples/bugfix-review.md) — small, targeted, correctness-focused.
- [`examples/refactor-review.md`](examples/refactor-review.md) — behavior-preservation focused,
  heavier on regression risk than on requirements.

# Boundaries

- Review only, don't implement — see `.ai/rules/review/scope.md`. If the human wants fixes
  applied, that's a separate, explicitly requested follow-up.
- Don't expand scope beyond the requested diff/PR/files — see `.ai/rules/review/scope.md`.
- Don't understate or silently fix findings — see `.ai/rules/review/safety.md`.
- Rank and evidence every finding — see `.ai/rules/review/quality.md`.
