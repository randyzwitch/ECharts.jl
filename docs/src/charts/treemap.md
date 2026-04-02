# treemap

```@docs
treemap
```

```@example
using ECharts
data = [
    Dict("name" => "Americas", "value" => 0, "children" => [
        Dict("name" => "United States", "value" => 25500),
        Dict("name" => "Brazil",        "value" =>  2080),
        Dict("name" => "Canada",        "value" =>  2140),
        Dict("name" => "Mexico",        "value" =>  1320),
    ]),
    Dict("name" => "Asia Pacific", "value" => 0, "children" => [
        Dict("name" => "China",   "value" => 17900),
        Dict("name" => "Japan",   "value" =>  4230),
        Dict("name" => "India",   "value" =>  3730),
        Dict("name" => "S. Korea","value" =>  1710),
    ]),
    Dict("name" => "Europe", "value" => 0, "children" => [
        Dict("name" => "Germany", "value" => 4080),
        Dict("name" => "UK",      "value" => 3080),
        Dict("name" => "France",  "value" => 2780),
        Dict("name" => "Italy",   "value" => 2010),
        Dict("name" => "Russia",  "value" => 1860),
    ]),
]
ec = treemap(data)
title!(ec, text = "GDP by Country", subtext = "USD billions, 2023")
ec
```
