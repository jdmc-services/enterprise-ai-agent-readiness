# Use Case: Enterprise Knowledge Assistant

## Objective

Provide authorized users with fast access to trusted enterprise knowledge without bypassing source permissions.

## Requirements

- Entra ID integration
- User-delegated access where possible
- Source-level permission preservation
- Citations for every supported answer
- Explicit statement when evidence is insufficient
- Prompt-injection filtering
- Malicious-content detection
- Retention controls
- SIEM integration

## Failure Conditions

The assistant must not:

- Invent policy
- Return restricted content
- Treat unapproved sources as authoritative
- Execute transactions without approval
- Conceal uncertainty
