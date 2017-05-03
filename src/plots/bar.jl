function bar(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "bar",
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 		return xy_plot(x, y; mark = mark, legend = legend, scale = scale, kwargs...)

end
