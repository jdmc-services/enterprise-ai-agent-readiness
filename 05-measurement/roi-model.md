# ROI Model

A defensible ROI model for agent-assist initiatives. Its purpose is not to produce an impressive number — it is to produce a number that survives finance review. Three disciplines make that possible: measured baselines, conservative benefit attribution, and fully loaded costs.

## Benefit Model

```text
  Labor Capacity Recovered      (AHT + ACW reduction × volume × loaded rate)
+ Overtime Reduction            (measured OT hours × OT rate)
+ Avoided Rework                (reassignment/transfer reduction × cost per touch)
+ Reduced Error Cost            (error-rate reduction × cost per error)
+ Reduced Training Cost         (time-to-proficiency reduction × cohort size × cost)
+ Deflection Value              (contacts deflected × cost per contact)
= Gross Annual Benefit
```

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
ROI %             = Net Annual Benefit ÷ Gross Annual Cost
Payback (months)  = Implementation Cost ÷ (Net Monthly Benefit)
```

## Worked Example (Synthetic)

Mid-size service desk, 25 analysts, ~180k contacts/year:

| Item | Basis | Annual Amount |
|---|---|---:|
| Labor capacity recovered | 45s AHT + 60s ACW reduction × volume × $38/hr loaded | $198,000 |
| Overtime reduction | 1,600 OT hours reduced | $91,000 |
| Avoided rework | 9,000 fewer reassignments × $8 | $72,000 |
| **Gross benefit** | | **$361,000** |
| Platform + consumption | | $96,000 |
| Integration + implementation (yr 1) | | $85,000 |
| Security, training, support, internal labor | | $88,000 |
| **Gross cost (yr 1)** | | **$269,000** |
| **Net benefit (yr 1)** | | **$92,000** |
| **ROI (yr 1)** | | **34%** |
| **ROI (yr 2, run-rate costs)** | | **~95%** |

> Synthetic figures for methodology illustration only. A year-one ROI of 34% that is *real* beats a slideware 300% every time it meets a CFO. Replace every value with measured data from [Baseline Metrics](baseline-metrics.md) and the pilot.

## Reporting Discipline

- Report benefit ranges (conservative / expected), not single points
- Separate one-time costs from run-rate; show year-1 and year-2 views
- State every assumption on the same page as the number it supports
- Tie each benefit line to the metric and measurement window that produced it

