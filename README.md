# Enterprise AI Agent Readiness for Regulated Environments

A vendor-neutral framework for evaluating, governing, securing, piloting, and measuring enterprise AI agents in regulated and mission-critical environments — healthcare operations, IT service management, contact centers, and enterprise knowledge work.

> **Scope and integrity statement:** All content in this repository is synthetic, vendor-neutral, and created for advisory, educational, and demonstration purposes. It contains no employer-confidential information, no patient or customer data, no internal architecture, and no proprietary operational metrics from any organization.

---

## Why This Framework Exists

Most enterprise AI initiatives fail for the same reason: organizations start with a tool and work backward to a problem. The result is ungoverned pilots, unmeasured value, unmanaged risk, and stalled adoption.

This framework inverts that sequence. Every AI agent initiative is required to answer five questions — in order — before a platform decision is made:

1. **Problem.** What operating problem are we solving, and who owns it?
2. **Data and systems.** What data, integrations, and systems of record are involved?
3. **Risk.** What new risks does the agent introduce, and how are they classified?
4. **Human control.** What actions require human approval, and how is that enforced?
5. **Value.** How will benefit be measured against a defensible baseline?

The destination is not a demo. It is governed, measurable, production-ready adoption that survives a security review, a compliance audit, and a CFO conversation.

## Who This Is For

- **CIOs and IT executives** deciding whether and where AI agents belong in their operating environment
- **Service management and contact center leaders** evaluating agent-assist capabilities without disrupting existing platforms
- **CISOs and security architects** who need Zero-Trust controls extended to nonhuman identities and agent tool use
- **Healthcare administrative and operations leaders** who must keep AI strictly on the nonclinical side of a hard boundary
- **Program and finance leaders** who need pilots measured against baselines rather than vendor claims

## Framework Structure

| Section | Contents | Question Answered |
|---|---|---|
| [01 — Business Case](01-business-case/) | Use-case intake, value hypothesis, pilot scorecard | Is this worth doing? |
| [02 — Architecture](02-architecture/) | Reference architecture, data-flow documentation, integration inventory | How does it fit the environment? |
| [03 — Security & Governance](03-security-governance/) | Zero-Trust agent controls, risk assessment, human approval matrix, incident response | How is it controlled? |
| [04 — Use Cases](04-use-cases/) | Help desk, contact center, healthcare administrative, enterprise knowledge | Where does it apply? |
| [05 — Measurement](05-measurement/) | Baseline metrics, pilot success criteria, ROI model | Did it work? |
| [06 — Workforce Enablement](06-workforce-enablement/) | Training plan, adoption checklist | Will people use it well? |
| [07 — Advisory Engagement](07-advisory-engagement/) | Service offerings, advisory approach, engagement ethics | How is this delivered? |

## Core Design Principles

**Governance precedes deployment.** No agent reaches users before risk classification, an approval matrix, and an incident-response path exist for it.

**The system of record stays authoritative.** Agents recommend, draft, summarize, and route. Ticketing platforms, contact center platforms, EHR-adjacent administrative systems, and directories remain the source of truth. An agent never becomes a shadow system of record.

**Identity is the perimeter.** Every agent runs as a governed nonhuman identity with scoped, time-limited, auditable access. User-delegated permissions are preserved through the retrieval layer — an agent must never return content its user could not open directly.

**Humans approve consequential actions.** Autonomy is granted by risk tier, not by default. The [Human Approval Matrix](03-security-governance/human-approval-matrix.md) makes the boundary explicit and auditable.

**Value is measured, not asserted.** Every pilot begins with a 30-day baseline and ends with a scorecard against pre-committed success criteria. A pilot that cannot be measured cannot be approved.

**Vendor neutrality.** The framework evaluates any agent platform against the same controls, architecture requirements, and measurement discipline. Platform selection is an output of the framework, never an input.

## How to Use This Repository

**Evaluating a first use case?** Start with the [Use-Case Intake Template](01-business-case/use-case-intake-template.md), then run the [AI Risk Assessment](03-security-governance/ai-risk-assessment.md).

**Preparing a security review?** Start with [Zero-Trust Agent Controls](03-security-governance/zero-trust-agent-controls.md) and the [Reference Architecture](02-architecture/reference-architecture.md).

**Building the business case?** Start with the [ROI Model](05-measurement/roi-model.md) and [Baseline Metrics](05-measurement/baseline-metrics.md).

**Planning a pilot?** Use [Pilot Success Criteria](05-measurement/pilot-success-criteria.md) and the [Pilot Scorecard](01-business-case/pilot-scorecard.md), and stage rollout with the [Adoption Checklist](06-workforce-enablement/adoption-checklist.md).

## Standards Alignment

The controls and methodology in this framework are designed to align with:

- **NIST AI Risk Management Framework (AI RMF 1.0)** — risk identification, measurement, and governance functions
- **NIST Cybersecurity Framework 2.0** — identify, protect, detect, respond, recover applied to agent infrastructure
- **NIST SP 800-207 (Zero Trust Architecture)** — extended to nonhuman identities and agent tool use
- **OWASP Top 10 for LLM Applications** — prompt injection, insecure output handling, excessive agency, and supply-chain risks
- **ISO/IEC 42001** — AI management system structure
- **HIPAA administrative context** — minimum-necessary access and the clinical/nonclinical boundary for healthcare administrative use cases

## About the Author

This framework is maintained by **James D. McClain, MBA** — an enterprise IT leader with 20+ years across mission-critical healthcare infrastructure, cybersecurity, unified communications, service management, and contact center operations, combined with AI governance advisory work and technology workforce education. It reflects the operating reality of regulated environments: adoption succeeds when security, governance, measurement, and workforce readiness are designed in from the first conversation.

## License

Released under the [MIT License](LICENSE). Use it, adapt it, and improve it. Attribution appreciated.
