#single series
function radialbar(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

#multiple y
function radialbar(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

# dataframe, single series
function radialgradientbar(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 ec = bar(df, x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

# dataframe, group argument
function radialbar(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 ec = bar(df, x, y, group; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end
