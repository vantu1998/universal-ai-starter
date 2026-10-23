# Template — rule candidate

Use this when Phase 3 classifies a candidate as **Rule**:

    ### Candidate: <one-line atomic statement>

    - **Classification:** Rule
    - **Target:** <file path under .ai/rules/> (new file / update existing)
    - **Reason:** <why this is a constraint the AI must always follow, not a fact about the
      project>
    - **Evidence:** <what in the session/source backs this>
    - **Confidence:** high / medium / low
    - **Content:** <exact markdown to add or the diff to an existing file>
    - **README.md row:** `| <file> | <applies to> | <summary> |`
