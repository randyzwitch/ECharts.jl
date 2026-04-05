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
    stage = ["Applications", "Resume Screen", "Phone Screen",
             "Technical Interview", "Final Round", "Offers Extended"],
    count = [8500, 2200, 650, 180, 42, 15],
)
ec = funnel(df, :stage, :count)
title!(ec, text = "Engineering Hiring Pipeline", subtext = "Annual recruiting cycle")
ec
```
