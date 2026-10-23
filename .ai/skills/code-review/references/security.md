# Security

## Check the OWASP-class basics on every non-trivial change

- Injection: SQL, command, template, log injection from unsanitized input.
- Auth/authz: does the change respect existing access checks, or introduce a path that bypasses
  them?
- Data exposure: are secrets, PII, or internal identifiers logged, returned in responses, or put
  in URLs/query strings where they don't belong?
- Deserialization/parsing of untrusted input without validation.

## Check dependencies

If the diff adds or bumps a dependency, note it as a finding worth a supply-chain sanity check —
this skill doesn't perform the check itself, but flags it for the human.

## Treat security findings as high severity by default

Don't downgrade a plausible security issue to "minor" because it's unlikely to be exploited in
practice. Let the human make that call with the finding stated plainly.

## Don't skip this phase for "internal" or "admin-only" code

Internal tooling and admin panels are common real-world breach points precisely because they get
less scrutiny. Apply the same checks.
