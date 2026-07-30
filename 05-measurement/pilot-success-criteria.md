# Pilot Success Criteria

Success criteria are **pre-committed**: written, quantified, and signed before the pilot begins. A pilot that defines success after seeing the data is a demo with better branding.

## Criteria Structure

Each criterion specifies: the metric, the baseline value, the target delta, the measurement source, and the decision weight.

| # | Criterion | Baseline | Target | Source | Weight |
|---|---|---|---|---|---|
| 1 | Average handle time | (measured) | â‰¥ 8% reduction | Platform reporting | Core |
| 2 | First-contact resolution | (measured) | â‰¥ 5 pt improvement | Platform reporting | Core |
| 3 | After-call work | (measured) | â‰¥ 20% reduction | Platform reporting | Core |
| 4 | Quality scores | (measured) | No degradation | Existing QM rubric | **Gate** |
| 5 | Answer citation integrity | â€” | 100% of answers cited or declined | Sampled audit | **Gate** |
| 6 | Permission integrity | â€” | Zero unauthorized returns | Adversarial testing | **Gate** |
| 7 | User adoption | â€” | â‰¥ 70% weekly active use in cohort | Platform telemetry | Core |
| 8 | User satisfaction | Pre-survey | Positive shift | Post-survey | Supporting |
| 9 | Incident count attributable to agent | â€” | Zero high-severity | IR records | **Gate** |

**Gates are pass/fail.** A pilot that beats every performance target but fails a gate â€” quality degradation, a permission leak, a high-severity incident â€” has failed. Speed obtained by sacrificing integrity is not a capability; it is a liability with good metrics.

## Decision Framework

At pilot close, exactly one outcome, decided against the pre-committed table:

| Outcome | Condition | Consequence |
|---|---|---|
| **Approve** | All gates pass; core targets substantially met | Proceed to production per [environment progression](../02-architecture/reference-architecture.md); scale plan and run-rate budget |
| **Revise** | Gates pass; core targets missed with identified, fixable causes | One bounded iteration with amended criteria; second revise is a stop |
| **Stop** | Any gate fails, or core value not demonstrated | Document findings; stopping a weak pilot is a governance success, not a failure |

## Reporting Cadence

- Weekly cohort snapshot during pilot (metrics vs. baseline, issues, adoption)
- Mid-pilot checkpoint with the sponsor â€” course-correct instrumentation, not targets
- Close-out scorecard using the [Pilot Scorecard](../01-business-case/pilot-scorecard.md), presented with the decision recommendation

