# nightingale

```@docs
nightingale
```

```@example
using ECharts
labels = ["Respiratory diseases", "Zymotic diseases", "Wounds & injuries",
          "Other causes", "Unknown"]
values = [42, 32, 26, 18, 12]
nightingale(labels, values)
```

```@example
using ECharts, DataFrames
df = DataFrame(cause  = ["Respiratory diseases", "Zymotic diseases", "Wounds & injuries",
                         "Other causes", "Unknown"],
               deaths = [42, 32, 26, 18, 12])
nightingale(df, :cause, :deaths)
```
