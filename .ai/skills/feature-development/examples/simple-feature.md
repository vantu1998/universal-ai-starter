# Example — simple feature

Request: "Add a config flag to disable the daily report email."

- **Tier:** Trivial/small (per [`../references/workflow.md`](../references/workflow.md)) — single
  module, no API/schema change, no other feature depends on this path.
- **Requirements:** done means the email job checks the flag and skips sending when disabled;
  out of scope: no admin UI for the flag, config-file only.
- **Impact analysis (short form):** touches only the report-email scheduler; no shared code path;
  risk: low — worst case is the flag is ignored and email still sends, not destructive.
- **Implementation:** add the flag read at the top of the existing job method; match existing
  config-flag conventions in the same module rather than inventing a new pattern.
- **Testing:** unit test the job with the flag on and off; no need for a full impact-analysis
  document given the low risk tier.
- **Completion:** flag works both ways, existing job tests still pass, no unrelated changes.
