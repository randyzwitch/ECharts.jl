# sunburst

```@docs
sunburst
```

```@example
using ECharts
data = [
    Dict("name" => "A", "value" => 10, "children" => [
        Dict("name" => "A1", "value" => 4),
        Dict("name" => "A2", "value" => 6),
    ]),
    Dict("name" => "B", "value" => 20, "children" => [
        Dict("name" => "B1", "value" => 12),
        Dict("name" => "B2", "value" => 8),
    ]),
]
sunburst(data)
```

With a title and custom color scheme:

```@example styled
using ECharts
data = [
    Dict("name" => "A", "value" => 10, "children" => [
        Dict("name" => "A1", "value" => 4),
        Dict("name" => "A2", "value" => 6),
    ]),
    Dict("name" => "B", "value" => 20, "children" => [
        Dict("name" => "B1", "value" => 12),
        Dict("name" => "B2", "value" => 8),
    ]),
]
ec = sunburst(data)
title!(ec, text = "Sales Breakdown")
colorscheme!(ec, ("Tableau", 10))
ec
```
