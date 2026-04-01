# calendarheatmap

```@docs
calendarheatmap
```

```@example
using ECharts, Dates
dates = [Date(2023, 1, 1) + Day(i) for i in 0:364]
values = rand(365)
calendarheatmap(dates, values, 2023)
```

```@example
using ECharts, DataFrames, Dates, Random
Random.seed!(42)
df = DataFrame(date  = [Date(2023, 1, 1) + Day(i) for i in 0:364],
               value = rand(365))
calendarheatmap(df, :date, :value, 2023)
```
