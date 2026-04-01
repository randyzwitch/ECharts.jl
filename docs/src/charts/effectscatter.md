# effectscatter

```@docs
effectscatter
```

```@example
using ECharts, Random
Random.seed!(42)
effectscatter(randn(30), randn(30))
```

```@example
using ECharts, Random
Random.seed!(42)
x = randn(30)
y = hcat(randn(30), randn(30))
effectscatter(x, y)
```

```@example
using ECharts, DataFrames
df = DataFrame(weight = [60.0, 72.0, 85.0, 55.0, 90.0, 68.0, 78.0, 63.0],
               height = [160.0, 175.0, 180.0, 155.0, 185.0, 170.0, 177.0, 162.0])
effectscatter(df, :weight, :height)
```

```@example
using ECharts, DataFrames
df = DataFrame(weight = [60.0, 72.0, 85.0, 55.0, 90.0, 68.0, 78.0, 63.0],
               height = [160.0, 175.0, 180.0, 155.0, 185.0, 170.0, 177.0, 162.0],
               sex    = ["F", "M", "M", "F", "M", "F", "M", "F"])
effectscatter(df, :weight, :height, :sex)
```
