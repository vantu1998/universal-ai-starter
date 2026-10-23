# /refactor

Use the `refactoring` skill (`.ai/skills/refactoring/SKILL.md`).

Review the request and drive it through the full workflow: analysis, invariants, strategy,
incremental refactoring, testing, completion.

Follow the `refactoring` skill completely — don't skip risk analysis because the change "looks
mechanical"; use the skill's guidance to decide how much each phase actually needs.

At the end, report:
- What was refactored and why
- What invariant guaranteed behavior didn't change
- What was tested
- Anything that needs human confirmation before merging
