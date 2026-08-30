# Start Here

## What This Repository Provides

This is a vendor-neutral framework for moving an enterprise AI-agent idea through intake, architecture, risk classification, security review, pilot measurement, workforce preparation, and an evidence-based scale decision.

It is a documentation and reference framework—not a deployable production system or compliance certification.

> **Privacy boundary:** All public content must remain synthetic, generalized, or fictional. Do not include employer names, confidential information, protected data, internal architecture, production credentials, real network addresses, identifiable incidents, or proprietary organizational metrics.

---

## Choose Your Starting Point

| Your Objective                     | Start With                                                                                   | Continue To                                                                          |
| ---------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| Evaluate an AI-agent idea          | [Use-Case Intake](01-business-case/use-case-intake-template.md)                              | [AI Risk Assessment](03-security-governance/ai-risk-assessment.md)                   |
| Build an executive business case   | [Value Hypothesis](01-business-case/value-hypothesis-template.md)                            | [ROI Model](05-measurement/roi-model.md)                                             |
| Prepare for security review        | [Zero-Trust Agent Controls](03-security-governance/zero-trust-agent-controls.md)             | [Reference Architecture](02-architecture/reference-architecture.md)                  |
| Define human oversight             | [Human Approval Matrix](03-security-governance/human-approval-matrix.md)                     | [AI Incident Response](03-security-governance/ai-incident-response.md)               |
| Establish operational measurements | [Baseline Metrics](05-measurement/baseline-metrics.md)                                       | [Pilot Success Criteria](05-measurement/pilot-success-criteria.md)                   |
| Plan workforce adoption            | [Training Plan](06-workforce-enablement/training-plan.md)                                    | [Adoption Checklist](06-workforce-enablement/adoption-checklist.md)                  |
| Review an advisory engagement      | [Advisory Approach](07-advisory-engagement/advisory-approach.md)                             | [Engagement Ethics](07-advisory-engagement/engagement-ethics.md)                     |
| Protect professional boundaries    | [Conflict-of-Interest Boundary](07-partnership-positioning/conflict-of-interest-boundary.md) | [Independent Opportunities](07-partnership-positioning/independent-opportunities.md) |

---

## Recommended Workflow

1. Define the operating problem without assuming a technology solution.
2. Assign an accountable business owner.
3. Document the data, integrations, systems of record, connectors, and tools.
4. Classify security, privacy, operational, vendor, and human-impact risks.
5. Establish human-approval and prohibited-action boundaries.
6. Apply Zero-Trust identity, access, segmentation, logging, and recovery controls.
7. Capture baseline performance before enabling the pilot.
8. Define measurable success thresholds and stop conditions.
9. Prepare participants through role-based learning and scenario practice.
10. Run a controlled pilot.
11. Compare results with the approved baseline.
12. Scale, revise, pause, or stop based on evidence.

---

## Repository Sections

* [01 — Business Case](01-business-case/)
* [02 — Architecture](02-architecture/)
* [03 — Security and Governance](03-security-governance/)
* [04 — Use Cases](04-use-cases/)
* [05 — Measurement](05-measurement/)
* [06 — Workforce Enablement](06-workforce-enablement/)
* [07 — Advisory Engagement](07-advisory-engagement/)
* [Independent Partnership Positioning](07-partnership-positioning/)
* [Architecture and Governance Diagrams](diagrams/)
* [Repository Scripts](scripts/)

The complete repository explanation is available in the [main README](README.md).

---

## Local Validation for Maintainers

Open PowerShell in the repository directory and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\validate-repository.ps1
```

Before publishing with the GitHub CLI, confirm the active account:

```powershell
gh auth status
```

If using the included publishing script, review its parameters and target repository before execution:

```powershell
.\scripts\publish-to-github.ps1 -GitHubOrg "<your-username-or-organization>" -Private
```

Review the private repository before changing its visibility to public.

---

## Public-Release Checklist

* [ ] Repository owner and destination verified
* [ ] No employer names or logos
* [ ] No confidential or internal information
* [ ] No protected health, customer, student, or employee data
* [ ] No real production credentials or secrets
* [ ] No internal network addresses or architecture diagrams
* [ ] No identifiable incidents
* [ ] No proprietary operational metrics
* [ ] All examples marked synthetic, generalized, or fictional
* [ ] Markdown tables and links render correctly
* [ ] Mermaid diagrams render correctly
* [ ] Security and conflict-of-interest boundaries reviewed
* [ ] Repository description and topics updated
* [ ] Final public review completed

---

## Recommended Repository Description

> Vendor-neutral enterprise AI agent readiness framework for Zero-Trust governance, measurable pilots, regulated operations, agent security, and workforce adoption.

## Recommended Topics

`enterprise-ai` `ai-agents` `ai-governance` `zero-trust` `agent-security` `nist-ai-rmf` `owasp-genai` `regulated-industries` `service-management` `contact-center` `responsible-ai` `workforce-development`

---

## Maintainer

**James D. McClain, MBA**

Independent enterprise AI, infrastructure, cybersecurity, governance, and workforce-development practitioner.
