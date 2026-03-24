"""
    slider!(ec)

Adds a data zoom slider to an `EChart`, allowing the user to pan and zoom along the data axis.

## Methods
```julia
slider!(ec::EChart)
```

## Examples
```julia
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
slider!(b)
```
"""
function slider!(ec::EChart)

    #Need to be more robust in checking the structure of dataZoom, specify axis, etc.
    ec.dataZoom == nothing ? ec.dataZoom = [DataZoom(show = true)] : push!(ec.dataZoom, DataZoom(show = true))

    return ec

end
