# horizonchart

```@docs
horizonchart
```

```@example
using ECharts
# Simulated daily temperature anomaly (°C) over one year
t = 1:365
anomaly = sin.(2π .* t ./ 365) .* 3 .+ 0.8 .* randn(365)
ec = horizonchart(collect(t), anomaly; nbands = 3)
title!(ec, text = "Daily Temperature Anomaly (°C)",
           subtext = "Horizon chart — 3 bands, sequential blue")
ec
```

```@example
using ECharts, DataFrames
# Stock-price deviation from 30-day moving average
days = string.(1:120)
deviation = cumsum(0.5 .* randn(120))
df = DataFrame(day = days, dev = deviation)
ec = horizonchart(df, :day, :dev; nbands = 4)
title!(ec, text = "Price Deviation from 30-day MA")
ec
```
