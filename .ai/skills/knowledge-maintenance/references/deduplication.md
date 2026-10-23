# Deduplication (Phase 5–6)

## Phase 5 — Search existing context

Before creating anything, search:

1. `knowledge/` (via `knowledge/README.md`)
2. `rules/` (via `rules/README.md`)
3. `skills/` (via `skills/README.md`)

For each candidate, determine whether it:

- Already exists as-is.
- Should update an existing file.
- Conflicts with existing information (→ [`conflict-resolution.md`](conflict-resolution.md)).
- Should be merged with another candidate or existing file.

## Phase 6 — Deduplicate

Preference order, strongest first:

    Existing file (nothing to do)
      > Update existing file
        > Create new file

Only create a new file once you've confirmed no existing file is the right home for the
candidate. Do not create duplicate knowledge — if duplication already exists across multiple
files (found incidentally while searching), consolidate it when safe to do so without losing
information.
