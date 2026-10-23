# Knowledge lifecycle

Rules for how files under `.ai/knowledge/` are created, updated, and retired.

## Update before you create

Before adding a new file, check whether an existing `knowledge/*.md` file already covers the
topic. Update in place — merge, fix what's stale, don't duplicate — rather than creating a
near-duplicate file.

## Preserve existing context unless it's demonstrably obsolete

When updating a knowledge file, don't drop existing project context just because it's not the
focus of the current change — only remove or replace information once it's demonstrably
outdated or wrong.

## Always update the index

Any file added, removed, renamed, or substantially changed must be reflected in
`knowledge/README.md`. Each row states what the file contains and when an AI should read it — not
a copy of the file's content.
