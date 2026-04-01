"""
    punchcard(x, y, sizes)

Creates an `EChart` punchcard (bubble grid) chart — a scatter plot on a categorical grid
where bubble size encodes a third variable, similar to a GitHub-style punch card.

## Methods
```julia
punchcard(x::AbstractVector, y::AbstractVector, sizes::AbstractVector{<:Real})
```

## Arguments
* `scale::Real = 10` : divisor applied to `sizes` to control the maximum bubble radius
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`x`, `y`, and `sizes` must be the same length. Each triplet `(x[i], y[i], sizes[i])`
defines one bubble at the grid intersection `(x[i], y[i])` with size proportional to
`sizes[i]`. Duplicate `(x, y)` pairs are allowed — all corresponding bubbles will be drawn.
"""
function punchcard(x::AbstractVector, y::AbstractVector,
                   sizes::AbstractVector{<:Real};
                   scale::Real = 10,
                   legend::Bool = false,
                   kwargs...)

    unique_x = unique(x)
    unique_y = unique(y)

    data = [[xi, yi, si] for (xi, yi, si) in zip(x, y, sizes)]

    ec = newplot(kwargs, ec_charttype = "punchcard")
    ec.xAxis = [Axis(_type = "category", data = collect(string.(unique_x)))]
    ec.yAxis = [Axis(_type = "category", data = collect(string.(unique_y)))]
    ec.series = [XYSeries(_type = "scatter",
                          data = data,
                          symbolSize = JSON.JSONText(
                              "(function(val){ return val[2] / $scale; })"))]

    legend ? legend!(ec) : nothing

    return ec

end

"""
    punchcard(df, x, y, sizes)

Creates an `EChart` punchcard chart from columns `x`, `y`, and `sizes` in table `df`.
See the primary `punchcard` method for full argument documentation.
"""
function punchcard(df, x::Symbol, y::Symbol, sizes::Symbol;
                   scale::Real = 10,
                   legend::Bool = false,
                   kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    punchcard(_table_col(df, x), _table_col(df, y), _table_col(df, sizes);
              scale = scale, legend = legend, kwargs...)
end
