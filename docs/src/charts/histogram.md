# histogram

```@docs
histogram
```

```@example
using ECharts, StatsBase, Random
Random.seed!(42)
# Simulate adult male heights (cm) — approximately N(178, 7²)
heights = 178 .+ 7 .* randn(2000)
h = fit(Histogram, heights, nbins = 30)
ec = histogram(h)
title!(ec, text = "Adult Male Height Distribution", subtext = "n = 2,000 simulated subjects (cm)")
ec
```
