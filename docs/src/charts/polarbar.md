# polarbar

```@docs
polarbar
```

```@example
using ECharts
months    = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
rainfall  = [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
ec = polarbar(months, rainfall)
title!(ec, text = "Monthly Precipitation (mm)", subtext = "Beijing average")
ec
```

Stacked with multiple series:

```@example stacked
using ECharts
months   = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
beijing  = [2.6,  5.9,  9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8,  6.0, 2.3]
shanghai = [3.1,  7.2, 12.4, 43.8, 68.0, 99.1, 149.3, 122.0, 82.7, 38.4, 13.0, 3.8]
ec = polarbar(months, hcat(beijing, shanghai), stack = true, legend = true)
seriesnames!(ec, ["Beijing", "Shanghai"])
title!(ec, text = "Monthly Precipitation (mm)")
ec
```
