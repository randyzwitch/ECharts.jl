function xy_plot(;x::AbstractVector = [], y::AbstractVector = [], mark::AbstractString = "line", pointSymbol::AbstractString = "none")


    ec = deepcopy(
    			EChart(	xAxis = [Axis(_type = "category", data = x)],
                		yAxis = [Axis(_type = "value")],
                		series = [Series(_type = mark, data = y, name = "y", _symbol = pointSymbol)],
                		grid = Grid(borderWidth = 0)
                	)
    			)

end


lineplot(; x::AbstractVector = [], y::AbstractVector = [], pointSymbol = "circle") = xy_plot(x = x, y = y, mark = "line", pointSymbol = pointSymbol)
barplot(; x::AbstractVector = [], y::AbstractVector = []) = xy_plot(x = x, y = y, mark = "bar")
