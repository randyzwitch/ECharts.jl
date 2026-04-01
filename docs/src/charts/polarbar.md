# polarbar

```@docs
polarbar
```

```@example
using ECharts
days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
sales = [120, 200, 150, 80, 70, 110, 130]
polarbar(days, sales)
```

With multiple series (stacked):

```@example stacked
using ECharts
days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
sales_a = [120, 200, 150, 80, 70, 110, 130]
sales_b = [80, 120, 100, 60, 50, 90, 80]
ec = polarbar(days, hcat(sales_a, sales_b), stack = true, legend = true)
title!(ec, text = "Weekly Sales by Channel")
ec
```
