# Workforce Training Plan

Agent-assist initiatives fail at the desk, not in the architecture, when training is skipped or generic. The plan below is role-based, capability-tied, and scheduled against the pilot phases â€” training for a capability lands the week that capability turns on, not in a kickoff deck three months earlier.

## Role-Based Tracks

| Track | Audience | Duration | Content |
|---|---|---|---|
| Executive briefing | Sponsors, senior leaders | 60 min | What the agent does and doesn't do; governance model; how value will be measured; their role in adoption |
| Frontline user training | Analysts / agents in cohort | 2 Ã— 90 min + floor support | Where assist appears in their workflow; reviewing vs. rubber-stamping drafts; when to trust, adapt, or ignore suggestions; citation checking; how to flag bad answers |
| Supervisor track | Team leads, QM | 90 min | Coaching with assist-layer signals; what changes in QM; adoption metrics they own; anti-patterns to watch (blind acceptance, workaround culture) |
| Administrator track | Platform / ITSM / CC admins | Half day | Connector scopes, approval gates, kill switch, monitoring dashboards, escalation paths |
| Security & IR track | SOC, incident response | 90 min | AI incident types, evidence checklist, containment steps per [playbook](../03-security-governance/ai-incident-response.md) |

## Core Curriculum Principles

- **Judgment over mechanics.** The scarce skill is knowing when the agent is wrong. Training drills review discipline with planted-error exercises: users must catch seeded bad suggestions before go-live.
- **The human is the control.** Frontline users are told plainly: approval steps exist because *they* are the safety mechanism. Rubber-stamping is a control failure, and the training says so.
- **Feedback is a feature.** Every user knows how to flag a wrong answer and what happens when they do â€” visible closure of feedback drives adoption more than any incentive.

## Schedule Against Pilot Phases

| Phase | Training Delivered |
|---|---|
| 2 weeks pre-pilot | Executive briefing; supervisor track; admin track |
| Pilot week 1 (read-only) | Frontline session 1 + daily floor support |
| Draft-write enablement | Frontline session 2 (review discipline, planted-error drill) |
| Mid-pilot | Refresher clinic from observed usage patterns |
| Pre-production | Scaled delivery plan built from pilot training feedback |

## Effectiveness Measures

- Planted-error catch rate in training (target â‰¥ 90% before go-live)
- Feature adoption per trained capability (telemetry)
- Post-training confidence survey deltas
- Correlation of training completion with pilot metric performance

