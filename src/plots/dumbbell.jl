"""
    dumbbell(categories, start_vals, end_vals)

Creates an `EChart` dumbbell (connected dot) plot — a horizontal chart with two dots per
category connected by a line, emphasising the size of the gap between two values for each
item. Categories sit on the y-axis; values on the x-axis.

Contrast with [`slope`](@ref): a slope chart uses a vertical orientation with exactly two
categorical x-axis points and highlights ranking changes across items; a dumbbell uses a
horizontal orientation with a continuous x-axis and highlights the gap magnitude within
each item.

## Methods
```julia
dumbbell(categories::AbstractVector,
         start_vals::AbstractVector{<:Union{Missing, Real}},
         end_vals::AbstractVector{<:Union{Missing, Real}})
dumbbell(df, category::Symbol, start_val::Symbol, end_val::Symbol)
```

## Arguments
* `start_name::String = "Start"` : legend label for the start-value dots
* `end_name::String = "End"` : legend label for the end-value dots
* `dot_size::Int = 14` : diameter of each dot (pixels)
* `line_width::Int = 3` : pixel width of the connecting segment
* `line_color::String = "#cccccc"` : color of the connecting segment
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Each category produces two dots (start, end) connected by a thin line. The connecting line
is drawn via ECharts `markLine` attached to the start series. Dot colors follow the active
ECharts palette; the connector color is independent and defaults to light gray so it
recedes behind the dots.

# Examples
```@example
using ECharts
roles = ["Engineer", "Manager", "Director", "VP", "C-Suite"]
low   = [85,  100, 130, 160, 210]
high  = [110, 145, 180, 230, 400]
ec = dumbbell(roles, low, high; start_name = "25th pct", end_name = "75th pct")
title!(ec, text = "Salary Range by Role (USD 000s)")
ec
```
"""
function dumbbell(categories::AbstractVector,
                  start_vals::AbstractVector{<:Union{Missing, Real}},
                  end_vals::AbstractVector{<:Union{Missing, Real}};
                  start_name::String = "Start",
                  end_name::String   = "End",
                  dot_size::Int      = 14,
                  line_width::Int    = 3,
                  line_color::String = "#cccccc",
                  legend::Bool       = true,
                  kwargs...)

    length(categories) == length(start_vals) == length(end_vals) ||
        throw(ArgumentError("categories, start_vals, and end_vals must have the same length"))

    cats = string.(categories)

    ec = newplot(kwargs, ec_charttype = "dumbbell")
    ec.xAxis = [Axis(_type = "value")]
    ec.yAxis = [Axis(_type = "category", data = cats)]

    # Connecting segments via markLine: one line per category
    ml_data = [[Dict("coord" => [Float64(coalesce(s, NaN)), c]),
                Dict("coord" => [Float64(coalesce(e, NaN)), c])]
               for (s, e, c) in zip(start_vals, end_vals, cats)]

    connector = MarkLine(
        _symbol   = "none",
        lineStyle = LineStyle(color = line_color, width = line_width),
        label     = Dict("show" => false),
        data      = ml_data,
    )

    start_series = XYSeries(
        name       = start_name,
        _type      = "scatter",
        symbolSize = dot_size,
        data       = [[Float64(coalesce(v, NaN)), c] for (v, c) in zip(start_vals, cats)],
        markLine   = connector,
    )

    end_series = XYSeries(
        name       = end_name,
        _type      = "scatter",
        symbolSize = dot_size,
        data       = [[Float64(coalesce(v, NaN)), c] for (v, c) in zip(end_vals, cats)],
    )

    ec.series = [start_series, end_series]
    legend ? legend!(ec) : nothing
    return ec
end

"""
    dumbbell(df, category, start_val, end_val)

Creates an `EChart` dumbbell plot from a Tables.jl-compatible table. The `category` column
provides y-axis labels; `start_val` and `end_val` are the two value columns.
Legend labels default to the column names.
See the primary `dumbbell` method for full argument documentation.

# Examples
```@example df
using ECharts, DataFrames
df = DataFrame(
    country    = ["Germany", "France", "Spain", "Italy", "Portugal"],
    rate_2015  = [4.6, 10.4, 22.1, 11.9,  12.4],
    rate_2023  = [3.0,  7.3, 12.2,  6.7,   6.5],
)
ec = dumbbell(df, :country, :rate_2015, :rate_2023)
title!(ec, text = "Unemployment Rate: 2015 vs 2023")
ec
```
"""
function dumbbell(df, category::Symbol, start_val::Symbol, end_val::Symbol;
                  start_name::String = string(start_val),
                  end_name::String   = string(end_val),
                  dot_size::Int      = 14,
                  line_width::Int    = 3,
                  line_color::String = "#cccccc",
                  legend::Bool       = true,
                  kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    dumbbell(_table_col(df, category),
             _table_col(df, start_val),
             _table_col(df, end_val);
             start_name = start_name,
             end_name   = end_name,
             dot_size   = dot_size,
             line_width  = line_width,
             line_color  = line_color,
             legend      = legend,
             kwargs...)
end
