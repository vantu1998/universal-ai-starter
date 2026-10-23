# Classification (Phase 3)

Classify each atomic candidate from Phase 2 (Extract) into exactly one bucket:

- **Knowledge** — a durable project/domain/architecture fact → `.ai/knowledge/`. Authoring rules:
  see `.ai/rules/knowledge/`.
- **Rule** — a standing constraint the AI must always follow going forward (project workflow or
  coding convention) → `.ai/rules/*.md` (top level).
- **Skill** — a repeatable multi-step process for a kind of task → `.ai/skills/`.
- **Ignore** — reliably derivable from the code, a one-off debugging note, or a local hypothesis
  never confirmed — don't persist.

If a candidate seems to straddle two buckets (e.g. a fact that implies a constraint), split it
back in Phase 2: the factual part becomes a Knowledge candidate, the constraint part becomes a
Rule candidate — don't force one candidate to carry both.
