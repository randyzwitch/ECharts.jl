# labels!

```@docs
labels!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
labels!(b)
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
labels!(b, position = "top", color = "#333", fontSize = 14, fontWeight = "bold")
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
labels!(b, position = "top", rotate = 45)
```

```@example
using ECharts
b = bar(["A","B","C"], [1234, 5678, 9012])
labels!(b, position = "insideTop", color = "#fff", formatter = "{c}")
```
