"""
    smooth!(ec)

Enables or disables line smoothing for series in an `EChart`.

## Methods
```julia
smooth!(ec::EChart; smooth)
smooth!(ec::EChart, series::Int; smooth)
smooth!(ec::EChart, series::Vector{Int}; smooth)
```

## Arguments
* `series::Int` : index of a single series to smooth
* `series::Vector{Int}` : indices of multiple series to smooth
* `smooth::Bool = true` : enable smoothing

## Notes

When called without a `series` argument, smoothing is applied to all series.

## Examples
```julia
l = line(["A","B","C","D"], [1,4,2,5])
smooth!(l)
```
"""
#All series by default
function smooth!(ec::EChart; smooth::Bool = true)

	[x.smooth = smooth for x in ec.series]

	return ec

end

#Single series
function smooth!(ec::EChart, series::Int; smooth::Bool = true)

	ec.series[series].smooth = smooth

	return ec

end

#Specified Series in Array
function smooth!(ec::EChart, series::Vector{Int}; smooth::Bool = true)

	[smooth!(ec, x, smooth = smooth) for x in series]

	return ec

end
