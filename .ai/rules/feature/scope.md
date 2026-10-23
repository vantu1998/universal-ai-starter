# Feature scope

## State scope explicitly before implementing

Every feature plan must state what's in scope and what's explicitly out of scope. If a request
has multiple reasonable interpretations, surface them and ask — don't silently pick one.

## Don't expand scope mid-implementation

If implementation surfaces adjacent work that seems worth doing (a related bug, a missing test
elsewhere, a nearby refactor), don't fold it into the current feature. Note it and let the human
decide whether it's a separate task.

## Impact analysis can force a scope conversation

If impact analysis reveals the feature touches more than expected (a shared module, multiple
consumers of a changed event), stop and confirm scope with the human before proceeding — don't
silently absorb the larger scope or silently ignore the risk to stay within the original estimate.

## "Done" means the stated done-criteria, not more

Don't keep polishing past the concrete "done means" defined in the requirements phase. Extra
robustness for scenarios that can't happen, or extra tests beyond what verifies the stated
outcome, is scope creep, not thoroughness.
