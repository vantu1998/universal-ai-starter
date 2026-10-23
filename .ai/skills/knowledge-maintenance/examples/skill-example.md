# Example — skill candidate

Session context: the session walked through reviewing a PR for whether modified logic changed
original business behavior, using a specific multi-step method (identify changed branches,
compare against prior behavior, flag any semantic diff).

    ### Candidate: Reviewing a diff for unintended business-logic changes follows a fixed method

    - **Classification:** Skill
    - **Target:** `skills/` — new dedicated skill, or fold into
      `commands/custom-review-no-update-logic.md`'s existing methodology
    - **Reason:** repeatable multi-step process for a recurring kind of task, not a one-off
      instruction
    - **Evidence:** the method used this session, already partially captured in the existing
      command
    - **Confidence:** medium — check whether the command should be split into a thin command
      pointing at a new skill (per the "commands are thin, skills own methodology" principle in
      `.ai/README.md`) before proposing a brand-new skill
    - **README.md row:** `skills/README.md`, once the target is decided
