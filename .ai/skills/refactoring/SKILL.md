---
name: refactoring
description: Change code structure without changing observable behavior — analysis, invariants, strategy, incremental refactoring, testing, completion.
---

# Refactoring

## Objective

Improve the internal structure of existing code without changing what it does.

The goal is not to make the code "better" by taste. The goal is a change that preserves every
observable behavior while making the code easier to work with, verified by tests that existed
before the refactor still passing.

---

# Workflow

## Phase 1 — Workflow overview

Read [`references/workflow.md`](references/workflow.md) once per refactor to confirm which
phases below actually apply — a rename and a cross-module extraction don't need the same depth.

## Phase 2 — Analysis

Understand what the code currently does and why it needs to change structurally.

Read: [`references/analysis.md`](references/analysis.md)

## Phase 3 — Invariants

State exactly what must stay the same — the contract the refactor is not allowed to break.

Read: [`references/invariants.md`](references/invariants.md)

## Phase 4 — Strategy

Decide the refactoring approach and its order of steps.

Read: [`references/strategy.md`](references/strategy.md)

Draft with: [`templates/refactor-plan.md`](templates/refactor-plan.md)

## Phase 5 — Risk analysis

Identify what could break and how confident the invariants in Phase 3 actually are.

Read: [`references/risk-analysis.md`](references/risk-analysis.md)

Draft with: [`templates/impact-analysis.md`](templates/impact-analysis.md)

## Phase 6 — Incremental refactoring

Apply the change in small, independently-verifiable steps.

Read: [`references/incremental-refactoring.md`](references/incremental-refactoring.md)

## Phase 7 — Testing

Confirm behavior is unchanged.

Read: [`references/testing.md`](references/testing.md)

## Phase 8 — Completion

Confirm the refactor is actually done and the invariants held throughout.

Read: [`references/completion.md`](references/completion.md)

Draft with: [`templates/refactor-checklist.md`](templates/refactor-checklist.md)

---

# Examples

- [`examples/extract-method.md`](examples/extract-method.md) — small, single-file, low-risk.
- [`examples/extract-class.md`](examples/extract-class.md) — splitting responsibilities within a
  module.
- [`examples/simplify-service.md`](examples/simplify-service.md) — removing accumulated
  complexity from one service.
- [`examples/dependency-refactor.md`](examples/dependency-refactor.md) — changing how modules
  depend on each other; highest risk tier.

# Boundaries

- Never change observable behavior — see `.ai/rules/refactor/safety.md`. If the request actually
  needs a behavior change, it's a feature, not a refactor — use `feature-development` instead.
- Don't refactor beyond what was requested — see `.ai/rules/refactor/scope.md`.
- Match existing conventions in the surrounding code; don't use the refactor as a vehicle for
  unrelated style opinions — see `.ai/rules/refactor/quality.md`.
