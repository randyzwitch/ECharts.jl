# tree

```@docs
tree
```

## Left-to-right (default)

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
title!(ec, text = "Company Org Chart", subtext = "orient = \"LR\" (default)")
tooltip!(ec)
ec
```

## Top-to-bottom (`orient = "TB"`)

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
ec = tree(data; orient = "TB")
title!(ec, text = "Company Org Chart", subtext = "orient = \"TB\"")
tooltip!(ec)
ec
```

## Radial layout (`layout = "radial"`)

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
ec = tree(data; layout = "radial")
title!(ec, text = "Company Org Chart", subtext = "layout = \"radial\"")
tooltip!(ec)
ec
```
