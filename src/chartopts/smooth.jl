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
function smooth!(ec::EChart; smooth::Bool = true)
	#All series by default

	for s in ec.series
		s.smooth = smooth
	end

	return ec

end

"""
    smooth!(ec, series)

Enables or disables line smoothing for a single series at index `series` in `ec`.
See the primary `smooth!` method for full argument documentation.
"""
function smooth!(ec::EChart, series::Int; smooth::Bool = true)

	ec.series[series].smooth = smooth

	return ec

end

"""
    smooth!(ec, series)

Enables or disables line smoothing for the series at each index in the `series` vector.
See the primary `smooth!` method for full argument documentation.
"""
function smooth!(ec::EChart, series::Vector{Int}; smooth::Bool = true)

	for s in series
		smooth!(ec, s, smooth = smooth)
	end

	return ec

end
