function xy_plot(;	x::AbstractVector = [],
					y::AbstractVector = [],
					mark::AbstractString = "line",
					pointSymbol::AbstractString = "circle",
					smooth::Bool = false,
					itemStyle::ItemStyle = ItemStyle(),
					boundaryGapX::Bool = true)

	ec = deepcopy(EChart())

	ec.xAxis = deepcopy([Axis(_type = "category", data = x, boundaryGap = boundaryGapX)])
	ec.yAxis = deepcopy([Axis(_type = "value")])
	ec.series = [Series(_type = mark, data = y, name = "y", _symbol = pointSymbol, smooth = smooth, itemStyle = itemStyle)]
	ec.grid.borderWidth = 0 #Turn off outer graph border to leave top and right "open"

	return ec

end

function lineplot(; x::AbstractVector = [], y::AbstractVector = [], pointSymbol::AbstractString = "circle", smooth::Bool = false)

	ec = xy_plot(x = x, y = y, pointSymbol = pointSymbol, smooth = smooth)

	return ec

end

function areaplot(; x::AbstractVector = [], y::AbstractVector = [], pointSymbol::AbstractString = "none", smooth::Bool = true)

	ec = xy_plot(x = x, y = y, pointSymbol = pointSymbol, smooth = smooth, itemStyle = ItemStyle(normal = ItemStyleOpts(areaStyle = AreaStyle(_type = "normal"))), boundaryGapX = false)

	return ec

end

function barplot(; x::AbstractVector = [], y::AbstractVector = [], horizontal::Bool = false)

    ec = xy_plot(x = x, y = y, mark = "bar")

    if horizontal
        ec.xAxis, ec.yAxis = ec.yAxis, ec.xAxis
    end

    return ec

end
