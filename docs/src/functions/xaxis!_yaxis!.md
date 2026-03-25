# xaxis! / yaxis!

```@docs
xaxis!
yaxis!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
xaxis!(b, name = "Category")
```

```@example
using ECharts
b = bar(["A","B","C"], [1000, 2000, 3000])
yaxis!(b, name = "Revenue", formatter = "\${value}")
```
