function xy_plot(;	x::AbstractVector = [],
					y::AbstractVector = [],
					mark::AbstractString = "line",
					pointSymbol::AbstractString = "circle",
					smooth::Bool = false,
					itemStyle::ItemStyle = ItemStyle(),
					boundaryGapX::Bool = true)


    ec = deepcopy(

    			EChart(	xAxis = [Axis(_type = "category", data = x, boundaryGap = boundaryGapX)],
                		yAxis = [Axis(_type = "value")],
                		series = [Series(_type = mark, data = y, name = "y", _symbol = pointSymbol, smooth = smooth, itemStyle = itemStyle)],
                		grid = Grid(borderWidth = 0)
                	)
    			)

end


lineplot(; x::AbstractVector = [], y::AbstractVector = [], pointSymbol::AbstractString = "circle", smooth::Bool = false) = xy_plot(x = x, y = y, pointSymbol = pointSymbol, smooth = smooth)
areaplot(; x::AbstractVector = [], y::AbstractVector = [], pointSymbol::AbstractString = "none", smooth::Bool = true) = xy_plot(x = x, y = y, pointSymbol = pointSymbol, smooth = smooth, itemStyle = ItemStyle(normal = ItemStyleOpts(areaStyle = AreaStyle(_type = "normal"))), boundaryGapX = false)

function barplot(; x::AbstractVector = [], y::AbstractVector = [], horizontal::Bool = false)

    ec = xy_plot(x = x, y = y, mark = "bar")

    if horizontal
        ec.xAxis, ec.yAxis = ec.yAxis, ec.xAxis
    end

    return ec

end