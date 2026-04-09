"""
    bollinger!(ec, y)

Overlays Bollinger bands on an existing `EChart` (typically a candlestick or line chart).

## Methods
```julia
bollinger!(ec::EChart, y::AbstractVector{<:Union{Missing, Real}};
           window, nstd, band_color, band_opacity, show_mean, kwargs...)
```

## Arguments
* `y::AbstractVector` : the price/value series to compute bands from (e.g. closing prices)
* `window::Int = 20` : rolling window size for the moving average and standard deviation
* `nstd::Real = 2` : number of standard deviations for the band width
* `band_color::String = "#5470c6"` : fill color of the band region and mean line
* `band_opacity::Real = 0.15` : opacity of the band fill
* `show_mean::Bool = true` : overlay the rolling mean line?

## Notes

The rolling mean and standard deviation use a simple (unweighted) trailing window.
The first `window - 1` points have insufficient history; they are rendered as gaps
(`null` in JSON) so the bands only appear where a full window is available.

`y` must have the same length as the x-axis data already on `ec`.
"""
function bollinger!(ec::EChart,
                    y::AbstractVector{<:Union{Missing, Real}};
                    window::Int        = 20,
                    nstd::Real         = 2,
                    band_color::String = "#5470c6",
                    band_opacity::Real = 0.15,
                    show_mean::Bool    = true)

    n = length(y)
    length(ec.xAxis[1].data) == n ||
        throw(ArgumentError("y length ($n) must match the chart's x-axis length ($(length(ec.xAxis[1].data)))"))
    window >= 2 || throw(ArgumentError("window must be at least 2"))

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

    upper     = [isnothing(roll_mean[i]) ? nothing : roll_mean[i] + nstd * roll_std[i] for i in 1:n]
    lower     = [isnothing(roll_mean[i]) ? nothing : roll_mean[i] - nstd * roll_std[i] for i in 1:n]
    band_diff = [isnothing(upper[i]) || isnothing(lower[i]) ? nothing : upper[i] - lower[i] for i in 1:n]

    # Widen the series vector so XYSeries can be pushed onto any chart type (e.g. candlestick)
    ec.series = Vector{AbstractEChartSeries}(ec.series)

    # Lower invisible base for stacking
    push!(ec.series, XYSeries(
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
    push!(ec.series, XYSeries(
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

    if show_mean
        push!(ec.series, XYSeries(
            name       = "Mean ($(window))",
            _type      = "line",
            data       = roll_mean,
            showSymbol = false,
            lineStyle  = LineStyle(color = band_color),
        ))
    end

    return ec

end
