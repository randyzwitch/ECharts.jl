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
