"""
    errorbar!(ec, lower, upper)

Adds vertical error bars to an existing `EChart` by appending a `custom` series whose
whiskers span `[lower[i], upper[i]]` at the x-position of each existing data point.

## Arguments
* `lower::AbstractVector{<:Union{Missing,Real}}` : lower bound for each observation
* `upper::AbstractVector{<:Union{Missing,Real}}` : upper bound for each observation
* `series_index::Int = 1` : which series to read x-positions from
* `cap_frac::Number = 0.2` : cap width as a fraction of the category-slot width.
  Works best with categorical x-axes; for value axes you may want a smaller value.
* `line_width::Int = 2` : stroke width of the whisker lines (pixels)
* `color::String = "#333333"` : whisker color. Defaults to dark gray so the bars are
  visible over any bar fill color. Pass any hex/name string to override.

## Notes

x-positions are inferred automatically:
- categorical x-axis → labels taken from `ec.xAxis[1].data`
- value x-axis → first element of each `[x, y]` data pair in `ec.series[series_index]`

`lower` and `upper` must have the same length as the data in the referenced series.
The error bar series is appended to `ec.series` and `ec` is returned.

## Example
```julia
ec = scatter(x, y)
errorbar!(ec, y .- err, y .+ err)
```
"""
function errorbar!(ec::EChart,
                   lower::AbstractVector{<:Union{Missing, Real}},
                   upper::AbstractVector{<:Union{Missing, Real}};
                   series_index::Int = 1,
                   cap_frac::Number  = 0.2,
                   line_width::Int   = 2,
                   color::String = "#333333")

    (isnothing(ec.xAxis) || isempty(ec.xAxis)) &&
        throw(ArgumentError("errorbar! requires a chart with an x-axis"))
    1 <= series_index <= length(ec.series) ||
        throw(ArgumentError("series_index $series_index is out of range " *
                            "(chart has $(length(ec.series)) series)"))

    if ec.xAxis[1]._type == "category"
        xs      = ec.xAxis[1].data
        n       = length(xs)
        length(lower) == n && length(upper) == n ||
            throw(ArgumentError("lower and upper must each have length $n " *
                                "(matching the number of categories)"))
        eb_data = [[string(xs[i]),
                    Float64(coalesce(lower[i], NaN)),
                    Float64(coalesce(upper[i], NaN))]
                   for i in 1:n]
    else
        src = ec.series[series_index].data
        n   = length(src)
        length(lower) == n && length(upper) == n ||
            throw(ArgumentError("lower and upper must each have length $n " *
                                "(matching series $series_index data length)"))
        eb_data = [[Float64(src[i][1]),
                    Float64(coalesce(lower[i], NaN)),
                    Float64(coalesce(upper[i], NaN))]
                   for i in 1:n]
    end

    color_expr = "'$(color)'"

    render_fn = JSON.JSONText("""
function(params, api) {
    var xValue    = api.value(0);
    var lowPoint  = api.coord([xValue, api.value(1)]);
    var highPoint = api.coord([xValue, api.value(2)]);
    var halfCap   = api.size([1, 0])[0] * $(Float64(cap_frac)) / 2;
    var color     = $(color_expr);
    var stroke    = { stroke: color, fill: null, lineWidth: $(line_width) };
    return {
        type: 'group',
        children: [
            { type: 'line',
              shape: { x1: highPoint[0] - halfCap, y1: highPoint[1],
                       x2: highPoint[0] + halfCap, y2: highPoint[1] },
              style: stroke },
            { type: 'line',
              shape: { x1: highPoint[0], y1: highPoint[1],
                       x2: lowPoint[0],  y2: lowPoint[1] },
              style: stroke },
            { type: 'line',
              shape: { x1: lowPoint[0] - halfCap, y1: lowPoint[1],
                       x2: lowPoint[0] + halfCap, y2: lowPoint[1] },
              style: stroke }
        ]
    };
}
""")

    eb_series = CustomSeries(
        renderItem = render_fn,
        data       = eb_data,
        encode     = Dict("x" => 0, "y" => [1, 2]),
        silent     = true,
        z          = 10,
    )
    ec.series = AbstractEChartSeries[ec.series..., eb_series]

    return ec
end
