# Example: reviewing a bug fix

A PR fixes an off-by-one error in a pagination helper.

- **Requirements:** Confirm the fix matches the reported bug (e.g. "last page missing one item"),
  not a different symptom.
- **Correctness:** Verify the boundary condition is now correct for first page, last page, and a
  single-page result set — off-by-one fixes are easy to overcorrect.
- **Testing:** Confirm a regression test was added that would have failed before the fix.
- **Code quality, security, performance, compatibility:** Quick check only — localized change,
  no new surface area, no shared contract touched. Note this tiering explicitly in the report.

Risk tier: small.
