# funnel

```@docs
funnel
```

```@example
using ECharts
funnel(["A","B","C","D","E"], [100, 60, 80, 70, 50])
```

```@example
using ECharts, DataFrames
df = DataFrame(stage = ["A","B","C","D","E"], count = [100, 60, 80, 70, 50])
funnel(df, :stage, :count)
```
