# Data Flow Template

## Workflow

1. User authenticates.
2. Channel passes identity context.
3. Agent evaluates policy.
4. Retrieval layer accesses approved sources.
5. Sensitive data is filtered or tokenized.
6. Model generates a proposed response.
7. Guardrails validate the response.
8. Human approval occurs where required.
9. Approved action is committed to the system of record.
10. Activity is logged.

## Data Elements

| Data Element | Source | Destination | Classification | Retention | Encryption | Owner |
|---|---|---|---|---|---|---|
| Prompt | User | Agent platform | Internal | TBD | In transit/at rest | TBD |
| Retrieved text | Knowledge source | Agent platform | Internal/Sensitive | TBD | In transit/at rest | TBD |
| Output | Agent platform | User/channel | Internal | TBD | In transit/at rest | TBD |
| Audit event | Agent platform | SIEM | Restricted | TBD | In transit/at rest | Security |
