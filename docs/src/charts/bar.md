# bar

```@docs
bar
```

```@example
using ECharts
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
evaporation   = [2.0,  4.9,  7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0,  6.4, 3.3]
precipitation = [2.6,  5.9,  9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8,  6.0, 2.3]
ec = bar(months, hcat(evaporation, precipitation), legend = true)
seriesnames!(ec, ["Evaporation", "Precipitation"])
title!(ec, text = "Rainfall vs Evaporation", subtext = "Average monthly data — Beijing")
ec
```
