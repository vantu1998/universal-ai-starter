# Consolidating findings

## Rank before writing

Order: correctness bugs and security issues first, then compatibility breaks, then missing
tests/requirements gaps, then code quality/performance, then style suggestions last.

## One finding, one issue

Don't bundle multiple unrelated problems into a single finding — each finding should be
independently actionable and independently resolvable.

## Every finding states severity and evidence

Use [`templates/finding.md`](../templates/finding.md) per finding: what's wrong, where, why it
matters, and whether it's confirmed or suspected (see `.ai/rules/review/quality.md`).

## Summarize verification performed

State explicitly what was actually checked (tests run, code read, behavior reproduced) versus
what wasn't reachable in this review — don't imply full verification if some phases were
skipped per `workflow.md` tiering.

## Call out the blocking bar

End the report stating plainly which findings (if any) should block merge, per
`.ai/rules/review/safety.md`.
