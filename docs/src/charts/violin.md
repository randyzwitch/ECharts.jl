# violin

```@docs
violin
```

```@example
using ECharts, Random
Random.seed!(42)
# Sepal length (cm) for three iris species
setosa     = 5.0 .+ 0.35 .* randn(50)
versicolor = 5.9 .+ 0.52 .* randn(50)
virginica  = 6.6 .+ 0.64 .* randn(50)
groups = vcat(fill("I. setosa", 50), fill("I. versicolor", 50), fill("I. virginica", 50))
values = vcat(setosa, versicolor, virginica)
ec = violin(groups, values)
title!(ec, text = "Iris Sepal Length by Species", subtext = "cm (n = 50 per species)")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(99)
basic    = clamp.(7.5 .+ 1.9 .* randn(60), 1.0, 10.0)
standard = clamp.(7.5 .+ 1.9 .* randn(60), 1.0, 10.0)
premium  = clamp.(7.5 .+ 1.9 .* randn(60), 1.0, 10.0)
# shift means to represent different satisfaction levels
basic    = clamp.(basic .- 1.8, 1.0, 10.0)
standard = clamp.(standard .+ 0.0, 1.0, 10.0)
premium  = clamp.(premium .+ 1.2, 1.0, 10.0)
df = DataFrame(
    tier  = vcat(fill("Basic", 60), fill("Standard", 60), fill("Premium", 60)),
    score = vcat(basic, standard, premium),
)
ec = violin(df, :tier, :score)
title!(ec, text = "Customer Satisfaction by Subscription Tier", subtext = "NPS score 1–10, n = 60 per tier")
ec
```
