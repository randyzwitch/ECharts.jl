function polar(angle::AbstractVector, radius::AbstractVector;
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = false,
            kwargs...)

    ec = newplot(kwargs, ec_charttype = "polar")

    ec.polar = [Polar()]
    ec.angleAxis = AngleAxis(_type = "value", splitNumber = splitNumber)
    ec.radiusAxis = RadiusAxis(min = 0)
    ec.series = [Series(name = "Series 1", coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = [[r,a] for (r,a) in zip(radius, angle)])]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
