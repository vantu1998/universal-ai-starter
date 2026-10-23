# Example — rule candidate

Session context: the user said "from now on, don't call `SecurityUtils.crrUserId()` inside
`@Async`/`@EventListener`/`@Scheduled` methods — the security context isn't propagated there,
you have to pass the user id in explicitly."

    ### Candidate: Don't call SecurityUtils.crrUserId() in async/event/scheduled methods

    - **Classification:** Rule
    - **Target:** `rules/java-coding-style.md` (update existing — already documents this exact
      pitfall)
    - **Reason:** standing constraint the AI must always follow, not a fact about current state
    - **Evidence:** explicit instruction from the user this session
    - **Confidence:** high
    - **Content:** confirm/tighten existing wording on this pitfall
    - **README.md row:** update the summary column in `rules/README.md` if the wording changed
      meaningfully

Per [`../references/classification.md`](../references/classification.md), this is a Rule, not
Knowledge, because it constrains future behavior rather than describing a fact.
