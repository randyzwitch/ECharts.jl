# boxenplot

```@docs
boxenplot
```

```@example
using ECharts, Random
Random.seed!(42)
# Simulated salary distributions for three job levels
junior = max.(30.0,  70 .+ 15 .* randn(200))
mid    = max.(30.0, 110 .+ 22 .* randn(200))
senior = max.(30.0, 160 .+ 30 .* randn(200))
ec = boxenplot([junior, mid, senior]; names = ["Junior", "Mid-Level", "Senior"])
title!(ec, text = "Salary Distribution by Level (USD thousands)",
           subtext = "Letter-value plot — n = 200 per group")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(7)
n = 150
df = DataFrame(
    score = vcat(50 .+ 10 .* randn(n), 65 .+ 12 .* randn(n), 80 .+ 8 .* randn(n)),
    group = vcat(fill("Control", n), fill("Treatment A", n), fill("Treatment B", n)),
)
ec = boxenplot(df, :score, :group)
title!(ec, text = "Test Scores by Treatment Group")
ec
```
