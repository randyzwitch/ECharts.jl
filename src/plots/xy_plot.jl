function xy_plot(;	x::AbstractVector = [],
					y::AbstractVector = [],
					mark::AbstractString = "bar")

	#Validate arrays are same length
	if length(x) != length(y)
		error("Arrays X and Y need to have the same length.")
	end

	#General visualization defaults
	ec = deepcopy(EChart())
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = [Series(_type = mark, data = y)];

	return ec

end

lineplot(; x::AbstractVector = [], y::AbstractVector = []) = xy_plot(x = x, y = y, mark = "line")
barplot(; x::AbstractVector = [], y::AbstractVector = []) = xy_plot(x = x, y = y, mark = "bar")

function scatterplot(; x::AbstractVector = [], y::AbstractVector = [])

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	_x = d[:,1]
	_y = d[:,2]

	ec = xy_plot(x = _x, y = _y, mark = "scatter")

	return ec

end

function areaplot(; x::AbstractVector = [], y::AbstractVector = [])

	ec = xy_plot(x = x, y = y, mark = "line")
	ec.series[1].areaStyle = Dict("normal" => Dict())
	ec.xAxis[1].boundaryGap = false

	return ec

end
