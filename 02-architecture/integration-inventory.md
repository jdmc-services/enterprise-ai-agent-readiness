# Integration Inventory

| System | Purpose | Data Classification | Access Method | Identity Model | Write Access | Owner |
|---|---|---|---|---|---|---|
| SharePoint | Knowledge retrieval | Internal | API/Connector | User delegated | No | TBD |
| Service Management | Ticket workflow | Internal | API | Service principal/user | Limited | TBD |
| Contact Center | Interaction support | Sensitive | API/Event | Service identity | Limited | TBD |
| Entra ID | Authentication | Restricted | OIDC/SAML | Enterprise identity | No | IAM |
| SIEM | Monitoring | Restricted | API/Syslog | Service identity | Yes | Security |

## Review Questions

- Does the connector preserve source permissions?
- Is a broad service account being used?
- Can write operations be separated from read operations?
- Can the integration be disabled independently?
- Are transactions idempotent?
- Are retries bounded?
