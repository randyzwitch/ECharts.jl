# jointplot

```@docs
jointplot
```

```@example
using ECharts, Random
Random.seed!(42)
# Bivariate normal — correlated x and y
n = 300
x = randn(n)
y = 0.7 .* x .+ 0.7 .* randn(n)
ec = jointplot(x, y)
title!(ec, text = "Joint Distribution — Correlated Normal",
           subtext = "Scatter with marginal histograms (n = 300)")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(7)
df = DataFrame(
    sepal_length = 4.5 .+ 1.5 .* rand(150),
    sepal_width  = 2.0 .+ 1.5 .* rand(150),
)
ec = jointplot(df, :sepal_length, :sepal_width; nbins = 20)
title!(ec, text = "Sepal Length vs Width")
ec
```
