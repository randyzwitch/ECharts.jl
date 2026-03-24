"""
    candlestick(dt, open, close, low, high)

Creates an `EChart` for visualizing financial prices of a security.

## Methods
```julia
candlestick(dt::AbstractVector{String},
            open::AbstractVector{<:Union{Missing, Real}},
            close::AbstractVector{<:Union{Missing, Real}},
            low::AbstractVector{<:Union{Missing, Real}},
            high::AbstractVector{<:Union{Missing, Real}})

candlestick(dt::AbstractVector{<:Dates.TimeType},
            open::AbstractVector{<:Union{Missing, Real}},
            close::AbstractVector{<:Union{Missing, Real}},
            low::AbstractVector{<:Union{Missing, Real}},
            high::AbstractVector{<:Union{Missing, Real}})
```

## Arguments
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Candlestick plots are financial plots showing the relationship between the open, close, low and high prices for a security on a given day. For a more thorough description of the uses and subtleties of candlestick plots, see: [http://www.datavizcatalogue.com/methods/candlestick_chart.html](http://www.datavizcatalogue.com/methods/candlestick_chart.html)
"""
function candlestick(dt::AbstractVector{String},
                     open::AbstractVector{<:Union{Missing, Real}},
                     close::AbstractVector{<:Union{Missing, Real}},
                     low::AbstractVector{<:Union{Missing, Real}},
                     high::AbstractVector{<:Union{Missing, Real}};
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
    ec.series = [CandleStickSeries(name = "Series 1", data = fmtdata)]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end

candlestick(dt::AbstractVector{<:Dates.TimeType},
                     open::AbstractVector{<:Union{Missing, Real}},
                     close::AbstractVector{<:Union{Missing, Real}},
                     low::AbstractVector{<:Union{Missing, Real}},
                     high::AbstractVector{<:Union{Missing, Real}};
                     legend::Bool = false,
                     scale::Bool = true,
                     kwargs...) = candlestick(string.(dt), open, close, low, high; legend = legend, scale = scale, kwargs...)
