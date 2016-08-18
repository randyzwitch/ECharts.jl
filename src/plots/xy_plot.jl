function xy_plot(;	x::AbstractVector = [],
					y::AbstractArray = [],
					mark::Union{String, AbstractVector} = "bar")

	#Validate arrays are same length
	if size(x)[1] != size(y)[1]
		error("Arrays X and Y need to have the same length.")
	end

	#General visualization defaults
	ec = deepcopy(EChart())
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = Series[]

	#Add y columns into Series
	ndims(y) == 1?
		push!(ec.series, Series(_type = mark, data = y)):
		[push!(ec.series, Series(_type = mark, data = y[:,i])) for i in 1:size(y)[2]]

	return ec

end

lineplot(; x::AbstractVector = [], y::AbstractArray = []) = xy_plot(x = x, y = y, mark = "line")
barplot(; x::AbstractVector = [], y::AbstractArray = []) = xy_plot(x = x, y = y, mark = "bar")

function scatterplot(; x::AbstractVector = [], y::AbstractArray = [])

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(x = d[:,1], y = d[:,2:end], mark = "scatter")

	return ec

end

function areaplot(; x::AbstractVector = [], y::AbstractArray = [])

	ec = xy_plot(x = x, y = y, mark = "line")
	ec.xAxis[1].boundaryGap = false

	ndims(y) == 1?
		ec.series[1].areaStyle = Dict("normal" => Dict()):
		[ec.series[i].areaStyle = Dict("normal" => Dict()) for i in 1:size(y)[2]]

	return ec

end
