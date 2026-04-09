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
* `colors::Union{AbstractVector, Nothing} = nothing` : vector of `nbands` colour strings;
  defaults to a sequential blue palette from light to dark
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

_horizon_palette(n::Int) = begin
    # Sequential blues from ColorBrewer Blues (light → dark)
    all_blues = ["#deebf7", "#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#084594"]
    idxs = round.(Int, range(1, length(all_blues), length = n))
    [all_blues[i] for i in idxs]
end

function horizonchart(x::AbstractVector, y::AbstractVector{<:Real};
                      nbands::Int = 3,
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
    clrs = isnothing(colors) ? _horizon_palette(nbands) : colors
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
    ec.yAxis  = [Axis(_type = "value", min = 0, max = band_size)]
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
                      colors::Union{AbstractVector, Nothing} = nothing,
                      legend::Bool = false,
                      kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    ec = horizonchart(_table_col(df, x), _table_col(df, y);
                      nbands = nbands, colors = colors, legend = legend, kwargs...)
    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))
    return ec
end
