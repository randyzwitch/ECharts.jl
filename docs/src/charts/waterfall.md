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
    item   = ["Opening Balance", "Tax Revenue", "Federal Grants", "Debt Service",
              "Public Safety", "Infrastructure", "Social Services", "Closing Balance"],
    amount = [4200, 3800, 650, -980, -1540, -1100, -1430, 0],
)
ec = waterfall(df, :item, :amount)
title!(ec, text = "Municipal Budget Breakdown", subtext = "USD millions, Fiscal Year 2024")
ec
```
