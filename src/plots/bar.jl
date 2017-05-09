function bar(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end
