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
