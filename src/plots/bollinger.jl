"""
    bollinger(x, y)

Creates an `EChart` Bollinger bands chart — a line series overlaid with a rolling
mean and upper/lower bands at ± `nstd` standard deviations.

## Methods
```julia
bollinger(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
bollinger(x::AbstractVector{<:Dates.TimeType}, y::AbstractVector{<:Union{Missing, Real}})
bollinger(df, x::Symbol, y::Symbol)
```

## Arguments
* `window::Int = 20` : rolling window size for the moving average and standard deviation
* `nstd::Real = 2` : number of standard deviations for the band width
* `band_color::String = "#5470c6"` : fill color of the band region
* `band_opacity::Real = 0.15` : opacity of the band fill
* `show_raw::Bool = true` : overlay the raw data line?
* `raw_color::String = "#91cc75"` : color of the raw data line
* `legend::Bool = true` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

The rolling mean and standard deviation use a simple (unweighted) trailing window.
The first `window - 1` points have insufficient history; they are rendered as gaps
(`null` in JSON) in the band series so the bands only appear where a full window is
available. The raw series always spans all points.

Missing values in `y` are propagated as-is and rendered as gaps in ECharts.
"""
function bollinger(x::AbstractVector,
                   y::AbstractVector{<:Union{Missing, Real}};
                   window::Int       = 20,
                   nstd::Real        = 2,
                   band_color::String  = "#5470c6",
                   band_opacity::Real  = 0.15,
                   show_raw::Bool    = true,
                   raw_color::String = "#91cc75",
                   legend::Bool      = true,
                   scale::Bool       = false,
                   kwargs...)

    length(x) == length(y) || throw(ArgumentError("x and y must have the same length"))
    window >= 2             || throw(ArgumentError("window must be at least 2"))

    xs = string.(x)
    n  = length(y)

    # Rolling mean and std; nothing (→ null in JSON) where window is incomplete
    roll_mean = Vector{Union{Float64, Nothing}}(nothing, n)
    roll_std  = Vector{Union{Float64, Nothing}}(nothing, n)
    for i in window:n
        seg = [Float64(v) for v in y[(i - window + 1):i] if !ismissing(v)]
        if length(seg) >= 2
            m = sum(seg) / length(seg)
            roll_mean[i] = m
            roll_std[i]  = sqrt(sum((v - m)^2 for v in seg) / (length(seg) - 1))
        end
    end

    upper = [isnothing(roll_mean[i]) ? nothing : roll_mean[i] + nstd * roll_std[i] for i in 1:n]
    lower = [isnothing(roll_mean[i]) ? nothing : roll_mean[i] - nstd * roll_std[i] for i in 1:n]

    # Band via stacked area: invisible base (lower) + diff band
    band_diff = [isnothing(upper[i]) || isnothing(lower[i]) ? nothing : upper[i] - lower[i] for i in 1:n]

    ec = newplot(kwargs, ec_charttype = "bollinger")
    ec.xAxis = [Axis(_type = "category", data = xs, boundaryGap = false)]
    ec.yAxis = [Axis(_type = "value", scale = scale)]

    series = XYSeries[]

    # Lower invisible base for stacking
    push!(series, XYSeries(
        name            = "",
        _type           = "line",
        data            = lower,
        lineStyle       = LineStyle(width = 0),
        showSymbol      = false,
        legendHoverLink = false,
        silent          = true,
        stack           = "bollinger_band",
    ))

    # Upper diff — filled area creates the band
    push!(series, XYSeries(
        name            = "",
        _type           = "line",
        data            = band_diff,
        lineStyle       = LineStyle(width = 0),
        showSymbol      = false,
        areaStyle       = AreaStyle(color = band_color, opacity = band_opacity),
        legendHoverLink = false,
        silent          = true,
        stack           = "bollinger_band",
    ))

    # Rolling mean line
    push!(series, XYSeries(
        name      = "Mean ($(window))",
        _type     = "line",
        data      = roll_mean,
        showSymbol = false,
        lineStyle  = LineStyle(color = band_color),
    ))

    # Raw data line
    if show_raw
        raw_vals = [ismissing(v) ? missing : Float64(v) for v in y]
        push!(series, XYSeries(
            name      = "Value",
            _type     = "line",
            data      = raw_vals,
            showSymbol = false,
            lineStyle  = LineStyle(color = raw_color),
        ))
    end

    ec.series = series
    legend ? legend!(ec) : nothing
    return ec
end

"""
    bollinger(x, y)

Creates an `EChart` Bollinger bands chart from `AbstractVector{<:Dates.TimeType}` x values.
Date/DateTime values are converted to strings and forwarded to the primary method.
See the primary `bollinger` method for full argument documentation.
"""
bollinger(x::AbstractVector{<:Dates.TimeType},
          y::AbstractVector{<:Union{Missing, Real}};
          kwargs...) = bollinger(string.(x), y; kwargs...)

"""
    bollinger(df, x, y)

Creates an `EChart` Bollinger bands chart from columns `x` and `y` in table `df`.
Axis labels are set automatically from column names.
See the primary `bollinger` method for full argument documentation.
"""
function bollinger(df, x::Symbol, y::Symbol;
                   window::Int       = 20,
                   nstd::Real        = 2,
                   band_color::String  = "#5470c6",
                   band_opacity::Real  = 0.15,
                   show_raw::Bool    = true,
                   raw_color::String = "#91cc75",
                   legend::Bool      = true,
                   scale::Bool       = false,
                   kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    ec = bollinger(_table_col(df, x), _table_col(df, y);
                   window = window, nstd = nstd,
                   band_color = band_color, band_opacity = band_opacity,
                   show_raw = show_raw, raw_color = raw_color,
                   legend = legend, scale = scale, kwargs...)
    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))
    return ec
end
