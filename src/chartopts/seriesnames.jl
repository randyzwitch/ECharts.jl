"""
    seriesnames!(ec)

Assigns names to series in an `EChart`. When called without a `names` argument, series
are named automatically as `"Series 1"`, `"Series 2"`, etc. This is useful before calling
`legend!`, which requires named series.

## Methods
```julia
seriesnames!(ec::EChart)
seriesnames!(ec::EChart, names::AbstractVector{String})
seriesnames!(ec::EChart, names::AbstractVector)
```

## Arguments
* `names::AbstractVector` : vector of names, one per series (converted to `String` if needed)

## Examples
```julia
x = ["A","B","C"]
y = [1 2; 3 4; 5 6]
b = bar(x, y)
seriesnames!(b, ["Series One", "Series Two"])
```
"""
#Automatically name series, so that downstream functions like legend which use names have one
function seriesnames!(ec::EChart)

    for (i, x) in enumerate(ec.series)
        isnothing(x.name) ? x.name = "Series $i" : nothing
    end

    return ec

end

function seriesnames!(ec::EChart, names::AbstractVector{String})

    length(ec.series) != length(names) ? error("Names not equal to number of Series") : nothing

    for i in 1:length(ec.series)
        ec.series[i].name = names[i]
    end

    #Modify legend attribute to use new seriesnames
    ec.legend.data = names

    return ec

end

seriesnames!(ec::EChart, names::AbstractVector) = seriesnames!(ec, String[string(x) for x in names])
