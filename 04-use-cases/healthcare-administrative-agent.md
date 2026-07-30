# Use Case: Healthcare Administrative Agent

## Scope

This pattern applies AI agents **strictly to nonclinical administrative workflows** in healthcare operations. The defining discipline of healthcare AI adoption is not what the agent can do â€” it is the hardness of the boundary around what it must never do.

## The Clinical Boundary

The boundary is architectural, not behavioral. It is enforced by scope, identity, data access, and connector design â€” not by prompt instructions asking the model to decline.

### In Scope â€” Administrative

- Policy and procedure navigation for staff (HR, operations, safety, compliance policies)
- Administrative intake and forms guidance
- Staff knowledge support â€” benefits, scheduling logistics, facility information, IT how-to
- Appointment *preparation logistics* â€” directions, parking, documents to bring, arrival times
- Service-request drafting and routing to the correct department
- Operational communications drafting for human review
- Workforce support â€” onboarding navigation, training location, credential renewal reminders

### Out of Scope â€” Prohibited by Design

- Diagnosis or symptom assessment in any form
- Treatment recommendations or care guidance
- Medication instructions, interactions, or dosing
- Emergency or clinical triage
- Autonomous clinical decision-making or clinical decision *support*
- Any access to protected health information beyond an explicitly approved, minimum-necessary administrative scope

An administrative agent that receives a clinical question does one thing: it states that it cannot help with clinical matters and routes the person to the appropriate human channel. That routing path is defined before go-live, tested during the pilot, and audited in production.

## Governance Requirements

| Requirement | Detail |
|---|---|
| Business Associate Agreement | Executed with any vendor whose platform touches PHI-adjacent data flows |
| Minimum-necessary access | Retrieval scopes reviewed per HIPAA principle; default is no PHI access at all |
| Privacy review | Completed before pilot, refreshed on any scope change |
| Clinical boundary review | Clinical and compliance leadership sign off on scope exclusions and routing paths |
| Human escalation | Defined, staffed, and tested â€” including the clinical-question routing path |
| Audit logging | Every retrieval and response attributable and reviewable |
| Prohibited-topic testing | Boundary probed with adversarial test cases before and during production |

## Risk Profile

Administrative-only scope with no PHI access classifies **Low-to-Moderate**. Any PHI-adjacent scope, any patient-facing channel, or any workflow execution re-scores the use case under the [AI Risk Assessment](../03-security-governance/ai-risk-assessment.md) and elevates review to include privacy, compliance, and clinical leadership.

## Metrics

- Deflection of routine administrative questions from staffed channels
- Time-to-answer for policy and procedure questions
- Routing accuracy of service requests
- Staff satisfaction with administrative support
- **Boundary integrity:** zero tolerated clinical-scope responses in audit sampling â€” this metric gates continued operation

