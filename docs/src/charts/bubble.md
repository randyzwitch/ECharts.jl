# bubble

```@docs
bubble
```

```@example
using ECharts
# Gapminder-style: GDP per capita (x), life expectancy (y), population in millions (size)
gdp_pc   = [65000, 12500,  2400, 51800, 42200, 46300, 44400, 35000,  9400,  2200]
life_exp = [ 79.1,  77.1,  69.7,  81.1,  84.3,  81.3,  82.3,  83.5,  75.7,  54.7]
pop_m    = [  335,  1400,  1380,    84,   125,    68,    68,    52,   215,   218]
ec = bubble(gdp_pc, life_exp, pop_m, scale = true)
title!(ec, text = "GDP per Capita vs Life Expectancy",
           subtext = "Bubble size = population (millions), 2023")
ec
```

For a richer visual effect, apply a colored shadow and radial gradient fill — matching the style of the [Apache ECharts bubble-gradient example](https://echarts.apache.org/examples/en/editor.html?c=bubble-gradient):

```@example gradient
using ECharts
gdp_pc   = [65000, 12500,  2400, 51800, 42200, 46300, 44400, 35000,  9400,  2200]
life_exp = [ 79.1,  77.1,  69.7,  81.1,  84.3,  81.3,  82.3,  83.5,  75.7,  54.7]
pop_m    = [  335,  1400,  1380,    84,   125,    68,    68,    52,   215,   218]
b = bubble(gdp_pc, life_exp, pop_m, scale = true)
shadow!(b, 1, shadowColor = "rgba(120, 36, 50, 0.5)")
b.series[1].itemStyle.color = radialgradient("rgb(251, 118, 123)", "rgb(204, 46, 72)", x = 0.4, y = 0.3, r = 1)
title!(b, text = "GDP per Capita vs Life Expectancy",
          subtext = "Bubble size = population (millions), 2023")
b
```
