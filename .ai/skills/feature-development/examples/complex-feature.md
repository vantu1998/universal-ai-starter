# Example — complex feature

Request: "Add a refund API that reverses a completed order and notifies the payment service."

- **Tier:** Significant (per [`../references/workflow.md`](../references/workflow.md)) — new API,
  crosses order and payment modules, touches shared event topics.
- **Requirements:** done means a new endpoint exists that validates a completed order, triggers a
  reversal, and emits a refund event; out of scope: partial refunds, refund-approval workflow —
  those are separate future features, called out explicitly so they aren't silently bundled in.
- **Impact analysis:** modules touched: order service, payment service, event bus; APIs affected:
  new `POST /orders/{id}/refund`; data affected: order status transition, refund audit row; other
  features at risk: anything else consuming the same event topic must tolerate a new event type;
  risk: medium-high — a bug here moves real money, needs the full written analysis, not a mental
  note.
- **Implementation:** follows existing order-service module boundaries; matches existing event
  payload conventions rather than introducing a new envelope shape.
- **Testing:** unit tests for the reversal logic, integration test for the event emission, and the
  existing order/payment test suites re-run given the shared code paths identified in impact
  analysis.
- **Completion:** every impact-analysis risk is explicitly addressed or accepted in the report;
  anything not built (partial refunds, approval workflow) is called out as future work, not left
  ambiguous.
