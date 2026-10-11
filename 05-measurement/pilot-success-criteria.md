# Pilot Success Criteria

Success criteria are **pre-committed**: written, quantified, and signed before the pilot begins. A pilot that defines success after seeing the data is a demo with better branding.

## Criteria Structure

Each criterion specifies: the metric, the baseline value, the target delta, the measurement source, and the decision weight.

| # | Criterion | Baseline | Target | Source | Weight |
|---|---|---|---|---|---|
| 1 | Average handle time | (measured) | ≥ 8% reduction | Platform reporting | Core |
| 2 | First-contact resolution | (measured) | ≥ 5 pt improvement | Platform reporting | Core |
| 3 | After-call work | (measured) | ≥ 20% reduction | Platform reporting | Core |
| 4 | Quality scores | (measured) | No degradation | Existing QM rubric | **Gate** |
| 5 | Answer citation integrity | — | Every substantive answer cited or declined; source support reviewed | Sampled audit | **Gate** |
| 6 | Permission integrity | — | Zero unauthorized returns observed in documented tests | Adversarial testing | **Gate** |
| 7 | User adoption | — | ≥ 70% weekly active use in cohort | Platform telemetry | Core |
| 8 | User satisfaction | Pre-survey | Positive shift | Post-survey | Supporting |
| 9 | Incident count attributable to agent | — | Zero high-severity | IR records | **Gate** |

**Gates are pass/fail.** A pilot that beats every performance target but fails a gate — quality degradation, a permission leak, a high-severity incident — has failed. Speed obtained by sacrificing integrity is not a capability; it is a liability with good metrics.

Citation presence does not establish answer correctness. Before pilot launch, define claim-level source-support review, sampling coverage, evaluators, and pass/fail criteria. Record the permission-test population, negative cases, and limitations. Zero observed leaks is a test result, not a guarantee; maintain production monitoring and stop on any unauthorized return. Pilot performance targets are illustrative and must be approved for the selected use case before launch.

## Decision Framework

At pilot close, exactly one outcome, decided against the pre-committed table:

| Outcome | Condition | Consequence |
|---|---|---|
| **Approve** | All gates pass; core targets substantially met | Proceed to production per [environment progression](../02-architecture/reference-architecture.md); scale plan and run-rate budget |
| **Revise** | Gates pass; core targets missed with identified, fixable causes | One bounded iteration with amended criteria; second revise is a stop |
| **Stop** | Any gate fails, or core value not demonstrated | Document findings; stopping a weak pilot is a governance success, not a failure |

## Reporting Cadence

- Weekly cohort snapshot during pilot (metrics vs. baseline, issues, adoption)
- Mid-pilot checkpoint with the sponsor — course-correct instrumentation, not targets
- Close-out scorecard using the [Pilot Scorecard](../01-business-case/pilot-scorecard.md), presented with the decision recommendation

