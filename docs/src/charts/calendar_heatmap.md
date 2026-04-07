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
using ECharts, DataFrames, Dates
# Simulate NYC-style daily high temperatures with a seasonal sine curve
dates = [Date(2023, 1, 1) + Day(i) for i in 0:364]
doy   = dayofyear.(dates)
temps = round.(50 .+ 28 .* sin.(2π .* (doy .- 80) ./ 365) .+ 4 .* randn(365), digits = 1)
df = DataFrame(date = dates, temp_f = temps)
ec = calendarheatmap(df, :date, :temp_f, 2023)
title!(ec, text = "Daily High Temperature — New York City, 2023", subtext = "°F")
ec
```

