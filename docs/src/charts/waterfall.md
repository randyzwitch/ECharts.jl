# waterfall

```@docs
waterfall
```

```@example
using ECharts
items   = ["Revenue", "COGS", "Gross Profit", "Marketing", "R&D", "G&A", "Operating Income"]
amounts = [12500, -4800, -1200, -950, -620, 0, 0]
ec = waterfall(items, amounts)
title!(ec, text = "Annual P&L Breakdown", subtext = "USD thousands")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    item   = ["Revenue", "COGS", "Gross Profit", "Marketing", "R&D", "G&A", "Operating Income"],
    amount = [12500, -4800, -1200, -950, -620, 0, 0],
)
waterfall(df, :item, :amount)
```
