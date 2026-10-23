# Compatibility

## Identify what's a public/shared contract

APIs, event schemas, database schemas, config formats, and shared library interfaces are
contracts other code depends on. Changes to these need compatibility analysis; purely internal,
unexported changes don't.

## Check for breaking changes

- Removed/renamed fields, endpoints, or parameters that a consumer might still rely on.
- Changed types, changed defaults, or changed error behavior on an existing contract.
- Database migrations that aren't backward-compatible with code still running the old version
  during a rolling deploy.

## Check who actually consumes the changed contract

Search the codebase (and note if external/unknown consumers might exist) for callers of the
changed contract before concluding a change is safe.

## Flag missing versioning/migration strategy

If a breaking change is genuinely necessary, check whether the diff includes a migration path
(versioning, dual-write, deprecation period). Its absence on a breaking change is a finding.
