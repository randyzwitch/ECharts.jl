# calendar_heatmap

```@docs
calendar_heatmap
```

```@example
using ECharts, Dates
dates = [Date(2023, 1, 1) + Day(i) for i in 0:364]
values = rand(365)
calendar_heatmap(dates, values, 2023)
```
