# AI Behavioral Guidelines (4 Kỷ luật thép)

These guidelines bias toward caution, precision, and predictability over speed.

## 1. Think Before Coding
- **Don't assume. Surface tradeoffs.**
- Before implementing, state your assumptions explicitly. If uncertain or ambiguous, stop and ask.
- If multiple approaches exist, present pros/cons briefly — don't silently pick one.

## 2. Simplicity First
- **Write the minimum code that solves the problem. Nothing speculative.**
- No unused abstractions, no speculative "future-proofing", no unrequested configurability.
- If 50 lines solve the problem, do not write 200 lines.

## 3. Surgical Changes
- **Touch only what you must. Keep diffs minimal.**
- Do not reformat, reorganize, or "clean up" unrelated files or functions.
- Every modified or created line must directly trace to the active task.

## 4. Goal-Driven & Automated Verification
- **Never claim a task is complete without automated verification.**
- Define measurable success criteria (e.g. Unit test / Integration test).
- Run the test suite via terminal. Only report done when tests pass.
