"""
    radialbar(x, y)

Creates an `EChart` where values plotted as a percentage of cirlce as rectangular columns.

## Methods
```julia
radialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
radialbar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
radialbar(df, x::Symbol, y::Symbol)
radialbar(df, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `stack::Union{Bool, AbstractVector, Nothing} = nothing` : stack (add together) when multiple series present?
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
function radialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

"""
    radialbar(x, y)

Creates an `EChart` radial bar chart from a 2-D array `y`, where each column is a separate series.
Legend is displayed by default when multiple series are present.
See the primary `radialbar` method for full argument documentation.
"""
function radialbar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

"""
    radialbar(df, x, y)

Creates an `EChart` radial bar chart from a single column `y` in table `df` against column `x`.
See the primary `radialbar` method for full argument documentation.
"""
function radialbar(df, x::Symbol, y::Symbol;
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
	 ec = bar(df, x, y; stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

"""
    radialbar(df, x, y, group)

Creates an `EChart` radial bar chart from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `radialbar` method for full argument documentation.
"""
function radialbar(df, x::Symbol, y::Symbol, group::Symbol;
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
	 ec = bar(df, x, y, group; stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end
