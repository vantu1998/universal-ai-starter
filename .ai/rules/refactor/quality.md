# Refactor quality

Rules for how a refactor is executed, once analysis and invariants are clear.

## Match existing conventions

Follow the naming, structure, and style already used in the module(s) being touched. A refactor
is not an opportunity to impose a different personal style — consistency with the surrounding
code beats personal preference.

## One technique at a time

Don't mix multiple refactoring techniques (e.g. extract-class and rename-everything) into one
undifferentiated change. Apply the technique named in the strategy, in the steps planned.

## No drive-by improvements

Don't use a refactor as cover for unrelated cleanup — formatting changes, comment rewrites, or
"while I'm here" fixes outside the stated strategy belong in a separate, explicitly requested
change.

## New conventions get flagged, not assumed

If the refactor's new structure implies a convention worth applying elsewhere too, flag it as a
rule candidate at completion — don't silently declare it a project-wide standard.
