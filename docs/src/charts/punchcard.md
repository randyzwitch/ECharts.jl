# punchcard

```@docs
punchcard
```

```@example
using ECharts, Random
Random.seed!(42)
day_names  = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
days  = repeat(day_names, 24)
hours = repeat(string.(0:23), inner = 7)

# Weekday traffic peaks at 9–11am and 2–4pm; weekends are quieter
is_weekday = [d ∈ ["Mon","Tue","Wed","Thu","Fri"] for d in days]
is_peak    = [h ∈ ["9","10","11","14","15","16"] for h in hours]
base       = is_weekday .* 200 .+ is_peak .* 150
counts     = max.(0, round.(Int, base .+ 60 .* randn(length(days))))
ec = punchcard(days, hours, counts)
title!(ec, text = "Website Visitors by Day & Hour")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(42)
day_names  = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
days  = repeat(day_names, 24)
hours = repeat(string.(0:23), inner = 7)
is_weekday = [d ∈ ["Mon","Tue","Wed","Thu","Fri"] for d in days]
is_peak    = [h ∈ ["9","10","11","14","15","16"] for h in hours]
base       = is_weekday .* 200 .+ is_peak .* 150
df = DataFrame(
    day   = days,
    hour  = hours,
    count = max.(0, round.(Int, base .+ 60 .* randn(length(days)))),
)
punchcard(df, :day, :hour, :count)
```
