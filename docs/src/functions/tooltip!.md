# tooltip!

```@docs
tooltip!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
tooltip!(b)                    # trigger = "axis" (auto-selected for bar)
```

```@example
using ECharts
p = pie(["A","B","C"], [1,2,3])
tooltip!(p)                    # trigger = "item" (auto-selected for pie)
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
tooltip!(b, trigger = "item")  # override auto-selection
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
tooltip!(b, formatter = "{b}: {c} units")
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
tooltip!(b, backgroundColor = "rgba(0,0,0,0.85)", borderColor = "#aaa", padding = 12)
```
