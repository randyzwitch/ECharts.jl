# xarea! / yarea!

```@docs
xarea!
yarea!
```

```@example
using ECharts
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
xarea!(b, "B", "D", color = "rgba(200,200,200,0.4)")
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
yarea!(b, 1.5, 2.5, color = "rgba(200,200,200,0.4)")
```
