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
    sector    = ["Energy", "Transport", "Industry", "Agriculture", "Buildings", "Other"],
    emissions = [34.6, 16.2, 24.2, 18.4, 5.9, 0.7],
)
ec = donut(df, :sector, :emissions)
title!(ec, text = "Global CO₂ Emissions by Sector", subtext = "Share of total, 2023")
ec
```
