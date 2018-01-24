#These functions are nearly identical
#Difference: legend for multiple series, stack by default
function area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
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
	fill!(ec, 1, fill)

	return ec

end

function area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2};
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = true,
			step::Union{String, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	#If there are missing values, set equal to zero so the graph stacks correctly
	eltype(y) >: Missing? y_ = collect(Missings.replace(y,0)): y_ = deepcopy(y)

	ec = xy_plot(x, y_; stack = stack, mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	fill!(ec, size(y)[2], fill)

	return ec

end

#dataframe, single series
function area(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = nothing,
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

			ec = xy_plot(df, x, y, mark = mark, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

			ec.xAxis[1].boundaryGap = false

			fill!(ec, 1, fill)

			return ec

end

#dataframe, group argument
function area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = true,
			step::Union{String, Void} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

			#If there are missing values, set equal to zero so the graph stacks correctly
			eltype(y) >: Missing? y_ = collect(Missings.replace(y,0)): y_ = deepcopy(y)

			ec = xy_plot(df, x, y_, group, mark = mark, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

			ec.xAxis[1].boundaryGap = false

			fill!(ec, length(ec.series), fill)

			return ec

end

function area(k::KernelDensity.UnivariateKDE;
				mark::Union{String, AbstractVector} = "line",
				fill::Union{Bool, AbstractVector} = true,
				stack::Union{Bool, AbstractVector, Void} = nothing,
				step::Union{String, Void} = nothing,
				legend::Bool = false,
				scale::Bool = false,
				kwargs...)

	ec = area(collect(k.x), k.density, mark = mark, fill = fill, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

	return ec

end
