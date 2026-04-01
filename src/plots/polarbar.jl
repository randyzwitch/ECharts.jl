"""
    polarbar(categories, values)

Creates an `EChart` polar bar chart (also called a radial column chart), where bars radiate
outward from the centre of a circle. Categories are placed evenly around the angle axis and
bar lengths represent the corresponding values on the radius axis.

## Methods
```julia
polarbar(categories::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
polarbar(categories::AbstractVector, values::AbstractArray{<:Union{Missing, Real},2})
polarbar(df, category::Symbol, value::Symbol)
polarbar(df, category::Symbol, value::Symbol, group::Symbol)
```

## Arguments
* `stack::Union{Bool, Nothing} = nothing` : stack series? Pass `true` to stack all series
* `legend::Bool` : display legend? Defaults to `true` for multi-series inputs
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Unlike [`radialbar`](@ref) (which converts a Cartesian bar chart to a radial layout),
`polarbar` is built directly on ECharts' polar coordinate system with a category angle axis
and a value radius axis, giving true circular column bars.

# Examples
```@example
using ECharts
days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
sales = [120, 200, 150, 80, 70, 110, 130]
polarbar(days, sales)
```
"""
function polarbar(categories::AbstractVector,
                  values::AbstractVector{<:Union{Missing, Real}};
                  stack::Union{Bool, Nothing} = nothing,
                  legend::Bool = false,
                  kwargs...)

    ec = newplot(kwargs, ec_charttype = "polarbar")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.polar = [Polar()]
    ec.angleAxis = AngleAxis(_type = "category", data = string.(categories), z = 10)
    ec.radiusAxis = RadiusAxis(min = 0)

    stack_val = stack === true ? "polarbar_stack" : nothing
    ec.series = [XYSeries(name = "Series 1",
                          _type = "bar",
                          coordinateSystem = "polar",
                          stack = stack_val,
                          data = collect(values))]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    polarbar(categories, values)

Creates an `EChart` polar bar chart from a 2-D array `values`, where each column is a
separate series. Legend is displayed by default when multiple series are present.
See the primary `polarbar` method for full argument documentation.
"""
function polarbar(categories::AbstractVector,
                  values::AbstractArray{<:Union{Missing, Real},2};
                  stack::Union{Bool, Nothing} = nothing,
                  legend::Bool = true,
                  kwargs...)

    n_series = size(values, 2)
    stack_val = stack === true ? "polarbar_stack" : nothing

    ec = polarbar(categories, values[:, 1]; stack = stack, legend = false, kwargs...)

    for i in 2:n_series
        push!(ec.series,
              XYSeries(_type = "bar",
                       coordinateSystem = "polar",
                       stack = stack_val,
                       data = collect(values[:, i])))
    end

    seriesnames!(ec)
    legend ? legend!(ec) : nothing
    return ec
end

"""
    polarbar(df, category, value)

Creates an `EChart` polar bar chart from a single column `value` in table `df` against
column `category`.
See the primary `polarbar` method for full argument documentation.
"""
function polarbar(df, category::Symbol, value::Symbol;
                  stack::Union{Bool, Nothing} = nothing,
                  legend::Bool = false,
                  kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    polarbar(_table_col(df, category), _table_col(df, value);
             stack = stack, legend = legend, kwargs...)
end

"""
    polarbar(df, category, value, group)

Creates an `EChart` polar bar chart from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `polarbar` method for full argument documentation.
"""
function polarbar(df, category::Symbol, value::Symbol, group::Symbol;
                  stack::Union{Bool, Nothing} = nothing,
                  legend::Bool = true,
                  kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    xcol = _table_col(df, category)
    ycol = _table_col(df, value)
    groups = _table_groupby(df, group)
    n_groups = length(groups)

    _, idx1 = groups[1]
    ec = polarbar(xcol[idx1], ycol[idx1]; stack = stack, legend = false, kwargs...)

    for i in 2:n_groups
        _, idxi = groups[i]
        stack_val = stack === true ? "polarbar_stack" : nothing
        push!(ec.series,
              XYSeries(_type = "bar",
                       coordinateSystem = "polar",
                       stack = stack_val,
                       data = collect(ycol[idxi])))
    end

    seriesnames!(ec, [string(groups[i][1]) for i in 1:n_groups])
    legend ? legend!(ec) : nothing
    return ec
end
