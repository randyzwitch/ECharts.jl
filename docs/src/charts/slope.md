# slope

```@docs
slope
```

```@example
using ECharts
points = ["2015", "2023"]
# rows = series, columns = time points
vals = [4.6   3.0;
        10.4   7.3;
        22.1  12.2]
ec = slope(points, vals)
seriesnames!(ec, ["Germany", "France", "Spain"])
ec
```

From a DataFrame:

```@example df
using ECharts, DataFrames
df = DataFrame(
    country   = ["Germany", "France", "Spain", "Italy"],
    rate_2015 = [4.6, 10.4, 22.1, 11.9],
    rate_2023 = [3.0,  7.3, 12.2,  6.7],
)
ec = slope(df, :country, :rate_2015, :rate_2023)
title!(ec, text = "Unemployment Rate Change 2015 → 2023")
ec
```
