# slope

```@docs
slope
```

```@example
using ECharts
points = ["2015", "2023"]
vals   = [4.6   3.0;   # Germany
          10.4   7.3;   # France
          22.1  12.2;   # Spain
          11.9   6.7]   # Italy
ec = slope(points, vals)
seriesnames!(ec, ["Germany", "France", "Spain", "Italy"])
title!(ec, text = "Unemployment Rate Change", subtext = "2015 → 2023 (%)")
ec
```

From a DataFrame:

```@example df
using ECharts, DataFrames
df = DataFrame(
    country   = ["Germany", "France", "Spain", "Italy", "Portugal"],
    rate_2015 = [4.6, 10.4, 22.1, 11.9, 12.4],
    rate_2023 = [3.0,  7.3, 12.2,  6.7,  6.5],
)
ec = slope(df, :country, :rate_2015, :rate_2023)
title!(ec, text = "Unemployment Rate Change 2015 → 2023", subtext = "%")
ec
```
