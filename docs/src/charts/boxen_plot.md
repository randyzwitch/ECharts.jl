# boxenplot

```@docs
boxenplot
```

```@example
using ECharts, RDatasets
diamonds = dataset("ggplot2", "diamonds")

# Single distribution of diamond prices
ec = boxenplot(diamonds, :Price)
flip!(ec)
title!(ec, text = "Distribution of Diamond Prices",
           subtext = "diamonds dataset — n = 53,940")
ec
```

```@example
using ECharts, RDatasets
diamonds = dataset("ggplot2", "diamonds")

# Price distribution broken out by clarity grade
ec = boxenplot(diamonds, :Price, :Clarity)
flip!(ec)
title!(ec, text = "Diamond Price by Clarity",
           subtext = "I1 (worst) → IF (best)")
ec
```

```@example
using ECharts, RDatasets
diamonds = dataset("ggplot2", "diamonds")

# Split by carat size: ≤ 1 ct vs > 1 ct, within each clarity grade
small = diamonds[diamonds.Carat .<= 1, :]
large = diamonds[diamonds.Carat .>  1, :]

clarity_levels = ["I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"]

small_vecs = [small.Price[small.Clarity .== c] for c in clarity_levels]
large_vecs = [large.Price[large.Clarity .== c] for c in clarity_levels]

# Interleave small/large for each clarity so they sit side-by-side
vecs  = vcat([[s, l] for (s, l) in zip(small_vecs, large_vecs)]...)
labels = vcat([["$c ≤1ct", "$c >1ct"] for c in clarity_levels]...)

ec = boxenplot(vecs; names = labels)
flip!(ec)
title!(ec, text = "Diamond Price by Clarity and Carat Size",
           subtext = "Each clarity grade split by carat ≤ 1 vs > 1")
ec
```
