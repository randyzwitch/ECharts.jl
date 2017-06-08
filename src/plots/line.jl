#array, single series
function line(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

#array, multiple series
function line(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

#DataFrame, single series
function line(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(df, x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

#DataFrame with group argument
function line(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	return xy_plot(df, x, y, group; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end
