"""
    jitter!(ec)

Adds random jitter to data points in an `EChart` to reduce overplotting.
The jitter amount is a random percentage of the data range, following the range method
from Chambers, Cleveland, Kleiner, and Tukey (1983).

## Methods
```julia
jitter!(ec::EChart, series::Int; pctxrange, pctyrange)
jitter!(ec::EChart; pctxrange, pctyrange)
```

## Arguments
* `series::Int` : index of the series to jitter (single-series method only)
* `pctxrange::Real = 0.05` : maximum jitter as a fraction of the x data range
* `pctyrange::Real = 0` : maximum jitter as a fraction of the y data range

## Notes

When called without a `series` argument, jitter is applied to all series.

## Examples
```julia
s = scatter([1,1,2,2,3], [1,1,2,2,3])
jitter!(s)
```
"""
function jitter!(ec::EChart, series::Int; pctxrange::Real = 0.05, pctyrange::Real = 0)

    #http://blogs.sas.com/content/iml/2011/07/05/jittering-to-prevent-overplotting-in-statistical-graphics.html
    #range method supposed to be from Graphical Methods for Data Analysis
    #Chambers, Cleveland, Kleiner, and Tukey (1983)

    #Calculate range, then use random pct of range
    _y = []
    _x = []

    for datum in ec.series[series].data
        push!(_x, datum[1])
        push!(_y, datum[2])
    end

    xrange = maximum(_x) - minimum(_x)
    yrange = maximum(_y) - minimum(_y)

    #To avoid inexact error, ensure array is float
    ec.series[series].data isa Vector{Vector{Int64}} ?
        ec.series[1].data = [convert(Vector{Float64}, x) for x in ec.series[series].data] :
            nothing

    #Iterate over series to jitter dataset
    for datum in ec.series[series].data

        datum[1] = rand(-pctxrange:0.001:pctxrange) * xrange + datum[1]
        datum[2] = rand(-pctyrange:0.001:pctyrange) * yrange + datum[2]

    end

    return ec
end

function jitter!(ec::EChart; pctxrange::Real = 0.05, pctyrange::Real = 0)

	for n in 1:length(ec.series)
		jitter!(ec, n, pctxrange = pctxrange, pctyrange = pctyrange)
	end

	return ec

end
