"""
    bar(x, y)

Creates an `EChart` where values plotted vertically as rectangular columns.

## Methods
```julia
bar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
bar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
bar(df::AbstractDataFrame, x::Symbol, y::Symbol)
bar(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `mark::Union{String, AbstractVector} = "bar"` : how to display plotted points
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `bar`, such as displaying a legend when two or more series present.

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = bar(x, y)
```
"""
function bar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

#multiple y
function bar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

# dataframe, single series
function bar(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(df, x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

# dataframe, group argument
function bar(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(df, x, y, group; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end
