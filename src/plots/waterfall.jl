"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2})
area(df::AbstractDataFrame, x::Symbol, y::Symbol)
area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
area(k::KernelDensity.UnivariateKDE)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `fill::Union{Bool, AbstractVector} = true` : fill area below marks with color?
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y)
```
"""
function waterfall(x::AbstractVector, y::AbstractVector{<:Union{Int, AbstractFloat, Rational}};
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

    #Make bottom series transparent
    trans = ItemStyleOpts(barBorderColor = "transparent", color = "transparent")

    ec = bar(labels, hcat(bottom, top), stack = true, legend = legend, scale = scale, kwargs...)
    ec.series[1].itemStyle = ItemStyle(normal = trans, emphasis = trans )

    return ec
end
