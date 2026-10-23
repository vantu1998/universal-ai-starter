# Correctness

## Trace the logic, don't skim it

Read each changed function well enough to state what it does for a given input, not just what it
looks like it does. Skimming misses off-by-one errors, inverted conditions, and wrong operator
choices.

## Check the edges, not just the happy path

- Empty/null/zero inputs
- Boundary values (first/last item, min/max)
- Concurrent access, if the code is reachable from multiple threads/requests
- Error paths: does a failure actually get handled, or silently swallowed/mismapped

## Check state and side effects

- Does the change mutate shared state in a way that could surprise another caller?
- Are resources (connections, files, locks) always released, including on the error path?

## Verify against actual behavior when possible

Prefer running the code or an existing/added test over reasoning from the diff alone. If you
can't run it, say so explicitly rather than presenting a read-through as verified behavior.
