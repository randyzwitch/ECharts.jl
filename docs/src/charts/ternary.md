# ternary

```@docs
ternary
```

```@example
using ECharts, DataFrames

# Soil texture classification data (sand / silt / clay proportions)
df = DataFrame(
    sand  = [0.70, 0.55, 0.45, 0.30, 0.20, 0.60, 0.40, 0.25, 0.15, 0.50],
    silt  = [0.15, 0.25, 0.35, 0.45, 0.50, 0.20, 0.40, 0.50, 0.60, 0.30],
    clay  = [0.15, 0.20, 0.20, 0.25, 0.30, 0.20, 0.20, 0.25, 0.25, 0.20],
    class = ["Sandy", "Sandy Loam", "Loam", "Silt Loam", "Silt",
             "Sandy", "Loam", "Silt Loam", "Silty Clay Loam", "Sandy Loam"],
)

ec = ternary(df, :sand, :silt, :clay, :class; symbolSize = 10)
title!(ec, text = "Soil Texture Classification", subtext = "Sand / Silt / Clay proportions")
ec
```
