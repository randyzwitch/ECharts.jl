# toolbox!

```@docs
toolbox!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
toolbox!(b, chartTypes = ["line", "bar"])
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
toolbox!(b, dataZoom = true, orient = "horizontal", right = "5%", top = "5%")
```
