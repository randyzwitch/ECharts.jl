# shadow!

```@docs
shadow!
```

```@example
using ECharts

# Shadows are applied automatically on bubble charts — no call needed
b = bubble([1,2,3,4,5], [10,30,20,50,40], [100,200,300,150,250])

# Enhance with a colored shadow and radial gradient fill to match bubble hue
shadow!(b, 1, shadowColor = "rgba(120, 36, 50, 0.5)")
b.series[1].itemStyle.color = radialgradient("rgb(251, 118, 123)", "rgb(204, 46, 72)", x = 0.4, y = 0.3, r = 1)
b
```
