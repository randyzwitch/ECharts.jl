# beeswarm

```@docs
beeswarm
```

```@example
using ECharts
categories = vcat(fill("Control", 30), fill("Treatment A", 30), fill("Treatment B", 30))
values = vcat(randn(30), randn(30) .+ 1.5, randn(30) .+ 3)
beeswarm(categories, values)
```
