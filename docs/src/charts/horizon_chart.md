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

## Multi-row horizon chart

```@example
using ECharts, Random
Random.seed!(42)
# 12 monthly temperature anomaly series (different weather stations)
n = 120
t = collect(1:n)
stations = ["Station $i" for i in 1:12]
Y = [sin.(2π .* t ./ 12 .+ 0.3i) .* (1 + 0.3i) .+ 0.4 .* randn(n) for i in 1:12]
ec = horizonchart(t, Y; names = stations, nbands = 3, row_height = 50)
title!(ec, text = "Monthly Temperature Anomaly by Station")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(7)
# Cumulative returns for several assets — shared_scale makes magnitudes comparable
n = 200
days = string.(1:n)
tickers = [:AAPL, :GOOG, :MSFT, :AMZN, :TSLA, :NVDA]
df = DataFrame(day = days)
for tk in tickers
    df[!, tk] = cumsum(0.015 .* randn(n))
end
ec = horizonchart(df, :day, tickers; shared_scale = true, nbands = 3, row_height = 55)
title!(ec, text = "Cumulative Returns — shared scale")
ec
```

```@example
using ECharts, DataFrames, Random
Random.seed!(99)
# Same data with a Reds palette instead of the default Blues
n = 200
days = string.(1:n)
tickers = [:AAPL, :GOOG, :MSFT, :AMZN, :TSLA, :NVDA]
df = DataFrame(day = days)
for tk in tickers
    df[!, tk] = cumsum(0.015 .* randn(n))
end
ec = horizonchart(df, :day, tickers; palette = "Reds", shared_scale = true, nbands = 3, row_height = 55)
title!(ec, text = "Cumulative Returns — Reds palette")
ec
```
