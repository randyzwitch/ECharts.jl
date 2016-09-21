"""
    xy_plot(x::AbstractVector, y::AbstractVector; mark::String = "bar", kwargs...)

Single X and Y Series. Used as internal function template for XY Plots.
"""
function xy_plot(x::AbstractVector, y::AbstractVector; mark::String = "bar", kwargs...)

	#Validate arrays are same length
	if size(x)[1] != size(y)[1]
		error("Arrays X and Y need to have the same length.")
	end

	#General visualization defaults
	ec = deepcopy(EChart())
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = [Series(_type = mark, data = y)]

	#Process keyword args after defined functionality
	kwargs!(ec, kwargs)

	return ec

end

"""
	xy_plot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "bar", kwargs...)

Single X and multiple Y series. Used as internal function template for XY Plots.
"""
function xy_plot(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "bar", kwargs...)

	# Allow for convenience of using single string to represent same mark for all series values
	typeof(mark) <: AbstractVector? nothing : mark = [mark for i in 1:length(x)]

	# Call 1-D method to build base
	ec = xy_plot(x, y[:,1]; mark = mark[1], kwargs...)

	# Append remaining Y data
	for i in 2:size(y)[2]
		push!(ec.series, Series(_type = mark[i], data = y[:,i]))
	end

	return ec

end

line(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "line", kwargs...) = xy_plot(x, y; mark = mark, kwargs...)
bar(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "bar", kwargs...) = xy_plot(x, y; mark = mark, kwargs...)

function scatter(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "scatter", kwargs...)

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(d[:,1], d[:,2:end]; mark = mark, kwargs...)

	return ec

end

function area(x::AbstractVector, y::AbstractArray; mark::Union{String, AbstractVector} = "line", fill::Union{Bool, AbstractVector} = true, kwargs...)

	ec = xy_plot(x, y; mark = mark, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	ndims(y) == 1? cols = 1: cols = size(y)[2]
	fill!(ec, cols, fill)

	return ec

end
