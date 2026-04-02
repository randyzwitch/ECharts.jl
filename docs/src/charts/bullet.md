# bullet

```@docs
bullet
```

```@example
using ECharts
labels = ["Revenue", "Profit", "Satisfaction", "Retention"]
actual = [75.0, 62.0, 81.0, 88.0]
target = [80.0, 70.0, 85.0, 90.0]
ranges = [60.0, 80.0, 100.0]
ec = bullet(labels, actual, target, ranges)
title!(ec, text = "Q3 KPI Dashboard", subtext = "Actual vs target (score out of 100)")
ec
```
