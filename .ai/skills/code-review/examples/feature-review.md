# Example: reviewing a new feature

A PR adds a new "export to CSV" endpoint.

- **Requirements:** Confirm the PR description's stated fields/format match what the endpoint
  actually returns.
- **Correctness:** Trace pagination/streaming logic for large datasets; check encoding of
  special characters (commas, quotes, newlines) in CSV output.
- **Code quality:** Check whether an existing export utility already exists elsewhere in the
  codebase before accepting a new one.
- **Testing:** Confirm a test covers empty dataset, large dataset, and special-character
  escaping.
- **Security:** Confirm the endpoint enforces the same authz as the underlying data's normal
  read path — a common gap when a new export path is added ad hoc.
- **Performance:** Check the export doesn't load the entire dataset into memory at once.
- **Compatibility:** New endpoint, no existing consumers — compatibility analysis is minimal
  here; note that explicitly rather than running the full phase.

Risk tier: medium (new endpoint, new data-handling surface, but no shared-contract change).
