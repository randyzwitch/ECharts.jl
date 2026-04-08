# linreg!

```@docs
linreg!
```

```@example
using ECharts, Random
Random.seed!(42)
x = randn(80)
y = 1.5 .* x .+ 0.5 .+ randn(80)
ec = scatter(x, y)
linreg!(ec, x, y; annotation = true)
title!(ec, text = "Linear Regression", subtext = "OLS fit with 95% confidence interval")
xaxis!(ec, name = "x")
yaxis!(ec, name = "y")
ec
```

```@example
using ECharts, Random
Random.seed!(7)
# ci = false — scatter + line only, no band
x = collect(Float64, 1:30)
y = 0.8 .* x .+ 5 .+ 3 .* randn(30)
ec = scatter(x, y)
linreg!(ec, x, y; ci = false, line_color = "#333333")
title!(ec, text = "Linear Regression — CI disabled")
ec
```
