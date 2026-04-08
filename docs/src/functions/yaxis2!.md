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
yaxis2!(ec, growth, name = "Growth Rate (%)")
seriesnames!(ec, ["Revenue", "Growth Rate"])
yaxis!(ec, name = "Revenue (\$)")
title!(ec, text = "Dual-Axis: Revenue and Growth Rate")
legend!(ec)
ec
```

```@example
using ECharts
# Reassign an existing series to the right axis
months = ["Jan", "Feb", "Mar", "Apr"]
sales   = [10, 40, 30, 50]
visits  = [2200, 1900, 2400, 2800]
ec = line(months, hcat(sales, visits))
seriesnames!(ec, ["Sales", "Website Visits"])
yaxis2!(ec; series = 2, name = "Visits")
yaxis!(ec, name = "Sales")
legend!(ec)
ec
```
