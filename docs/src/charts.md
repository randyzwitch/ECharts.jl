# Charts

## area

```@docs
area
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
area(x, y)
```

## bar

```@docs
bar
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, y)
```

## box

```@docs
box
```

```@example
using ECharts
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
box(data)
```

## bubble

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

## candlestick

```@docs
candlestick
```

```@example
using ECharts
dt = ["2016/08/26","2016/08/29","2016/08/30","2016/08/31","2016/09/01","2016/09/02",
      "2016/09/06","2016/09/07","2016/09/08","2016/09/09","2016/09/12","2016/09/13",
      "2016/09/14","2016/09/15","2016/09/16","2016/09/19","2016/09/20","2016/09/21",
      "2016/09/22","2016/09/23","2016/09/26"]
close_ = [12.38,12.47,12.55,12.60,12.44,12.50,12.67,12.70,12.73,12.38,12.70,12.38,12.14,12.11,12.11,12.11,12.00,12.09,12.18,12.17,12.01]
open_  = [12.47,12.38,12.46,12.48,12.66,12.53,12.49,12.62,12.50,12.61,12.32,12.53,12.18,12.14,12.05,12.12,12.09,12.08,12.17,12.12,12.12]
high_  = [12.55,12.50,12.56,12.61,12.72,12.57,12.67,12.75,12.75,12.685,12.77,12.68,12.31,12.18,12.13,12.33,12.19,12.11,12.29,12.22,12.12]
low_   = [12.34,12.38,12.43,12.48,12.35,12.46,12.43,12.62,12.50,12.38,12.28,12.33,12.11,12.06,12.01,12.0586,11.96,12.01,12.16,12.12,12.00]
candlestick(dt, open_, close_, low_, high_)
```

## corrplot

```@docs
corrplot
```

```@example
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
corrplot(df)
```

## donut

```@docs
donut
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
donut(x, y)
```

## funnel

```@docs
funnel
```

```@example
using ECharts
funnel(["A","B","C","D","E"], [100, 60, 80, 70, 50])
```

## gauge

```@docs
gauge
```

```@example
using ECharts
gauge(27.64)
```

## heatmap

```@docs
heatmap
```

```@example
using ECharts, StatsBase
h = fit(Histogram, (randn(10000), randn(10000)), nbins = 20)
heatmap(h)
```

## histogram

```@docs
histogram
```

```@example
using ECharts, StatsBase
h = fit(Histogram, randn(1000))
histogram(h)
```

## line

```@docs
line
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
line(x, y)
```

## pie

```@docs
pie
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
pie(x, y)
```

## polar

```@docs
polar
```

```@example
using ECharts
t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2a) * cos(2a)) for a in angle]
polar(angle, radius)
```

## radar

```@docs
radar
```

```@example
using ECharts
names = ["Speed","Strength","Agility","Endurance","Accuracy"]
values = [80, 65, 90, 55, 75]
maxvals = [100, 100, 100, 100, 100]
radar(names, values, maxvals)
```

## radialbar

```@docs
radialbar
```

```@example
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
radialbar(x, y)
```

## sankey

```@docs
sankey
```

```@example
using ECharts
name   = ["Agricultural waste","Bio-conversion","Liquid","Losses","Solid","Gas",
          "Biofuel imports","Biomass imports","Coal imports","Coal"]
source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9,  9]
value  = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]
sankey(name, source, target, value)
```

## scatter

```@docs
scatter
```

```@example
using ECharts, Random
Random.seed!(42)
scatter(rand(50), rand(50))
```

## streamgraph

```@docs
streamgraph
```

```@example
using ECharts, Dates
dates = repeat(Date(2020,1,1):Month(1):Date(2020,12,1), 3)
yvals = [10,12,8,15,20,18,22,19,14,11,9,13,
         5,8,12,10,7,14,16,11,9,6,8,10,
         3,5,6,4,8,9,7,6,5,4,6,7]
groups = vcat(fill("Series A",12), fill("Series B",12), fill("Series C",12))
streamgraph(dates, yvals, groups)
```

## waterfall

```@docs
waterfall
```

```@example
using ECharts
waterfall(["Q1","Q2","Q3","Q4","Q5"], [2900, -1200, -300, -200, -900])
```
