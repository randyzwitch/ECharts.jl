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
Random.seed!(42)
setosa     = 5.0 .+ 0.35 .* randn(50)
versicolor = 5.9 .+ 0.52 .* randn(50)
virginica  = 6.6 .+ 0.64 .* randn(50)
df = DataFrame(
    species = vcat(fill("I. setosa", 50), fill("I. versicolor", 50), fill("I. virginica", 50)),
    sepal_length = vcat(setosa, versicolor, virginica),
)
violin(df, :species, :sepal_length)
```
