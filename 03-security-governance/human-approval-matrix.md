# Human Approval Matrix

Autonomy is granted per action, by risk — never per agent, by default. This matrix is the enforceable boundary between what an agent may do on its own, what it may do with approval, and what it may never do. It is configured server-side in connector scopes and workflow gates; it is not a prompt instruction.

## The Matrix

| Action | Risk | Agent May Recommend | Agent May Execute | Human Approval Required | Approver |
|---|---|---|---|---|---|
| Search approved knowledge | Low | Yes | Yes | No | — |
| Summarize an interaction | Low | Yes | Yes | No | — |
| Draft ticket work note | Low | Yes | Draft only | Analyst commits | Analyst |
| Suggest classification/routing | Low | Yes | Suggest only | Analyst applies | Analyst |
| Reclassify a ticket | Moderate | Yes | Limited | Yes | Analyst |
| Draft customer-facing response | Moderate | Yes | Draft only | Yes | Human contact-center agent or analyst |
| Reset a standard account | Moderate | Yes | Conditional | Yes, with step-up auth | Analyst + policy gate |
| Modify group membership / entitlements | High | Yes | No | Yes | Access management |
| Modify production configuration | High | Yes | No | Yes | Change approval board |
| Close a standard ticket | Moderate | Yes | No | Yes | Analyst |
| Close a critical incident | High | Yes | No | Yes | Incident commander |
| Communicate during an active incident | High | Draft only | No | Yes | Incident commander |
| Provide clinical guidance | Prohibited | No | No | Not permitted | — |
| Touch emergency/life-safety workflows | Prohibited | No | No | Not permitted | — |

## Applying Risk Tiers and Action Approvals

Apply the highest requirement arising from the use-case risk tier, action-specific approval matrix, data classification, and organizational policy. Action labels are illustrative and do not lower the assessed use-case tier. High-risk consequential actions require explicit human approval; approved read-only activity remains subject to documented access and monitoring controls. Elevated cases require executive and risk-committee authorization before any pilot and use the High-tier controls as a minimum. Approval cannot authorize an action marked prohibited or agent execution marked No.

## Rules of Operation

- **Approval is informed.** The approver sees what the agent retrieved, what it proposes, and its confidence — not just an "approve" button. Rubber-stamp UX converts a control into a liability.
- **Step-up authentication binds to the human.** For privileged actions, the approver re-authenticates; an agent can never satisfy its own approval gate.
- **Every row is logged.** Recommendation, decision, approver identity, and timestamp — attributable end to end.
- **Prohibited means architecturally absent.** Prohibited actions have no connector, no tool, and no workflow path — not a system-prompt request to refuse.
- **The matrix is versioned.** Changes go through the same review as the [risk assessment](ai-risk-assessment.md) that produced the original tiering.

## Extending the Matrix

New actions enter through use-case intake: score the action's reversibility, blast radius, and data sensitivity; assign the tier; name the approver; then build the gate. An action without a row does not run.

