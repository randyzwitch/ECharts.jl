# bollinger!

```@docs
bollinger!
```

```@example
using ECharts, Random, Dates
Random.seed!(42)
dates  = collect(Date(2024, 1, 1):Day(1):Date(2024, 6, 30))
open   = 100.0 .+ cumsum(randn(length(dates)))
close  = open  .+ randn(length(dates))
low    = min.(open, close) .- abs.(randn(length(dates)))
high   = max.(open, close) .+ abs.(randn(length(dates)))
ec = candlestick(dates, open, close, low, high)
bollinger!(ec, close; window = 20, nstd = 2)
legend!(ec)
title!(ec, text = "Candlestick with Bollinger Bands (20-day, ±2σ)")
ec
```
