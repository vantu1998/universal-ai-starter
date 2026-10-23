# Requirements

## Establish what the change was supposed to do

Read the PR/ticket description, commit messages, or the human's stated intent. If none exists,
ask, or infer from the diff and state the inferred intent explicitly before reviewing against it.

## Check the diff actually satisfies it

Walk through the stated requirement and confirm the code does that — not a close approximation,
not "probably." If a requirement is partially met, say exactly which part isn't.

## Flag scope mismatches

- Diff does less than requested → missing requirement, likely blocking.
- Diff does more than requested → note as scope creep; not necessarily blocking, but worth
  surfacing so the author can decide whether it belongs in this change.

## Don't invent requirements

Don't hold the change to a standard nobody asked for. If you think something *should* be
required but wasn't stated, flag it as a suggestion, not a requirements gap.
