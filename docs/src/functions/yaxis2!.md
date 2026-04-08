# yaxis2!

```@docs
yaxis2!
```

```@example
using ECharts
# Bar chart for revenue (left axis) + line for growth rate (right axis)
quarters = ["Q1", "Q2", "Q3", "Q4"]
revenue  = [120_000, 145_000, 98_000, 162_000]
growth   = [nothing, 20.8, -32.4, 65.3]
ec = bar(quarters, revenue)
yaxis2!(ec, growth, series_name = "Growth Rate", name = "Growth Rate (%)")
yaxis!(ec, name = "Revenue (\$)")
title!(ec, text = "Dual-Axis: Revenue and Growth Rate")
ec
```

```@example
using ECharts
# Multiple series on the right axis; series_name appears in the legend
months = ["Jan", "Feb", "Mar", "Apr"]
ec = line(months, [10, 40, 30, 50])
yaxis2!(ec, [22, 19, 24, 28], series_name = "Temp (°C)", name = "Weather")
yaxis2!(ec, [60, 75, 55, 80], series_name = "Humidity (%)")
yaxis!(ec, name = "Sales")
legend!(ec)
ec
```
