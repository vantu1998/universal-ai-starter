---
description: Review a diff/PR/change for correctness, requirements coverage, code quality, security, and performance
---

# /review

Use the `code-review` skill (`.ai/skills/code-review/SKILL.md`).

Review the requested scope (a diff, a PR, a set of files, or a change description) and assess it
for correctness, requirements coverage, code quality, testing, security, performance, and
compatibility.

Follow the `code-review` skill completely — don't skip security or requirements checks because
the change "looks small"; use the skill's guidance to decide how much depth each phase actually
needs.

This is a review, not an implementation task — don't change code as part of running this command
unless the human explicitly asks for a follow-up fix.

At the end, report:
- What was reviewed and its scope
- Findings, ranked by severity
- What was verified (tests run, requirements checked) and what wasn't
- Anything that needs human confirmation before merging
