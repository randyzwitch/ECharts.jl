"""
    lollipop(x, y)

Creates an `EChart` lollipop chart — a variant of a bar chart where each value is shown
as a dot (circle) connected to the baseline by a thin line, rather than a filled bar.
Lollipop charts reduce visual clutter when comparing many categories.

## Methods
```julia
lollipop(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
lollipop(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
lollipop(df, x::Symbol, y::Symbol)
lollipop(df, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `dot_size::Int = 10` : diameter of the dot at the tip of each lollipop (pixels)
* `stem_width::Int = 2` : pixel width of the stem line
* `legend::Bool` : display legend? Defaults to `true` for multi-series inputs
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Each lollipop is rendered as a scatter series (the dot) combined with a zero-width bar
series (the stem). The stem color automatically matches the dot color via the ECharts
color palette.

# Examples
```@example
using ECharts
categories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
values = [120, 200, 150, 80, 70, 110, 130]
lollipop(categories, values)
```
"""
function lollipop(x::AbstractVector,
                  y::AbstractVector{<:Union{Missing, Real}};
                  dot_size::Int = 10,
                  stem_width::Int = 2,
                  legend::Bool = false,
                  kwargs...)

    ydata = collect(y)
    ec = newplot(kwargs, ec_charttype = "lollipop")
    ec.xAxis = [Axis(_type = "category", data = string.(x))]
    ec.yAxis = [Axis(_type = "value")]

    stem = XYSeries(
        name      = "Series 1",
        _type     = "bar",
        barWidth  = stem_width,
        data      = ydata,
        itemStyle = ItemStyle(color = "inherit"),
    )
    dot = XYSeries(
        name       = "Series 1",
        _type      = "scatter",
        symbolSize = dot_size,
        data       = ydata,
    )
    ec.series = [stem, dot]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    lollipop(x, y)

Creates an `EChart` lollipop chart from a 2-D array `y`, where each column is a
separate series. Legend is displayed by default when multiple series are present.
See the primary `lollipop` method for full argument documentation.
"""
function lollipop(x::AbstractVector,
                  y::AbstractArray{<:Union{Missing, Real},2};
                  dot_size::Int = 10,
                  stem_width::Int = 2,
                  legend::Bool = true,
                  kwargs...)

    n_series = size(y, 2)
    ec = lollipop(x, y[:, 1]; dot_size = dot_size, stem_width = stem_width,
                  legend = false, kwargs...)

    for i in 2:n_series
        ydata = collect(y[:, i])
        push!(ec.series,
              XYSeries(_type = "bar", barWidth = stem_width,
                       data = ydata, itemStyle = ItemStyle(color = "inherit")))
        push!(ec.series,
              XYSeries(_type = "scatter", symbolSize = dot_size, data = ydata))
    end

    # Name only the scatter series (every second series is the visible dot)
    names = ["Series $i" for i in 1:n_series]
    for (i, s) in enumerate(ec.series)
        s._type == "scatter" ? s.name = names[ceil(Int, i / 2)] : s.name = ""
    end

    legend ? legend!(ec) : nothing
    return ec
end

"""
    lollipop(df, x, y)

Creates an `EChart` lollipop chart from a single column `y` in table `df` against column `x`.
See the primary `lollipop` method for full argument documentation.
"""
function lollipop(df, x::Symbol, y::Symbol;
                  dot_size::Int = 10,
                  stem_width::Int = 2,
                  legend::Bool = false,
                  kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    lollipop(_table_col(df, x), _table_col(df, y);
             dot_size = dot_size, stem_width = stem_width, legend = legend, kwargs...)
end

"""
    lollipop(df, x, y, group)

Creates an `EChart` lollipop chart from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `lollipop` method for full argument documentation.
"""
function lollipop(df, x::Symbol, y::Symbol, group::Symbol;
                  dot_size::Int = 10,
                  stem_width::Int = 2,
                  legend::Bool = true,
                  kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    xvals, mat, group_names = _table_unstack(df, x, group, y)
    mat_float = map(v -> ismissing(v) ? missing : Float64(v), mat)
    ec = lollipop(xvals, mat_float; dot_size = dot_size, stem_width = stem_width,
                  legend = false, kwargs...)

    scatter_idx = [i for (i, s) in enumerate(ec.series) if s._type == "scatter"]
    for (i, idx) in enumerate(scatter_idx)
        ec.series[idx].name = group_names[i]
    end
    for s in ec.series
        s._type == "bar" ? s.name = "" : nothing
    end

    legend ? legend!(ec) : nothing
    return ec
end
