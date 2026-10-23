# Knowledge safety — what belongs, what doesn't

## Only persist what earns its place

Persist a fact only if: a future AI session would benefit from it, it's hard to reliably infer
from the source, it's a domain/architecture fact or constraint, it explains non-obvious behavior,
or it prevents a likely future mistake.

Do not persist: conversation summaries, step-by-step recaps of a session, obvious implementation
details, temporary debugging notes, anything already obvious from the source, personal
preferences that aren't an established team convention, or speculation presented as fact.

## Mandatory constraints go in Rules, not Knowledge

If what you're about to write is a constraint the AI must always follow (not a fact about the
project), it belongs in `.ai/rules/`, not `.ai/knowledge/`. Don't let a knowledge file drift into
stating rules.

This drift happens at the sentence level, not just the whole-file level: a fact statement followed
by an imperative closing sentence ("should call X instead", "must filter by Y", "don't assume
Z — check W first") is a rule smuggled into a knowledge entry. State the fact and its
consequence — e.g. "the collision means an id-only filter can silently match the wrong row" — and
stop there; if the imperative sentence would still be true with the fact deleted, it's a rule, not
part of this fact, and belongs in `.ai/rules/` instead (or gets cut if it's not worth a standing
rule).

## Knowledge stays self-contained — no `docs/` or other human-facing references

Per `.ai/README.md`'s content policy, `.ai/knowledge/*.md` may reference source code paths
(`modules/...`, specific classes/files) but must never reference human-facing documentation
outside `.ai/` (e.g. `doc/`, `docs/`). If a fact is genuinely only findable in an external doc,
describe it in prose without linking or naming the path — don't cite the doc as the source.
