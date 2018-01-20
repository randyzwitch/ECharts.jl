function candlestick(dt::AbstractVector{String},
                     open::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                     close::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                     low::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
                     high::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
                     legend::Bool = false,
                     scale::Bool = true,
                     kwargs...)

    #Put in array of array format
    fmtdata = []
    for (o,c,l,h) in zip(open, close, low, high)
        push!(fmtdata, [o,c,l,h])
    end

    ec = newplot(kwargs, ec_charttype = "candlestick")
    ec.xAxis = [Axis(_type = "category", data = dt, scale = true, boundaryGap = true)]
    ec.yAxis = [Axis(scale = scale)]
    ec.series = [Series(name = "Series 1", _type = "candlestick", data = fmtdata)]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
