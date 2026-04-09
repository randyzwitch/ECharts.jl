# scatter

```@docs
scatter
```

```@example
using ECharts, DataFrames
male_height   = [174.0, 180.0, 177.0, 183.0, 170.0, 188.0, 175.0, 172.0, 178.0, 185.0]
male_weight   = [ 75.0,  85.0,  78.0,  90.0,  68.0,  95.0,  76.0,  72.0,  80.0,  88.0]
female_height = [160.0, 165.0, 158.0, 170.0, 155.0, 168.0, 162.0, 157.0, 164.0, 172.0]
female_weight = [ 52.0,  58.0,  50.0,  62.0,  48.0,  60.0,  54.0,  51.0,  57.0,  65.0]
df = DataFrame(
    height = vcat(male_height, female_height),
    weight = vcat(male_weight, female_weight),
    sex    = vcat(fill("Male", 10), fill("Female", 10)),
)
ec = scatter(df, :height, :weight, :sex)
title!(ec, text = "Height vs Weight", subtext = "20 subjects by sex (cm, kg)")
ec
```

```@example
using ECharts, Random
Random.seed!(42)
x = collect(1.0:0.5:10.0)
y = 1.8 .* x .+ 3.0 .+ randn(length(x)) .* 2
ec = scatter(x, y)
linreg!(ec, x, y; annotation = true)
title!(ec, text = "Simple Linear Regression", subtext = "OLS fit with 95% CI")
ec
```
