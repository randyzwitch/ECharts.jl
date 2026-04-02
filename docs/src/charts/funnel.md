# funnel

```@docs
funnel
```

```@example
using ECharts
stages = ["Impressions", "Clicks", "Visits", "Inquiries", "Orders"]
counts = [50000, 18000, 9000, 2000, 800]
ec = funnel(stages, counts)
title!(ec, text = "Marketing Conversion Funnel")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    stage = ["Impressions", "Clicks", "Visits", "Inquiries", "Orders"],
    count = [50000, 18000, 9000, 2000, 800],
)
funnel(df, :stage, :count)
```
