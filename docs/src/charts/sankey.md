# sankey

```@docs
sankey
```

```@example
using ECharts
# UK energy flow (simplified from DECC)
name   = ["Coal", "Natural Gas", "Nuclear", "Wind/Solar",
          "Electricity", "Industry", "Transport", "Residential", "Losses"]
source = [0, 1, 2, 3, 0, 1, 4, 4, 4]
target = [4, 4, 4, 4, 5, 5, 6, 7, 8]
value  = [60.0, 90.0, 70.0, 35.0, 25.0, 30.0, 85.0, 65.0, 55.0]
ec = sankey(name, source, target, value)
title!(ec, text = "Energy Flow Diagram", subtext = "TWh, simplified")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    source = ["Salary", "Salary",  "Freelance", "Budget",   "Budget",    "Budget",   "Budget"],
    target = ["Budget", "Savings", "Budget",    "Housing",  "Food",      "Transport","Leisure"],
    value  = [4200.0,   800.0,     600.0,       1400.0,     600.0,       350.0,      450.0],
)
ec = sankey(df, :source, :target, :value)
title!(ec, text = "Monthly Household Budget", subtext = "USD")
ec
```
