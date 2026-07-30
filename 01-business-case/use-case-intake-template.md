# Use-Case Intake Template

Every AI agent idea enters through this template. Its job is to force clarity before enthusiasm: a use case that cannot complete intake is not ready for a platform conversation.

## 1. The Problem (no technology language permitted in this section)

| Field | Entry |
|---|---|
| Operating problem, in one sentence | |
| Who feels this problem daily (role, team, volume) | |
| Business owner (named individual, not a department) | |
| What it costs today (time, money, quality, risk — estimated is fine, labeled as estimated) | |
| What has already been tried | |

## 2. The Proposed Capability

| Field | Entry |
|---|---|
| What the agent would do (recommend / draft / retrieve / execute — be precise) | |
| What the agent explicitly would NOT do | |
| Who interacts with it, in what channel | |
| What "good" looks like in the first 90 days | |

## 3. Data and Systems

| Field | Entry |
|---|---|
| Knowledge sources needed (and their owners) | |
| Systems of record touched, read vs. write | |
| Most sensitive data element in scope | |
| Regulated data involved? (HIPAA / PCI / CMMC / other) | |

## 4. Risk Signals (triggers full [risk assessment](../03-security-governance/ai-risk-assessment.md))

- [ ] Agent would execute actions, not just recommend
- [ ] Customer- or patient-facing channel
- [ ] Regulated or restricted data in scope
- [ ] Irreversible or hard-to-reverse actions possible
- [ ] External connectivity required
- [ ] Anywhere near clinical, emergency, or life-safety workflows → **stop; out of scope**

## 5. Value Hypothesis

Complete the [Value Hypothesis Template](value-hypothesis-template.md). Intake is not accepted without a measurable hypothesis and an identified baseline source.

## 6. Intake Decision

| Outcome | Meaning |
|---|---|
| Advance | Proceeds to risk assessment and architecture review |
| Park | Real problem, not ready (data, owner, or baseline missing) — with named unblock conditions |
| Decline | Not a fit for agent capability; documented why |
