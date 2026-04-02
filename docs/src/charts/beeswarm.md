# beeswarm

```@docs
beeswarm
```

```@example
using ECharts, Random
Random.seed!(42)
# Simulated 12-week weight loss (lbs) for three diet interventions
diet_only    = max.(0.0,  5 .+ 4 .* randn(40))
diet_exercise = max.(0.0, 12 .+ 5 .* randn(40))
diet_meds    = max.(0.0, 18 .+ 6 .* randn(40))
groups = vcat(fill("Diet Only", 40), fill("Diet + Exercise", 40), fill("Diet + Medication", 40))
values = vcat(diet_only, diet_exercise, diet_meds)
ec = beeswarm(groups, values)
title!(ec, text = "Weight Loss by Intervention (12 weeks)",
           subtext = "Pounds lost — n = 40 per group")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(42)
diet_only     = max.(0.0,  5 .+ 4 .* randn(40))
diet_exercise = max.(0.0, 12 .+ 5 .* randn(40))
diet_meds     = max.(0.0, 18 .+ 6 .* randn(40))
df = DataFrame(
    group  = vcat(fill("Diet Only", 40), fill("Diet + Exercise", 40), fill("Diet + Medication", 40)),
    loss   = vcat(diet_only, diet_exercise, diet_meds),
)
beeswarm(df, :group, :loss)
```
