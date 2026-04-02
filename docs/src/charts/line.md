# line

```@docs
line
```

```@example
using ECharts
months  = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
beijing  = [-2, 0, 4, 14, 21, 26, 29, 28, 22, 13,  5, -2]
shanghai = [ 4, 5, 9, 15, 20, 24, 28, 28, 23, 18, 12,  6]
ec = line(months, hcat(beijing, shanghai), legend = true)
seriesnames!(ec, ["Beijing", "Shanghai"])
title!(ec, text = "Average Monthly Temperature (°C)")
ec
```
