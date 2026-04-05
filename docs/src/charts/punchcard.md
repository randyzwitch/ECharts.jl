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
Random.seed!(13)
day_names  = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
time_slots = ["Breakfast", "Lunch", "Afternoon", "Dinner", "Late Night"]
days  = repeat(day_names, inner = 1, outer = 5)
slots = repeat(time_slots, inner = 7)
is_weekend = [d ∈ ["Sat", "Sun"] for d in days]
is_meal    = [s ∈ ["Lunch", "Dinner"] for s in slots]
base       = is_weekend .* 55 .+ is_meal .* 90 .+ 20
df = DataFrame(
    day    = days,
    slot   = slots,
    orders = max.(0, round.(Int, base .+ 20 .* randn(35))),
)
ec = punchcard(df, :day, :slot, :orders)
title!(ec, text = "Restaurant Orders by Day and Time Slot")
ec
```
