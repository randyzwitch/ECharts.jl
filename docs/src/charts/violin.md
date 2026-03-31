# violin

```@docs
violin
```

```@example
using ECharts
groups = vcat(fill("A", 50), fill("B", 50), fill("C", 50))
values = vcat(randn(50), randn(50) .+ 2, randn(50) .- 1)
violin(groups, values)
```
