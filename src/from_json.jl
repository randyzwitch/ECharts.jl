"""
    from_json(json_str; width=800, height=450, renderer="canvas", theme=roma) -> EChart

Parse an Apache ECharts JSON option string into an [`EChart`](@ref) struct.

The resulting chart can be rendered, modified with the standard ECharts.jl modifier functions,
and re-exported.

Any JSON keys that have no corresponding field in the Julia type system emit a `@warn` message
so that gaps can be identified and fixed. Pass `warn_unknown=false` to suppress these warnings.

"""
function from_json(json_str::AbstractString;
                   width::Int     = 800,
                   height::Int    = 450,
                   renderer::String = "canvas",
                   theme::Theme   = roma,
                   warn_unknown::Bool = true)
    d = JSON.parse(json_str)
    ec = EChart()
    ec.ec_width    = width
    ec.ec_height   = height
    ec.ec_renderer = renderer
    ec.theme       = theme

    # Clear EChart defaults so the output is faithful to the input JSON
    ec.title   = nothing
    ec.grid    = nothing
    ec.tooltip = nothing
    ec.toolbox = nothing
    ec.aria    = nothing

    _fill_echart!(ec, d, warn_unknown)
    return ec
end

# ---------------------------------------------------------------------------
# Top-level EChart field dispatcher
# ---------------------------------------------------------------------------

const _ECHART_TOP_LEVEL_KEYS = Set([
    "backgroundColor", "animation", "animationThreshold",
    "animationDuration", "animationEasing", "animationDelay",
    "animationDurationUpdate", "animationEasingUpdate",
    "animationDelayUpdate", "progressive", "progressiveThreshold",
    "blendMode", "hoverLayerThreshold", "useUTC",
    "color", "title", "legend", "grid", "xAxis", "yAxis", "polar",
    "radiusAxis", "angleAxis", "radar", "dataZoom", "visualMap",
    "tooltip", "axisPointer", "toolbox", "brush", "geo", "parallel",
    "parallelAxis", "singleAxis", "timeline", "calendar", "dataset",
    "aria", "series", "options", "media",
])

function _fill_echart!(ec::EChart, d::AbstractDict, warn_unknown::Bool)
    # Scalar pass-through fields
    for key in ("backgroundColor", "animation", "animationThreshold",
                "animationDuration", "animationEasing", "animationDelay",
                "animationDurationUpdate", "animationEasingUpdate",
                "animationDelayUpdate", "progressive", "progressiveThreshold",
                "blendMode", "hoverLayerThreshold", "useUTC")
        if haskey(d, key)
            sym = Symbol(key)
            try; setfield!(ec, sym, d[key]); catch; end
        end
    end

    haskey(d, "color")           && (ec.color           = d["color"])
    haskey(d, "title")           && (ec.title           = _parse_titles(d["title"], warn_unknown))
    haskey(d, "legend")          && (ec.legend          = _parse_legend(d["legend"], warn_unknown))
    haskey(d, "grid")            && (ec.grid            = _parse_grids(d["grid"], warn_unknown))
    haskey(d, "xAxis")           && (ec.xAxis           = _parse_axes(d["xAxis"], warn_unknown))
    haskey(d, "yAxis")           && (ec.yAxis           = _parse_axes(d["yAxis"], warn_unknown))
    haskey(d, "polar")           && (ec.polar           = _parse_polar(d["polar"], warn_unknown))
    haskey(d, "radiusAxis")      && (ec.radiusAxis      = _parse_echarts_struct(RadiusAxis, d["radiusAxis"], warn_unknown))
    haskey(d, "angleAxis")       && (ec.angleAxis       = _parse_echarts_struct(AngleAxis, d["angleAxis"], warn_unknown))
    haskey(d, "radar")           && (ec.radar           = _parse_radars(d["radar"], warn_unknown))
    haskey(d, "dataZoom")        && (ec.dataZoom        = _parse_datazoom_list(d["dataZoom"], warn_unknown))
    haskey(d, "visualMap")       && (ec.visualMap       = _parse_echarts_struct(VisualMap, d["visualMap"], warn_unknown))
    haskey(d, "tooltip")         && (ec.tooltip         = _parse_echarts_struct(Tooltip, d["tooltip"], warn_unknown))
    haskey(d, "axisPointer")     && (ec.axisPointer     = _parse_echarts_struct(AxisPointer, d["axisPointer"], warn_unknown))
    haskey(d, "toolbox")         && (ec.toolbox         = _parse_echarts_struct(Toolbox, d["toolbox"], warn_unknown))
    haskey(d, "brush")           && (ec.brush           = _parse_echarts_struct(Brush, d["brush"], warn_unknown))
    haskey(d, "geo")             && (ec.geo             = _parse_echarts_struct(Geo, d["geo"], warn_unknown))
    haskey(d, "parallel")        && (ec.parallel        = _parse_echarts_struct(Parallel, d["parallel"], warn_unknown))
    haskey(d, "parallelAxis")    && (ec.parallelAxis    = _parse_parallel_axis(d["parallelAxis"], warn_unknown))
    haskey(d, "singleAxis")      && (ec.singleAxis      = _parse_echarts_struct(SingleAxis, d["singleAxis"], warn_unknown))
    haskey(d, "timeline")        && (ec.timeline        = _parse_echarts_struct(Timeline, d["timeline"], warn_unknown))
    haskey(d, "calendar")        && (ec.calendar        = _parse_echarts_struct(Calendar, d["calendar"], warn_unknown))
    haskey(d, "dataset")         && (ec.dataset         = _parse_echarts_struct(Dataset, d["dataset"], warn_unknown))
    haskey(d, "aria")            && (ec.aria            = _parse_echarts_struct(Aria, d["aria"], warn_unknown))
    haskey(d, "series")          && (ec.series          = _parse_series_list(d["series"], warn_unknown))
    haskey(d, "options")         && (ec.options         = d["options"])
    haskey(d, "media")           && (ec.media           = d["media"])

    if warn_unknown
        for key in keys(d)
            key in _ECHART_TOP_LEVEL_KEYS && continue
            @warn "ECharts.jl: unknown top-level key \"$key\" — consider opening an issue at https://github.com/randyzwitch/ECharts.jl/issues"
        end
    end
end

# ---------------------------------------------------------------------------
# Normalise single-object vs array-of-objects
# ---------------------------------------------------------------------------

_to_array(v::AbstractVector) = v
_to_array(v)                  = [v]

# ---------------------------------------------------------------------------
# Title
# ---------------------------------------------------------------------------

function _parse_titles(v, warn_unknown::Bool)
    v isa AbstractVector && return [_parse_echarts_struct(Title, t, warn_unknown) for t in v if t isa AbstractDict]
    v isa AbstractDict   && return [_parse_echarts_struct(Title, v, warn_unknown)]
    return [Title()]
end

# ---------------------------------------------------------------------------
# Axes
# ---------------------------------------------------------------------------

function _parse_axes(v, warn_unknown::Bool)
    items = _to_array(v)
    return Axis[_parse_echarts_struct(Axis, a isa AbstractDict ? a : Dict(), warn_unknown) for a in items]
end

# ---------------------------------------------------------------------------
# Grid
# ---------------------------------------------------------------------------

function _parse_grids(v, warn_unknown::Bool)
    items = _to_array(v)
    return Grid[_parse_echarts_struct(Grid, g isa AbstractDict ? g : Dict(), warn_unknown) for g in items]
end

# ---------------------------------------------------------------------------
# Legend
# ---------------------------------------------------------------------------

function _parse_legend(v, warn_unknown::Bool)
    v isa AbstractDict && return _parse_echarts_struct(Legend, v, warn_unknown)
    return Legend()
end

# ---------------------------------------------------------------------------
# Polar
# ---------------------------------------------------------------------------

function _parse_polar(v, warn_unknown::Bool)
    v isa AbstractDict   && return _parse_echarts_struct(Polar, v, warn_unknown)
    v isa AbstractVector && return [_parse_echarts_struct(Polar, p, warn_unknown) for p in v if p isa AbstractDict]
    return Polar()
end

# ---------------------------------------------------------------------------
# Radar
# ---------------------------------------------------------------------------

function _parse_radars(v, warn_unknown::Bool)
    items = _to_array(v)
    return Radar[_parse_echarts_struct(Radar, r isa AbstractDict ? r : Dict(), warn_unknown) for r in items]
end

# ---------------------------------------------------------------------------
# DataZoom
# ---------------------------------------------------------------------------

function _parse_datazoom_list(v, warn_unknown::Bool)
    items = _to_array(v)
    return DataZoom[_parse_echarts_struct(DataZoom, dz isa AbstractDict ? dz : Dict(), warn_unknown) for dz in items]
end

# ---------------------------------------------------------------------------
# ParallelAxis
# ---------------------------------------------------------------------------

function _parse_parallel_axis(v, warn_unknown::Bool)
    v isa AbstractVector && return [_parse_echarts_struct(ParallelAxis, a, warn_unknown) for a in v if a isa AbstractDict]
    v isa AbstractDict   && return _parse_echarts_struct(ParallelAxis, v, warn_unknown)
    return nothing
end

# ---------------------------------------------------------------------------
# Series
# ---------------------------------------------------------------------------

const _SERIES_TYPE_MAP = Dict{String, Type{<:AbstractEChartSeries}}(
    "bar"           => XYSeries,
    "line"          => XYSeries,
    "scatter"       => XYSeries,
    "pie"           => PieSeries,
    "radar"         => RadarSeries,
    "funnel"        => FunnelSeries,
    "gauge"         => GaugeSeries,
    "heatmap"       => HeatmapSeries,
    "candlestick"   => CandleStickSeries,
    "boxplot"       => BoxPlotSeries,
    "sankey"        => SankeySeries,
    "tree"          => TreeSeries,
    "treemap"       => TreemapSeries,
    "sunburst"      => SunburstSeries,
    "graph"         => GraphSeries,
    "effectScatter" => EffectScatterSeries,
    "lines"         => LinesSeries,
    "parallel"      => ParallelSeries,
    "map"           => MapSeries,
    "themeRiver"    => ThemeRiverSeries,
    "pictorialBar"  => PictorialBarSeries,
    "chord"         => ChordSeries,
    "custom"        => CustomSeries,
)

function _parse_series_list(v, warn_unknown::Bool)
    items = _to_array(v)
    result = AbstractEChartSeries[]
    for item in items
        item isa AbstractDict || continue
        push!(result, _parse_one_series(item, warn_unknown))
    end
    return result
end

function _parse_one_series(d::AbstractDict, warn_unknown::Bool)
    type_str = get(d, "type", "")
    T = get(_SERIES_TYPE_MAP, type_str, XYSeries)
    if warn_unknown && !haskey(_SERIES_TYPE_MAP, type_str) && type_str != ""
        @warn "ECharts.jl: unknown series type \"$type_str\" — falling back to XYSeries"
    end
    return _parse_echarts_struct(T, d, warn_unknown)
end

# ---------------------------------------------------------------------------
# Generic AbstractEChartType struct parser
#
# Strategy:
#   1. Map each JSON key to the Julia field (handling the _type/_end/_symbol
#      underscore-prefix convention from JSON.lower).
#   2. Coerce each value to the declared field type.
#   3. For any Union{…,Nothing} field NOT present in JSON, supply `nothing`
#      so that (a) required fields are satisfied and (b) the output stays
#      faithful to the input (no ECharts.jl-added defaults leak in).
#   4. Construct via keyword constructor produced by @with_kw.
# ---------------------------------------------------------------------------

function _parse_echarts_struct(T::Type{<:AbstractEChartType}, d::AbstractDict, warn_unknown::Bool = true)
    fnames  = fieldnames(T)
    kwargs  = Dict{Symbol,Any}()
    provided = Set{Symbol}()

    for (json_key, val) in d
        julia_sym = _json_to_julia_sym(T, json_key)
        if julia_sym === nothing || !(julia_sym in fnames)
            if warn_unknown
                @warn "ECharts.jl: unknown field \"$json_key\" in $T — consider opening an issue at https://github.com/randyzwitch/ECharts.jl/issues"
            end
            continue
        end
        ft = fieldtype(T, julia_sym)
        converted = _coerce_value(ft, val, warn_unknown)
        kwargs[julia_sym] = converted
        push!(provided, julia_sym)
    end

    # Null out any nullable fields that were NOT provided so we don't inject
    # ECharts.jl defaults (e.g. MarkLine(), AxisLabel(), etc.) into the output.
    for f in fnames
        f in provided && continue
        ft = fieldtype(T, f)
        Nothing <: ft && (kwargs[f] = nothing)
    end

    try
        return T(; kwargs...)
    catch
        # Fallback: try without the null-overrides (uses @with_kw defaults)
        clean = Dict{Symbol,Any}(k => v for (k, v) in kwargs if k in provided)
        try
            return T(; clean...)
        catch
            return _struct_fallback(T)
        end
    end
end

# Last-resort: build with all non-nullable defaults + nothing for nullable
function _struct_fallback(T::Type{<:AbstractEChartType})
    fnames = fieldnames(T)
    kwargs = Dict{Symbol,Any}()
    for f in fnames
        ft = fieldtype(T, f)
        Nothing <: ft && (kwargs[f] = nothing)
    end
    try
        return T(; kwargs...)
    catch
        # Cannot construct — return a bare instance (may panic for truly required fields)
        return T()
    end
end

# ---------------------------------------------------------------------------
# JSON key → Julia field symbol mapping
#
# JSON.lower strips a leading '_' from Julia field names:
#   _type → "type",  _end → "end",  _symbol → "symbol"
# The inverse: try the key as-is, then with '_' prepended.
# ---------------------------------------------------------------------------

function _json_to_julia_sym(T::Type, json_key::String)
    fnames = fieldnames(T)
    sym = Symbol(json_key)
    sym in fnames && return sym
    u_sym = Symbol("_" * json_key)
    u_sym in fnames && return u_sym
    return nothing
end

# ---------------------------------------------------------------------------
# Value coercion
# ---------------------------------------------------------------------------

function _coerce_value(::Type{T}, val, warn_unknown::Bool = true) where T
    val === nothing && return nothing

    # Already the right type
    val isa T && return val

    # Union: try each non-Nothing branch
    if T isa Union
        return _coerce_union(T, val, warn_unknown)
    end

    _coerce_concrete(T, val, warn_unknown)
end

function _coerce_union(U::Union, val, warn_unknown::Bool = true)
    non_nothing = filter(!=(Nothing), _union_types(U))

    # Prefer concrete ECharts struct types (most specific match)
    for t in non_nothing
        (t <: AbstractEChartType) || continue
        val isa AbstractDict || continue
        try; return _parse_echarts_struct(t, val, warn_unknown); catch; end
    end

    # Try remaining types in order
    for t in non_nothing
        (t <: AbstractEChartType) && continue   # already tried above
        try; return _coerce_concrete(t, val, warn_unknown); catch; end
    end

    return val  # fallback: keep original value
end

# Collect all concrete types from a Union tree
function _union_types(U::Union)
    result = Type[]
    _collect_union_types!(result, U)
    return result
end
function _collect_union_types!(acc, U::Union)
    _collect_union_types!(acc, U.a)
    _collect_union_types!(acc, U.b)
end
function _collect_union_types!(acc, T::Type)
    push!(acc, T)
end

function _coerce_concrete(::Type{T}, val, warn_unknown::Bool = true) where T
    val isa T && return val
    val === nothing && return nothing

    # String
    T <: AbstractString && return string(val)

    # Bool (before Integer, since Bool <: Integer)
    T == Bool && return Bool(val)

    # Integer
    T <: Integer && val isa Number && return round(T, val)

    # Float
    T <: AbstractFloat && val isa Number && return T(val)

    # Generic Number
    T <: Number && val isa Number && return val

    # JSON.JSONText — wrap raw strings / convert objects
    if T == JSON.JSONText
        val isa AbstractString && return JSON.JSONText(val)
        return JSON.JSONText(JSON.json(val))
    end

    # AbstractVector: wrap scalars
    if T <: AbstractVector
        val isa AbstractVector && return val
        return [val]
    end

    # AbstractDict: widen key/value types if needed
    if T <: AbstractDict
        val isa AbstractDict || return val
        try
            return convert(T, val)
        catch
            # e.g. Dict{Any,Any} from Dict{String,Any}
            try; return T(pairs(val)...); catch; end
            return val
        end
    end

    # AbstractEChartType
    T <: AbstractEChartType && val isa AbstractDict && return _parse_echarts_struct(T, val, warn_unknown)

    # Any — accept as-is
    T == Any && return val

    return val  # fallback
end
