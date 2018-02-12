"""
    heatmap(data)

Creates an `EChart` heatmap.

## Methods
```julia
heatmap(h::StatsBase.Histogram)
```

## Arguments
* `legend::Bool = false` : display legend?
* `show::Bool = true` : show slider denoting color range
* `calculable::Bool = true` : allow user to slide endpoints to change data displayed
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
using RDatasets
h2 = fit(Histogram, (df[:Price], df[:Carat]), closed = :left)
hs2 = heatmap(h2)
```
"""
function heatmap(h::StatsBase.Histogram;
                    legend::Bool = false,
                    show::Bool = true,
                    calculable::Bool = true,
                    kwargs...)

    #Get labels
    xedges = collect(h.edges[1])
    yedges = collect(h.edges[2])

    h.closed == :left ? left = "[" : left = "("
    left == "[" ? right = ")" : right = "]"

    xlabels = []
    for i in 1:length(xedges)-1
        push!(xlabels, string(left, xedges[i], " - ", xedges[i + 1], right))
    end

    ylabels = []
    for i in 1:length(yedges)-1
        push!(ylabels, string(left, yedges[i], " - ", yedges[i + 1], right))
    end

    #Format data, subtract 1 bc JavaScript!
    xlen, ylen = size(h.weights)
    data = []
    for i in 1:xlen
        for j in 1:ylen
            push!(data, [i - 1, j - 1, h.weights[i,j]])
        end
    end

    #Build heatmap
    ec = ECharts.newplot(kwargs, ec_charttype = "heatmap")
    ec.yAxis = [Axis(_type = "category", data = ylabels)]
    ec.xAxis = [Axis(_type = "category", data = xlabels)]
    ec.series = [HeatmapSeries(name = "heatmap", data = data)]

    minval, maxval = extrema(h.weights)

    ec.visualMap = ECharts.VisualMap(show = show,
                                     min = minval,
                                     max = maxval,
                                     calculable = calculable,
                                     orient = "vertical",
                                     right = "2%",
                                     top = "middle"
                                     )

    #Show legend if requested, though doesn't make sense in this context
    legend ? legend!(ec) : nothing

    return ec

end
