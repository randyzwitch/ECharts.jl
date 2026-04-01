# polar

```@docs
polar
```

```@example
using ECharts
t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2a) * cos(2a)) for a in angle]
polar(angle, radius)
```

```@example
using ECharts, DataFrames
t = 0:360
df = DataFrame(angle  = [a / 180 * pi for a in t],
               radius = [(sin(2a) * cos(2a)) for a in [a / 180 * pi for a in t]])
polar(df, :angle, :radius)
```

## Spiral plot

A spiral plot is just `polar` with angles beyond 360°. As the angle increases past one
full revolution the line continues outward, creating a spiral. The radius encodes the
data value at each step.

```@example spiral
using ECharts
# 4 full revolutions, 720 points
n = 720
angle  = range(0, 4 * 2π, length = n)
radius = range(0, 100, length = n)   # linearly growing radius → Archimedean spiral
ec = polar(angle, radius, showSymbol = false)
title!(ec, text = "Spiral Plot (Archimedean)")
ec
```

A data-driven spiral — daily temperature readings wrapped into a circular year view:

```@example spiral_data
using ECharts
# Simulate 2 years of daily high-temperature data (°C)
days = 1:(2*365)
temps = 15 .+ 12 .* sin.((days .- 80) .* 2π ./ 365) .+ randn(length(days))
angle  = (days .- 1) .* 2π ./ 365   # one revolution per year
ec = polar(angle, temps, showSymbol = false)
title!(ec, text = "Daily Temperature — 2-Year Spiral")
yaxis!(ec, name = "°C")
ec
```
