# sunburst

```@docs
sunburst
```

```@example
using ECharts
data = [
    Dict("name" => "Asia Pacific", "children" => [
        Dict("name" => "China",  "value" => 9.9),
        Dict("name" => "India",  "value" => 2.5),
        Dict("name" => "Japan",  "value" => 1.1),
        Dict("name" => "Other",  "value" => 3.2),
    ]),
    Dict("name" => "North America", "children" => [
        Dict("name" => "USA",    "value" => 4.8),
        Dict("name" => "Canada", "value" => 0.7),
        Dict("name" => "Mexico", "value" => 0.5),
    ]),
    Dict("name" => "Europe", "children" => [
        Dict("name" => "Russia", "value" => 1.7),
        Dict("name" => "Germany","value" => 0.7),
        Dict("name" => "UK",     "value" => 0.4),
        Dict("name" => "Other",  "value" => 1.5),
    ]),
    Dict("name" => "Rest of World", "value" => 4.2),
]
ec = sunburst(data)
title!(ec, text = "CO₂ Emissions by Region", subtext = "Gt CO₂, 2022")
ec
```
