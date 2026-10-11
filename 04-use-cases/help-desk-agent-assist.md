# Use Case: Help Desk Agent Assist

## Business Problem

Service-desk analysts lose a large share of every shift to non-resolution work: searching fragmented knowledge sources, documenting calls after the fact, correcting misclassified tickets, and re-routing work that landed in the wrong queue. The downstream effects are measurable — longer handle times, lower first-contact resolution, reassignment churn between resolver groups, after-call work that compresses availability, and overtime that masks a capacity problem rather than solving it.

The root cause is rarely analyst skill. It is the distance between the analyst and the right information at the moment of need.

## Proposed Capability

A **human-supervised agent-assist layer** that sits beside the analyst — never between the analyst and the caller, and never above the ITSM platform:

- **Knowledge retrieval** — searches only approved, permission-controlled knowledge sources and returns cited answers
- **Interaction summarization** — drafts the ticket work note from the conversation; the analyst reviews and commits
- **Classification and routing suggestions** — recommends category, priority, and assignment group with a confidence score
- **Resolution drafting** — proposes resolution notes and closure codes for analyst approval
- **Repeat-incident detection** — flags probable recurrences and links related tickets for problem management
- **Knowledge-gap identification** — logs questions the knowledge base could not answer, feeding the knowledge lifecycle

## What the Agent Must Not Do

These are design constraints, not configuration preferences:

- No autonomous ticket closure — ever, at any confidence level
- No privileged actions (resets, unlocks, entitlement changes) without the approval path defined in the [Human Approval Matrix](../03-security-governance/human-approval-matrix.md)
- No uncited answers — every response traces to an approved source, or states that no supported answer exists
- No answers below the confidence threshold — low-confidence responses escalate to the analyst's judgment explicitly
- No shadow record-keeping — the ITSM platform remains the sole system of record

## Architecture Touchpoints

| Layer | Requirement |
|---|---|
| Identity | Agent operates as a governed nonhuman identity; analyst context preserved on every request |
| Retrieval | Permission-aware; returns nothing the analyst could not open directly |
| ITSM integration | Read plus draft-write only; commits require analyst action |
| Logging | Every retrieval, suggestion, confidence score, and analyst decision logged to SIEM |
| Fallback | Test fallback to normal operations against approved call-handling and recovery objectives |

## Risk Profile

Classified **Moderate** under the [AI Risk Assessment](../03-security-governance/ai-risk-assessment.md) when write access is limited to drafts: internal data sensitivity, low autonomy, reversible actions, human in the loop at every commit point. Privileged-action extensions (e.g., password resets) re-score the use case and require step-up controls before enablement.

## Metrics That Prove or Disprove Value

Baseline all of these for 30 days before pilot start (see [Baseline Metrics](../05-measurement/baseline-metrics.md)):

| Metric | Direction | Why It Matters |
|---|---|---|
| Average handle time | ↓ | Direct capacity recovery |
| First-contact resolution | ↑ | Fewer callbacks, higher satisfaction |
| Reassignment rate | ↓ | Routing accuracy; resolver-group churn |
| After-call work | ↓ | Documentation burden shifted to review |
| Abandonment rate | ↓ | Availability recovered from AHT and ACW gains |
| Knowledge utilization | ↑ | Confirms retrieval is actually used |
| Analyst satisfaction | ↑ | Adoption leading indicator; survey pre/post |
| Overtime hours | ↓ | Financial proof point for the ROI model |

## Pilot Design

- **Cohort:** one team or queue, 8–15 analysts, mixed tenure
- **Duration:** 60–90 days against the 30-day baseline
- **Phase 1 (read-only):** retrieval and summarization only; no ITSM writes
- **Phase 2 (draft-write):** ticket-note and classification drafts enabled after Phase 1 review
- **Exit:** scored against pre-committed [Pilot Success Criteria](../05-measurement/pilot-success-criteria.md) — approve, revise, or stop

