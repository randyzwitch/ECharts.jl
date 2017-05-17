#Functions identical, except for legend default to true for multiple series
function line(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

function line(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end
