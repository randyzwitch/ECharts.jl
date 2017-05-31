function gauge(x::Real;
               breakpoints::AbstractVector = [0.2, 0.8, 1],
               colors::AbstractVector = ["#91c7ae", "#63869e", "#c23531"],
               kwargs...)

    length(breakpoints) != length(colors)? error("breakpoints and colors vectors need to have the same length."): nothing

    ec = newplot(kwargs, ec_charttype = "gauge")

    ec.series = [Series(name = "Series 1",
                        _type = "gauge",
                        data = [Dict("value" => x)],
                        axisLine = AxisLine(lineStyle = LineStyle(width = 10, color = [[b,c] for (b,c) in zip(breakpoints, colors)]))
                        )
                ]

    return ec

end
