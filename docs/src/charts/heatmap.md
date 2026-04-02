# heatmap

```@docs
heatmap
```

```@example
using ECharts, StatsBase, Random
Random.seed!(42)
# Simulate height (cm) and weight (kg) for 10,000 people
height = 170 .+ 10 .* randn(10000)
weight =  70 .+ 15 .* randn(10000)
h = fit(Histogram, (height, weight), nbins = 25)
ec = heatmap(h)
title!(ec, text = "Height vs Weight Distribution", subtext = "10,000 simulated subjects")
ec
```
