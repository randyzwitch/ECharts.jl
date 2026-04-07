# errorbar!

```@docs
errorbar!
```

```@example
using ECharts
categories = ["Control", "Treatment A", "Treatment B", "Treatment C"]
means      = [12.4, 18.7, 15.2, 21.3]
lower      = [10.8, 16.5, 13.1, 19.0]
upper      = [14.0, 20.9, 17.3, 23.6]

ec = bar(categories, means)
errorbar!(ec, lower, upper)
title!(ec, text = "Mean Response by Group", subtext = "Whiskers show 95% confidence intervals")
ec
```
