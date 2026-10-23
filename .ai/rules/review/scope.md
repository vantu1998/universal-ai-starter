# Review scope

## State scope explicitly before reviewing

Every review must state what is being reviewed (diff, PR, files, commit range) and what is
explicitly out of scope, even when adjacent code looks like it has the same problem.

## Don't expand scope mid-review

If reviewing surfaces unrelated issues elsewhere in the codebase, don't fold them into this
review's findings as if they were part of the change. Note them separately and let the human
decide whether they're worth a follow-up task.

## Review only, don't implement

A review produces findings, not fixes. Don't edit code as part of running a review unless the
human explicitly asks for a follow-up fix — mixing the two makes it unclear what was reviewed
versus what was changed.

## "Done" means the stated scope was assessed, not more

Don't chase every tangential concern past what the scope calls for. A review that wanders into
unrelated modules or hypothetical future changes has lost its scope, not gained thoroughness.
