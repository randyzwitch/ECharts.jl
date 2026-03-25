# xline! / yline!

```@docs
xline!
yline!
```

```@example
using ECharts
b = bar(["A","B","C","D"], [1,4,2,5])
yline!(b, "average")
yline!(b, 3.0, color = "red")
```

```@example
using ECharts
b = bar(["A","B","C","D"], [1,4,2,5])
xline!(b, "B")
```
