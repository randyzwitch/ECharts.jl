# bump

```@docs
bump
```

```@example
using ECharts
periods = ["2019", "2020", "2021", "2022", "2023"]
values = [82.0 75.0 60.0;
          74.0 88.0 65.0;
          68.0 95.0 72.0;
          91.0 70.0 80.0;
          85.0 78.0 92.0]
bump(periods, values, names = ["Alpha", "Beta", "Gamma"])
```

From a DataFrame:

```@example df
using ECharts, DataFrames
df = DataFrame(
    year  = repeat(2019:2023, inner = 3),
    brand = repeat(["Alpha", "Beta", "Gamma"], outer = 5),
    sales = [82.0, 75.0, 60.0, 74.0, 88.0, 65.0,
             68.0, 95.0, 72.0, 91.0, 70.0, 80.0, 85.0, 78.0, 92.0],
)
ec = bump(df, :year, :sales, :brand)
title!(ec, text = "Brand Rankings Over Time")
ec
```
