#single series
function bar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

#multiple y
function bar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

# dataframe, single series
function bar(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(df, x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

# dataframe, group argument
function bar(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(df, x, y, group; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end
