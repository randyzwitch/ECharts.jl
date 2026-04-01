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
