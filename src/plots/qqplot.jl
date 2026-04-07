"""
    qqplot(x, dist)

Creates an `EChart` Q-Q (quantile-quantile) plot comparing the sample
quantiles of `x` against theoretical quantiles from distribution `dist`.
A reference line through the first and third quartiles is included automatically.

## Methods
```julia
qqplot(x::AbstractVector{<:Real}, dist)
qqplot(x::AbstractVector{<:Real}, y::AbstractVector{<:Real})
```

## Arguments
* `showSymbol::Bool = true` : show a dot marker at each quantile point?
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

**One-distribution form** (`qqplot(x, dist)`): plots sample quantiles of `x`
against theoretical quantiles of `dist`. Any object that supports
`quantile(dist, p)` for `p ∈ (0, 1)` works — typically a
[Distributions.jl](https://github.com/JuliaStats/Distributions.jl) distribution
such as `Normal()`, `TDist(5)`, or `Exponential(2)`:

```julia
using Distributions
qqplot(data, Normal())
```

**Two-sample form** (`qqplot(x, y)`): plots sample quantiles of `x` against
sample quantiles of `y`. When sample sizes differ, quantiles are computed at
a common set of probability points (Hazen positions of the smaller sample).
A 45° reference line is included automatically.

All sample-quantile computation uses `StatsBase.quantile`.
"""
function qqplot(x::AbstractVector{<:Real}, dist;
                showSymbol::Bool = true,
                legend::Bool = false,
                kwargs...)

    n = length(x)
    n >= 2 || throw(ArgumentError("x must have at least 2 elements"))

    xs = sort(Float64.(x))
    ps  = [(i - 0.5) / n for i in 1:n]           # Hazen plotting positions
    theoretical = [quantile(dist, p) for p in ps] # caller's distribution

    pts = [[theoretical[i], xs[i]] for i in 1:n]

    # Reference line through (T₁, Q₁) and (T₃, Q₃)
    q1s = StatsBase.quantile(xs, 0.25)
    q3s = StatsBase.quantile(xs, 0.75)
    t1  = quantile(dist, 0.25)
    t3  = quantile(dist, 0.75)
    slope     = (q3s - q1s) / (t3 - t1)
    intercept = q1s - slope * t1
    xmin, xmax = theoretical[1], theoretical[end]
    refline = [[xmin, slope * xmin + intercept],
               [xmax, slope * xmax + intercept]]

    dist_name = string(nameof(typeof(dist)))
    ec = newplot(kwargs, ec_charttype = "qqplot")
    ec.xAxis = [Axis(_type = "value", name = "$dist_name quantiles", nameGap = 50, scale = true)]
    ec.yAxis = [Axis(_type = "value", name = "Sample quantiles",     nameGap = 50, scale = true)]
    ec.series = [
        XYSeries(name = "Sample",    _type = "scatter", data = pts,
                 showSymbol = showSymbol),
        XYSeries(name = "Reference", _type = "line",    data = refline,
                 showSymbol = false,
                 lineStyle  = LineStyle(_type = "dashed"),
                 smooth     = false),
    ]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    qqplot(x, y)

Creates an `EChart` two-sample Q-Q plot comparing the distributions of `x`
and `y`. See the primary `qqplot` method for full argument documentation.
"""
function qqplot(x::AbstractVector{<:Real}, y::AbstractVector{<:Real};
                showSymbol::Bool = true,
                legend::Bool = false,
                kwargs...)

    length(x) >= 2 || throw(ArgumentError("x must have at least 2 elements"))
    length(y) >= 2 || throw(ArgumentError("y must have at least 2 elements"))

    # Common probability points at Hazen positions of the smaller sample
    n  = min(length(x), length(y))
    ps = [(i - 0.5) / n for i in 1:n]
    xq = [StatsBase.quantile(x, p) for p in ps]
    yq = [StatsBase.quantile(y, p) for p in ps]

    pts = [[xq[i], yq[i]] for i in 1:n]

    # 45° reference line spanning the full data range
    lo = min(xq[1], yq[1])
    hi = max(xq[end], yq[end])
    refline = [[lo, lo], [hi, hi]]

    ec = newplot(kwargs, ec_charttype = "qqplot")
    ec.xAxis = [Axis(_type = "value", name = "x quantiles", nameGap = 50, scale = true)]
    ec.yAxis = [Axis(_type = "value", name = "y quantiles", nameGap = 50, scale = true)]
    ec.series = [
        XYSeries(name = "Sample",    _type = "scatter", data = pts,
                 showSymbol = showSymbol),
        XYSeries(name = "Reference", _type = "line",    data = refline,
                 showSymbol = false,
                 lineStyle  = LineStyle(_type = "dashed"),
                 smooth     = false),
    ]

    legend ? legend!(ec) : nothing
    return ec
end
