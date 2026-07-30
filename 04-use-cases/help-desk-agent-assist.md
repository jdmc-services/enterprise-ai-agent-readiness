# Use Case: Help Desk Agent Assist

## Business Problem

Service-desk analysts lose a large share of every shift to non-resolution work: searching fragmented knowledge sources, documenting calls after the fact, correcting misclassified tickets, and re-routing work that landed in the wrong queue. The downstream effects are measurable â€” longer handle times, lower first-contact resolution, reassignment churn between resolver groups, after-call work that compresses availability, and overtime that masks a capacity problem rather than solving it.

The root cause is rarely analyst skill. It is the distance between the analyst and the right information at the moment of need.

## Proposed Capability

A **human-supervised agent-assist layer** that sits beside the analyst â€” never between the analyst and the caller, and never above the ITSM platform:

- **Knowledge retrieval** â€” searches only approved, permission-controlled knowledge sources and returns cited answers
- **Interaction summarization** â€” drafts the ticket work note from the conversation; the analyst reviews and commits
- **Classification and routing suggestions** â€” recommends category, priority, and assignment group with a confidence score
- **Resolution drafting** â€” proposes resolution notes and closure codes for analyst approval
- **Repeat-incident detection** â€” flags probable recurrences and links related tickets for problem management
- **Knowledge-gap identification** â€” logs questions the knowledge base could not answer, feeding the knowledge lifecycle

## What the Agent Must Not Do

These are design constraints, not configuration preferences:

- No autonomous ticket closure â€” ever, at any confidence level
- No privileged actions (resets, unlocks, entitlement changes) without the approval path defined in the [Human Approval Matrix](../03-security-governance/human-approval-matrix.md)
- No uncited answers â€” every response traces to an approved source, or states that no supported answer exists
- No answers below the confidence threshold â€” low-confidence responses escalate to the analyst's judgment explicitly
- No shadow record-keeping â€” the ITSM platform remains the sole system of record

## Architecture Touchpoints

| Layer | Requirement |
|---|---|
| Identity | Agent operates as a governed nonhuman identity; analyst context preserved on every request |
| Retrieval | Permission-aware; returns nothing the analyst could not open directly |
| ITSM integration | Read plus draft-write only; commits require analyst action |
| Logging | Every retrieval, suggestion, confidence score, and analyst decision logged to SIEM |
| Fallback | Assist-layer outage degrades to normal operations with zero impact on call handling |

## Risk Profile

Classified **Moderate** under the [AI Risk Assessment](../03-security-governance/ai-risk-assessment.md) when write access is limited to drafts: internal data sensitivity, low autonomy, reversible actions, human in the loop at every commit point. Privileged-action extensions (e.g., password resets) re-score the use case and require step-up controls before enablement.

## Metrics That Prove or Disprove Value

Baseline all of these for 30 days before pilot start (see [Baseline Metrics](../05-measurement/baseline-metrics.md)):

| Metric | Direction | Why It Matters |
|---|---|---|
| Average handle time | â†“ | Direct capacity recovery |
| First-contact resolution | â†‘ | Fewer callbacks, higher satisfaction |
| Reassignment rate | â†“ | Routing accuracy; resolver-group churn |
| After-call work | â†“ | Documentation burden shifted to review |
| Abandonment rate | â†“ | Availability recovered from AHT and ACW gains |
| Knowledge utilization | â†‘ | Confirms retrieval is actually used |
| Analyst satisfaction | â†‘ | Adoption leading indicator; survey pre/post |
| Overtime hours | â†“ | Financial proof point for the ROI model |

## Pilot Design

- **Cohort:** one team or queue, 8â€“15 analysts, mixed tenure
- **Duration:** 60â€“90 days against the 30-day baseline
- **Phase 1 (read-only):** retrieval and summarization only; no ITSM writes
- **Phase 2 (draft-write):** ticket-note and classification drafts enabled after Phase 1 review
- **Exit:** scored against pre-committed [Pilot Success Criteria](../05-measurement/pilot-success-criteria.md) â€” approve, revise, or stop

