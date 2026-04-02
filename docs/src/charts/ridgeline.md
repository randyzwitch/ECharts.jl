# ridgeline

```@docs
ridgeline
```

```@example
using ECharts, Random
Random.seed!(42)
# Simulated daily high temperatures (°F) for Chicago by month
months = ["January", "March", "May", "July", "September", "November"]
data   = [
    28 .+ 10 .* randn(200),   # January
    42 .+ 12 .* randn(200),   # March
    65 .+  9 .* randn(200),   # May
    82 .+  7 .* randn(200),   # July
    68 .+  9 .* randn(200),   # September
    44 .+ 11 .* randn(200),   # November
]
ec = ridgeline(months, data)
title!(ec, text = "Daily High Temperature Distribution by Month",
           subtext = "Chicago (°F) — simulated from historical averages")
ec
```
