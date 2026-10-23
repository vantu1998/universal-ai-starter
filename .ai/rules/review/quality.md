# Review quality

Rules for how a code review is conducted, once scope is clear.

## Findings must be evidence-based

Every finding must point at a specific file/line/behavior. Don't report vague impressions
("this could be cleaner") without naming the concrete problem and why it matters.

## Rank, don't just list

Order findings by severity (correctness/security first, style last). A flat list that buries a
bug under ten formatting nits is not a useful review.

## Distinguish confirmed vs. suspected

State plainly whether a finding was verified (read the code path, ran a test, reproduced the
issue) or is a suspicion that needs the author to confirm. Don't present a guess as a fact.

## New conventions get flagged, not assumed

If a review surfaces a pattern worth applying project-wide, flag it as a rule candidate — don't
silently treat one review's opinion as a project-wide standard.
