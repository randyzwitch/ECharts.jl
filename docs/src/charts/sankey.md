# sankey

```@docs
sankey
```

```@example
using ECharts
name   = ["Agricultural waste","Bio-conversion","Liquid","Losses","Solid","Gas",
          "Biofuel imports","Biomass imports","Coal imports","Coal"]
source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9,  9]
value  = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]
sankey(name, source, target, value)
```

```@example
using ECharts, DataFrames
df = DataFrame(
    source = ["Wages", "Wages", "Interest", "Budget", "Budget", "Budget"],
    target = ["Budget", "Taxes", "Budget", "Housing", "Food", "Transport"],
    value  = [2000.0, 200.0, 25.0, 500.0, 450.0, 310.0],
)
sankey(df, :source, :target, :value)
```
