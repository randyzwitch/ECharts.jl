# regplot

```@docs
regplot
```

```@example
using ECharts, Random
Random.seed!(42)
x = randn(80)
y = 1.5 .* x .+ 0.5 .+ randn(80)
ec = regplot(x, y)
title!(ec, text = "Regression Plot", subtext = "OLS fit with 95% confidence interval")
xaxis!(ec, name = "x")
yaxis!(ec, name = "y")
ec
```

```@example
using ECharts, Random
Random.seed!(7)
# ci = false — scatter + line only, no band
x = 1:30
y = 0.8 .* collect(x) .+ 5 .+ 3 .* randn(30)
ec = regplot(collect(Float64, x), Float64.(y); ci = false,
             scatter_color = "#ee6666", line_color = "#333333")
title!(ec, text = "Regression Plot — CI disabled")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(99)
df = DataFrame(
    weight = 50 .+ 30 .* rand(60),
    height = 150 .+ 0.5 .* (50 .+ 30 .* rand(60)) .+ 5 .* randn(60),
)
ec = regplot(df, :weight, :height)
title!(ec, text = "Height vs Weight", subtext = "DataFrame method")
ec
```
