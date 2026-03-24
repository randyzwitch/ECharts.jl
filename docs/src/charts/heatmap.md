# heatmap

```@docs
heatmap
```

```@example
using ECharts, StatsBase
h = fit(Histogram, (randn(10000), randn(10000)), nbins = 20)
heatmap(h)
```
