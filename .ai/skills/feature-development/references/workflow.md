# Workflow overview

Six phases: Requirements → Impact analysis → Implementation → Testing → Completion, with this
overview read first each time.

Not every feature needs every phase at full depth:

- **Trivial** (one-line config, copy tweak): Requirements and Completion only; skip a written
  impact analysis but still think through it.
- **Small** (single module, no API/schema change): all phases, lightly — a short plan, a short
  impact note.
- **Significant** (crosses modules, touches an API/schema/shared behavior): all phases in full,
  written down, per the templates.

When unsure which tier a feature falls into, default to the next tier up rather than down —
under-scoping impact analysis is the most common way a "simple" feature causes a regression.
