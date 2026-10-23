# Code quality

## Match existing conventions

Judge the diff against the conventions already used in the surrounding code/module, not against
a generic external style guide. A stylistic disagreement with an established local convention is
not a finding.

## Look for reuse and duplication

If the diff reimplements logic that already exists elsewhere in the codebase, flag it — point at
the existing implementation.

## Check naming and structure for clarity

Names should say what something is/does without needing the reader to open the implementation.
Flag names that actively mislead, not names that are merely not the reviewer's preference.

## Flag unnecessary complexity

Note abstractions, configurability, or generality added beyond what the requirement needed —
see `.ai/rules/review/quality.md` for how to phrase this as a finding rather than an assumption.

## Don't nitpick pure taste

Formatting handled by an autoformatter, or a stylistic choice with no functional or readability
consequence, is not worth a finding. Reserve findings for things that affect correctness,
maintainability, or actually mislead a reader.
