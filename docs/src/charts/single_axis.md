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
# Global average temperature anomalies (°C above 1951–1980 baseline), 1995–2023
df = DataFrame(
    anomaly = [-0.21, 0.08, 0.14, 0.31, 0.16, 0.18, 0.32, 0.14,
                0.31, 0.16, 0.27, 0.45, 0.62, 0.29, 0.44, 0.54,
                0.68, 0.61, 0.65, 0.55, 0.58, 0.62, 0.74, 0.85,
                1.02, 0.92, 1.17, 1.01, 1.46],
)
ec = singleaxis(df, :anomaly)
title!(ec, text = "Global Temperature Anomalies", subtext = "°C above 1951–1980 baseline, 1995–2023")
ec
```
