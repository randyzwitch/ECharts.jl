# bollinger

```@docs
bollinger
```

```@example
using ECharts, Random, Dates
Random.seed!(42)
# Simulated closing prices
dates = Date(2024, 1, 1):Day(1):Date(2024, 6, 30)
dates = collect(dates)
prices = 100.0 .+ cumsum(randn(length(dates)))
ec = bollinger(dates, prices; window = 20, nstd = 2)
title!(ec, text = "Bollinger Bands (20-day, ±2σ)",
           subtext = "Simulated daily closing prices")
yaxis!(ec, name = "Price")
ec
```

```@example
using ECharts, Random
Random.seed!(7)
# Tighter bands with a shorter window
t = 1:80
y = 50 .+ 5 .* sin.(t ./ 5) .+ randn(80)
ec = bollinger(collect(t), collect(y); window = 10, nstd = 1.5,
               band_color = "#ee6666", raw_color = "#333333")
title!(ec, text = "Bollinger Bands (10-period, ±1.5σ)")
ec
```

```@example
using ECharts, DataFrames, Random, Dates
Random.seed!(99)
df = DataFrame(
    date  = Date(2024,1,1):Day(1):Date(2024,5,31),
    close = 200.0 .+ cumsum(randn(152)),
)
ec = bollinger(df, :date, :close; window = 20)
title!(ec, text = "Bollinger Bands — DataFrame method")
ec
```
