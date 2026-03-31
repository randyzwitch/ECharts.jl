# ridgeline

```@docs
ridgeline
```

```@example
using ECharts
groups = ["Group A", "Group B", "Group C", "Group D"]
data   = [randn(200), randn(200) .+ 2, randn(200) .- 1, randn(200) .+ 4]
ridgeline(groups, data)
```
