# Reference Architecture

## Architectural Pattern

The recommended pattern separates user experience, identity, orchestration, knowledge, tools, systems of record, and monitoring.

```mermaid
flowchart LR
    U[User] --> C[Approved Channel]
    C --> I[Identity and Access]
    I --> A[AI Agent Orchestrator]
    A --> G[Guardrails and Policy Engine]
    G --> R[Retrieval Layer]
    R --> K[Approved Knowledge Sources]
    G --> T[Approved Tools and Workflows]
    T --> S[Systems of Record]
    A --> H[Human Approval or Escalation]
    A --> L[Audit, Monitoring, and SIEM]
```

## Design Principles

- Identity-aware access
- Least privilege
- Source-permission preservation
- Segregation of duties
- Human approval for higher-risk actions
- Read-only pilot phase
- Deterministic controls for critical workflows
- Full auditability
- Safe failure and fallback
- Vendor-independent systems of record
