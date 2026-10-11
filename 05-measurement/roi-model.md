# ROI Model

A defensible ROI model for agent-assist initiatives. Its purpose is not to produce an impressive number — it is to produce a number that survives finance review. Three disciplines make that possible: measured baselines, conservative benefit attribution, and fully loaded costs.

## Benefit Model

```text
  Labor Capacity Recovered      (non-overlapping time reduction × volume × loaded rate)
+ Overtime Reduction            (measured OT hours × OT rate)
+ Avoided Rework                (reassignment/transfer reduction × cost per touch)
+ Reduced Error Cost            (error-rate reduction × cost per error)
+ Reduced Training Cost         (time-to-proficiency reduction × cohort size × cost)
+ Deflection Value              (contacts deflected × cost per contact)
= Gross Annual Benefit
```

Define whether average handle time includes after-call work. If it does, count the AHT reduction once; do not add ACW again. Where components are measured separately, use non-overlapping talk, hold, and ACW reductions. Report recovered capacity separately from realized cash savings. Exclude overtime, rework, and deflection benefits already captured in another benefit line.

**Attribution rules that keep the model honest:**

- Benefits count only against the 30-day pre-pilot baseline — never against estimates or vendor benchmarks
- Capacity recovered is valued at redeployment, not headcount elimination, unless a workforce decision is actually made
- Where a control group exists, only the delta over control counts
- Apply a stated confidence factor (e.g., 70–80%) to soft benefits, and label them as soft

## Cost Model — Fully Loaded

```text
  Platform Licensing            (all tiers, all seats, realistic growth)
+ Model Consumption             (measured pilot usage extrapolated, with headroom)
+ Integration Build             (connectors, identity, ITSM/CC platform work)
+ Implementation Services       (internal and external)
+ Security and Governance       (reviews, testing, monitoring build-out)
+ Training and Change           (per 06-workforce-enablement/training-plan.md)
+ Ongoing Support               (platform admin, knowledge lifecycle, model ops)
+ Internal Labor                (every project hour at loaded rate — including governance time)
= Gross Annual Cost
```

Omitting internal labor and governance cost is the most common way AI ROI models flatter themselves. Include them.

## ROI Calculation

```text
Net Annual Benefit = Gross Annual Benefit − Gross Annual Cost
ROI (%)           = (Net Annual Benefit ÷ Gross Annual Cost) × 100
Payback (months)  = One-Time Implementation Cost ÷ Net Recurring Monthly Cash Benefit
```

Payback applies only when recurring monthly cash benefit, net of recurring costs, is positive. Do not count one-time implementation costs again in that monthly denominator. Capacity value alone does not establish cash payback.

## Worked Example (Synthetic)

Mid-size service desk, 25 analysts, 180,000 contacts/year. For this fictional example, the 45-second reduction is talk/hold time excluding ACW; the separate 60-second ACW reduction does not overlap. Overtime and rework figures are assumed to arise from separate activity not included in the capacity line. These are assumptions for illustration, not measured results:

| Item | Basis | Annual Amount |
|---|---|---:|
| Labor capacity recovered | (45s talk/hold + 60s ACW) × 180,000 ÷ 3,600 × $38/hr | $199,500 |
| Overtime reduction | 1,600 OT hours reduced | $91,000 |
| Avoided rework | 9,000 fewer reassignments × $8 | $72,000 |
| **Gross benefit** | | **$362,500** |
| Platform + consumption | | $96,000 |
| Integration + implementation (yr 1) | | $85,000 |
| Security, training, support, internal labor | | $88,000 |
| **Gross cost (yr 1)** | | **$269,000** |
| **Net benefit (yr 1)** | | **$93,500** |
| **ROI (yr 1)** | | **34.8%** |
| **ROI (yr 2, run-rate costs)** | | **97.0%** |

The $362,500 gross benefit includes $199,500 of capacity value and $163,000 of assumed cash savings. The 34.8% year-one figure is a combined capacity-and-cash value ROI, not cash ROI. With recurring costs of $184,000 and no repeated $85,000 implementation charge, year-two combined-value ROI is 97.0%. Under these assumptions, cash savings alone do not cover recurring costs, so cash payback is not demonstrated.

> Synthetic figures for methodology illustration only. Replace every assumption with validated data from [Baseline Metrics](baseline-metrics.md) and the pilot. Do not claim financial savings or payback from unverified capacity value.

## Reporting Discipline

- Report benefit ranges (conservative / expected), not single points
- Separate one-time costs from run-rate; show year-1 and year-2 views
- State every assumption on the same page as the number it supports
- Tie each benefit line to the metric and measurement window that produced it

