function area(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = nothing,
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; stack = stack, mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	ndims(y) == 1? cols = 1: cols = size(y)[2]
	fill!(ec, cols, fill)

	return ec

end
