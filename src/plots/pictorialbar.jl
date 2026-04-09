"""
    pictorialbar(x, y)

Creates an `EChart` pictorial bar chart, where bars are rendered using a custom symbol
(icon, shape, or SVG path) instead of plain rectangles.

## Methods
```julia
pictorialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
pictorialbar(df, x::Symbol, y::Symbol)
```

## Arguments
* `symbol::Union{String, AbstractVector} = "roundRect"` : symbol shape for all bars, or a vector of shapes (one per bar). Built-in shapes: `"circle"`, `"rect"`, `"roundRect"`, `"triangle"`, `"diamond"`, `"pin"`, `"arrow"`. Also accepts SVG paths (`"path://..."`) and image URLs (`"image://..."`).
* `symbolSize::Union{Number, AbstractVector, Nothing} = nothing` : symbol size as a number (uniform) or `[width, height]` vector. When `nothing`, ECharts scales the symbol to fill the bar.
* `symbolRepeat::Union{Bool, Int, String, Nothing} = false` : `false` — single symbol scaled to bar value; `true` — repeat symbols to fill bar height; `"fixed"` — repeat with a fixed symbol size.
* `symbolBoundingData::Union{Number, Nothing} = nothing` : the maximum data value used as the bounding reference when repeating symbols. Useful for aligning bars with different values.
* `horizontal::Bool = false` : flip axes to produce a horizontal chart.
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct.

## Notes

When `symbol` is a vector, each element sets the shape for the corresponding bar, enabling
mixed-symbol charts (e.g., different icons for different categories).

Built-in ECharts symbol names (case-sensitive): `"circle"`, `"rect"`, `"roundRect"`,
`"triangle"`, `"diamond"`, `"pin"`, `"arrow"`, `"none"`.
"""
function pictorialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
                      symbol::Union{String, AbstractVector} = "roundRect",
                      symbolSize::Union{Number, AbstractVector, Nothing} = nothing,
                      symbolRepeat::Union{Bool, Int, String, Nothing} = false,
                      symbolBoundingData::Union{Number, Nothing} = nothing,
                      horizontal::Bool = false,
                      legend::Bool = false,
                      kwargs...)

    length(x) == length(y) || throw(ArgumentError("x and y must have the same length"))
    if symbol isa AbstractVector
        length(symbol) == length(y) ||
            throw(ArgumentError("symbol vector must have the same length as y"))
    end

    ec = newplot(kwargs, ec_charttype = "pictorialbar")
    ec.xAxis = [Axis(_type = "category", data = collect(string.(x)))]
    ec.yAxis = [Axis(_type = "value")]

    # When symbol is a vector, embed per-point symbol in the data array
    if symbol isa AbstractVector
        data = [Dict("value" => v, "symbol" => s) for (v, s) in zip(y, symbol)]
        series_symbol = nothing
    else
        data = collect(y)
        series_symbol = symbol
    end

    ec.series = [PictorialBarSeries(
        name               = "Series 1",
        data               = data,
        symbol             = series_symbol,
        symbolSize         = symbolSize isa Number ? [symbolSize, symbolSize] : symbolSize,
        symbolRepeat       = symbolRepeat,
        symbolBoundingData = symbolBoundingData isa Number ? symbolBoundingData : nothing,
    )]

    horizontal ? flip!(ec) : nothing
    legend ? legend!(ec) : nothing

    return ec
end

"""
    pictorialbar(df, x, y)

Creates an `EChart` pictorial bar chart from columns `x` and `y` in table `df`.
See the primary `pictorialbar` method for full argument documentation.
"""
function pictorialbar(df, x::Symbol, y::Symbol;
                      symbol::Union{String, AbstractVector} = "roundRect",
                      symbolSize::Union{Number, AbstractVector, Nothing} = nothing,
                      symbolRepeat::Union{Bool, Int, String, Nothing} = false,
                      symbolBoundingData::Union{Number, Nothing} = nothing,
                      horizontal::Bool = false,
                      legend::Bool = false,
                      kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    pictorialbar(_table_col(df, x), _table_col(df, y);
                 symbol = symbol, symbolSize = symbolSize,
                 symbolRepeat = symbolRepeat, symbolBoundingData = symbolBoundingData,
                 horizontal = horizontal, legend = legend, kwargs...)
end
