"""
    streamgraph(x, y, group)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
streamgraph(x::AbstractVector{String},y::AbstractVector{<:Union{Missing, Real}},
            group::AbstractVector)
streamgraph(x::AbstractVector{<:Union{Missing, Real}},
            y::AbstractVector{<:Union{Missing, Real}},
            group::AbstractVector)
streamgraph(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
streamgraph(x::AbstractVector{<:Dates.TimeType},y::AbstractVector{<:Union{Missing, Real}},             group::AbstractVector)
```

## Arguments
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
function streamgraph(x::AbstractVector{String},
                    y::AbstractVector{<:Union{Missing, Real}},
                    group::AbstractVector;
          legend::Bool = false,
          kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis(_type = "time")

    ec.series = [ThemeRiverSeries(data = data)]

    #need to modify legend!
    legend ? legend!(ec) : nothing

    return ec

end

"""
    streamgraph(x, y, group)

Creates an `EChart` streamgraph (theme river) with a numeric x-axis.
See the primary `streamgraph` method for full argument documentation.
"""
function streamgraph(x::AbstractVector{<:Union{Missing, Real}},
                     y::AbstractVector{<:Union{Missing, Real}},
                     group::AbstractVector;
          legend::Bool = false,
          kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis()

    ec.series = [ThemeRiverSeries(data = data)]

    #need to modify legend!
    legend ? legend!(ec) : nothing

    return ec

end

streamgraph(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
            legend::Bool = false,
            kwargs...) = streamgraph(df[x], df[y], df[group]; legend = legend, kwargs...)

streamgraph(x::AbstractVector{<:Dates.TimeType},
            y::AbstractVector{<:Union{Missing, Real}},
            group::AbstractVector;
            legend::Bool = false,
            kwargs...) = streamgraph(x, y, group; legend = legend, kwargs...)
