"""
    effectscatter(x, y)

Creates an `EChart` effect scatter plot — a scatter chart with a ripple animation on each
point, useful for emphasising highlighted locations.

## Methods
```julia
effectscatter(x::AbstractVector{<:Real}, y::AbstractVector{<:Real})
```

## Arguments
* `legend::Bool = false` : display legend?
* `scale::Bool = false` : show full axis range or truncated
* `symbol_size::Int = 10` : radius of each scatter symbol in pixels
* `kwargs` : varargs to set any field of resulting `EChart` struct
"""
function effectscatter(x::AbstractVector{<:Real}, y::AbstractVector{<:Real};
                       legend::Bool = false,
                       scale::Bool = false,
                       symbol_size::Int = 10,
                       kwargs...)

    ec = newplot(kwargs, ec_charttype = "effectscatter")
    ec.xAxis = [Axis(_type = "value", scale = scale)]
    ec.yAxis = [Axis(_type = "value", scale = scale)]
    ec.series = [EffectScatterSeries(name = "Series 1",
                                     data = arrayofarray(x, y),
                                     symbolSize = symbol_size)]

    legend ? legend!(ec) : nothing

    return ec

end
