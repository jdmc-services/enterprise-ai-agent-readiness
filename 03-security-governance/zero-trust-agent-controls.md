# Zero-Trust Controls for AI Agents

## Verify Explicitly

- Authenticate every user and agent.
- Validate device and session context.
- Preserve source-system authorization.
- Require step-up authentication for privileged actions.

## Least Privilege

- Separate read and write identities.
- Limit connectors to approved scopes.
- Restrict tool parameters.
- Use time-limited credentials.
- Review nonhuman identities regularly.

## Assume Breach

- Treat retrieved content as untrusted.
- Defend against direct and indirect prompt injection.
- Segment agents and tools.
- Monitor anomalous retrieval and tool use.
- Maintain kill switches.
- Test rollback and recovery.

## Control Matrix

| Control | Low-Risk Agent | Moderate-Risk Agent | High-Risk Agent |
|---|---|---|---|
| Human approval | Optional | Required for writes | Required for all actions |
| Write access | No | Limited | Highly restricted |
| Logging | Full | Full | Full plus review |
| Data access | Public/Internal | Internal/Sensitive | Restricted |
| Deployment | Standard | Controlled | Isolated |
| Monitoring | Daily | Near real time | Real time |
