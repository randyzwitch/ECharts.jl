function xy_plot(x::AbstractVector, y::AbstractVector; mark::String = "bar")

	#Validate arrays are same length
	if size(x)[1] != size(y)[1]
		error("Arrays X and Y need to have the same length.")
	end

	#General visualization defaults
	ec = deepcopy(EChart())
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = [Series(_type = mark, data = y)]

	return ec

end

function xy_plot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "bar")

	# Allow for convenience of using single string to represent same mark for all series values
	typeof(mark) <: AbstractVector? nothing : mark = [mark for i in 1:length(x)]

	# Call 1-D method to build base
	ec = xy_plot(x, y[:,1], mark = mark[1])

	# Append remaining Y data
	for i in 2:size(y)[2]
		push!(ec.series, Series(_type = mark[i], data = y[:,i]))
	end

	return ec

end

lineplot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "line") = xy_plot(x, y, mark = mark)
barplot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "bar") = xy_plot(x, y, mark = mark)

function scatterplot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "scatter")

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(d[:,1], d[:,2:end], mark = mark)

	return ec

end

function areaplot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "line")

	ec = xy_plot(x, y; mark = mark)
	ec.xAxis[1].boundaryGap = false

	for i in 1:length(ec.series)
		ec.series[i].areaStyle = Dict("normal" => Dict())
	end

	return ec

end
