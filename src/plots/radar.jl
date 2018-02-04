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
function radar(names::AbstractVector,
			   values::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
			   max::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
	 			fill::Bool = false,
				legend::Bool = false,
				kwargs...)

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = newplot(kwargs, ec_charttype = "radar")

	ec.radar = [Radar(indicator = arrayofdicts(name = names, max = max))]

	ec.series = [Series(name = "Series 1", _type = "radar", data = [Dict{Any, Any}("value" => values)])]

	# Fill area if requested
	fill!(ec, 1, fill)

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end

function radar(names::AbstractVector,
			   values::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2},
			   max::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
	 			fill::Union{Bool, AbstractVector} = false,
				legend::Bool = true,
				kwargs...)

	# Call 1-D method to build base
	ec = radar(names, values[:,1], max; kwargs...)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	# Fill area if requested
	# This is smelly
	typeof(fill) == Bool? fill = [fill for i in 1:size(values)[2]]: fill = fill
	cols = length(fill)
	fill!(ec, cols, fill)

	seriesnames!(ec)

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end
