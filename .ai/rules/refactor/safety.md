# Refactor safety

## Behavior must not change

A refactor's defining constraint is that observable behavior is identical before and after. If a
requested change requires different behavior, it is a feature or a bug fix, not a refactor —
say so rather than smuggling a behavior change in under the "refactor" label.

## Risk analysis is not optional for anything beyond trivial

A refactor that crosses modules, changes a shared interface, or touches how modules depend on
each other must have a written risk analysis before execution starts, regardless of how
mechanical the change looks. See `.ai/skills/refactoring/references/workflow.md` for tiering.

## Coverage gaps get closed before, not after

If risk analysis finds behavior that isn't covered by an existing test, add a characterization
test that pins down current behavior *before* relying on it to verify the refactor. A test
written after the fact to match new output verifies nothing.

## Don't edit existing test expectations to make them pass

If an existing test fails after a refactoring step, that is a signal the invariant was broken —
fix the refactor, don't change the test's expectation, unless the invariants phase explicitly
allowed that specific behavior to change.

## High-risk refactors need explicit human confirmation

A refactor classified as medium/high risk (crosses modules, changes a shared/public contract,
touches a hot path) must be confirmed with the human before merging, even if all automated checks
pass.
