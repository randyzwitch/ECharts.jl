# calendarheatmap

```@docs
calendarheatmap
```

```@example
using ECharts, Dates, Random
Random.seed!(42)
dates = [Date(2024, 1, 1) + Day(i) for i in 0:365]
# Simulate commit activity: higher on weekdays, occasional streaks
activity = [dayofweek(d) <= 5 ? rand(0:8) : rand(0:2) for d in dates]
ec = calendarheatmap(dates, Float64.(activity), 2024)
title!(ec, text = "GitHub Commit Activity — 2024")
ec
```

```@example
using ECharts, DataFrames, Dates, Random
Random.seed!(42)
dates = [Date(2024, 1, 1) + Day(i) for i in 0:365]
df = DataFrame(
    date     = dates,
    commits  = [dayofweek(d) <= 5 ? rand(0:8) : rand(0:2) for d in dates],
)
calendarheatmap(df, :date, :commits, 2024)
```
