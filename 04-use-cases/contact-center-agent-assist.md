# Use Case: Contact Center Agent Assist

## Business Problem

Contact center agents operate under a harder constraint than most knowledge workers: the customer is on the line while they search. Fragmented knowledge, swivel-chair application workflows, and heavy after-call documentation inflate handle time, drive transfers, extend hold, and push abandonment up during peak load. New-hire proficiency timelines stretch because competence depends on tribal knowledge rather than accessible knowledge.

## Proposed Capability

A **real-time agent-assist layer** integrated beside — not inside — the contact center platform:

- **Live knowledge retrieval** — cited answers from approved sources, surfaced in-context during the interaction
- **Real-time interaction summarization** — running summary that becomes the draft disposition note
- **Suggested responses and next-best action** — recommendations the agent can use, adapt, or ignore
- **After-call work automation** — draft notes and disposition codes for agent review and commit
- **Quality and coaching signals** — interaction patterns surfaced to supervisors for coaching, never for automated discipline
- **Structured human handoff** — full context transfers with the interaction; the customer never repeats themselves because of the AI

## Non-Negotiable Architecture Requirements

- **Telephony and routing remain untouched.** The assist layer consumes events; it does not sit in the media or signaling path.
- **Resilient fallback.** Assist-layer failure degrades to standard operations instantly and invisibly to the caller.
- **No emergency-call automation.** Emergency and life-safety call flows are architecturally excluded from AI involvement.
- **Recording and consent controls preserved.** The assist layer inherits, and never bypasses, existing recording, consent, and retention policy.
- **Approved knowledge only.** Retrieval is scoped to governed sources with citation on every answer.
- **Full logging.** Every recommendation, retrieval, and agent action is logged and correlated with the interaction record.

## Healthcare and Regulated-Environment Considerations

In healthcare-adjacent contact centers, the assist layer must respect the same boundary as the [Healthcare Administrative Agent](healthcare-administrative-agent.md): administrative support only — scheduling logistics, wayfinding, policy navigation, coverage questions routed appropriately — with hard exclusions on anything clinical. Minimum-necessary access applies to every retrieval scope.

## Risk Profile

**Moderate** with read-only integration and draft-only writes; escalates with any workflow execution. Recording/consent scope and any PHI-adjacent data flows require privacy review before pilot, per the [AI Risk Assessment](../03-security-governance/ai-risk-assessment.md).

## Metrics That Prove or Disprove Value

| Metric | Direction | Notes |
|---|---|---|
| Average handle time | ↓ | Primary capacity metric |
| Transfer rate | ↓ | Right answer at first agent |
| First-contact resolution | ↑ | Paired with repeat-call rate |
| Average hold time | ↓ | Search time moved into the assist layer |
| Abandonment rate | ↓ | Follows recovered availability |
| After-call work | ↓ | Draft-note automation |
| Quality scores | ↑ / = | Must not degrade while speed improves |
| Time to proficiency (new hires) | ↓ | Knowledge access replaces tribal knowledge |
| Agent satisfaction / attrition signal | ↑ | Adoption and retention leading indicator |

## Pilot Design

- **Cohort:** one line of business or queue, 10–20 agents, mixed tenure, matched control group where feasible
- **Duration:** 60–90 days against a 30-day baseline
- **Phasing:** knowledge + summarization first; disposition drafting second; any workflow execution only after re-scored risk review
- **Exit:** scored against pre-committed [Pilot Success Criteria](../05-measurement/pilot-success-criteria.md)

