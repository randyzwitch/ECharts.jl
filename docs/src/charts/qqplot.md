# qqplot

```@docs
qqplot
```

!!! note "ECharts.jl does not import Distributions.jl"
    `qqplot` accepts any object as its second argument as long as
    `quantile(dist, p)` is defined for `p ∈ (0, 1)`.
    [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) distributions
    satisfy this interface and are the most common choice, but you must load
    Distributions.jl yourself — ECharts.jl does not depend on it.

    ```julia
    using Distributions          # you bring the distribution
    qqplot(data, Normal())       # ECharts.jl just plots it
    ```

```@example
using ECharts, Distributions, Random
Random.seed!(42)
# Normal Q-Q plot: check whether data follows a normal distribution
data = randn(200)
ec = qqplot(data, Normal())
title!(ec, text = "Normal Q-Q Plot", subtext = "200 standard-normal samples")
ec
```

```@example
using ECharts, Distributions, Random
Random.seed!(7)
# Normal Q-Q plot: heavy-tailed data deviates from the reference line
heavy_tails = rand(TDist(3), 300)
ec = qqplot(heavy_tails, Normal())
title!(ec, text = "Normal Q-Q Plot — Heavy-Tailed Data",
           subtext = "t(3) samples: tails curve away from the Normal reference line")
ec
```

```@example
using ECharts, Distributions, Random
Random.seed!(99)
# Two-sample Q-Q plot: compare two groups directly (no distribution needed)
group_a = 5.0 .+ 1.0 .* randn(150)
group_b = 5.5 .+ 1.3 .* randn(200)
ec = qqplot(group_a, group_b)
title!(ec, text = "Two-Sample Q-Q Plot",
           subtext = "Group A vs Group B — points near the 45° line indicate similar distributions")
xaxis!(ec, name = "Group A quantiles")
yaxis!(ec, name = "Group B quantiles")
ec
```
