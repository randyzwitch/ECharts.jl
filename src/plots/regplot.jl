"""
    regplot(x, y)

Creates an `EChart` regression plot — a scatter of the raw data overlaid with an OLS
regression line and an optional confidence interval band.

## Methods
```julia
regplot(x::AbstractVector{<:Real}, y::AbstractVector{<:Real})
regplot(df, x::Symbol, y::Symbol)
```

## Arguments
* `ci::Bool = true` : draw a confidence interval band around the regression line?
* `ci_level::Real = 0.95` : confidence level (e.g. `0.95` for a 95% CI)
* `npoints::Int = 200` : number of points used to draw the smooth fitted line
* `ci_color::String = "#5470c6"` : color used for the CI band fill
* `line_color::String = "#5470c6"` : color of the regression line
* `scatter_color::String = "#5470c6"` : color of the scatter dots
* `ci_opacity::Real = 0.2` : opacity of the CI band fill
* `legend::Bool = false` : display legend?
* `scale::Bool = true` : show truncated Y-axis (zoomed to data)?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

The regression line is estimated via ordinary least squares (OLS). The confidence
interval uses the standard error of the **mean prediction** at each x value:

    SE(x₀) = s · √(1/n + (x₀ − x̄)² / Σ(xᵢ − x̄)²)

where `s` is the residual standard error. The critical value is taken from a
Normal approximation (z-score), which is accurate for large n and reasonable for n ≥ 30.

Missing values in either `x` or `y` are silently dropped before fitting.
"""
function regplot(x::AbstractVector{<:Real},
                 y::AbstractVector{<:Real};
                 ci::Bool         = true,
                 ci_level::Real   = 0.95,
                 npoints::Int     = 200,
                 ci_color::String    = "#5470c6",
                 line_color::String  = "#5470c6",
                 scatter_color::String = "#91cc75",
                 ci_opacity::Real = 0.2,
                 legend::Bool     = false,
                 scale::Bool      = true,
                 kwargs...)

    length(x) == length(y) || throw(ArgumentError("x and y must have the same length"))
    length(x) >= 2         || throw(ArgumentError("x and y must have at least 2 elements"))

    xf = Float64.(x)
    yf = Float64.(y)

    # OLS
    n     = length(xf)
    x_bar = sum(xf) / n
    y_bar = sum(yf) / n
    sxx   = sum((xi - x_bar)^2 for xi in xf)
    sxy   = sum((xf[i] - x_bar) * (yf[i] - y_bar) for i in eachindex(xf))
    slope     = sxy / sxx
    intercept = y_bar - slope * x_bar

    # Residual standard error
    y_hat = [intercept + slope * xi for xi in xf]
    sse   = sum((yf[i] - y_hat[i])^2 for i in eachindex(yf))
    s     = n > 2 ? sqrt(sse / (n - 2)) : 0.0

    # Critical value (Normal approximation)
    z = _normal_quantile((1 + ci_level) / 2)

    # Build smooth line + band over [xmin, xmax]
    xgrid  = collect(range(minimum(xf), maximum(xf); length = npoints))
    y_fit  = [intercept + slope * xi for xi in xgrid]
    se_fit = [s * sqrt(1/n + (xi - x_bar)^2 / sxx) for xi in xgrid]

    # Scatter points
    scatter_pts = [[xf[i], yf[i]] for i in eachindex(xf)]

    ec = newplot(kwargs, ec_charttype = "regplot")
    ec.xAxis = [Axis(_type = "value", nameGap = 50, scale = scale)]
    ec.yAxis = [Axis(_type = "value", nameGap = 50, scale = scale)]

    # Series order: CI lower band (transparent base), CI upper band (filled), regression line, scatter
    if ci && s > 0
        lo_pts = [[xgrid[i], y_fit[i] - z * se_fit[i]] for i in eachindex(xgrid)]
        hi_diff = [2 * z * se_fit[i] for i in eachindex(xgrid)]

        # Lower invisible base for stacking
        ec.series = [
            XYSeries(
                name            = "",
                _type           = "line",
                data            = lo_pts,
                lineStyle       = LineStyle(width = 0),
                showSymbol      = false,
                legendHoverLink = false,
                silent          = true,
                stack           = "ci_band",
            ),
            XYSeries(
                name            = "",
                _type           = "line",
                data            = [[xgrid[i], hi_diff[i]] for i in eachindex(xgrid)],
                lineStyle       = LineStyle(width = 0),
                showSymbol      = false,
                areaStyle       = AreaStyle(color = ci_color, opacity = ci_opacity),
                legendHoverLink = false,
                silent          = true,
                stack           = "ci_band",
            ),
            XYSeries(
                name      = "Fit",
                _type     = "line",
                data      = [[xgrid[i], y_fit[i]] for i in eachindex(xgrid)],
                showSymbol = false,
                lineStyle  = LineStyle(color = line_color),
            ),
            XYSeries(
                name      = "Data",
                _type     = "scatter",
                data      = scatter_pts,
                itemStyle = ItemStyle(color = scatter_color),
            ),
        ]
    else
        ec.series = [
            XYSeries(
                name      = "Fit",
                _type     = "line",
                data      = [[xgrid[i], y_fit[i]] for i in eachindex(xgrid)],
                showSymbol = false,
                lineStyle  = LineStyle(color = line_color),
            ),
            XYSeries(
                name      = "Data",
                _type     = "scatter",
                data      = scatter_pts,
                itemStyle = ItemStyle(color = scatter_color),
            ),
        ]
    end

    legend ? legend!(ec) : nothing
    return ec
end

"""
    regplot(df, x, y)

Creates an `EChart` regression plot from columns `x` and `y` in table `df`.
Axis labels are set automatically from column names.
See the primary `regplot` method for full argument documentation.
"""
function regplot(df, x::Symbol, y::Symbol;
                 ci::Bool         = true,
                 ci_level::Real   = 0.95,
                 npoints::Int     = 200,
                 ci_color::String    = "#5470c6",
                 line_color::String  = "#5470c6",
                 scatter_color::String = "#91cc75",
                 ci_opacity::Real = 0.2,
                 legend::Bool     = false,
                 scale::Bool      = true,
                 kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    xcol = Float64.(collect(skipmissing(_table_col(df, x))))
    ycol = Float64.(collect(skipmissing(_table_col(df, y))))
    ec = regplot(xcol, ycol;
                 ci = ci, ci_level = ci_level, npoints = npoints,
                 ci_color = ci_color, line_color = line_color,
                 scatter_color = scatter_color, ci_opacity = ci_opacity,
                 legend = legend, scale = scale, kwargs...)
    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))
    return ec
end

# Rational approximation to the Normal quantile (Abramowitz & Stegun 26.2.17).
# Accurate to ~4.5e-4 for p in (0, 1).
function _normal_quantile(p::Real)
    0 < p < 1 || throw(ArgumentError("p must be in (0, 1)"))
    p < 0.5 && return -_normal_quantile(1 - p)
    t = sqrt(-2 * log(1 - p))
    c0, c1, c2 = 2.515517, 0.802853, 0.010328
    d1, d2, d3 = 1.432788, 0.189269, 0.001308
    return t - (c0 + c1*t + c2*t^2) / (1 + d1*t + d2*t^2 + d3*t^3)
end
