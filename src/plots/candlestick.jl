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

## Examples
```julia
dt = ["2016/08/26", "2016/08/29", "2016/08/30", "2016/08/31", "2016/09/01", "2016/09/02",
"2016/09/06", "2016/09/07", "2016/09/08", "2016/09/09", "2016/09/12", "2016/09/13",
"2016/09/14", "2016/09/15", "2016/09/16", "2016/09/19", "2016/09/20", "2016/09/21",
"2016/09/22", "2016/09/23", "2016/09/26"]

close_ = [12.38, 12.47, 12.55, 12.60, 12.44, 12.50, 12.67, 12.70, 12.73, 12.38, 12.70, 12.38, 12.14, 12.11, 12.11, 12.11, 12.00, 12.09, 12.18, 12.17, 12.01]

open_ = [12.47, 12.38, 12.46, 12.48, 12.66, 12.53, 12.49, 12.62, 12.50, 12.61, 12.32, 12.53, 12.18, 12.14, 12.05, 12.12, 12.09, 12.08, 12.17, 12.12, 12.12]

high_ = [12.55, 12.50, 12.56, 12.61, 12.72, 12.57, 12.67, 12.75, 12.75, 12.6850, 12.77, 12.68, 12.31, 12.18, 12.13, 12.33, 12.19, 12.11, 12.29, 12.22, 12.12]

low_ = [12.34, 12.38, 12.43, 12.48, 12.35, 12.46, 12.43, 12.62, 12.50, 12.38, 12.28, 12.33,12.11, 12.06, 12.01, 12.0586, 11.96, 12.01, 12.16, 12.12, 12.00]

c = candlestick(dt, open_, close_, low_, high_)
```
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
