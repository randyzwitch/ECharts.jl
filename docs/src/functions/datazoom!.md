# datazoom!

```@docs
datazoom!
```

Default slider:

```@example
using ECharts
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
datazoom!(b)
```

Start zoomed into the first 50% of data:

```@example
using ECharts
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
datazoom!(b, start = 0, end_ = 50)
```

Vertical slider attached to the y-axis:

```@example
using ECharts
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
datazoom!(b, yAxisIndex = 0, orient = "vertical")
```

Inside zoom (mouse-scroll), locked to pan only:

```@example
using ECharts
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
datazoom!(b, type = "inside", zoomLock = true, throttle = 100)
```
