# choropleth

```@docs
choropleth
```

```@example
using ECharts

countries = ["China", "United States", "Brazil", "Russia", "Canada",
             "Australia", "India", "Argentina", "Kazakhstan", "Algeria",
             "Democratic Republic of the Congo", "Saudi Arabia", "Mexico",
             "Indonesia", "Sudan", "Libya", "Iran", "Mongolia",
             "Peru", "Chad"]

gdp_per_capita = [12720, 63530, 8920, 12890, 51990,
                  54890, 2410, 10620, 9690, 3490,
                  590, 23050, 10050, 4310, 590, 6530,
                  5260, 3730, 6710, 660]

ec = choropleth(countries, gdp_per_capita; map = "world")
title!(ec, text = "GDP per Capita (USD)", subtext = "Selected Countries")
ec
```
