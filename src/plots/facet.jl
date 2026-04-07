# ── Layout helpers ────────────────────────────────────────────────────────────

# Returns (ncols, nrows, left_margin, top_margin, col_gap, row_gap, cell_w, cell_h)
function _facet_layout(n::Int, ncols::Union{Int,Nothing})
    nc = isnothing(ncols) ? min(n, 3) : ncols
    nr = ceil(Int, n / nc)

    left_margin   = 8.0
    right_margin  = 2.0
    top_margin    = 12.0   # headroom for panel titles
    bottom_margin = 5.0
    col_gap       = 3.0
    row_gap       = 3.0

    cell_w = (100 - left_margin - right_margin - (nc - 1) * col_gap) / nc
    cell_h = (100 - top_margin  - bottom_margin - (nr - 1) * row_gap) / nr

    return nc, nr, left_margin, top_margin, col_gap, row_gap, cell_w, cell_h
end

# Builds one (Grid, xAxis, yAxis, Title) tuple for panel at 0-based index `idx`.
function _facet_panel(idx, nc, lm, tm, cg, rg, cw, ch,
                      x_data, x_type::Union{String,Nothing}, scale, label::String)
    row = idx ÷ nc
    col = idx % nc

    gl = lm + col * (cw + cg)
    gt = tm  + row * (ch + rg)

    grid = Grid(
        left         = "$(round(gl; digits=1))%",
        top          = "$(round(gt; digits=1))%",
        width        = "$(round(cw; digits=1))%",
        height       = "$(round(ch; digits=1))%",
        containLabel = true,
    )

    xaxis = Axis(
        _type     = isnothing(x_type) ? "category" : x_type,
        data      = x_data,
        gridIndex = idx,
    )

    yaxis = Axis(
        _type     = "value",
        gridIndex = idx,
        scale     = scale,
        nameGap   = 40,
    )

    center    = gl + cw / 2
    title_top = max(0.5, gt - 5.0)
    title = Title(
        text      = label,
        left      = "$(round(center; digits=1))%",
        top       = "$(round(title_top; digits=1))%",
        textStyle = TextStyle(align = "center", fontSize = 12),
    )

    return grid, xaxis, yaxis, title
end

# ── Primary mutating function ─────────────────────────────────────────────────

"""
    facet!(ec; ncols)

Transform an existing multi-series cartesian `EChart` into a trellis (small-multiples)
layout in place. Each series becomes its own panel, preserving all styling already
applied to the chart.

## Arguments
- `ec::EChart`: a chart with two or more series (e.g. from `bar`, `line`, `scatter` with a group column)
- `ncols::Union{Int,Nothing} = nothing`: columns in the panel grid (default: `min(n_series, 3)`)

Returns the mutated `ec` so it can be used in a pipeline.

## Examples
```julia
# Pipeline style
bar(df, :month, :sales, :region) |> facet!

# Pre-configure then facet
ec = line(df, :month, :revenue, :product)
smooth!(ec)
colorscheme!(ec, "Paired_12")
facet!(ec; ncols=2)
```
"""
function facet!(ec::EChart; ncols::Union{Int,Nothing} = nothing)
    n = length(ec.series)
    n >= 2 || error("facet! requires a chart with at least 2 series.")

    # Capture existing single-axis configuration to replicate per panel
    x_type = isnothing(ec.xAxis) ? "category"                 : ec.xAxis[1]._type
    x_data = isnothing(ec.xAxis) ? nothing                    : ec.xAxis[1].data
    scale  = isnothing(ec.yAxis) ? false                      :
             isnothing(ec.yAxis[1].scale) ? false             : ec.yAxis[1].scale

    nc, nr, lm, tm, cg, rg, cw, ch = _facet_layout(n, ncols)

    grids  = Grid[]
    xaxes  = Axis[]
    yaxes  = Axis[]
    titles = Title[]

    for (i, s) in enumerate(ec.series)
        idx   = i - 1
        label = isnothing(s.name) ? "Series $i" : s.name

        grid, xaxis, yaxis, title = _facet_panel(
            idx, nc, lm, tm, cg, rg, cw, ch, x_data, x_type, scale, label
        )

        push!(grids,  grid)
        push!(xaxes,  xaxis)
        push!(yaxes,  yaxis)
        push!(titles, title)

        # Re-point series to its own axis pair
        s.xAxisIndex = idx
        s.yAxisIndex = idx
    end

    ec.grid          = grids
    ec.xAxis         = xaxes
    ec.yAxis         = yaxes
    ec.title         = titles
    ec.legend        = nothing   # panel titles serve as labels
    ec.ec_charttype  = "facet"

    # Scale height with row count unless the caller already set a custom height
    if ec.ec_height == 400
        ec.ec_height = max(400, nr * 260)
    end

    return ec
end

# ── Convenience constructors ──────────────────────────────────────────────────

"""
    facet(df, x, y, facet_col; mark, ncols, kwargs...)

Build a faceted chart directly from a Tables.jl-compatible table.
Equivalent to calling the grouped `xy_plot` and piping through `facet!`.

## Arguments
- `df`: any Tables.jl-compatible source (DataFrame, NamedTuple, etc.)
- `x::Symbol`: column for the x-axis
- `y::Symbol`: column for the y-axis
- `facet_col::Symbol`: column whose unique values define the panels
- `mark::String = "bar"`: series type (`"bar"`, `"line"`, `"scatter"`, etc.)
- `ncols::Union{Int,Nothing} = nothing`: columns in the panel grid

## Example
```julia
using ECharts, DataFrames
df = DataFrame(
    month  = repeat(["Jan","Feb","Mar","Apr"], 3),
    sales  = [10,15,13,17, 25,30,22,28, 8,12,9,14],
    region = repeat(["North","Central","South"], inner=4),
)
facet(df, :month, :sales, :region)
facet(df, :month, :sales, :region; mark="line", ncols=2)
```
"""
function facet(df, x::Symbol, y::Symbol, facet_col::Symbol;
               mark::String            = "bar",
               ncols::Union{Int,Nothing} = nothing,
               kwargs...)

    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    # xy_plot with a group column builds a multi-series chart with named series —
    # exactly the input facet! expects.
    ec = xy_plot(df, x, y, facet_col; mark = mark, legend = false, kwargs...)
    facet!(ec; ncols = ncols)
    return ec
end

"""
    facet(x, y, facet_var; mark, ncols, scale, kwargs...)

Build a faceted chart from raw arrays. Each unique value in `facet_var` becomes
one panel containing the subset of `x`/`y` belonging to that group.

## Arguments
- `x::AbstractVector`: x-axis values
- `y::AbstractVector`: y-axis values
- `facet_var::AbstractVector`: grouping variable (one panel per unique value, in order of first appearance)
- `mark::String = "bar"`: series type
- `ncols::Union{Int,Nothing} = nothing`: columns in the panel grid
- `scale::Bool = false`: `true` truncates y-axes to data range
"""
function facet(x::AbstractVector, y::AbstractVector, facet_var::AbstractVector;
               mark::String             = "bar",
               ncols::Union{Int,Nothing} = nothing,
               scale::Bool              = false,
               kwargs...)

    length(x) == length(y) == length(facet_var) ||
        error("x, y, and facet_var must all have the same length.")

    groups = unique(facet_var)
    n      = length(groups)
    nc, nr, lm, tm, cg, rg, cw, ch = _facet_layout(n, ncols)

    grids   = Grid[]
    xaxes   = Axis[]
    yaxes   = Axis[]
    seriess = XYSeries[]
    titles  = Title[]

    for (i, group) in enumerate(groups)
        idx     = i - 1
        mask    = facet_var .== group
        group_x = x[mask]
        group_y = y[mask]

        grid, xaxis, yaxis, title = _facet_panel(
            idx, nc, lm, tm, cg, rg, cw, ch,
            group_x, "category", scale, string(group)
        )

        push!(grids,   grid)
        push!(xaxes,   xaxis)
        push!(yaxes,   yaxis)
        push!(titles,  title)
        push!(seriess, XYSeries(
            _type      = mark,
            name       = string(group),
            data       = group_y,
            xAxisIndex = idx,
            yAxisIndex = idx,
        ))
    end

    ec = newplot(collect(kwargs), ec_charttype = "facet")
    if ec.ec_height == 400
        ec.ec_height = max(400, nr * 260)
    end
    ec.grid   = grids
    ec.xAxis  = xaxes
    ec.yAxis  = yaxes
    ec.series = seriess
    ec.title  = titles
    ec.legend = nothing
    return ec
end
