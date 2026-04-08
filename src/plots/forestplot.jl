"""
    forestplot(labels, estimate, lower, upper)

Creates an `EChart` forest plot — a horizontal dot plot with confidence interval
whiskers on a common axis, standard in meta-analysis and statistical reporting.

## Methods
```julia
forestplot(labels::AbstractVector{String},
           estimate::AbstractVector{<:Real},
           lower::AbstractVector{<:Real},
           upper::AbstractVector{<:Real})
forestplot(df, label::Symbol, estimate::Symbol, lower::Symbol, upper::Symbol)
```

## Arguments
* `ref::Union{Real, Nothing} = 0` : x-position of the vertical reference line
  (`nothing` to suppress it)
* `ref_style::String = "dashed"` : line type of the reference line
* `dot_size::Int = 10` : size of the point-estimate dot
* `ci_color::String = "#333333"` : color of the CI whiskers
* `cap_frac::Real = 0.3` : cap width as a fraction of the inter-label spacing
* `line_width::Int = 2` : stroke width of the CI whiskers (pixels)
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Labels are displayed on the y-axis; the x-axis carries the effect-size scale.
The confidence interval is rendered via a `custom` series using ECharts'
`renderItem` API — horizontal lines with end caps exactly as in the vertical
`errorbar!` helper, but rotated 90°.

Missing values in `estimate`, `lower`, or `upper` are silently skipped (no dot
or whisker drawn for that row).
"""
function forestplot(labels::AbstractVector{String},
                    estimate::AbstractVector{<:Real},
                    lower::AbstractVector{<:Real},
                    upper::AbstractVector{<:Real};
                    ref::Union{Real, Nothing} = 0,
                    ref_style::String = "dashed",
                    dot_size::Int     = 10,
                    ci_color::String  = "#333333",
                    cap_frac::Real    = 0.3,
                    line_width::Int   = 2,
                    legend::Bool      = false,
                    kwargs...)

    n = length(labels)
    n == length(estimate) == length(lower) == length(upper) ||
        throw(ArgumentError("labels, estimate, lower, and upper must all have the same length"))

    # Scatter data: [x=estimate, y=label_index (0-based for JS)]
    scatter_data = [[Float64(estimate[i]), i - 1] for i in 1:n]

    # CI custom-series data: [y_index (0-based), lower_x, upper_x]
    ci_data = [[i - 1, Float64(lower[i]), Float64(upper[i])] for i in 1:n]

    color_expr = "'$(ci_color)'"

    render_fn = JSON.JSONText("""
function(params, api) {
    var yValue    = api.value(0);
    var lowPoint  = api.coord([api.value(1), yValue]);
    var highPoint = api.coord([api.value(2), yValue]);
    var halfCap   = api.size([0, 1])[1] * $(Float64(cap_frac)) / 2;
    var color     = $(color_expr);
    var stroke    = { stroke: color, fill: null, lineWidth: $(line_width) };
    return {
        type: 'group',
        children: [
            { type: 'line',
              shape: { x1: lowPoint[0],  y1: lowPoint[1]  - halfCap,
                       x2: lowPoint[0],  y2: lowPoint[1]  + halfCap },
              style: stroke },
            { type: 'line',
              shape: { x1: lowPoint[0],  y1: lowPoint[1],
                       x2: highPoint[0], y2: highPoint[1] },
              style: stroke },
            { type: 'line',
              shape: { x1: highPoint[0], y1: highPoint[1] - halfCap,
                       x2: highPoint[0], y2: highPoint[1] + halfCap },
              style: stroke }
        ]
    };
}
""")

    ec = newplot(kwargs, ec_charttype = "forestplot")
    ec.xAxis = [Axis(_type = "value", nameGap = 50, scale = true)]
    ec.yAxis = [Axis(_type = "category", data = labels)]

    scatter_series = XYSeries(
        name       = "Estimate",
        _type      = "scatter",
        data       = scatter_data,
        symbolSize = dot_size,
    )

    ci_series = CustomSeries(
        renderItem = render_fn,
        data       = ci_data,
        encode     = Dict("x" => [1, 2], "y" => 0),
        silent     = true,
        z          = 10,
    )

    ec.series = AbstractEChartSeries[scatter_series, ci_series]

    # Optional vertical reference line
    if !isnothing(ref)
        ec.series[1].markLine = MarkLine(
            silent = true,
            data   = [Dict("xAxis" => Float64(ref))],
            lineStyle = LineStyle(_type = ref_style, color = "#999999"),
            label  = Dict("show" => false),
        )
    end

    legend ? legend!(ec) : nothing
    return ec
end

"""
    forestplot(df, label, estimate, lower, upper)

Creates an `EChart` forest plot from columns in table `df`.
See the primary `forestplot` method for full argument documentation.
"""
function forestplot(df, label::Symbol, estimate::Symbol, lower::Symbol, upper::Symbol;
                    ref::Union{Real, Nothing} = 0,
                    ref_style::String = "dashed",
                    dot_size::Int     = 10,
                    ci_color::String  = "#333333",
                    cap_frac::Real    = 0.3,
                    line_width::Int   = 2,
                    legend::Bool      = false,
                    kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    forestplot(
        string.(_table_col(df, label)),
        Float64.(_table_col(df, estimate)),
        Float64.(_table_col(df, lower)),
        Float64.(_table_col(df, upper));
        ref = ref, ref_style = ref_style,
        dot_size = dot_size, ci_color = ci_color,
        cap_frac = cap_frac, line_width = line_width,
        legend = legend, kwargs...
    )
end
