# pie

```@docs
pie
```

```@example
using ECharts
browsers = ["Chrome", "Safari", "Edge", "Firefox", "Samsung Internet", "Other"]
share    = [65.8, 18.7, 5.3, 4.1, 2.6, 3.5]
ec = pie(browsers, share)
title!(ec, text = "Browser Market Share", subtext = "Global, Q4 2024")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    source = ["Coal", "Natural Gas", "Oil", "Hydro", "Nuclear", "Wind", "Solar", "Other"],
    share  = [35.8, 22.4, 4.1, 15.3, 9.7, 6.5, 4.7, 1.5],
)
ec = pie(df, :source, :share)
title!(ec, text = "Global Electricity Generation by Source", subtext = "Share of total, 2023")
ec
```
