# Feature quality

Rules for how a feature is implemented, once requirements and impact are clear.

## Match existing conventions

Follow the naming, structure, and error-handling style already used in the module(s) being
touched. Don't introduce a new pattern for a single feature just because you'd prefer it —
consistency with the surrounding code beats personal preference.

## No speculative flexibility

Build what the feature actually requires. Don't add configurability, abstraction layers, or
extension points for hypothetical future needs that weren't part of the request.

## Surgical changes only

Touch only what the feature requires. Don't refactor unrelated code, rename things you didn't
need to rename, or "improve" adjacent code while implementing the feature — that belongs in a
separate, explicitly requested change.

## New conventions get flagged, not assumed

If implementation reveals a genuinely new convention is needed (not covered by any existing
rule), implement it for this feature, then flag it as a rule candidate at completion — don't
silently treat a one-off implementation choice as a new standing convention.
