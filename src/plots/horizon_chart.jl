"""
    horizonchart(x, y)

Creates an `EChart` horizon chart — a compact time-series visualisation that folds a tall
area chart into `nbands` overlapping bands, each shaded progressively darker to encode
magnitude. This allows many series to be compared in a small vertical space.

## Methods
```julia
horizonchart(x::AbstractVector, y::AbstractVector{<:Real})
horizonchart(df, x::Symbol, y::Symbol)
```

## Arguments
* `nbands::Int = 3` : number of fold levels (bands)
* `palette::String = "Blues"` : name of a sequential palette from `colorpalettes`
  (e.g. `"Reds"`, `"Greens"`, `"Oranges"`, `"Purples"`). `nbands` evenly-spaced
  colours are sampled from light to dark.
* `colors::Union{AbstractVector, Nothing} = nothing` : explicit vector of `nbands`
  colour strings; overrides `palette` when provided
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

The data range is divided into `nbands` equal intervals of height `band_size = max / nbands`.
Band *k* (0-indexed) displays the portion of the signal in `[k·band_size, (k+1)·band_size]`
folded back to `[0, band_size]`. Higher bands are drawn on top with a darker colour,
creating the illusion of a taller chart compressed into a single row.

Negative values are shifted upward so the minimum maps to zero before folding.

The y-axis maximum is fixed to `band_size` (not the full data range).
"""

# Sample n evenly-spaced colours from a named sequential colorpalettes entry.
# ColorBrewer sequential palettes have 3–9 swatches; we pick the largest available
# swatch set and subsample from it.
function _horizon_colors(palette::String, n::Int)
    haskey(colorpalettes, palette) ||
        throw(ArgumentError("palette \"$palette\" not found in colorpalettes"))
    pal = colorpalettes[palette]
    # Keys are like "3","4",…,"9","type" — keep only numeric ones
    numeric_keys = [k for k in keys(pal) if all(isdigit, k)]
    isempty(numeric_keys) && throw(ArgumentError("palette \"$palette\" has no numeric swatch keys"))
    max_key = string(maximum(parse(Int, k) for k in numeric_keys))
    all_colors = pal[max_key]
    idxs = round.(Int, range(1, length(all_colors); length = n))
    [all_colors[i] for i in idxs]
end

function horizonchart(x::AbstractVector, y::AbstractVector{<:Real};
                      nbands::Int = 3,
                      palette::String = "Blues",
                      colors::Union{AbstractVector, Nothing} = nothing,
                      legend::Bool = false,
                      kwargs...)

    nbands >= 1 || throw(ArgumentError("nbands must be ≥ 1"))
    length(x) == length(y) ||
        throw(ArgumentError("x and y must have the same length"))

    # Shift to non-negative
    ymin = minimum(y)
    y_shifted = ymin < 0 ? collect(Float64, y .- ymin) : collect(Float64, y)
    ymax = maximum(y_shifted)
    ymax > 0 || throw(ArgumentError("all values are identical; cannot build a horizon chart"))

    band_size = ymax / nbands
    clrs = isnothing(colors) ? _horizon_colors(palette, nbands) : colors
    length(clrs) == nbands ||
        throw(ArgumentError("length(colors) must equal nbands (got $(length(clrs)), need $nbands)"))

    x_type = eltype(x) <: Real ? "value" : "category"

    series_list = XYSeries[]
    for k in 0:nbands-1
        band_y = [max(0.0, min(y_shifted[i] - k * band_size, band_size))
                  for i in eachindex(y_shifted)]
        push!(series_list, XYSeries(
            name       = "Band $(k + 1)",
            _type      = "line",
            data       = arrayofarray(x, band_y),
            areaStyle  = AreaStyle(color = clrs[k + 1]),
            lineStyle  = LineStyle(opacity = 0),
            showSymbol = false,
        ))
    end

    ec = newplot(kwargs, ec_charttype = "horizonchart")
    ec.xAxis  = [Axis(_type = x_type)]
    ec.yAxis  = [Axis(_type = "value", min = 0)]
    ec.series = series_list

    legend ? legend!(ec) : nothing

    return ec
end

"""
    horizonchart(df, x, y)

Creates an `EChart` horizon chart from columns `x` and `y` in table `df`.
Axis labels are set from the column names.
See the primary `horizonchart` method for full argument documentation.
"""
function horizonchart(df, x::Symbol, y::Symbol;
                      nbands::Int = 3,
                      palette::String = "Blues",
                      colors::Union{AbstractVector, Nothing} = nothing,
                      legend::Bool = false,
                      kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    ec = horizonchart(_table_col(df, x), _table_col(df, y);
                      nbands = nbands, palette = palette, colors = colors,
                      legend = legend, kwargs...)
    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))
    return ec
end

"""
    horizonchart(x, Y; names)

Creates a multi-row `EChart` horizon chart — one compact row per series, all sharing
the same x-axis. This matches the classic horizon chart as shown in academic literature
and tools like Vega-Lite: many time series stacked vertically in a small space, each
independently scaled so differences within a series are visible regardless of magnitude.

## Methods
```julia
horizonchart(x::AbstractVector, Y::AbstractMatrix{<:Real}; names, ...)
horizonchart(x::AbstractVector, Y::AbstractVector{<:AbstractVector{<:Real}}; names, ...)
horizonchart(df, x::Symbol, ys::AbstractVector{Symbol}; ...)
```

## Arguments
* `names::Union{AbstractVector, Nothing} = nothing` : row labels; defaults to
  `"Series 1"`, `"Series 2"`, …
* `nbands::Int = 3` : number of fold levels per row
* `palette::String = "Blues"` : named sequential palette from `colorpalettes`;
  `nbands` colours are sampled light-to-dark and shared across all rows
* `colors::Union{AbstractVector, Nothing} = nothing` : explicit colour override;
  takes precedence over `palette` when provided
* `row_height::Int = 60` : height of each row in pixels
* `shared_scale::Bool = false` : if `true`, all rows use the same `band_size`
  (the global maximum ÷ `nbands`); if `false` (default) each row is scaled
  independently so its own range fills the band height
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Each row is an independent grid with its own x/y axes. The x-axis is shown only on
the bottom row. Row labels appear on the left y-axis of each row. Total chart height
is `n_series × row_height + bottom_margin` pixels.
"""
function horizonchart(x::AbstractVector,
                      Y::AbstractVector{<:AbstractVector{<:Real}};
                      names::Union{AbstractVector, Nothing} = nothing,
                      nbands::Int = 3,
                      palette::String = "Blues",
                      colors::Union{AbstractVector, Nothing} = nothing,
                      shared_scale::Bool = false,
                      row_height::Int = 60,
                      kwargs...)

    n = length(Y)
    n >= 2 || throw(ArgumentError("multi-row horizonchart requires at least 2 series"))
    all(length(yi) == length(x) for yi in Y) ||
        throw(ArgumentError("every series in Y must have the same length as x"))
    nbands >= 1 || throw(ArgumentError("nbands must be ≥ 1"))

    row_names = isnothing(names) ? ["Series $i" for i in 1:n] : collect(names)
    length(row_names) == n ||
        throw(ArgumentError("length(names) must equal number of series"))

    clrs = isnothing(colors) ? _horizon_colors(palette, nbands) : colors
    length(clrs) == nbands ||
        throw(ArgumentError("length(colors) must equal nbands"))

    x_type = eltype(x) <: Real ? "value" : "category"

    # Shift each series to non-negative, compute per-row band_size
    y_shifted = Vector{Vector{Float64}}(undef, n)
    band_sizes = Vector{Float64}(undef, n)
    for i in 1:n
        ymin = minimum(Y[i])
        ys   = ymin < 0 ? collect(Float64, Y[i] .- ymin) : collect(Float64, Y[i])
        y_shifted[i]  = ys
        band_sizes[i] = maximum(ys) / nbands
    end

    if shared_scale
        global_bs = maximum(band_sizes)
        band_sizes .= global_bs
    end

    # ── Pixel-exact layout ───────────────────────────────────────────────────
    # All positions in pixels so rows align perfectly regardless of label length.
    canvas_w  = 800
    lm_px     = 110   # fixed left margin — labels are right-aligned here
    rm_px     = 10
    title_px  = 40    # reserved for an optional title above the rows
    bottom_px = 30    # space for x-axis ticks on the last row
    row_gap   = 1     # 1 px gap between rows

    canvas_h  = title_px + n * row_height + bottom_px

    grids   = Grid[]
    xaxes   = Axis[]
    yaxes   = Axis[]
    seriess = AbstractEChartSeries[]
    labels  = GraphicElement[]

    for i in 1:n
        idx    = i - 1
        row_top = title_px + (i - 1) * row_height
        bs      = band_sizes[i]
        show_x  = i == n

        push!(grids, Grid(
            left   = lm_px,
            top    = row_top,
            width  = canvas_w - lm_px - rm_px,
            height = row_height - row_gap,
        ))

        push!(xaxes, Axis(
            _type     = x_type,
            gridIndex = idx,
            show      = show_x,
            axisLabel = show_x ? AxisLabel(fontSize = 10) : AxisLabel(show = false),
            splitLine = SplitLine(show = false),
            axisTick  = AxisTick(show = show_x),
        ))

        push!(yaxes, Axis(
            _type     = "value",
            gridIndex = idx,
            min       = 0,
            axisLabel = AxisLabel(show = false),
            splitLine = SplitLine(show = false),
            axisTick  = AxisTick(show = false),
            axisLine  = AxisLine(show = false),
        ))

        # Right-aligned graphic text label.
        # style.x/style.y set the anchor point; textAlign="right" means text
        # extends leftward from that anchor, keeping all labels flush-right.
        push!(labels, GraphicElement(
            _type = "text",
            style = GraphicStyle(
                text              = row_names[i],
                x                 = lm_px - 6,
                y                 = row_top + div(row_height, 2),
                textAlign         = "right",
                textVerticalAlign = "middle",
                fill              = "#555",
                font              = "12px sans-serif",
            ),
        ))

        for k in 0:nbands-1
            band_y = [max(0.0, min(y_shifted[i][j] - k * bs, bs))
                      for j in eachindex(y_shifted[i])]
            push!(seriess, XYSeries(
                name       = i == 1 ? "Band $(k+1)" : nothing,
                _type      = "line",
                data       = arrayofarray(x, band_y),
                xAxisIndex = idx,
                yAxisIndex = idx,
                areaStyle  = AreaStyle(color = clrs[k+1]),
                lineStyle  = LineStyle(opacity = 0),
                showSymbol = false,
            ))
        end
    end

    ec = newplot(kwargs, ec_charttype = "horizonchart")
    ec.grid    = grids
    ec.xAxis   = xaxes
    ec.yAxis   = yaxes
    ec.series  = seriess
    ec.legend  = nothing
    ec.graphic = Graphic(labels)
    ec.ec_height = canvas_h
    ec.ec_width  = canvas_w

    return ec
end

"""
    horizonchart(x, Y::AbstractMatrix; names, ...)

Multi-row horizon chart from a matrix where each column is one series.
See the `horizonchart(x, Y::Vector{Vector})` method for full documentation.
"""
function horizonchart(x::AbstractVector,
                      Y::AbstractMatrix{<:Real};
                      kwargs...)
    horizonchart(x, [Y[:, j] for j in axes(Y, 2)]; kwargs...)
end

"""
    horizonchart(df, x, ys; ...)

Multi-row horizon chart from table `df`, where `ys` is a vector of column symbols —
one row per column.
See the `horizonchart(x, Y::Vector{Vector})` method for full documentation.
"""
function horizonchart(df, x::Symbol, ys::AbstractVector{Symbol};
                      names::Union{AbstractVector, Nothing} = nothing,
                      nbands::Int = 3,
                      palette::String = "Blues",
                      colors::Union{AbstractVector, Nothing} = nothing,
                      shared_scale::Bool = false,
                      row_height::Int = 60,
                      kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    xvec = _table_col(df, x)
    Yvec = [_table_col(df, s) for s in ys]
    nm   = isnothing(names) ? string.(ys) : names
    horizonchart(xvec, Yvec;
                 names = nm, nbands = nbands, palette = palette, colors = colors,
                 shared_scale = shared_scale, row_height = row_height, kwargs...)
end
