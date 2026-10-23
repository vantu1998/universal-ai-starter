# Example — knowledge candidate

Session context: while debugging a slow report, the AI found that a specific jOOQ-built CTE
query needed a per-query JIT disable to avoid a Postgres planner regression, and that this is
already documented as an existing pattern.

    ### Candidate: A per-query JIT disable via SET LOCAL avoids a planner regression on this CTE

    - **Classification:** Knowledge
    - **Target:** `knowledge/data-orchestrator-cte-query-performance.md` (update existing — this
      file already covers this topic, see `knowledge/README.md`)
    - **Reason:** durable, non-obvious fact about query performance, not a constraint
    - **Evidence:** observed during this session's debugging of the slow report
    - **Confidence:** high
    - **Content:** add the new observation as a section; keep existing content; state the durable
      fact per `.ai/rules/knowledge/quality.md`, don't re-narrate the debugging session
    - **README.md row:** unchanged (topic already listed)

Per [`../references/deduplication.md`](../references/deduplication.md), this is a Phase 6 "update
existing file" case, not a new `knowledge/postgres-jit-notes.md`.
