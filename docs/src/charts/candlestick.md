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
df = DataFrame(
    date  = ["Jan 02","Jan 03","Jan 04","Jan 05","Jan 08",
             "Jan 09","Jan 10","Jan 11","Jan 12","Jan 16"],
    open  = [142.5, 141.1, 145.3, 150.2, 148.8, 147.2, 152.0, 155.6, 154.3, 158.9],
    close = [140.8, 144.7, 149.8, 148.1, 146.5, 151.3, 155.0, 153.8, 158.4, 156.9],
    low   = [139.2, 140.5, 144.1, 147.3, 145.0, 146.8, 151.2, 152.4, 153.0, 155.8],
    high  = [143.8, 145.2, 150.4, 151.5, 149.7, 152.1, 156.3, 156.8, 159.2, 159.7],
)
candlestick(df, :date, :open, :close, :low, :high)
```
