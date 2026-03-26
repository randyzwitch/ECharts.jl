"""
    gauge(x)

Creates an `EChart` where a value is plotted as a needle indicating the value along some range.

## Methods
```julia
gauge(x::Union{Missing, Real})
```

## Arguments
* `breakpoints::AbstractVector = [0.2, 0.8, 1]` : percentage along gauge to switch indicator colors
* `colors::AbstractVector = ["#91c7ae", "#63869e", "#c23531"]` : colors for breakpoints
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
function gauge(x::Union{Missing, Real};
               breakpoints::AbstractVector = [0.2, 0.8, 1],
               colors::AbstractVector = ["#91c7ae", "#63869e", "#c23531"],
               kwargs...)

    length(breakpoints) != length(colors) && error("breakpoints and colors must have the same length.")
    any(b -> b <= 0 || b > 1, breakpoints) && error("all breakpoints must be in the range (0, 1].")
    issorted(breakpoints) || error("breakpoints must be in ascending order.")

    ec = newplot(kwargs, ec_charttype = "gauge")

    ec.series = [GaugeSeries(name = "Series 1",
                        _type = "gauge",
                        data = [Dict("value" => x)],
                        axisLine = AxisLine(lineStyle = LineStyle(width = 10, color = [[b,c] for (b,c) in zip(breakpoints, colors)]))
                        )
                ]

    return ec

end
