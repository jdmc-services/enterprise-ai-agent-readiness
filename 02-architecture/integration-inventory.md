# Integration Inventory

The complete, current list of everything the agent environment touches. If it isn't in this inventory, it isn't approved — and the policy engine should make unlisted integrations impossible, not merely prohibited.

## Why This Document Gates Everything

Agent risk concentrates at integration points: each connector is data reach, each tool is action capability, each identity is an attack surface. The inventory is the denominator for every security review, the scope sheet for every audit, and the first document opened during an incident.

## Connector Inventory

| Connector | Target System | Direction | Scope (enumerated, not "full") | Identity Used | Credential Type / Rotation | Risk Tier | Owner | Last Review |
|---|---|---|---|---|---|---|---|---|
| | | Read / Write / Both | | | | | | |

## Tool Inventory

| Tool | Action Performed | Parameters Restricted To | Approval Gate ([matrix row](../03-security-governance/human-approval-matrix.md)) | Reversible? | Logged To |
|---|---|---|---|---|---|
| | | | | | |

## Knowledge Source Inventory

| Source | Content Type | Permission Model (delegated / trimmed) | Refresh Cadence | Content Owner | Poisoning Review |
|---|---|---|---|---|---|
| | | | | | |

## Nonhuman Identity Register

| Agent Identity | Purpose | Entitlements | Credential Lifetime | Named Owner | Review Cadence | Kill Switch Tested |
|---|---|---|---|---|---|---|
| | | | | | | |

## Operating Rules

- **Change control:** adding a row is a governance event — risk re-scored, scopes reviewed, owner assigned — not a configuration change
- **Review cadence:** quarterly minimum; monthly for high-tier entries
- **Orphan rule:** any entry without a current named owner is disabled at review, not deferred
- **Drift detection:** actual platform grants reconciled against this inventory on every review; undocumented grants are treated as findings
