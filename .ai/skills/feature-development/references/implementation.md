# Implementation (Phase 4)

- Follow the plan from Phase 2/3 — if implementation reveals the plan was wrong, update the plan
  and say so, don't quietly diverge.
- Match existing code conventions in the files/modules you're touching (naming, structure,
  error handling style) rather than introducing a new pattern for one feature.
  See `.ai/rules/feature/quality.md`.
- Touch only what the feature requires. Don't refactor unrelated code, rename things you didn't
  need to rename, or "improve" adjacent code while you're in there.
- Respect every rule in `.ai/rules/README.md` that applies to the code being touched, and any
  `.ai/knowledge/` entry relevant to the module.
- If the feature needs a new convention (not covered by existing rules), implement it, then flag
  it as a rule candidate at Phase 6 rather than deciding unilaterally that it's now a standing
  convention.
