# streamgraph

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
