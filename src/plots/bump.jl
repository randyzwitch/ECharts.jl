"""
    bump(periods, values)

Creates an `EChart` bump chart showing how rankings change across time periods or
ordered categories. Each series is ranked independently at every period (rank 1 = highest
value) and drawn as a line. The Y-axis is inverted so that rank 1 appears at the top.

## Methods
```julia
bump(periods::AbstractVector, values::AbstractArray{<:Union{Missing, Real},2})
bump(df, period::Symbol, value::Symbol, group::Symbol)
```

## Arguments
* `names::Union{AbstractVector, Nothing} = nothing` : series labels (used when passing a
  raw matrix; auto-generated when `nothing`)
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Rankings are computed from the supplied `values` matrix — each row (period) is ranked
independently, with rank 1 assigned to the largest value. Ties are broken by their
position in the column order (leftmost gets the better rank).

To supply pre-computed ranks, pass the rank matrix directly together with
`yAxis` adjustment: the function always inverts the Y-axis and sets the minimum rank to 1.

# Examples
```@example
using ECharts
periods = ["2019", "2020", "2021", "2022", "2023"]
values = [
    82  74  68  91  85;   # Series A
    75  88  95  70  78;   # Series B
    60  65  72  80  92;   # Series C
]'  # transpose so rows = periods
bump(periods, values, names = ["A", "B", "C"])
```
"""
function bump(periods::AbstractVector,
              values::AbstractArray{<:Union{Missing, Real},2};
              names::Union{AbstractVector, Nothing} = nothing,
              legend::Bool = true,
              kwargs...)

    n_periods, n_series = size(values)
    length(periods) == n_periods ||
        throw(ArgumentError("length of periods ($(length(periods))) must equal number of rows in values ($n_periods)"))

    # Compute ranks: rank 1 = highest value, per period (row)
    ranks = zeros(Int, n_periods, n_series)
    for i in 1:n_periods
        row = [ismissing(values[i, j]) ? -Inf : Float64(values[i, j]) for j in 1:n_series]
        ord = sortperm(row, rev = true)
        for (rank, col_idx) in enumerate(ord)
            ranks[i, col_idx] = rank
        end
    end

    ec = line(string.(periods), ranks; legend = legend, kwargs...)

    # Invert Y-axis: rank 1 at top, max rank at bottom; integer steps
    ec.yAxis[1].inverse = true
    ec.yAxis[1].min = 1
    ec.yAxis[1].interval = 1

    if names !== nothing
        length(names) == n_series ||
            throw(ArgumentError("length of names ($(length(names))) must equal number of series ($n_series)"))
        seriesnames!(ec, string.(names))
    end

    return ec
end

"""
    bump(df, period, value, group)

Creates an `EChart` bump chart from a Tables.jl-compatible table. The `group` column
identifies individual series; `value` is the magnitude ranked at each `period`.
Legend is displayed by default.
See the primary `bump` method for full argument documentation.

# Examples
```@example df
using ECharts, DataFrames
df = DataFrame(
    year  = repeat(2019:2023, inner = 3),
    brand = repeat(["Alpha", "Beta", "Gamma"], outer = 5),
    sales = [82, 75, 60, 74, 88, 65, 68, 95, 72, 91, 70, 80, 85, 78, 92],
)
bump(df, :year, :sales, :brand)
```
"""
function bump(df, period::Symbol, value::Symbol, group::Symbol;
              legend::Bool = true,
              kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    periods, vals, group_names = _table_unstack(df, period, group, value)
    vals_float = map(x -> ismissing(x) ? missing : Float64(x), vals)
    bump(periods, vals_float; names = group_names, legend = legend, kwargs...)
end
