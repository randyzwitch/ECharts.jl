"""
    differencearea(x, y1, y2)

Creates an `EChart` difference area chart showing two lines with the area between them
filled in two colors: one color where `y1 > y2`, another where `y2 > y1`.

## Methods
```julia
differencearea(x::AbstractVector, y1::AbstractVector{<:Union{Missing,Real}}, y2::AbstractVector{<:Union{Missing,Real}})
differencearea(x::AbstractVector{<:Dates.TimeType}, y1, y2)
differencearea(df, x::Symbol, y1::Symbol, y2::Symbol)
```

## Arguments
* `y1_name::String = "y1"` : legend label for the first series
* `y2_name::String = "y2"` : legend label for the second series
* `pos_color::String = "#5470c6"` : fill color for regions where y1 > y2
* `neg_color::String = "#ee6666"` : fill color for regions where y2 > y1
* `legend::Bool = true` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

The fill is implemented via a stacked-area decomposition entirely in Julia —
ECharts has no native difference-area type. For each point, the data range is split
into a transparent base and a colored band so that the shaded region appears only
between the two lines.  The four band series are invisible in the legend; only the
two visible line series (`y1_name` and `y2_name`) appear there.
"""
function differencearea(x::AbstractVector,
                        y1::AbstractVector{<:Union{Missing, Real}},
                        y2::AbstractVector{<:Union{Missing, Real}};
                        y1_name::String   = "y1",
                        y2_name::String   = "y2",
                        pos_color::String = "#5470c6",
                        neg_color::String = "#ee6666",
                        legend::Bool      = true,
                        scale::Bool       = false,
                        kwargs...)

    length(x) == length(y1) == length(y2) ||
        throw(ArgumentError("x, y1, and y2 must have the same length"))

    # Pre-compute band arrays
    base_pos = [y1[i] !== missing && y2[i] !== missing && Float64(y1[i]) >= Float64(y2[i]) ?
                Float64(y2[i]) : 0.0 for i in eachindex(y1)]
    diff_pos = [y1[i] !== missing && y2[i] !== missing ?
                max(Float64(y1[i]) - Float64(y2[i]), 0.0) : 0.0 for i in eachindex(y1)]
    base_neg = [y1[i] !== missing && y2[i] !== missing && Float64(y2[i]) > Float64(y1[i]) ?
                Float64(y1[i]) : 0.0 for i in eachindex(y1)]
    diff_neg = [y1[i] !== missing && y2[i] !== missing ?
                max(Float64(y2[i]) - Float64(y1[i]), 0.0) : 0.0 for i in eachindex(y1)]

    xs = string.(x)

    ec = newplot(kwargs, ec_charttype = "differencearea")
    ec.xAxis = [Axis(_type = "category", data = xs, boundaryGap = false)]
    ec.yAxis = [Axis(_type = "value", scale = scale)]

    ec.series = [
        # Band series — invisible in legend
        XYSeries(
            name        = "",
            _type       = "line",
            stack       = "pos",
            data        = base_pos,
            areaStyle   = AreaStyle(opacity = 0.0),
            lineStyle   = LineStyle(width = 0),
            showSymbol  = false,
            legendHoverLink = false,
            silent      = true,
        ),
        XYSeries(
            name        = "",
            _type       = "line",
            stack       = "pos",
            data        = diff_pos,
            areaStyle   = AreaStyle(color = pos_color),
            lineStyle   = LineStyle(width = 0),
            showSymbol  = false,
            legendHoverLink = false,
            silent      = true,
        ),
        XYSeries(
            name        = "",
            _type       = "line",
            stack       = "neg",
            data        = base_neg,
            areaStyle   = AreaStyle(opacity = 0.0),
            lineStyle   = LineStyle(width = 0),
            showSymbol  = false,
            legendHoverLink = false,
            silent      = true,
        ),
        XYSeries(
            name        = "",
            _type       = "line",
            stack       = "neg",
            data        = diff_neg,
            areaStyle   = AreaStyle(color = neg_color),
            lineStyle   = LineStyle(width = 0),
            showSymbol  = false,
            legendHoverLink = false,
            silent      = true,
        ),
        # Visible line series
        XYSeries(
            name      = y1_name,
            _type     = "line",
            data      = Float64.(coalesce.(y1, NaN)),
            showSymbol = false,
            smooth    = false,
        ),
        XYSeries(
            name      = y2_name,
            _type     = "line",
            data      = Float64.(coalesce.(y2, NaN)),
            showSymbol = false,
            smooth    = false,
        ),
    ]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    differencearea(x, y1, y2)

Creates an `EChart` difference area chart from `AbstractVector{<:Dates.TimeType}` x values.
Date/DateTime values are converted to strings and forwarded to the primary method.
See the primary `differencearea` method for full argument documentation.
"""
differencearea(x::AbstractVector{<:Dates.TimeType},
               y1::AbstractVector{<:Union{Missing, Real}},
               y2::AbstractVector{<:Union{Missing, Real}};
               kwargs...) = differencearea(string.(x), y1, y2; kwargs...)

"""
    differencearea(df, x, y1, y2)

Creates an `EChart` difference area chart from a Tables.jl-compatible table.
The `x`, `y1`, and `y2` symbols name the columns to use; legend labels default
to the column names of `y1` and `y2`.
See the primary `differencearea` method for full argument documentation.
"""
function differencearea(df, x::Symbol, y1::Symbol, y2::Symbol;
                        y1_name::String   = string(y1),
                        y2_name::String   = string(y2),
                        pos_color::String = "#5470c6",
                        neg_color::String = "#ee6666",
                        legend::Bool      = true,
                        scale::Bool       = false,
                        kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    differencearea(_table_col(df, x),
                   _table_col(df, y1),
                   _table_col(df, y2);
                   y1_name   = y1_name,
                   y2_name   = y2_name,
                   pos_color = pos_color,
                   neg_color = neg_color,
                   legend    = legend,
                   scale     = scale,
                   kwargs...)
end
