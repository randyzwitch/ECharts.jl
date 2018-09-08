"""
    funnel(names, values)

Creates an `EChart` funnel.

## Methods
```julia
funnel(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
```

## Arguments
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Given the concept of a funnel (largest at top, narrowing), if you pass in the values out of order, the echarts.js library automatically sorts the numbers highest to lowest.

## Examples
```julia
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
```
"""
function funnel(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}};
 legend::Bool = false,
 sort::String = "descending",
 kwargs...)

    ec = newplot(kwargs, ec_charttype = "funnel")

    ec.series = [FunnelSeries(name = "Series 1",
                            data =  arrayofdicts(value = values, name = names),
                            sort = sort
                            )]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end
