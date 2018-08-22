"""
    polar(angle, radius)

Creates an `EChart` where region between points connected by a line, with polar coordinates.

## Methods
```julia
polar(angle::AbstractVector{<:Union{Missing, Real}}, radius::AbstractVector{<:Union{Missing, Real}})
polar(angle::AbstractVector{<:Union{Missing, Real}},radius::AbstractArray{<:Union{Missing, Real},2})
```

## Arguments
* `splitNumber::Int = 12` : number of splits shown in axis
* `showSymbol::Bool = false` : show the dots as well as the line?
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `polar`, such as displaying a legend when two or more series present.

## Examples
```julia
t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2t) * cos(2t)) for t in angle]
p = polar(angle, radius)
```
"""
function polar(angle::AbstractVector{<:Union{Missing, Real}},
               radius::AbstractVector{<:Union{Missing, Real}};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = false,
            kwargs...)

    ec = newplot(kwargs, ec_charttype = "polar")

    ec.polar = [Polar()]
    ec.angleAxis = AngleAxis(_type = "value", splitNumber = splitNumber)
    ec.radiusAxis = RadiusAxis(min = 0)
    ec.series = [XYSeries(name = "Series 1", coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius,angle))]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end

function polar(angle::AbstractVector{<:Union{Missing, Real}},
               radius::AbstractArray{<:Union{Missing, Real},2};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = true,
            kwargs...)

    #Instantiate polar graph with first series
    ec = polar(angle, radius[:,1]; splitNumber = splitNumber, showSymbol = showSymbol, kwargs...)

    #Append remaining series
	for i in 2:size(radius)[2]
		push!(ec.series, XYSeries(coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius[:,i],angle)))
	end

    #Add seriesnames for legend
    seriesnames!(ec)

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end
