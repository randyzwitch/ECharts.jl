"""
    jointplot(x, y)

Creates an `EChart` joint/marginal plot — a central scatter surrounded by marginal
histograms on the top and right edges, showing the bivariate and univariate
distributions together.

## Methods
```julia
jointplot(x::AbstractVector{<:Real}, y::AbstractVector{<:Real})
jointplot(df, x::Symbol, y::Symbol)
```

## Arguments
* `nbins::Int = 30` : number of histogram bins for each marginal
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Three ECharts grids are used:
- **Scatter** (center-bottom): the bivariate scatter plot
- **Top marginal** (above scatter): histogram of `x`
- **Right marginal** (right of scatter): histogram of `y`, rendered as a
  horizontal step-line with area fill so that it aligns with the scatter y-axis

The top and right marginal x/y ranges are locked to the scatter axis ranges so
the three panels are visually aligned. The default chart height is 600 px to give
the square scatter area room.
"""
function jointplot(x::AbstractVector{<:Real}, y::AbstractVector{<:Real};
                   nbins::Int  = 30,
                   legend::Bool = false,
                   kwargs...)

    length(x) == length(y) ||
        throw(ArgumentError("x and y must have the same length"))
    length(x) >= 2 ||
        throw(ArgumentError("need at least 2 observations"))

    xmin_f, xmax_f = Float64(minimum(x)), Float64(maximum(x))
    ymin_f, ymax_f = Float64(minimum(y)), Float64(maximum(y))

    # Round axis bounds to 4 significant figures so tick labels stay readable.
    _sigfig(v) = isfinite(v) && v != 0.0 ? round(v; sigdigits = 4) : v
    xmin, xmax = string(_sigfig(xmin_f)), string(_sigfig(xmax_f))
    ymin, ymax = string(_sigfig(ymin_f)), string(_sigfig(ymax_f))

    # Marginal histograms
    h_x = StatsBase.fit(StatsBase.Histogram, collect(Float64, x); nbins = nbins)
    h_y = StatsBase.fit(StatsBase.Histogram, collect(Float64, y); nbins = nbins)

    xe = collect(Float64, h_x.edges[1])
    ye = collect(Float64, h_y.edges[1])

    # ── Layout (%): left / top / width / height ───────────────────────────────
    lm       = 10.0   # left margin (room for scatter y-axis ticks)
    tm       = 4.0    # top margin
    rm       = 4.0    # right margin (unused, right histogram sits here)
    bm       = 8.0    # bottom margin (scatter x-axis ticks)
    gap      = 1.5    # gap between panels
    hist_h   = 18.0   # top histogram height
    hist_w   = 18.0   # right histogram width
    sc_w     = 100.0 - lm - rm - gap - hist_w   # ≈ 66.5 %
    sc_h     = 100.0 - tm - bm - gap - hist_h   # ≈ 68.5 %
    sc_top   = tm + hist_h + gap

    # Grid 0: scatter
    scatter_grid = Grid(left = "$(lm)%", top = "$(sc_top)%",
                        width = "$(sc_w)%", height = "$(sc_h)%",
                        containLabel = false)
    # Grid 1: top histogram
    top_grid = Grid(left = "$(lm)%", top = "$(tm)%",
                    width = "$(sc_w)%", height = "$(hist_h)%",
                    containLabel = false)
    # Grid 2: right histogram
    right_grid = Grid(left = "$(lm + sc_w + gap)%", top = "$(sc_top)%",
                      width = "$(hist_w)%", height = "$(sc_h)%",
                      containLabel = false)

    # ── Axes ──────────────────────────────────────────────────────────────────
    # Scatter
    sc_xax = Axis(_type = "value", gridIndex = 0, min = xmin, max = xmax)
    sc_yax = Axis(_type = "value", gridIndex = 0, min = ymin, max = ymax)

    # Top histogram — x shared with scatter, y = counts
    top_xax = Axis(_type = "value", gridIndex = 1, min = xmin, max = xmax,
                   show = false)
    top_yax = Axis(_type = "value", gridIndex = 1, min = 0,
                   axisLabel = AxisLabel(show = false),
                   splitLine = SplitLine(show = false))

    # Right histogram — x = counts, y shared with scatter
    rht_xax = Axis(_type = "value", gridIndex = 2, min = 0,
                   axisLabel = AxisLabel(show = false),
                   splitLine = SplitLine(show = false))
    rht_yax = Axis(_type = "value", gridIndex = 2, min = ymin, max = ymax,
                   show = false)

    # ── Series ────────────────────────────────────────────────────────────────
    # Scatter (gridIndex 0)
    sc_series = XYSeries(
        name       = "data",
        _type      = "scatter",
        data       = arrayofarray(collect(Float64, x), collect(Float64, y)),
        xAxisIndex = 0,
        yAxisIndex = 0,
        large      = true,
        symbolSize = 5,
    )

    # Top histogram — vertical step-line with area fill (gridIndex 1)
    top_pts = Any[]
    push!(top_pts, [xe[1], 0.0])
    for i in eachindex(h_x.weights)
        push!(top_pts, [xe[i],     Float64(h_x.weights[i])])
        push!(top_pts, [xe[i + 1], Float64(h_x.weights[i])])
    end
    push!(top_pts, [xe[end], 0.0])

    top_series = XYSeries(
        name       = "x dist",
        _type      = "line",
        data       = top_pts,
        xAxisIndex = 1,
        yAxisIndex = 1,
        areaStyle  = AreaStyle(),
        lineStyle  = LineStyle(opacity = 0),
        showSymbol = false,
    )

    # Right histogram — horizontal step-line: x = count, y = bin edge (gridIndex 2)
    rht_pts = Any[]
    push!(rht_pts, [0.0, ye[1]])
    for i in eachindex(h_y.weights)
        push!(rht_pts, [Float64(h_y.weights[i]), ye[i]])
        push!(rht_pts, [Float64(h_y.weights[i]), ye[i + 1]])
    end
    push!(rht_pts, [0.0, ye[end]])

    rht_series = XYSeries(
        name       = "y dist",
        _type      = "line",
        data       = rht_pts,
        xAxisIndex = 2,
        yAxisIndex = 2,
        areaStyle  = AreaStyle(),
        lineStyle  = LineStyle(opacity = 0),
        showSymbol = false,
    )

    # ── Assemble ──────────────────────────────────────────────────────────────
    ec = newplot(kwargs, ec_charttype = "jointplot")
    ec.grid   = [scatter_grid, top_grid, right_grid]
    ec.xAxis  = [sc_xax, top_xax, rht_xax]
    ec.yAxis  = [sc_yax, top_yax, rht_yax]
    ec.series = [sc_series, top_series, rht_series]

    if ec.ec_height == 400
        ec.ec_height = 600
    end

    legend ? legend!(ec) : nothing

    return ec
end

"""
    jointplot(df, x, y)

Creates an `EChart` joint/marginal plot from columns `x` and `y` in table `df`.
Axis labels are set from the column names.
See the primary `jointplot` method for full argument documentation.
"""
function jointplot(df, x::Symbol, y::Symbol;
                   nbins::Int   = 30,
                   legend::Bool = false,
                   kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    ec = jointplot(_table_col(df, x), _table_col(df, y);
                   nbins = nbins, legend = legend, kwargs...)
    xaxis!(ec, name = string(x))
    yaxis!(ec, name = string(y))
    return ec
end
