# Example — extract method

Request: "This 80-line method does three distinct things, split it into named private methods."

- **Tier:** Trivial (per [`../references/workflow.md`](../references/workflow.md)) — single file,
  no external callers affected, no signature change.
- **Analysis:** the method validates input, computes a total, then formats a response — three
  clear sections separable by existing local variable boundaries.
- **Invariants:** the public method's signature and return value must be byte-for-byte identical
  for every existing test input.
- **Strategy:** extract each section into a private method with a descriptive name, in three
  small steps, each compiled and tested before the next.
- **Risk analysis:** low — single file, existing unit tests already cover all three sections.
- **Testing:** run the existing unit tests after each extraction step; no new tests needed since
  behavior isn't changing.
- **Completion:** all three extractions done, same tests pass unmodified, no signature change.
