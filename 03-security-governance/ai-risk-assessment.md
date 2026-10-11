# AI Risk Assessment

A structured, repeatable method for classifying AI agent use cases before any platform work begins. Aligned with the NIST AI Risk Management Framework: the output of this assessment drives the control tier in the [Zero-Trust Control Matrix](zero-trust-agent-controls.md) and the autonomy boundary in the [Human Approval Matrix](human-approval-matrix.md).

## Scoring Method

Score each category **1 (lowest risk) to 5 (highest risk)**. Every score requires a written rationale — an unexplained score is an unassessed risk. The assessment is performed jointly by the use-case owner, security, and (where applicable) privacy/compliance, and is re-run on **any** scope change.

| Risk Area | 1 (Low) looks like | 5 (High) looks like | Score | Rationale | Required Control |
|---|---|---|---:|---|---|
| Data sensitivity | Public or general internal content | Restricted, regulated, or PHI-adjacent data | | | |
| Autonomy | Recommends only; human commits everything | Executes consequential actions unsupervised | | | |
| User impact | Internal staff convenience | Patient-, customer-, or safety-affecting | | | |
| Operational dependency | Loss is a mild inconvenience | Loss disrupts a critical operation | | | |
| Regulatory exposure | No regulated data or process | HIPAA/CMMC/PCI-scoped data or process | | | |
| External connectivity | Fully internal, no external calls | Reads/writes across external services | | | |
| Tool access | Read-only retrieval | Write access to systems of record | | | |
| Reversibility | Every action trivially undone | Actions difficult or impossible to reverse | | | |

## Decision Thresholds

| Total Score | Classification | Consequence |
|---|---|---|
| 8–12 | **Low** | Standard controls; team-level approval |
| 13–20 | **Moderate** | Moderate control tier; security sign-off; human approval on writes |
| 21–30 | **High** | High control tier; security + privacy/compliance sign-off; human approval on all consequential actions; isolated deployment |
| 31–40 | **Elevated** | Executive and risk-committee review before any pilot; presumption is *no* until controls prove otherwise |

Two overrides apply regardless of total score:

- Any single category scored **5** elevates the use case one tier, capped at Elevated.
- Any clinical, life-safety, or emergency-workflow adjacency is out of scope entirely — it does not enter this pipeline.

## Applying Risk Tiers and Action Approvals

Apply the highest requirement arising from the use-case risk tier, action-specific approval matrix, data classification, and organizational policy. Action labels are illustrative and do not lower the assessed use-case tier. High-risk consequential actions require explicit human approval; approved read-only activity remains subject to documented access and monitoring controls. Elevated cases require executive and risk-committee authorization before any pilot and use the High-tier controls as a minimum. Approval cannot authorize an action marked prohibited or agent execution marked No.

## Mandatory Questions

These must be answered in writing before classification is final. "Unknown" is an answer — the affected category scores 5 until resolved, and unresolved mandatory questions block pilot approval. The scoring thresholds are illustrative framework choices, not NIST-prescribed or empirically validated deployment thresholds.

1. Can the agent expose information the requesting user is not authorized to see? Through what path was this tested?
2. Can the agent make, trigger, or materially influence a consequential decision?
3. If the agent acts incorrectly, how is the action reversed, by whom, and how fast?
4. Is a human available to intervene in real time, and do they know they are the control?
5. Is every action attributable to a user, an agent identity, and a timestamp in a log a third party could audit?
6. What happens to the dependent business process when the agent is unavailable for a day?
7. Who owns this agent — by name — and who reviews its access on what cadence?

## Reassessment Triggers

- Any new connector, data source, or tool
- Any move from recommend to execute on any action
- Any change in user population (e.g., staff-only → customer-facing)
- Any incident involving the agent, regardless of severity
- Annual review at minimum, with the named owner accountable

