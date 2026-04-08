# differencearea

```@docs
differencearea
```

```@example
using ECharts
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
temperature_high = [3,  5, 10, 16, 21, 26, 29, 28, 23, 17, 10,  4]
temperature_low  = [-3, -1,  4,  9, 14, 18, 21, 20, 15,  9,  3, -2]
ec = differencearea(months, temperature_high, temperature_low,
                    y1_name = "High", y2_name = "Low")
title!(ec, text = "Monthly Temperature Range",
           subtext = "Blue = high above low  |  Red = low above high (impossible here, illustrative)")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    quarter  = ["Q1 2021","Q2 2021","Q3 2021","Q4 2021",
                "Q1 2022","Q2 2022","Q3 2022","Q4 2022"],
    revenue  = [120, 145, 160, 175, 155, 170, 190, 210],
    expenses = [130, 135, 150, 160, 165, 155, 180, 200],
)
ec = differencearea(df, :quarter, :revenue, :expenses)
title!(ec, text = "Revenue vs Expenses",
           subtext = "Blue = revenue ahead  |  Red = expenses ahead")
ec
```
