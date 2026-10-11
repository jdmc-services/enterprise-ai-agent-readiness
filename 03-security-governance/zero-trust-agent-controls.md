# Zero-Trust Controls for Enterprise AI Agents

AI agents are nonhuman identities with data access, tool permissions, integration reach, and the potential to initiate actions at machine speed.

Zero-Trust principles apply to agents as rigorously as they apply to human users. Trust must never be granted solely because an agent operates inside an approved platform or uses an approved model.

> **Scope statement:** This document is an independently developed reference control model. All examples are synthetic and vendor-neutral. It contains no employer-specific architecture, confidential information, protected data, credentials, or proprietary operational metrics.

---

## Standards and Guidance

This control model is informed by:

* **NIST SP 800-207** — Zero-Trust Architecture
* **NIST AI Risk Management Framework 1.0**
* **NIST Cybersecurity Framework 2.0**
* **[OWASP GenAI LLM Top 10 2026](https://genai.owasp.org/resource/owasp-genai-llm-top-10-2026/)**
* **[OWASP Top 10 for Agentic Applications 2026](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/)**

These references inform the control design but do not make this repository an official certification, compliance determination, or substitute for organizational security and legal review.

---

## Core Zero-Trust Position

An enterprise AI agent must be treated as:

* A registered nonhuman identity
* A potential attack path
* An untrusted interpreter of untrusted content
* A constrained user of tools and connectors
* A source of decisions and actions requiring attribution
* A workload requiring continuous verification
* A service with measurable operational and financial limits
* A capability that can be disabled quickly

---

## Primary Threat Model

| Threat                           | Common Vector                                                                | Potential Impact                                           |
| -------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------- |
| Direct prompt injection          | Malicious or manipulative user instructions                                  | Policy bypass, unsafe output, or unauthorized action       |
| Indirect prompt injection        | Instructions embedded in retrieved documents, tickets, websites, or messages | Agent manipulation without direct attacker interaction     |
| Sensitive-information disclosure | Excessive retrieval access, weak output controls, or permission flattening   | Exposure of restricted or protected information            |
| Excessive agency                 | Over-scoped tools, connectors, or workflow permissions                       | Unauthorized, irreversible, or high-impact actions         |
| Identity compromise              | Stolen, shared, or long-lived nonhuman credentials                           | Persistent unauthorized access                             |
| Supply-chain compromise          | Unreviewed models, libraries, plug-ins, data sources, or connectors          | Manipulated behavior or compromised dependencies           |
| Knowledge poisoning              | Malicious, outdated, or corrupted retrieval sources                          | Incorrect recommendations or unsafe decisions              |
| Improper output handling         | Agent output passed directly into downstream systems                         | Injection, execution, workflow, or data-integrity failures |
| Approval manipulation            | Incomplete evidence or misleading context presented to a reviewer            | Uninformed human authorization                             |
| Unbounded consumption            | Loops, repeated tool calls, abuse, or uncontrolled token usage               | Financial loss or service degradation                      |
| Model or configuration drift     | Unreviewed model, prompt, policy, or connector changes                       | Changed behavior outside the approved risk assessment      |
| Audit failure                    | Missing or fragmented logs                                                   | Inability to reconstruct decisions, actions, or incidents  |

---

## Verify Explicitly

* Authenticate every human user and every agent identity.
* Deny anonymous invocation unless it is explicitly approved for a low-risk public use case.
* Evaluate user, device, session, location, and risk context where supported.
* Preserve source-system authorization during every retrieval.
* Test negative permissions: the agent must fail to retrieve information the user cannot access.
* Require step-up authentication for privileged or consequential actions.
* Apply step-up authentication to the human approver; an agent cannot approve itself.
* Register every agent with a named business owner, technical owner, risk tier, and review date.
* Reauthorize the agent when its model, tools, connectors, data, audience, or purpose changes.
* Treat trust as temporary and continuously evaluated.

---

## Enforce Least Privilege

* Grant only the minimum data, connector, tool, and action permissions required.
* Separate retrieval identities from action-taking identities.
* Separate read permissions from write permissions.
* Restrict connectors to named and approved resources.
* Avoid tenant-wide or organization-wide access unless formally justified and approved.
* Restrict tool parameters server-side instead of relying on prompt instructions.
* Use short-lived, automatically rotated credentials where supported.
* Prohibit static secrets in source code, prompts, repositories, and client-side configuration.
* Review nonhuman identities on a defined schedule.
* Disable orphaned, unused, expired, or ownerless agents.
* Grant autonomy by individual action and risk tier—not by agent name or platform.

---

## Assume Breach

* Treat all user input and retrieved content as untrusted.
* Treat documents, tickets, websites, emails, and knowledge articles as data—not instructions.
* Isolate retrieved content from system instructions and policy controls.
* Validate outputs before passing them to downstream applications.
* Require confirmation before consequential tool execution.
* Segment agents from each other, their tools, and authoritative systems.
* Prevent the compromise of one agent from cascading across the environment.
* Monitor abnormal retrieval volume, scope probing, repeated failures, off-hours activity, and unusual tool use.
* Apply hard rate limits, token limits, timeouts, and financial thresholds.
* Maintain a tested kill switch for every agent and connector.
* Test rollback and recovery before enabling any write capability.

---

## Identity and Ownership Requirements

Every production candidate should have an inventory record containing:

| Field               | Requirement                                                |
| ------------------- | ---------------------------------------------------------- |
| Agent name          | Unique and traceable                                       |
| Business purpose    | Specific approved use case                                 |
| Business owner      | Accountable for value and acceptable use                   |
| Technical owner     | Accountable for architecture and operations                |
| Security owner      | Accountable for control validation                         |
| Risk tier           | Assigned through the documented risk assessment            |
| Human approvers     | Named by action type                                       |
| Data classification | Highest classification the agent may access                |
| Connectors          | Complete approved inventory                                |
| Tools               | Complete approved inventory                                |
| Model and version   | Documented and change-controlled                           |
| Credential method   | Documented rotation and storage method                     |
| Review date         | Defined recertification schedule                           |
| Kill-switch owner   | Named role authorized to disable the service               |
| Retirement process  | Credential revocation, data handling, and record retention |

---

## Human-Approval Requirements

Human approval is required when an action is:

* Irreversible
* Externally binding
* Financially consequential
* Privileged
* Safety-sensitive
* Privacy-sensitive
* Legally significant
* Capable of changing an authoritative record
* Capable of communicating externally on behalf of the organization
* Outside the agent’s previously approved operating boundary

Approval evidence should include:

* The requested action
* The initiating user
* The agent identity
* The relevant source information
* The proposed target
* The expected result
* Material risks or uncertainties
* The approving person
* The approval timestamp
* The final execution result

An approval button without adequate context is not meaningful human oversight.

---

## Control Matrix by Risk Tier

Risk tiers are assigned through the [AI Risk Assessment](ai-risk-assessment.md).

| Control             | Low-Risk                        | Moderate-Risk                               | High-Risk                                               |
| ------------------- | ------------------------------- | ------------------------------------------- | ------------------------------------------------------- |
| Human approval      | Optional for read-only activity | Required for writes                         | Required for all consequential actions                  |
| Write access        | None                            | Limited and reversible                      | Highly restricted and change-controlled                 |
| Data access         | Public or internal              | Internal or sensitive                       | Restricted and minimum-necessary                        |
| Credentials         | Managed rotation                | Short-lived                                 | Short-lived and session-constrained                     |
| Connector scope     | Named resources                 | Named resources and actions                 | Isolated, explicitly allow-listed resources and actions |
| Logging             | Complete activity logging       | Complete logging and alerts                 | Complete logging, alerts, and human review              |
| Monitoring          | Scheduled review                | Near-real-time monitoring                   | Real-time monitoring with escalation                    |
| Deployment          | Standard controlled pipeline    | Segmented deployment                        | Isolated and security-reviewed deployment               |
| Kill-switch test    | Quarterly                       | Monthly                                     | Monthly plus tabletop exercise                          |
| Change review       | Material changes                | Model, prompt, tool, data, or scope changes | Every controlled change                                 |
| Pilot exit criteria | Documented                      | Precommitted                                | Precommitted with executive and control-owner approval  |

---

## Applying Risk Tiers and Action Approvals

Apply the highest requirement arising from the use-case risk tier, action-specific approval matrix, data classification, and organizational policy. Action labels are illustrative and do not lower the assessed use-case tier. High-risk consequential actions require explicit human approval; approved read-only activity remains subject to documented access and monitoring controls. Elevated cases require executive and risk-committee authorization before any pilot and use the High-tier controls as a minimum. Approval cannot authorize an action marked prohibited or agent execution marked No.

## Logging and Observability

Logs should capture:

* Initiating user
* Agent identity
* Session or correlation identifier
* Model and configuration version
* Retrieved sources
* Data classifications
* Tool and connector calls
* Input and output validation results
* Human approvals
* Actions attempted
* Actions completed
* Errors and denied requests
* Consumption and cost
* Kill-switch or rollback activity

Sensitive content should not be copied unnecessarily into logs. Logging design must balance auditability with privacy, retention, and minimum-necessary requirements.

---

## Change-Control Triggers

The risk assessment and approval package should be reviewed when any of the following changes:

* Model provider or model version
* System instructions
* Retrieval source
* Data classification
* Connector
* Tool permission
* User population
* Business purpose
* Human-approval boundary
* Output destination
* Hosting architecture
* Vendor data-handling terms
* Monitoring capability
* Cost or consumption limits

A change that expands capability or access is a new risk decision—not routine maintenance.

---

## Verification Before Pilot

1. Agent identity is registered with named owners.
2. Business purpose and prohibited uses are documented.
3. Data classification and retrieval sources are approved.
4. Connector and tool scopes match the documented need.
5. Negative permission tests confirm restricted information cannot be retrieved.
6. Direct and indirect prompt-injection tests are completed.
7. Output handling is validated before downstream use.
8. Human-approval gates are tested end to end.
9. Logging provides attribution to user, agent, approval, tool, and action.
10. Rate, token, time, and financial limits are configured.
11. The kill switch is tested successfully.
12. Rollback is tested for every enabled write path.
13. Incident ownership and escalation paths are documented.
14. Pilot success and stop criteria are approved.
15. Workforce participants understand verification and escalation responsibilities.

---

## Verification Before Scale

A pilot should not scale until the organization can demonstrate:

* Measured value against the approved baseline
* Acceptable residual risk
* Stable control performance
* Effective human oversight
* Complete incident and audit evidence
* Manageable operating cost
* Workforce readiness
* Tested recovery and shutdown processes
* Formal approval from the accountable business and control owners

---

## Practitioner Principle

The strongest AI control is not a warning placed inside a prompt. It is an enforceable technical and operational boundary supported by identity, authorization, segmentation, validation, monitoring, human accountability, and the ability to stop the system safely.
