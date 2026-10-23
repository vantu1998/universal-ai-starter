# Template — knowledge candidate

Use this when Phase 3 classifies a candidate as **Knowledge**, once it has passed Phase 4
(Evaluate) and Phase 5–6 (Search/Deduplicate):

    ### Candidate: <one-line atomic statement>

    - **Classification:** Knowledge
    - **Target:** <file path under .ai/knowledge/> (new file / update existing)
    - **Reason:** <why this belongs in knowledge, not a rule>
    - **Evidence:** <what in the session/source backs this>
    - **Confidence:** high / medium / low
    - **Content:** <exact markdown to add or the diff to an existing file, per
      `.ai/rules/knowledge/quality.md`>
    - **README.md row:** `| <file> | <topic> | <read when...> |`
