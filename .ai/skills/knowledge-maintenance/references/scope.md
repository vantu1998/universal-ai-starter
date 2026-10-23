# Scope (Phase 1–2 — Discover & Extract)

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

Ignore normal implementation details unless they have future value.

## Phase 2 — Extract

Convert discoveries into atomic candidates. Each candidate should represent one idea.

Bad:

> "Payment service uses Kafka, has PostgreSQL, uses Spring Boot and has refund APIs."

Good:

> "Payment Service communicates through Kafka events."
> "Payment Service uses PostgreSQL."
> "Refund requests require idempotency."

If, after Discover and Extract, nothing survives, that's a valid outcome — report "nothing to
persist" (Phase 12) rather than manufacturing a candidate to justify running the skill.
