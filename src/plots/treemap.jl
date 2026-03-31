"""
    treemap(data)

Creates an `EChart` treemap chart displaying hierarchical data as nested rectangles,
where rectangle size encodes a quantitative value.

## Methods
```julia
treemap(data::AbstractVector)
```

## Arguments
* `data` : hierarchical data as a vector of dicts, each with `name`, `value`, and
  optionally `children` for nested groups
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Examples
```julia
# Basic
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

# With title, tooltip, and custom color scheme
ec = treemap(data)
title!(ec, text = "Budget Allocation")
tooltip!(ec)
colorscheme!(ec, ("Tableau", 10))
```
"""
function treemap(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "treemap")
    ec.series = [TreemapSeries(data = data)]
    return ec
end
