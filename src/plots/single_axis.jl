"""
    singleaxis(x)

Creates an `EChart` scatter plot on a single axis — a one-dimensional display
useful for showing the distribution of values along a single dimension.

## Methods
```julia
singleaxis(x::AbstractVector{<:Union{Missing, Real}})
singleaxis(x::AbstractVector{String})
singleaxis(x::AbstractVector{<:Dates.TimeType})
singleaxis(df, x::Symbol)
```

## Arguments
* `symbol_size::Int = 10` : scatter point size in pixels
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Values are plotted along a horizontal axis. String and Date vectors produce a
category or time axis respectively; numeric vectors produce a value axis.
"""
function singleaxis(x::AbstractVector{<:Union{Missing, Real}};
                    symbol_size::Int = 10,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "singleaxis")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.singleAxis = SingleAxis(_type = "value")
    ec.series = [XYSeries(_type = "scatter",
                          coordinateSystem = "singleAxis",
                          symbolSize = symbol_size,
                          data = collect(x))]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    singleaxis(x)

Creates an `EChart` single-axis scatter plot with a category axis.
See the primary `singleaxis` method for full argument documentation.
"""
function singleaxis(x::AbstractVector{String};
                    symbol_size::Int = 10,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "singleaxis")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.singleAxis = SingleAxis(_type = "category", data = x)
    ec.series = [XYSeries(_type = "scatter",
                          coordinateSystem = "singleAxis",
                          symbolSize = symbol_size,
                          data = collect(x))]

    legend ? legend!(ec) : nothing
    return ec
end

singleaxis(x::AbstractVector{<:Dates.TimeType};
           symbol_size::Int = 10,
           legend::Bool = false,
           kwargs...) = singleaxis(string.(x); symbol_size = symbol_size,
                                   legend = legend, kwargs...)

"""
    singleaxis(df, x)

Creates an `EChart` single-axis scatter plot from a column in table `df`.
See the primary `singleaxis` method for full argument documentation.
"""
function singleaxis(df, x::Symbol;
                    symbol_size::Int = 10,
                    legend::Bool = false,
                    kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    singleaxis(_table_col(df, x); symbol_size = symbol_size, legend = legend, kwargs...)
end
