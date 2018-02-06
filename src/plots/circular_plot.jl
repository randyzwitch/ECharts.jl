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
function circular_plot(names::AbstractVector = [], values::AbstractVector = [];
            selected::Union{AbstractVector, Void} = nothing,
            radius::Union{AbstractVector, String, Void} = "80%",
            center::Union{AbstractVector, String, Void} = ["50%", "50%"],
            roseType::Union{String, Void} = nothing, # roseType = {"angle", "radius"}
            legend::Bool = false,
            kwargs...
            )

    # Set default to false if not passed by user
    selected == nothing ? selected = [false for x in 1:length(values)] : selected = selected

    ec = newplot(kwargs, ec_charttype = "circular")

    data_fmt = arrayofdicts(value = values, name = names, selected = selected)

    ec.series = [Series(name = "Series 1", _type = "pie", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
