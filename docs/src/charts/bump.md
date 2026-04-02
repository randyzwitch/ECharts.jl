# bump

```@docs
bump
```

```@example
using ECharts
years    = ["2019", "2020", "2021", "2022", "2023", "2024"]
# Subscriber counts (millions) — higher value = higher rank
netflix  = [167, 204, 222, 231, 260, 269]
disney   = [  0,  95, 130, 152, 150, 153]
amazon   = [150, 175, 200, 168, 200, 215]
hbomax   = [ 38,  61,  73, 122,  95, 110]
hulu     = [ 28,  39,  43,  48,  50,  51]
values   = hcat(netflix, disney, amazon, hbomax, hulu)
ec = bump(years, Float64.(values), names = ["Netflix", "Disney+", "Amazon", "HBO Max", "Hulu"])
title!(ec, text = "Streaming Service Subscribers", subtext = "Millions of paid subscribers")
ec
```

From a DataFrame:

```@example df
using ECharts, DataFrames
services = ["Netflix", "Disney+", "Amazon", "HBO Max", "Hulu"]
years    = repeat(2019:2024, inner = 5)
subs     = [167, 0, 150, 38, 28,
            204, 95, 175, 61, 39,
            222, 130, 200, 73, 43,
            231, 152, 168, 122, 48,
            260, 150, 200, 95, 50,
            269, 153, 215, 110, 51]
df = DataFrame(year = years, service = repeat(services, outer = 6), subscribers = Float64.(subs))
ec = bump(df, :year, :subscribers, :service)
title!(ec, text = "Streaming Service Subscribers", subtext = "Millions of paid subscribers")
ec
```
