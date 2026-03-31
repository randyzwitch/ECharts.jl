# treemap

```@docs
treemap
```

```@example
using ECharts
data = [
    Dict("name" => "Group A", "value" => 40, "children" => [
        Dict("name" => "Item A1", "value" => 25),
        Dict("name" => "Item A2", "value" => 15),
    ]),
    Dict("name" => "Group B", "value" => 35, "children" => [
        Dict("name" => "Item B1", "value" => 20),
        Dict("name" => "Item B2", "value" => 15),
    ]),
    Dict("name" => "Group C", "value" => 25),
]
treemap(data)
```

With a title, tooltip, and custom color scheme:

```@example styled
using ECharts
data = [
    Dict("name" => "Group A", "value" => 40, "children" => [
        Dict("name" => "Item A1", "value" => 25),
        Dict("name" => "Item A2", "value" => 15),
    ]),
    Dict("name" => "Group B", "value" => 35, "children" => [
        Dict("name" => "Item B1", "value" => 20),
        Dict("name" => "Item B2", "value" => 15),
    ]),
    Dict("name" => "Group C", "value" => 25),
]
ec = treemap(data)
title!(ec, text = "Budget Allocation")
tooltip!(ec)
colorscheme!(ec, ("Tableau", 10))
ec
```
