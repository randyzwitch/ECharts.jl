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
function gauge(x::Union{Missing, Int, AbstractFloat, Rational};
               breakpoints::AbstractVector = [0.2, 0.8, 1],
               colors::AbstractVector = ["#91c7ae", "#63869e", "#c23531"],
               kwargs...)

    length(breakpoints) != length(colors)? error("breakpoints and colors vectors need to have the same length."): nothing

    ec = newplot(kwargs, ec_charttype = "gauge")

    ec.series = [Series(name = "Series 1",
                        _type = "gauge",
                        data = [Dict("value" => x)],
                        axisLine = AxisLine(lineStyle = LineStyle(width = 10, color = [[b,c] for (b,c) in zip(breakpoints, colors)]))
                        )
                ]

    return ec

end
