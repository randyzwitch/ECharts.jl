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
function streamgraph(x::AbstractVector{String},
                    y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                    group::AbstractVector;
          legend::Bool = false,
          kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis(_type = "time")

    ec.series = [Series(_type = "themeRiver", data = data)]

    #need to modify legend!
    legend? legend!(ec) : nothing

    return ec

end

function streamgraph(x::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                     y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                     group::AbstractVector;
          legend::Bool = false,
          kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis()

    ec.series = [Series(_type = "themeRiver", data = data)]

    #need to modify legend!
    legend? legend!(ec) : nothing

    return ec

end

streamgraph(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
            legend::Bool = false,
            kwargs...) = streamgraph(df[x], df[y], df[group]; legend = legend, kwargs...)
