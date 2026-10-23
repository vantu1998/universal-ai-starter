---
name: feature-development
description: Drive a new feature from request to completion — requirements, impact analysis, implementation, testing, completion.
---

# Feature Development

## Objective

Turn a feature request into working, tested code without breaking existing behavior or
project conventions.

The goal is not to write code as fast as possible. The goal is a change that is correct,
scoped to what was asked, and verifiable.

---

# Workflow

## Phase 1 — Workflow overview

Read [`references/workflow.md`](references/workflow.md) once per feature to confirm which phases
below actually apply — a one-line config change and a new module don't need the same depth.

## Phase 2 — Requirements

Clarify what's actually being asked before writing anything.

Read: [`references/requirements.md`](references/requirements.md)

Draft with: [`templates/feature-plan.md`](templates/feature-plan.md)

## Phase 3 — Impact analysis

Identify what this feature touches: modules, APIs, data, other features, and what could break.

Read: [`references/impact-analysis.md`](references/impact-analysis.md)

Draft with: [`templates/impact-analysis.md`](templates/impact-analysis.md)

## Phase 4 — Implementation

Implement per the plan, respecting `.ai/rules/feature/` and any rule/knowledge specific to the
module being touched.

Read: [`references/implementation.md`](references/implementation.md)

## Phase 5 — Testing

Verify the feature works and didn't regress anything identified in Phase 3.

Read: [`references/testing.md`](references/testing.md)

Draft with: [`templates/implementation-checklist.md`](templates/implementation-checklist.md)

## Phase 6 — Completion

Confirm the feature is actually done — not just "code compiles."

Read: [`references/completion.md`](references/completion.md)

---

# Examples

- [`examples/simple-feature.md`](examples/simple-feature.md) — a small, low-risk change; most
  phases are quick.
- [`examples/complex-feature.md`](examples/complex-feature.md) — a change touching multiple
  modules; every phase matters.

# Boundaries

- Don't expand scope beyond what was requested — see `.ai/rules/feature/scope.md`.
- Don't skip impact analysis because a change "looks small" — see `.ai/rules/feature/safety.md`.
- Match existing code conventions; don't introduce a new pattern for a single feature — see
  `.ai/rules/feature/quality.md`.
