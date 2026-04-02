# marimekko

```@docs
marimekko
```

```@example
using ECharts
categories    = ["North", "South", "East", "West"]
subcategories = ["Product A", "Product B", "Product C"]
values = [40.0  30.0  20.0  10.0;
          25.0  35.0  15.0  25.0;
          35.0  35.0  65.0  65.0]
marimekko(categories, subcategories, values)
```

From a DataFrame (long format):

```@example df
using ECharts, DataFrames
df = DataFrame(
    region  = repeat(["North","South","East","West"], inner = 3),
    product = repeat(["A","B","C"], outer = 4),
    revenue = [40, 25, 35, 30, 35, 35, 20, 15, 65, 10, 25, 65],
)
ec = marimekko(df, :region, :product, :revenue)
title!(ec, text = "Revenue by Region and Product")
ec
```
