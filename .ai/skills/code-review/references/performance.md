# Performance

## Check for N+1 and unbounded work

- Queries or calls inside a loop that could be batched.
- Loading a full collection when only a subset/count is needed.
- Unbounded pagination, unbounded recursion, or unbounded retry loops.

## Check hot-path changes specifically

If the diff touches code known to run frequently or at scale (request handlers, tight loops,
scheduled jobs), check for added allocations, synchronous I/O, or blocking calls that weren't
there before.

## Don't chase micro-optimizations outside hot paths

A performance finding needs to point at code that plausibly runs often enough or on data large
enough to matter. Don't flag a one-time startup computation or an admin-only rarely-used path for
a few extra milliseconds.

## Note when you can't verify impact

If a suspected performance issue can't be confirmed without a profiler or production data, say
so and flag it as a suspicion for the author to assess, not a confirmed regression.
