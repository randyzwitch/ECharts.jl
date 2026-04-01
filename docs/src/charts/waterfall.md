# waterfall

```@docs
waterfall
```

```@example
using ECharts
waterfall(["Q1","Q2","Q3","Q4","Q5"], [2900, -1200, -300, -200, -900])
```

```@example
using ECharts, DataFrames
df = DataFrame(quarter = ["Q1","Q2","Q3","Q4","Q5"],
               change  = [2900, -1200, -300, -200, -900])
waterfall(df, :quarter, :change)
```
