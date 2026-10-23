# Example — simplify service

Request: "ReportGenerator has accumulated five different conditional branches for report types
added over time — simplify it."

- **Tier:** Small (per [`../references/workflow.md`](../references/workflow.md)) — one module,
  no external contract change, but several existing behaviors to preserve exactly.
- **Analysis:** the branches map cleanly to a strategy-per-report-type; some branches share
  near-duplicate logic that can be consolidated once separated out.
- **Invariants:** each of the five report types must produce identical output for identical
  input; no report type may accidentally start using another type's logic.
- **Strategy:** introduce one small class per report type implementing a shared interface,
  migrate one branch at a time, run existing tests for that report type after each migration.
- **Risk analysis:** medium — five branches means five chances to misassign shared logic;
  mitigated by testing each report type individually and only removing the old branch once its
  replacement's tests pass.
- **Testing:** existing tests per report type (add characterization tests for any type that
  lacked coverage) re-run after every migration step.
- **Completion:** all five report types produce identical output to before, old conditional
  removed, no report type merged or dropped.
