# bubble

```@docs
bubble
```

```@example
using ECharts, Random
Random.seed!(13579)
xval = rand() .* (0:1000:30000)
yval = 60 .+ (rand(31) * 20)
sizeval = shuffle!(6000 .* (rand(31) * 50))
bubble(xval, yval, sizeval, scale = true)
```

For a richer visual effect, pair the default shadow with a colored shadow and radial gradient fill per series — matching the style of the [Apache ECharts bubble-gradient example](https://echarts.apache.org/examples/en/editor.html?c=bubble-gradient):

```@example gradient
using ECharts, Random
Random.seed!(24680)
xval = rand() .* (0:1000:30000)
yval = 60 .+ (rand(31) * 20)
sizeval = shuffle!(6000 .* (rand(31) * 50))
b = bubble(xval, yval, sizeval, scale = true)
shadow!(b, 1, shadowColor = "rgba(120, 36, 50, 0.5)")
b.series[1].itemStyle.color = radialgradient("rgb(251, 118, 123)", "rgb(204, 46, 72)", x = 0.4, y = 0.3, r = 1)
b
```
