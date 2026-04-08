# facet

```@docs
facet
```

## Raw arrays — groups with independent x values

The array form of `facet` is useful when each group has its own set of x categories.

```@example
using ECharts
days    = vcat(["Mon","Tue","Wed","Thu","Fri"],
               ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
               ["Sat","Sun"])
steps   = vcat([8200,7500,9100,8800,10200],
               [6000,5800,7200,6900,8100,12000,11500],
               [13000,14500])
cohort  = vcat(fill("Weekday commuters",5),
               fill("Flexible workers",7),
               fill("Weekend walkers",2))
facet(days, steps, cohort; mark = "bar", ncols = 2)
```
