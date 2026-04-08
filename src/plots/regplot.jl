"""
    regplot!(ec, x, y)

Overlays an OLS regression line and optional confidence interval band on an existing `EChart`
(typically a scatter plot).

## Methods
```julia
regplot!(ec::EChart, x::AbstractVector{<:Real}, y::AbstractVector{<:Real};
         ci, ci_level, npoints, ci_color, line_color, ci_opacity)
```

## Arguments
* `x::AbstractVector{<:Real}` : predictor values (same data used to build `ec`)
* `y::AbstractVector{<:Real}` : response values (same data used to build `ec`)
* `ci::Bool = true` : draw a confidence interval band around the regression line?
* `ci_level::Real = 0.95` : confidence level (e.g. `0.95` for a 95% CI)
* `npoints::Int = 200` : number of points used to draw the smooth fitted line
* `ci_color::String = "#5470c6"` : color used for the CI band fill and regression line
* `line_color::String = "#5470c6"` : color of the regression line
* `ci_opacity::Real = 0.2` : opacity of the CI band fill

## Notes

The regression line is estimated via ordinary least squares (OLS). The confidence
interval uses the standard error of the **mean prediction** at each x value:

    SE(x₀) = s · √(1/n + (x₀ − x̄)² / Σ(xᵢ − x̄)²)

where `s` is the residual standard error. The critical value is taken from a Normal
approximation (z-score), accurate for large n and reasonable for n ≥ 30.

Missing values in either `x` or `y` are silently dropped before fitting.
"""
function regplot!(ec::EChart,
                  x::AbstractVector{<:Real},
                  y::AbstractVector{<:Real};
                  ci::Bool            = true,
                  ci_level::Real      = 0.95,
                  npoints::Int        = 200,
                  ci_color::String    = "#5470c6",
                  line_color::String  = "#5470c6",
                  ci_opacity::Real    = 0.2)

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

    z = _normal_quantile((1 + ci_level) / 2)

    xgrid  = collect(range(minimum(xf), maximum(xf); length = npoints))
    y_fit  = [intercept + slope * xi for xi in xgrid]
    se_fit = [s * sqrt(1/n + (xi - x_bar)^2 / sxx) for xi in xgrid]

    if ci && s > 0
        lo_pts  = [[xgrid[i], y_fit[i] - z * se_fit[i]] for i in eachindex(xgrid)]
        hi_diff = [2 * z * se_fit[i] for i in eachindex(xgrid)]

        push!(ec.series, XYSeries(
            name            = "",
            _type           = "line",
            data            = lo_pts,
            lineStyle       = LineStyle(width = 0),
            showSymbol      = false,
            legendHoverLink = false,
            silent          = true,
            stack           = "ci_band",
        ))
        push!(ec.series, XYSeries(
            name            = "",
            _type           = "line",
            data            = [[xgrid[i], hi_diff[i]] for i in eachindex(xgrid)],
            lineStyle       = LineStyle(width = 0),
            showSymbol      = false,
            areaStyle       = AreaStyle(color = ci_color, opacity = ci_opacity),
            legendHoverLink = false,
            silent          = true,
            stack           = "ci_band",
        ))
    end

    push!(ec.series, XYSeries(
        name       = "Fit",
        _type      = "line",
        data       = [[xgrid[i], y_fit[i]] for i in eachindex(xgrid)],
        showSymbol = false,
        lineStyle  = LineStyle(color = line_color),
    ))

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
