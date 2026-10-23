# Example — extract class

Request: "OrderService has grown to handle order creation, refund logic, and shipment tracking —
split refund logic into its own class."

- **Tier:** Small (per [`../references/workflow.md`](../references/workflow.md)) — one module,
  callers within the same package need updating, no external API change.
- **Analysis:** refund methods are already loosely coupled to the rest of `OrderService`, sharing
  only the order repository dependency; callers are two internal services and one test file.
- **Invariants:** every refund method's behavior and exceptions stay identical; `OrderService`'s
  public API for order creation/shipment is untouched.
- **Strategy:** introduce `RefundService` with the extracted methods, inject the shared
  repository, update the two internal callers to use the new class, keep `OrderService` delegating
  temporarily if a caller can't be updated in the same change.
- **Risk analysis:** medium — two internal callers to update correctly; mitigated by updating and
  testing one caller at a time.
- **Testing:** existing refund tests moved and still passing against `RefundService`; both
  updated callers re-tested.
- **Completion:** `RefundService` extracted, both callers updated, no behavior change, no
  unrelated cleanup in `OrderService`.
