# singleaxis

```@docs
singleaxis
```

```@example
using ECharts
# Marathon finish times (minutes) for a local race — clustered around common pacing groups
times = [178, 183, 191, 195, 202, 208, 213, 218, 225, 231,
         237, 244, 252, 261, 270, 279, 288, 301, 315, 342]
ec = singleaxis(times)
title!(ec, text = "Marathon Finish Time Distribution", subtext = "Minutes")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    finish_min = [178, 183, 191, 195, 202, 208, 213, 218, 225, 231,
                  237, 244, 252, 261, 270, 279, 288, 301, 315, 342],
)
singleaxis(df, :finish_min)
```
