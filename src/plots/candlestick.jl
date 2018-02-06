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

close_ = [12.3800, 12.4700, 12.5500, 12.6000, 12.4400, 12.5000, 12.6700, 12.7000, 12.7300,
12.3800, 12.7000, 12.3800, 12.1400, 12.1100, 12.1100, 12.1100, 12.0000, 12.0900, 12.1800,
12.1700, 12.0100]

open_ = [12.4700, 12.3800, 12.4600, 12.4800, 12.6600, 12.5300, 12.4900, 12.6200, 12.5000,
12.6100, 12.3200, 12.5300, 12.1800, 12.1400, 12.0500, 12.1200, 12.0900, 12.0800, 12.1700,
12.1200, 12.1200]

high_ = [12.5500, 12.5000, 12.5600, 12.6100, 12.7200, 12.5700, 12.6700, 12.7500, 12.7500,
12.6850, 12.7700, 12.6800, 12.3100, 12.1800, 12.1300, 12.3300, 12.1900, 12.1100, 12.2900,
12.2200, 12.1200]

low_ = [12.3400, 12.3800, 12.4300, 12.4800, 12.3500, 12.4600, 12.4300, 12.6200, 12.5000,
12.3800, 12.2800, 12.3300,12.1100, 12.0600, 12.0100, 12.0586, 11.9600, 12.0100, 12.1600,
12.1200, 12.0000]

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
    ec.series = [Series(name = "Series 1", _type = "candlestick", data = fmtdata)]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
