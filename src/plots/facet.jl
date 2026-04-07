"""
    facet(x, y, facet_var; mark, ncols, scale, kwargs...)

Create a faceted (trellis / small-multiples) chart. Each unique value in `facet_var`
produces its own panel, all using the same chart type.

## Arguments
- `x::AbstractVector`: x-axis values
- `y::AbstractVector`: y-axis values
- `facet_var::AbstractVector`: grouping variable — one panel per unique value (in order of first appearance)
- `mark::String = "bar"`: series type passed to ECharts (`"bar"`, `"line"`, `"scatter"`, etc.)
- `ncols::Union{Int,Nothing} = nothing`: number of columns in the panel grid (default: `min(n_groups, 3)`)
- `scale::Bool = false`: when `false` (default) y-axes start at zero; `true` truncates to data range

All other keyword arguments are forwarded to the underlying `EChart` struct (e.g. `ec_width`, `ec_height`).

## Examples
```julia
using ECharts
months = repeat(["Jan","Feb","Mar","Apr"], 3)
sales  = [10,15,13,17, 25,30,22,28, 8,12,9,14]
region = repeat(["North","Central","South"], inner=4)

facet(months, sales, region; mark="bar")
facet(months, sales, region; mark="line", ncols=2)
```
"""
function facet(x::AbstractVector, y::AbstractVector, facet_var::AbstractVector;
               mark::String  = "bar",
               ncols::Union{Int, Nothing} = nothing,
               scale::Bool   = false,
               kwargs...)

    length(x) == length(y) == length(facet_var) ||
        error("x, y, and facet_var must all have the same length.")

    groups  = unique(facet_var)
    n       = length(groups)
    nc      = isnothing(ncols) ? min(n, 3) : ncols
    nr      = ceil(Int, n / nc)

    # ── percentage-based layout ────────────────────────────────────────────
    left_margin   = 8.0
    right_margin  = 2.0
    top_margin    = 12.0   # headroom for panel titles
    bottom_margin = 5.0
    col_gap       = 3.0
    row_gap       = 3.0

    cell_w = (100 - left_margin - right_margin - (nc - 1) * col_gap) / nc
    cell_h = (100 - top_margin  - bottom_margin - (nr - 1) * row_gap) / nr

    # ── build per-panel structures ─────────────────────────────────────────
    grids   = Grid[]
    xaxes   = Axis[]
    yaxes   = Axis[]
    seriess = XYSeries[]
    titles  = Title[]

    for (i, group) in enumerate(groups)
        idx = i - 1          # 0-based index used by ECharts
        row = idx ÷ nc
        col = idx % nc

        gl = left_margin + col * (cell_w + col_gap)
        gt = top_margin  + row * (cell_h + row_gap)

        # Grid — containLabel keeps axis tick labels inside the allocated cell
        push!(grids, Grid(
            left         = "$(round(gl; digits=1))%",
            top          = "$(round(gt; digits=1))%",
            width        = "$(round(cell_w; digits=1))%",
            height       = "$(round(cell_h; digits=1))%",
            containLabel = true
        ))

        # Axes, linked to this grid by index
        mask    = facet_var .== group
        group_x = x[mask]
        group_y = y[mask]

        push!(xaxes, Axis(
            _type     = "category",
            data      = group_x,
            gridIndex = idx
        ))
        push!(yaxes, Axis(
            _type     = "value",
            gridIndex = idx,
            scale     = scale,
            nameGap   = 40
        ))

        # Series, linked to this panel's axes
        push!(seriess, XYSeries(
            _type      = mark,
            name       = string(group),
            data       = group_y,
            xAxisIndex = idx,
            yAxisIndex = idx
        ))

        # Panel title centered above the grid cell
        center = gl + cell_w / 2
        title_top = max(0.5, gt - 5.0)
        push!(titles, Title(
            text      = string(group),
            left      = "$(round(center; digits=1))%",
            top       = "$(round(title_top; digits=1))%",
            textStyle = TextStyle(align = "center", fontSize = 12)
        ))
    end

    # ── assemble EChart ────────────────────────────────────────────────────
    ec = newplot(collect(kwargs), ec_charttype = "facet")

    # Auto-scale height to the number of rows unless the caller overrode it
    if ec.ec_height == 400
        ec.ec_height = max(400, nr * 260)
    end

    ec.grid   = grids
    ec.xAxis  = xaxes
    ec.yAxis  = yaxes
    ec.series = seriess
    ec.title  = titles
    ec.legend = nothing   # panel titles serve as labels; legend would be redundant

    return ec
end

"""
    facet(df, x, y, facet_col; mark, ncols, scale, kwargs...)

Tables.jl-compatible method. `x`, `y`, and `facet_col` are column name `Symbol`s.

## Example
```julia
using ECharts, DataFrames
df = DataFrame(
    month  = repeat(["Jan","Feb","Mar","Apr"], 3),
    sales  = [10,15,13,17, 25,30,22,28, 8,12,9,14],
    region = repeat(["North","Central","South"], inner=4)
)
facet(df, :month, :sales, :region; mark="bar")
```
"""
function facet(df, x::Symbol, y::Symbol, facet_col::Symbol;
               mark::String  = "bar",
               ncols::Union{Int, Nothing} = nothing,
               scale::Bool   = false,
               kwargs...)

    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    facet(_table_col(df, x),
          _table_col(df, y),
          _table_col(df, facet_col);
          mark  = mark,
          ncols = ncols,
          scale = scale,
          kwargs...)
end
