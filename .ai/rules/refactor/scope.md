# Refactor scope

## State scope explicitly before executing

Every refactor plan must state which code is being restructured and what adjacent code is
explicitly out of scope, even when it looks like it could use the same treatment.

## Don't expand scope mid-refactor

If executing the plan surfaces other code that could benefit from the same technique, don't fold
it into the current change. Note it and let the human decide whether it's a separate task.

## Bugs found during a refactor are reported, not fixed inline

If a refactor surfaces a genuine bug in the code being restructured, report it separately rather
than fixing it as part of the refactor — fixing it inline conflates a behavior-preserving change
with a behavior change, which breaks the refactor's own invariants.

## "Done" means the stated invariants held, not more

Don't keep restructuring past what the strategy called for. Extra abstraction, extra
generalization, or extra "future-proofing" beyond the planned steps is scope creep, not
thoroughness.
