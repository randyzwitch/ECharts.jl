function xy_plot(;	x::AbstractVector = [],
					y::AbstractVector = [],
					mark::AbstractString = "line",
					pointSymbol::AbstractString = "circle",
					smooth::Bool = false,
					itemStyle::ItemStyle = ItemStyle(),
					boundaryGapX::Bool = true)

	#Validate arrays are same length
	if length(x) != length(y)
		error("Arrays X and Y need to have the same length.")
	end

	#General visualization defaults
	ec = deepcopy(EChart())
	ec.xAxis = deepcopy([Axis(_type = "category", data = x, boundaryGap = boundaryGapX)])
	ec.yAxis = deepcopy([Axis(_type = "value")])
	ec.series = [Series(_type = mark, data = y, name = "y", _symbol = pointSymbol, smooth = smooth, itemStyle = itemStyle)]
	ec.grid.borderWidth = 0 #Turn off outer graph border to leave top and right "open"


	#If element type is numeric, but small length, then probably a categorical; large numeric arrays should be "value" types
	#Test for Date/Time, else default back to category
	if eltype(x) <: Number && length(x) > 10 
		ec.xAxis[1]._type = "value"
	elseif eltype(x) <: Dates.TimeType
		ec.xAxis[1]._type = "time"
	else
		ec.xAxis[1]._type = "category"
	end

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

function scatterplot(; x::AbstractVector = [], y::AbstractVector = [])

	#Format data to array of [x,y] arrays
	scatterdata = []
	for i in 1:length(x)
	    _x = x[i]
	    _y = y[i]
	    push!(scatterdata, [_x, _y])
	end

    ec = xy_plot(x = x, y = scatterdata, mark = "scatter")

    #Switch axis type, since scatterplot are both
    ec.xAxis[1].data = nothing

    #Set X boundaries
    ec.xAxis[1].min = floor(minimum(x))
	ec.xAxis[1].max = ceil(maximum(x))

    return ec

end
