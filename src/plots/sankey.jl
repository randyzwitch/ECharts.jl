"""
    sankey(names, source, target, value)

Creates an `EChart` diagram displaying the path and frequencies between nodes.

## Methods
```julia
sankey(names::AbstractVector, source::AbstractVector{<:Union{Missing, Int}},
    target::AbstractVector{<:Union{Missing, Int}}, value::AbstractVector{<:Union{Missing, Real}};
```

## Arguments
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

## Examples
```julia
name = ["Agricultural waste", "Bio-conversion", "Liquid", "Losses", "Solid", "Gas", "Biofuel imports",
    "Biomass imports", "Coal imports", "Coal"]
source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9, 9]
value = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]
s = sankey(name, source, target, value)
```
"""
function sankey(names::AbstractVector,
                source::AbstractVector{<:Union{Missing, Int}},
                target::AbstractVector{<:Union{Missing, Int}},
                value::AbstractVector{<:Union{Missing, Real}};
                kwargs...)

    ec = newplot(kwargs, ec_charttype = "sankey")
    ec.series = [SankeySeries(name = "Series 1", layout = "none", data = arrayofdicts(name = names),
        links = arrayofdicts(source = source, target = target, value = value))]

    return ec

end
