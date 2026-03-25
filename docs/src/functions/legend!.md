# legend!

```@docs
legend!
```

```@example
using ECharts
x = ["A","B","C"]
y = [1 2; 3 4; 5 6]
b = bar(x, y)
legend!(b, orient = "vertical", left = "right")
```
