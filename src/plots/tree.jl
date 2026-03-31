"""
    tree(data)

Creates an `EChart` tree chart displaying hierarchical data as a connected node diagram.

## Methods
```julia
tree(data::AbstractDict)
```

## Arguments
* `data` : hierarchical data as a dict with `name` and `children` keys, where
  `children` is a vector of dicts with the same structure
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Examples
```julia
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
"""
function tree(data::AbstractDict; kwargs...)
    ec = newplot(kwargs, ec_charttype = "tree")
    ec.series = [TreeSeries(data = [data])]
    return ec
end
