function xy_plot(;x::AbstractVector = [], y::AbstractVector = [], mark::AbstractString = "line")

    ec = EChart(xAxis = [Axis(_type = "category", data = x)],
                yAxis = [Axis(_type = "value")],
                series = [Series(_type = mark, data = y)],
                grid = Grid(borderWidth = 0))

end

lineplot(; x::AbstractVector = [], y::AbstractVector = []) = xy_plot(x = x, y = y, mark = "line")
barplot(; x::AbstractVector = [], y::AbstractVector = []) = xy_plot(x = x, y = y, mark = "bar")
