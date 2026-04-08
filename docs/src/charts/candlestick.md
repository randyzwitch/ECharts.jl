# candlestick (OHLC)

!!! note "OHLC charts"
    Candlestick charts and OHLC (Open-High-Low-Close) charts display the same
    four-value financial data. `candlestick` is the ECharts native implementation
    of this chart type; there is no separate `ohlc` function.

```@docs
candlestick
```

```@example
using ECharts
dates  = ["Jan 02","Jan 03","Jan 04","Jan 05","Jan 08","Jan 09","Jan 10",
          "Jan 11","Jan 12","Jan 16","Jan 17","Jan 18","Jan 19","Jan 22",
          "Jan 23","Jan 24","Jan 25","Jan 26","Jan 29","Jan 30"]
open_  = [142.5, 141.1, 145.3, 150.2, 148.8, 147.2, 152.0, 155.6, 154.3, 158.9,
          157.2, 160.4, 163.1, 161.8, 165.0, 168.2, 166.7, 164.5, 169.3, 172.1]
close_ = [140.8, 144.7, 149.8, 148.1, 146.5, 151.3, 155.0, 153.8, 158.4, 156.9,
          160.1, 162.7, 161.2, 164.6, 167.8, 166.1, 163.9, 168.8, 171.6, 174.3]
low_   = [139.2, 140.5, 144.1, 147.3, 145.0, 146.8, 151.2, 152.4, 153.0, 155.8,
          156.3, 159.7, 160.5, 160.9, 163.8, 165.4, 162.8, 163.1, 168.5, 171.4]
high_  = [143.8, 145.2, 150.4, 151.5, 149.7, 152.1, 156.3, 156.8, 159.2, 159.7,
          161.0, 163.5, 164.4, 165.1, 168.3, 169.0, 167.5, 169.5, 172.8, 175.6]
ec = candlestick(dates, open_, close_, low_, high_)
title!(ec, text = "Stock Price — January 2024", subtext = "Daily OHLC")
ec
```

```@example
using ECharts, DataFrames
# WTI crude oil — weekly bars, Q1 2024
df = DataFrame(
    week  = ["Jan 08", "Jan 15", "Jan 22", "Jan 29", "Feb 05",
             "Feb 12", "Feb 20", "Feb 26", "Mar 04", "Mar 11"],
    open  = [73.8, 72.9, 74.6, 77.1, 76.4, 76.9, 79.3, 78.1, 79.7, 77.5],
    close = [72.6, 74.2, 76.8, 76.0, 76.7, 79.0, 77.8, 79.6, 77.3, 80.9],
    low   = [71.4, 72.3, 74.0, 75.2, 75.8, 76.5, 77.2, 77.9, 76.9, 77.1],
    high  = [74.5, 74.8, 77.4, 77.8, 77.3, 79.4, 79.9, 80.1, 80.2, 81.3],
)
ec = candlestick(df, :week, :open, :close, :low, :high)
title!(ec, text = "WTI Crude Oil — Q1 2024", subtext = "Weekly OHLC, USD per barrel")
ec
```

```@example
using ECharts
# 60 trading days of synthetic price data (enough for a 20-day window)
dates = ["Day $(lpad(i,2,'0'))" for i in 1:60]
close_ = cumsum(randn(60)) .+ 150.0
open_  = close_ .+ randn(60)
low_   = min.(open_, close_) .- abs.(randn(60))
high_  = max.(open_, close_) .+ abs.(randn(60))
ec = candlestick(dates, open_, close_, low_, high_)
bollinger!(ec, close_)
title!(ec, text = "Synthetic Stock — Bollinger Bands", subtext = "20-day window, ±2σ")
ec
```
