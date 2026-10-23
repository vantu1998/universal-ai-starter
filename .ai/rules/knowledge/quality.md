# Knowledge quality

Rules for how any file under `.ai/knowledge/` must be written.

## Write for a reader with no session context

Write for a future AI agent that never saw the conversation that produced this fact. State the
durable fact, not the narration of discovering it.

- Good: "Payment status is finalized from Stripe webhook events, because Stripe processing is
  asynchronous and webhook delivery can be retried."
- Bad: "Today we discovered the Stripe webhook was causing issues."

Avoid session-specific language: "We discovered...", "Today...", "The user asked...", "During
this session...".

## Don't state assumptions or speculation as fact

If something is unconfirmed or a working hypothesis, say so explicitly, or don't persist it.

## Keep files small and single-scope

Each file covers one coherent topic. Prefer roughly 500–1,500 words per document; review a
document above ~2,000 words for splitting. If a file grows large or now spans more than one
business scope, split it per scope (e.g. `domain-<scope>.md`) instead of letting one file
accumulate everything. Don't split just to hit a word count if it would make the knowledge harder
to follow.
