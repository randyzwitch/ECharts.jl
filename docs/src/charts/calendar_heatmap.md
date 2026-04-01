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
