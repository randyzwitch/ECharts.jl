"""
    marimekko(categories, subcategories, values)

Creates an `EChart` Marimekko chart (also called a mosaic plot) — a two-dimensional
stacked chart where **column widths** are proportional to each category's share of the
total, and **stacked heights** within each column show the sub-category composition.

## Methods
```julia
marimekko(categories::AbstractVector,
          subcategories::AbstractVector,
          values::AbstractArray{<:Real,2})
```

## Arguments
* `categories` : column labels (length `n_cols`)
* `subcategories` : row/segment labels (length `n_rows`)
* `values` : matrix of shape `(n_rows, n_cols)` — rows are sub-categories, columns are
  categories. Values must be non-negative; they are normalised internally.
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Column widths are proportional to each column's share of the grand total, scaled to
0–100 on the X-axis. Within each column, values are stacked to fill 0–100 on the Y-axis.
Both axes display percentage labels.

Rendering uses ECharts' `custom` series type with a `renderItem` JavaScript function that
draws one rectangle per cell. One `CustomSeries` is created per sub-category row.

# Examples
```@example
using ECharts
categories    = ["North", "South", "East", "West"]
subcategories = ["Product A", "Product B", "Product C"]
values = [40.0  30.0  20.0  10.0;   # Product A share per region
          25.0  35.0  15.0  25.0;   # Product B
          35.0  35.0  65.0  65.0]   # Product C
marimekko(categories, subcategories, values)
```
"""
function marimekko(categories::AbstractVector,
                   subcategories::AbstractVector,
                   values::AbstractArray{<:Real,2};
                   legend::Bool = true,
                   kwargs...)

    n_rows, n_cols = size(values)
    length(categories) == n_cols ||
        throw(ArgumentError("length of categories ($(length(categories))) must equal " *
                            "number of columns in values ($n_cols)"))
    length(subcategories) == n_rows ||
        throw(ArgumentError("length of subcategories ($(length(subcategories))) must equal " *
                            "number of rows in values ($n_rows)"))
    all(values .>= 0) ||
        throw(ArgumentError("all values must be non-negative"))

    # Column widths: each column's share of the grand total (0–100 scale)
    col_totals = sum(values, dims = 1)[:]
    grand_total = sum(col_totals)
    grand_total > 0 || throw(ArgumentError("grand total of values must be positive"))

    col_widths = col_totals ./ grand_total .* 100.0
    col_starts = [0.0; cumsum(col_widths)[1:end-1]]

    # Within each column, normalise rows to percentages (0–100 scale)
    pct = zeros(Float64, n_rows, n_cols)
    for j in 1:n_cols
        ct = col_totals[j]
        for i in 1:n_rows
            pct[i, j] = ct > 0 ? values[i, j] / ct * 100.0 : 0.0
        end
    end

    # renderItem JS function: data[i] = [x_start, y_start, x_end, y_end]
    render_fn = JSON.JSONText("""
function(params, api) {
    var x0 = api.coord([api.value(0), api.value(3)]);
    var x1 = api.coord([api.value(2), api.value(1)]);
    return {
        type: 'rect',
        shape: {
            x: x0[0],
            y: x0[1],
            width: x1[0] - x0[0],
            height: x1[1] - x0[1]
        },
        style: api.style()
    };
}
""")

    series = CustomSeries[]
    for i in 1:n_rows
        cell_data = Vector{Vector{Float64}}(undef, n_cols)
        cum_y = zeros(Float64, n_cols)
        # accumulate heights for rows above i
        for ii in 1:(i-1)
            for j in 1:n_cols
                cum_y[j] += pct[ii, j]
            end
        end
        for j in 1:n_cols
            x_start = col_starts[j]
            x_end   = col_starts[j] + col_widths[j]
            y_start = cum_y[j]
            y_end   = cum_y[j] + pct[i, j]
            cell_data[j] = [x_start, y_start, x_end, y_end]
        end
        push!(series, CustomSeries(
            name       = string(subcategories[i]),
            renderItem = render_fn,
            data       = cell_data,
            encode     = Dict("x" => [0, 2], "y" => [1, 3]),
        ))
    end

    ec = newplot(kwargs, ec_charttype = "marimekko")
    ec.xAxis = [Axis(_type = "value", min = 0, max = 100,
                     axisLabel = AxisLabel(formatter = "{value}%"))]
    ec.yAxis = [Axis(_type = "value", min = 0, max = 100,
                     axisLabel = AxisLabel(formatter = "{value}%"))]
    ec.series = series

    legend ? legend!(ec) : nothing
    return ec
end

"""
    marimekko(df, category, subcategory, value)

Creates an `EChart` Marimekko chart from a Tables.jl-compatible table in long format.
The `category` column defines the columns (variable-width axis), `subcategory` defines
the stacked segments, and `value` holds the cell magnitudes.
See the primary `marimekko` method for full argument documentation.

# Examples
```@example df
using ECharts, DataFrames
df = DataFrame(
    region   = repeat(["North","South","East","West"], inner = 3),
    product  = repeat(["A","B","C"], outer = 4),
    revenue  = [40, 25, 35, 30, 35, 35, 20, 15, 65, 10, 25, 65],
)
marimekko(df, :region, :product, :revenue)
```
"""
function marimekko(df, category::Symbol, subcategory::Symbol, value::Symbol;
                   legend::Bool = true,
                   kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    cats, mat, sub_names = _table_unstack(df, category, subcategory, value)
    mat_float = Float64.(coalesce.(mat, 0.0))
    marimekko(cats, sub_names, mat_float'; legend = legend, kwargs...)
end
