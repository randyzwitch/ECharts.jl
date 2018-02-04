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
function polar(angle::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
               radius::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = false,
            kwargs...)

    ec = newplot(kwargs, ec_charttype = "polar")

    ec.polar = [Polar()]
    ec.angleAxis = AngleAxis(_type = "value", splitNumber = splitNumber)
    ec.radiusAxis = RadiusAxis(min = 0)
    ec.series = [Series(name = "Series 1", coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius,angle))]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end

function polar(angle::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
               radius::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = true,
            kwargs...)

    #Instantiate polar graph with first series
    ec = polar(angle, radius[:,1]; splitNumber = splitNumber, showSymbol = showSymbol, kwargs...)

    #Append remaining series
	for i in 2:size(radius)[2]
		push!(ec.series, Series(coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius[:,i],angle)))
	end

    #Add seriesnames for legend
    seriesnames!(ec)

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
