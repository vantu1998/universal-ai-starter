# Feature safety

## Impact analysis is not optional for anything beyond trivial

A feature that touches more than one module, an API, a schema, or shared behavior must have a
written impact analysis before implementation starts, regardless of how simple the request
sounds. "It's just a small change" is not a valid reason to skip it — see
`.ai/skills/feature-development/references/workflow.md` for tiering.

## Every identified risk needs an explicit resolution

A risk surfaced during impact analysis must be either mitigated in the implementation or
explicitly accepted and stated in the completion report. It cannot simply be dropped or forgotten
between phases.

## Don't weaken tests to make them pass

If a test is hard to write because the implementation is hard to test, treat that as a signal to
reconsider the implementation — not a reason to write a weaker test or skip the case.

## High-risk changes need explicit human confirmation

A feature classified as medium/high risk in impact analysis (money, auth, data loss, irreversible
external side effects) must be confirmed with the human before merging, even if all automated
checks pass.
