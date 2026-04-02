# tree

```@docs
tree
```

```@example
using ECharts
data = Dict(
    "name" => "CEO",
    "children" => [
        Dict("name" => "CTO", "children" => [
            Dict("name" => "Engineering", "children" => [
                Dict("name" => "Frontend"),
                Dict("name" => "Backend"),
                Dict("name" => "DevOps"),
            ]),
            Dict("name" => "Data Science"),
        ]),
        Dict("name" => "CFO", "children" => [
            Dict("name" => "Accounting"),
            Dict("name" => "FP&A"),
        ]),
        Dict("name" => "CMO", "children" => [
            Dict("name" => "Marketing"),
            Dict("name" => "Sales"),
        ]),
    ],
)
ec = tree(data)
title!(ec, text = "Company Organization Chart")
tooltip!(ec)
ec
```
