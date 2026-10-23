# Review safety

## Don't understate risk

If a finding is a real correctness or security risk, say so plainly. Don't soften a serious
finding into a "nit" or "minor suggestion" to make the review read more pleasantly.

## Don't silently fix findings mid-review

If a finding is trivial to fix, resist fixing it inline unless asked — report it instead. A
review that quietly patches things as it goes leaves no record of what was actually wrong, and
can hide changes from the author's own review of their diff.

## Security and correctness findings can't be skipped for time

A review that skips checking for injection, auth, and data-exposure issues to save time isn't a
completed review — say explicitly if a security or correctness pass wasn't done, rather than
implying it was.

## High-severity findings need explicit human confirmation before merging

A finding classified as high severity (correctness bug, security vulnerability, data loss risk)
must be called out explicitly as blocking, and the human must confirm before the change merges —
even if the rest of the review is clean.
