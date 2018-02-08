"""
    waterfall(x, y)

Creates an `EChart` representing the increase/decrease between two consecutive points.

## Methods
```julia
waterfall(x::AbstractVector, y::AbstractVector{<:Real})
```

## Arguments
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
x = 1:5
y = [2900, -1200, -300, -200, -900]
w = waterfall(x, y)
```
"""
function waterfall(x::AbstractVector, y::AbstractVector{<:Real};
 		legend::Bool = false,
 		scale::Bool = false,
 		kwargs...)

    #Need to add a value for total, since user passes in data values only
    labels = [string(x) for x in x]
    push!(labels, "total")

    #Calculate transparent series as base for stacking
    bottom = cumsum(y)
    bottom[1] = 0
    push!(bottom, 0)

    #Calculate actual waterfall
    top = abs.(y)
    push!(top, sum(y))

    ec = bar(labels, hcat(bottom, top), stack = true, legend = legend, scale = scale, kwargs...)
    #Make bottom series transparent
    ec.series[1].itemStyle = trans = ItemStyle(barBorderColor = "transparent", color = "transparent")

    return ec
end
