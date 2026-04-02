# polar

```@docs
polar
```

A four-leaf rose curve — a classic example of a polar equation:

```@example
using ECharts
t     = 0:360
angle = [a / 180 * π for a in t]
r     = [sin(2a) * cos(2a) for a in angle]
ec = polar(angle, r)
title!(ec, text = "Four-Leaf Rose Curve", subtext = "r = sin(2θ)·cos(2θ)")
ec
```

## Spiral plot

A spiral plot is `polar` with angles beyond 360°. As the angle increases past one
full revolution the line continues outward, creating a spiral. The radius encodes the
data value at each step.

```@example spiral
using ECharts
# 4 full revolutions, 720 points
n      = 720
angle  = range(0, 4 * 2π, length = n)
radius = range(0, 100, length = n)   # linearly growing radius → Archimedean spiral
ec = polar(angle, radius, showSymbol = false)
title!(ec, text = "Spiral Plot (Archimedean)")
ec
```

A data-driven spiral — daily temperature readings wrapped into a circular year view:

```@example spiral_data
using ECharts, Random
Random.seed!(42)
days   = 1:(2 * 365)
temps  = 15 .+ 12 .* sin.((days .- 80) .* 2π ./ 365) .+ randn(length(days))
angle  = (days .- 1) .* 2π ./ 365   # one revolution per year
ec = polar(angle, temps, showSymbol = false)
title!(ec, text = "Daily Temperature — 2-Year Spiral", subtext = "°C")
ec
```
