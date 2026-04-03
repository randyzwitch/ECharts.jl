"""
    ternary(a, b, c)

Creates an `EChart` ternary (triangle) plot for three-component compositional data.

## Methods
```julia
ternary(a, b, c)
ternary(a, b, c; names, ...)           # same, with custom axis labels
ternary(df, a, b, c)                   # table input
ternary(df, a, b, c, group)            # table input, grouped series
```

## Arguments
* `names::AbstractVector{<:AbstractString} = ["A", "B", "C"]` : labels for the three axes
* `symbolSize::Int = 8` : marker diameter in pixels
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Each data point is a triplet `[a, b, c]`. The values do not need to be pre-normalized —
ECharts scales each axis independently from 0 to the observed maximum. If your data are
proportions that sum to 1 (or percentages that sum to 100), pass `max = 1` (or `max = 100`)
via the `kwargs` or mutate `ec.ternary.axisA.max` etc. after construction.
"""
function ternary(a::AbstractVector{<:Union{Missing, Real}},
                 b::AbstractVector{<:Union{Missing, Real}},
                 c::AbstractVector{<:Union{Missing, Real}};
                 names::AbstractVector{<:AbstractString} = ["A", "B", "C"],
                 symbolSize::Int = 8,
                 legend::Bool = false,
                 kwargs...)

    length(names) == 3 || throw(ArgumentError("`names` must have exactly 3 elements"))
    length(a) == length(b) == length(c) ||
        throw(ArgumentError("a, b, and c must all have the same length"))

    ec = newplot(kwargs, ec_charttype = "ternary")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.grid   = nothing

    ec.ternary = Ternary(
        axisA = TernaryAxis(name = names[1]),
        axisB = TernaryAxis(name = names[2]),
        axisC = TernaryAxis(name = names[3]),
    )

    ec.series = [TernarySeries(
        name       = "Series 1",
        symbolSize = symbolSize,
        data       = arrayofarray(a, b, c),
    )]

    legend ? legend!(ec) : nothing

    return ec

end

"""
    ternary(a, b, c; names, ...)  — multi-series matrix overload

Creates an `EChart` ternary plot from three matrices, each column being one series.
`a`, `b`, and `c` must have the same dimensions.
See the primary `ternary` method for full argument documentation.
"""
function ternary(a::AbstractMatrix{<:Union{Missing, Real}},
                 b::AbstractMatrix{<:Union{Missing, Real}},
                 c::AbstractMatrix{<:Union{Missing, Real}};
                 names::AbstractVector{<:AbstractString} = ["A", "B", "C"],
                 symbolSize::Int = 8,
                 legend::Bool = true,
                 kwargs...)

    length(names) == 3 || throw(ArgumentError("`names` must have exactly 3 elements"))
    size(a) == size(b) == size(c) ||
        throw(ArgumentError("a, b, and c matrices must have the same dimensions"))

    ec = ternary(a[:, 1], b[:, 1], c[:, 1];
                 names = names, symbolSize = symbolSize, legend = legend, kwargs...)

    for i in axes(a, 2)[2:end]
        push!(ec.series, TernarySeries(
            symbolSize = symbolSize,
            data       = arrayofarray(a[:, i], b[:, i], c[:, i]),
        ))
    end

    seriesnames!(ec)

    legend ? legend!(ec) : nothing

    return ec

end

"""
    ternary(df, a, b, c)

Creates an `EChart` ternary plot from columns `a`, `b`, and `c` in table `df`.
Axis labels default to the column names.
See the primary `ternary` method for full argument documentation.
"""
function ternary(df, a::Symbol, b::Symbol, c::Symbol;
                 names::Union{AbstractVector{<:AbstractString}, Nothing} = nothing,
                 symbolSize::Int = 8,
                 legend::Bool = false,
                 kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    axis_names = isnothing(names) ? [string(a), string(b), string(c)] : names

    return ternary(_table_col(df, a), _table_col(df, b), _table_col(df, c);
                   names = axis_names, symbolSize = symbolSize, legend = legend, kwargs...)

end

"""
    ternary(df, a, b, c, group)

Creates an `EChart` ternary plot from table `df`, drawing a separate series per unique
value of the `group` column. Legend is displayed by default.
See the primary `ternary` method for full argument documentation.
"""
function ternary(df, a::Symbol, b::Symbol, c::Symbol, group::Symbol;
                 names::Union{AbstractVector{<:AbstractString}, Nothing} = nothing,
                 symbolSize::Int = 8,
                 legend::Bool = true,
                 kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    axis_names = isnothing(names) ? [string(a), string(b), string(c)] : names

    groups = _table_groupby(df, group)
    acol   = _table_col(df, a)
    bcol   = _table_col(df, b)
    ccol   = _table_col(df, c)

    _, idx1 = groups[1]
    ec = ternary(acol[idx1], bcol[idx1], ccol[idx1];
                 names = axis_names, symbolSize = symbolSize, legend = legend, kwargs...)

    for (_, idxi) in groups[2:end]
        push!(ec.series, TernarySeries(
            symbolSize = symbolSize,
            data       = arrayofarray(acol[idxi], bcol[idxi], ccol[idxi]),
        ))
    end

    seriesnames!(ec, [string(g[1]) for g in groups])

    legend ? legend!(ec) : nothing

    return ec

end
