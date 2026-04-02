# spanchart

```@docs
spanchart
```

```@example
using ECharts
months    = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
temp_low  = [-3.0, -2.0,  3.0,  8.0, 13.0, 18.0, 20.0, 19.0, 15.0,  9.0,  3.0, -1.0]
temp_high = [ 5.0,  7.0, 12.0, 18.0, 23.0, 28.0, 30.0, 29.0, 24.0, 17.0,  9.0,  5.0]
ec = spanchart(months, temp_low, temp_high)
title!(ec, text = "Monthly Temperature Range (°C)", subtext = "Beijing — daily low to daily high")
ec
```
