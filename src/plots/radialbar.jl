"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2})
area(df::AbstractDataFrame, x::Symbol, y::Symbol)
area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
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

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y)
```
"""
function radialbar(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
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
function radialbar(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2};
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
