# AI Incident Response Playbook

AI agents introduce incident classes that traditional runbooks do not cover: an agent following hostile instructions embedded in a document, a model confidently fabricating policy, a nonhuman identity acting outside its intent. This playbook extends existing incident-response capability — it does not replace it. The incident commander model, evidence discipline, and communications structure remain whatever the organization already runs.

## Incident Types

| Type | Example Signal | Typical Severity |
|---|---|---|
| Unauthorized data exposure | Agent returns content the user lacks rights to | High |
| Direct prompt injection | User manipulates agent past its constraints | Moderate–High |
| Indirect prompt injection | Agent executes instructions found in retrieved content | High |
| Malicious or poisoned source | Approved knowledge source contains planted content | High |
| Incorrect automated action | Agent-executed change was wrong or unauthorized | Moderate–High |
| Model or platform outage | Assist capability unavailable | Low–Moderate |
| Excessive hallucination | Fabricated answers passing as cited fact | Moderate |
| Tool misuse | Tool invoked outside intended parameters | High |
| Nonhuman identity compromise | Agent credentials stolen, replayed, or abused | Critical |
| Cost or consumption anomaly | Runaway execution or abuse driving spend | Moderate |

## Immediate Actions

1. **Contain first.** Disable the affected agent, connector, or tool via the kill switch. Containment does not wait for root cause.
2. **Preserve evidence** before any restart or configuration change — logs, prompts, retrieved content, tool calls, and outputs.
3. **Notify the incident commander** and open the incident under the existing IR process at the mapped severity.
4. **Contain identities** — rotate or revoke the agent's credentials; review the human account involved if injection is suspected.
5. **Revert unauthorized changes** in affected systems of record via their native rollback paths.
6. **Assess data exposure** — what was returned, to whom, from what source, under what authorization.
7. **Notify privacy, legal, and compliance** where regulated data may be involved; in healthcare contexts, engage the privacy officer early — breach-clock determinations are theirs, not IT's.
8. **Document root cause** — including whether the failure was model behavior, retrieval content, connector scope, or control gap.
9. **Validate corrective controls** with the same adversarial tests that would have caught the incident.
10. **Approve controlled restoration** — staged re-enablement with heightened monitoring, signed off by the incident commander.

## Evidence Checklist

Capture all of it; agent incidents are reconstructed from correlation:

- Requesting user identity and session context
- Agent identity and version/configuration at time of incident
- Full prompt and conversation context
- Retrieved sources (documents, tickets, records) with identifiers
- Model responses as delivered
- Tool calls with parameters and results
- Approval records — who approved what, when
- Changes written to systems of record
- Connector and platform logs
- Correlated SIEM events

## Readiness Requirements

- Kill switches tested on the cadence set by the agent's risk tier — an untested kill switch is a hope, not a control
- AI incident types mapped into the existing severity matrix and on-call rotation
- **Tabletop exercises** run at least twice yearly using realistic scenarios (indirect injection via a ticket, exposure via permission flattening, credential replay against an agent identity)
- Post-incident findings fed back into the [risk assessment](ai-risk-assessment.md) and [Zero-Trust controls](zero-trust-agent-controls.md) as reassessment triggers

