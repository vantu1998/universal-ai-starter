---
name: knowledge-maintenance
description: Review development sessions and maintain persistent AI context.
---

# Knowledge Maintenance

## Objective

Review the current development session and determine
which discoveries should become persistent AI context.

The goal is not to summarize the session.

The goal is to improve the project's long-term AI context.

---

# Workflow

## Phase 1 — Discover

Review the session and identify:

- New architecture facts
- Domain discoveries
- Technology decisions
- API conventions
- Coding conventions
- Development workflows
- Important constraints
- Corrections to existing context
- Reusable problem-solving patterns

Ignore normal implementation details unless they have
future value.

---

## Phase 2 — Extract

Convert discoveries into atomic candidates.

Each candidate should represent one idea.

Bad:

"Payment service uses Kafka, has PostgreSQL,
uses Spring Boot and has refund APIs."

Good:

"Payment Service communicates through Kafka events."

"Payment Service uses PostgreSQL."

"Refund requests require idempotency."

---

## Phase 3 — Classify

Classify each candidate as:

- Knowledge
- Rule
- Skill
- Ignore

Read:

references/classification.md

---

## Phase 4 — Evaluate

Evaluate:

- Persistence
- Reusability
- Specificity
- Confidence
- Scope
- Volatility
- Evidence

Read:

references/quality-criteria.md

---

## Phase 5 — Search existing context

Before creating anything:

1. Search knowledge/
2. Search rules/
3. Search skills/

Determine whether the candidate:

- Already exists
- Should update an existing file
- Conflicts with existing information
- Should be merged

---

## Phase 6 — Deduplicate

Read:

references/deduplication.md

Prefer:

Existing file
>
Update existing file
>
Create new file

Do not create duplicate knowledge.

---

## Phase 7 — Conflict detection

If new information conflicts with existing context:

Read:

references/conflict-resolution.md

Never silently overwrite.

Report:

- Existing statement
- New statement
- Evidence
- Scope
- Conflict
- Recommendation

---

## Phase 8 — Generate proposal

Generate a review report.

For each candidate provide:

- Candidate
- Classification
- Target
- Reason
- Evidence
- Confidence
- Proposed action

---

## Phase 9 — Human approval

Do not modify persistent context yet.

Ask the developer to approve:

- All
- Selected candidates
- None

---

## Phase 10 — Persist

After approval:

- Update existing files when possible.
- Create new files only when necessary.
- Remove obsolete information only when explicitly approved.
- Preserve project terminology.
- Keep context concise.

---

## Phase 11 — Validate

After modification:

Check:

- Duplicates
- Contradictions
- Broken references
- Wrong classification
- Stale information
- Scope problems

---

## Phase 12 — Report

Return:

- What was discovered
- What was persisted
- What was rejected
- What was ignored
- Remaining conflicts