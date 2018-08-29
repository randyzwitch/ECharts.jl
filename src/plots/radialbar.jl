"""
    radialbar(x, y)

Creates an `EChart` where values plotted as a percentage of cirlce as rectangular columns.

## Methods
```julia
radialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
radialbar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
radialbar(df::AbstractDataFrame, x::Symbol, y::Symbol)
radialbar(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `mark::Union{String, AbstractVector} = "bar"` : how to display plotted points
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = radialbar(x, y)
```
"""
function radialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

#multiple y
function radialbar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 ec = bar(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end

# dataframe, single series
function radialbar(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
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
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 ec = bar(df, x, y, group; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)
	 radial!(ec)

	 return ec
end
