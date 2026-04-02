# donut

```@docs
donut
```

```@example
using ECharts
devices  = ["Desktop", "Mobile", "Tablet"]
sessions = [42.3, 52.1, 5.6]
ec = donut(devices, sessions)
title!(ec, text = "Website Sessions by Device", subtext = "% share, last 30 days")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    device   = ["Desktop", "Mobile", "Tablet"],
    sessions = [42.3, 52.1, 5.6],
)
donut(df, :device, :sessions)
```
