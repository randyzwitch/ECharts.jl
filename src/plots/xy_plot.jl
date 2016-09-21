function xy_plot(x::AbstractVector, y::AbstractVector;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing, #No op
			kwargs...)

	#Validate arrays are same length
	if size(x)[1] != size(y)[1]
		error("Arrays X and Y need to have the same length.")
	end

    ec = newplot(kwargs)

	#General visualization defaults
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = [Series(_type = mark, data = y)]

	return ec

end

function xy_plot(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			kwargs...)

	# Allow for convenience of using single string to represent same mark for all series values
	typeof(mark) <: AbstractVector? nothing : mark = [mark for i in 1:length(x)]

	# Call 1-D method to build base
	ec = xy_plot(x, y[:,1]; mark = mark[1], kwargs...)

	# Append remaining Y data
	for i in 2:size(y)[2]
		push!(ec.series, Series(_type = mark[i], data = y[:,i]))
	end

	#stack
	if stack != nothing
		stack == true? [x.stack = 1 for x in ec.series]: [x.stack = stack[i] for (i,x) in enumerate(ec.series)]
	end

	return ec

end

function line(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			kwargs...)

	return xy_plot(x, y; mark = mark, kwargs...)

end

function bar(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, kwargs...)

end

function scatter(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "scatter",
			kwargs...)

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(d[:,1], d[:,2:end]; mark = mark, kwargs...)

	return ec

end

function area(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = nothing,
			kwargs...)

	ec = xy_plot(x, y; stack = stack, mark = mark, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	ndims(y) == 1? cols = 1: cols = size(y)[2]
	fill!(ec, cols, fill)

	return ec

end
