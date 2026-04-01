"""
    slope(labels, values)

Creates an `EChart` slope chart — a line chart with exactly two x-axis points that
emphasises the direction and magnitude of change between two states (e.g. before/after,
two time points, two groups). Each row in `values` (or each series in a DataFrame)
becomes a labelled slope line.

## Methods
```julia
slope(labels::AbstractVector, values::AbstractArray{<:Union{Missing, Real},2})
slope(df, label::Symbol, before::Symbol, after::Symbol)
```

## Arguments
* `left_label::String` : label for the left axis point (default: `string(labels[1])`)
* `right_label::String` : label for the right axis point (default: `string(labels[2])`)
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

`labels` must have exactly two elements — one for the left point and one for the right.
`values` must have exactly two columns (or `before`/`after` two separate columns for the
DataFrame method). Each row represents a named series; use `seriesnames!` to set names
after construction if needed.

# Examples
```@example
using ECharts
points = ["2020", "2023"]
# Rows = countries, Columns = years
vals = [72.0  78.0;   # Country A
        65.0  60.0;   # Country B
        81.0  85.0]   # Country C
ec = slope(points, vals)
seriesnames!(ec, ["Country A", "Country B", "Country C"])
ec
```
"""
function slope(labels::AbstractVector,
               values::AbstractArray{<:Union{Missing, Real},2};
               legend::Bool = true,
               kwargs...)

    length(labels) == 2 ||
        throw(ArgumentError("slope charts require exactly 2 labels, got $(length(labels))"))
    size(values, 2) == 2 ||
        throw(ArgumentError("slope charts require exactly 2 columns in values, got $(size(values,2))"))

    n_series = size(values, 1)
    xlabels = string.(labels)

    ec = newplot(kwargs, ec_charttype = "slope")
    ec.xAxis = [Axis(_type = "category", data = xlabels, boundaryGap = true)]
    ec.yAxis = [Axis(_type = "value")]

    ec.series = [XYSeries(
        name  = "Series $i",
        _type = "line",
        data  = [values[i, 1], values[i, 2]],
    ) for i in 1:n_series]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    slope(df, label, before, after)

Creates an `EChart` slope chart from a Tables.jl-compatible table. The `label` column
provides series names; `before` and `after` are the two value columns.
See the primary `slope` method for full argument documentation.

# Examples
```@example df
using ECharts, DataFrames
df = DataFrame(
    country   = ["Germany", "France", "Spain", "Italy"],
    rate_2015 = [4.6, 10.4, 22.1, 11.9],
    rate_2023 = [3.0,  7.3, 12.2,  6.7],
)
ec = slope(df, :country, :rate_2015, :rate_2023)
title!(ec, text = "Unemployment Rate Change 2015 → 2023")
ec
```
"""
function slope(df, label::Symbol, before::Symbol, after::Symbol;
               legend::Bool = true,
               kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    names  = string.(_table_col(df, label))
    bvals  = _table_col(df, before)
    avals  = _table_col(df, after)
    labels = [string(before), string(after)]

    length(names) == length(bvals) == length(avals) ||
        throw(ArgumentError("label, before, and after columns must have the same length"))

    vals = hcat(bvals, avals)
    ec = slope(labels, Float64.(vals); legend = legend, kwargs...)
    seriesnames!(ec, names)
    return ec
end
