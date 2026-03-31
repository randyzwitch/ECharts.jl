# tree

```@docs
tree
```

```@example
using ECharts
data = Dict(
    "name" => "root",
    "children" => [
        Dict("name" => "A", "children" => [
            Dict("name" => "A1"),
            Dict("name" => "A2"),
        ]),
        Dict("name" => "B", "children" => [
            Dict("name" => "B1"),
        ]),
    ]
)
tree(data)
```

With a title and tooltip:

```@example styled
using ECharts
data = Dict(
    "name" => "root",
    "children" => [
        Dict("name" => "A", "children" => [
            Dict("name" => "A1"),
            Dict("name" => "A2"),
        ]),
        Dict("name" => "B", "children" => [
            Dict("name" => "B1"),
        ]),
    ]
)
ec = tree(data)
title!(ec, text = "Org Chart")
tooltip!(ec)
ec
```
