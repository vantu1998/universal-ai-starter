# .ai/ — AI Development Operating System

This directory is the source of truth for how AI coding assistants work in this repository, regardless of tool (Cursor, Claude Code, Antigravity, Windsurf, Kiro, Codex).

## Purpose
`.ai/` enables any AI assistant to immediately determine:
- **Which workflow to run?** (→ `skills/`)
- **What constraints must be respected?** (→ `rules/`)
- **What is true about this system?** (→ `knowledge/`)
- **How to invoke work?** (→ `commands/`)

```
User Request / Slash Command
       ↓
commands/ (.ai/commands/feature.md, etc.)
       ↓
skills/ (skills/feature/SKILL.md, etc.)
       ↓
rules/ (rules/behavior.md, etc.) + knowledge/ (knowledge/*.md)
       ↓
Verified Output & Green Automated Tests
```

## The Four Core Components

| Component | Role | Description |
|---|---|---|
| `commands/` | Entry Point | Human-invoked slash commands (`/feature`, `/refactor`, `/review`, `/knowledge-review`). |
| `skills/` | Workflow SOP | Structured multi-phase execution guides preventing AI from cutting corners. |
| `rules/` | Constraints | Invariants, behavioral discipline, and safety limits. |
| `knowledge/` | Project Wisdom | Accumulated domain facts and operational lessons learned. |

## Startup Routine for AI Assistants
At the start of every session:
1. Read `STATE.md` to identify current progress and active task.
2. Read `rules/behavior.md` for core execution discipline and `rules/security.md` for safety limits.
3. Check `knowledge/README.md` before searching code when answering domain architecture questions.
