# Contributing

1. Edit canonical content in `.ai/` (never the generated `.claude/`, `.cursor/`, `.agents/`).
2. Run `./scripts/sync.sh` or `.\scripts\sync.ps1` and commit the regenerated adapters (CI fails on drift).
3. New skills/commands need `name`/`description` frontmatter.
4. Update `STATE.md` with your change.

