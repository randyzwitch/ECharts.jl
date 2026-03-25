"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
area(df, x::Symbol, y::Symbol)
area(df, x::Symbol, y::Symbol, group::Symbol)
area(k::KernelDensity.UnivariateKDE)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `fill::Union{Bool, AbstractVector} = true` : fill area below marks with color?
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.
"""
function area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			step::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; stack = stack, mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	fill!(ec, 1, fill)

	return ec

end

"""
    area(x, y)

Creates an `EChart` area chart with multiple y series sharing the same x values, where each column of `y` is a separate series. Stacking and legend are enabled by default.
See the primary `area` method for full argument documentation.
"""
function area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Nothing} = true,
			step::Union{String, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; stack = stack, mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	fill!(ec, size(y)[2], fill)

	return ec

end

"""
    area(df, x, y)

Creates an `EChart` area chart from a single column `y` in table `df` against column `x`.
See the primary `area` method for full argument documentation.
"""
function area(df, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			step::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

			Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
			ec = xy_plot(df, x, y, mark = mark, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

			ec.xAxis[1].boundaryGap = false

			fill!(ec, 1, fill)

			return ec

end

"""
    area(df, x, y, group)

Creates an `EChart` area chart from table `df`, grouping series by the `group` column.
Stacking and legend are enabled by default when a group is provided.
See the primary `area` method for full argument documentation.
"""
function area(df, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Nothing} = true,
			step::Union{String, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

			Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
			ec = xy_plot(df, x, y, group, mark = mark, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

			ec.xAxis[1].boundaryGap = false

			fill!(ec, length(ec.series), fill)

			return ec

end

"""
    area(k)

Creates an `EChart` area chart from a `KernelDensity.UnivariateKDE` object, plotting the
estimated density curve.
See the primary `area` method for full argument documentation.
"""
function area(k::KernelDensity.UnivariateKDE;
				mark::Union{String, AbstractVector} = "line",
				fill::Union{Bool, AbstractVector} = true,
				stack::Union{Bool, AbstractVector, Nothing} = nothing,
				step::Union{String, Nothing} = nothing,
				legend::Bool = false,
				scale::Bool = false,
				kwargs...)

	ec = area(collect(k.x), k.density, mark = mark, fill = fill, stack = stack, step = step, legend = legend, scale = scale, kwargs...)

	return ec

end
