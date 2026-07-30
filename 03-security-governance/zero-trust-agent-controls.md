# Zero-Trust Controls for AI Agents

AI agents are nonhuman identities with tool access, data reach, and the ability to act. Zero-Trust principles (NIST SP 800-207) apply to them fully — and in several places more strictly than to human users, because agents operate at machine speed, follow instructions embedded in the content they read, and cannot be held accountable the way a person can.

## Threat Model

The controls below are designed against these primary threats, mapped to the OWASP Top 10 for LLM Applications:

| Threat | Vector | Example |
|---|---|---|
| Direct prompt injection | User input | User instructs the agent to ignore its constraints |
| Indirect prompt injection | Retrieved content | A document, ticket, or email contains instructions the agent executes |
| Excessive agency | Over-scoped tools | Agent granted write access it doesn't need, then misuses it under manipulation |
| Data exposure | Permission flattening | Agent returns content its user could not access directly |
| Identity compromise | Nonhuman credentials | Long-lived agent credentials stolen or replayed |
| Knowledge poisoning | Source ingestion | Malicious or corrupted content enters approved sources |
| Cost/consumption abuse | Unbounded execution | Runaway loops or abuse drive uncontrolled spend |

## Verify Explicitly

- Authenticate **every** user and **every** agent — no anonymous invocation paths
- Validate device and session context through conditional access before agent access is granted
- Preserve source-system authorization on every retrieval; the agent inherits the user's permissions, never substitutes its own
- Require step-up authentication for privileged actions, applied to the human approver — the agent cannot satisfy its own step-up
- Treat agent identity as first-class: registered, owned, inventoried, and attestable

## Least Privilege

- Separate read and write identities — a retrieval agent and an action-taking agent are never the same principal
- Scope connectors to named, approved resources; no tenant-wide or org-wide grants
- Restrict tool parameters server-side (allowed values, targets, and ranges) — never rely on the model to self-limit
- Use short-lived, automatically rotated credentials; no static secrets in agent configuration
- Review nonhuman identities on a fixed cadence with a named owner per agent; orphaned agents are disabled, not grandfathered
- Grant autonomy by risk tier per the [Human Approval Matrix](human-approval-matrix.md), never by default

## Assume Breach

- Treat **all retrieved content as untrusted input** — documents are data to be summarized, never instructions to be followed
- Defend against direct and indirect prompt injection with layered controls: input filtering, retrieval-content isolation, output validation, and action confirmation
- Segment agents from each other and from tools — compromise of one agent must not cascade
- Monitor for anomalous retrieval patterns, tool-use spikes, off-hours activity, and scope-probing behavior
- Maintain a tested **kill switch** per agent and per connector — disabling an agent must take minutes, not a change window
- Test rollback and recovery for every write path an agent touches before that write path is enabled
- Cap consumption with hard budget and rate limits; alert on anomalies

## Control Matrix by Risk Tier

Risk tiers are assigned by the [AI Risk Assessment](ai-risk-assessment.md).

| Control | Low-Risk Agent | Moderate-Risk Agent | High-Risk Agent |
|---|---|---|---|
| Human approval | Optional | Required for writes | Required for all actions |
| Write access | None | Limited, reversible | Highly restricted, change-managed |
| Credential lifetime | Standard rotation | Short-lived | Short-lived + per-session |
| Logging | Full | Full | Full + periodic human review |
| Data access | Public / Internal | Internal / Sensitive | Restricted, minimum-necessary |
| Deployment | Standard pipeline | Controlled | Isolated, segmented |
| Monitoring | Daily review | Near real time | Real time with alerting |
| Kill switch test | Quarterly | Monthly | Monthly + tabletop exercise |

## Verification Before Go-Live

A go-live checklist derived from these controls:

1. Agent identity registered with a named owner and review date
2. Connector scopes enumerated and matched to documented need
3. Permission preservation tested with negative cases (agent must *fail* to return restricted content)
4. Injection resistance tested with direct and indirect adversarial cases
5. Kill switch executed end-to-end in a live drill
6. Logs verified end-to-end in SIEM with attribution to user, agent, and action
7. Rollback executed successfully for every enabled write path

