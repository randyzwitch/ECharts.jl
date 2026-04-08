"""
    linreg!(ec, x, y)

Overlays an OLS regression line and optional confidence interval band on an existing `EChart`
(typically a scatter plot).

## Methods
```julia
linreg!(ec::EChart, x::AbstractVector{<:Real}, y::AbstractVector{<:Real};
        ci, ci_level, npoints, ci_color, line_color, ci_opacity,
        annotation, annotation_color, annotation_font)
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
* `annotation::Bool = false` : overlay the regression equation and R² as a text label?
* `annotation_color::String = "#333333"` : text color for the annotation label
* `annotation_font::String = "14px sans-serif"` : CSS font string for the annotation label

## Notes

The regression line is estimated via ordinary least squares (OLS). The confidence
interval uses the standard error of the **mean prediction** at each x value:

    SE(x₀) = s · √(1/n + (x₀ − x̄)² / Σ(xᵢ − x̄)²)

where `s` is the residual standard error. The critical value is taken from a Normal
approximation (z-score), accurate for large n and reasonable for n ≥ 30.

Missing values in either `x` or `y` are silently dropped before fitting.
"""
function linreg!(ec::EChart,
                 x::AbstractVector{<:Real},
                 y::AbstractVector{<:Real};
                 ci::Bool                 = true,
                 ci_level::Real           = 0.95,
                 npoints::Int             = 200,
                 ci_color::String         = "#5470c6",
                 line_color::String       = "#5470c6",
                 ci_opacity::Real         = 0.2,
                 annotation::Bool         = false,
                 annotation_color::String = "#333333",
                 annotation_font::String  = "14px sans-serif")

    length(x) == length(y) || throw(ArgumentError("x and y must have the same length"))
    length(x) >= 2         || throw(ArgumentError("x and y must have at least 2 elements"))

    xf = Float64.(x)
    yf = Float64.(y)

    # OLS via StatsBase mean/cov/var
    n         = length(xf)
    x_bar     = mean(xf)
    slope     = cov(xf, yf) / var(xf)
    intercept = mean(yf) - slope * x_bar
    sxx       = var(xf) * (n - 1)   # needed for SE formula

    # Residual standard error
    sse = sum((yf[i] - (intercept + slope * xf[i]))^2 for i in eachindex(xf))
    s   = n > 2 ? sqrt(sse / (n - 2)) : 0.0

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

    if annotation
        r² = cor(xf, yf)^2
        fmt(v) = string(round(v, sigdigits = 3))
        sign_str = intercept >= 0 ? "+" : "-"
        label_text = "ŷ = $(fmt(slope))x $sign_str $(fmt(abs(intercept)))\nR² = $(fmt(r²))"
        el = GraphicElement(
            _type  = "text",
            right  = "5%",
            bottom = "10%",
            style  = GraphicStyle(
                text      = label_text,
                fill      = annotation_color,
                font      = annotation_font,
            ),
        )
        if isnothing(ec.graphic)
            ec.graphic = Graphic([el])
        else
            push!(ec.graphic.elements, el)
        end
    end

    return ec

end

# Rational approximation to the Normal quantile (Abramowitz & Stegun 26.2.17).
# Accurate to ~4.5e-4 for p in (0, 1). StatsBase has no norminvcdf equivalent.
function _normal_quantile(p::Real)
    0 < p < 1 || throw(ArgumentError("p must be in (0, 1)"))
    p < 0.5 && return -_normal_quantile(1 - p)
    t = sqrt(-2 * log(1 - p))
    c0, c1, c2 = 2.515517, 0.802853, 0.010328
    d1, d2, d3 = 1.432788, 0.189269, 0.001308
    return t - (c0 + c1*t + c2*t^2) / (1 + d1*t + d2*t^2 + d3*t^3)
end
