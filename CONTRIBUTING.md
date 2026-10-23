# Contributing

1. Edit canonical content in `.ai/` (never the generated `.claude/`, `.cursor/`, `.agents/`).
2. Run `./scripts/sync.sh` or `.\scripts\sync.ps1` and commit the regenerated adapters (CI fails on drift).
3. New skills/commands need `name`/`description` frontmatter.
4. Record your change in `CHANGELOG.md`. **Never write to `STATE.md`, `ROADMAP.md` or `.ai/knowledge/`** in this repo: they ship to users as clean templates (CI fails if they contain dev traces). This overrides the 'update STATE.md on every commit' rule in `AGENTS.md`, which applies to projects that *use* the template.

