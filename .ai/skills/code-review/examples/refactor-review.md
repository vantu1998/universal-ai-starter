# Example: reviewing a refactor

A PR extracts a shared validation method out of three duplicated call sites.

- **Requirements:** The stated goal is "no behavior change" — treat that as the requirement to
  verify, not a checklist of new functionality.
- **Correctness:** Compare the extracted method's logic against each of the three original
  call sites line by line; a subtle divergence (e.g. one site had an extra null check) is the
  most common way this kind of refactor introduces a regression.
- **Testing:** Confirm existing tests for all three call sites still pass, and that a
  characterization test exists for any behavior that wasn't previously covered.
- **Code quality:** Check the extracted method's name and placement fit the module's existing
  conventions.
- **Security/performance/compatibility:** Only relevant if the extraction changed a public
  method signature consumed elsewhere — check for that specifically before skipping the phase.

Risk tier: small-to-medium, depending on how many callers the extracted method has.
