"""
    effectscatter(x, y)

Creates an `EChart` effect scatter plot — a scatter chart with a ripple animation on each
point, useful for emphasising highlighted locations.

## Methods
```julia
effectscatter(x::AbstractVector{<:Real}, y::AbstractVector{<:Real})
effectscatter(x::AbstractVector{<:Real}, y::AbstractArray{<:Real,2})
effectscatter(df, x::Symbol, y::Symbol)
effectscatter(df, x::Symbol, y::Symbol, group::Symbol)
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

"""
    effectscatter(x, y)

Creates an `EChart` effect scatter plot from a 2-D array `y`, where each column is a separate
series sharing the same `x` values. Legend is displayed by default when multiple series are
present. See the primary `effectscatter` method for full argument documentation.
"""
function effectscatter(x::AbstractVector{<:Real}, y::AbstractArray{<:Real,2};
                       legend::Bool = true,
                       scale::Bool = false,
                       symbol_size::Int = 10,
                       kwargs...)

    ec = effectscatter(x, y[:,1]; legend = legend, scale = scale,
                       symbol_size = symbol_size, kwargs...)

    for i in 2:size(y)[2]
        push!(ec.series, EffectScatterSeries(data = arrayofarray(x, y[:,i]),
                                             symbolSize = symbol_size))
    end

    seriesnames!(ec)

    legend ? legend!(ec) : nothing

    return ec

end

"""
    effectscatter(df, x, y)

Creates an `EChart` effect scatter plot from columns `x` and `y` in table `df`.
Axis labels are set automatically from column names.
See the primary `effectscatter` method for full argument documentation.
"""
function effectscatter(df, x::Symbol, y::Symbol;
                       legend::Bool = false,
                       scale::Bool = false,
                       symbol_size::Int = 10,
                       kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    ec = effectscatter(_table_col(df, x), _table_col(df, y); legend = legend,
                       scale = scale, symbol_size = symbol_size, kwargs...)

    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))

    legend ? legend!(ec) : nothing

    return ec

end

"""
    effectscatter(df, x, y, group)

Creates an `EChart` effect scatter plot from table `df`, grouping series by the `group`
column. Legend is displayed by default when a group is provided.
See the primary `effectscatter` method for full argument documentation.
"""
function effectscatter(df, x::Symbol, y::Symbol, group::Symbol;
                       legend::Bool = true,
                       scale::Bool = false,
                       symbol_size::Int = 10,
                       kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    groups = _table_groupby(df, group)
    numgroups = length(groups)
    xcol = _table_col(df, x)
    ycol = _table_col(df, y)

    _, idx1 = groups[1]
    ec = effectscatter(xcol[idx1], ycol[idx1]; legend = legend, scale = scale,
                       symbol_size = symbol_size, kwargs...)

    for i in 2:numgroups
        _, idxi = groups[i]
        push!(ec.series, EffectScatterSeries(data = arrayofarray(xcol[idxi], ycol[idxi]),
                                             symbolSize = symbol_size))
    end

    seriesnames!(ec, [string(groups[i][1]) for i in 1:numgroups])

    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))

    legend ? legend!(ec) : nothing

    return ec

end
