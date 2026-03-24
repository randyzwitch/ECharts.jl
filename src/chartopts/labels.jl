"""
    labels!(ec)

Shows or hides data labels on an `EChart`.

## Methods
```julia
labels!(ec::EChart, series::Int; show, position)
labels!(ec::EChart; show, position)
```

## Arguments
* `series::Int` : index of the series to modify (single-series method only)
* `show::Bool = true` : display labels
* `position::String = "insideTop"` : label position (e.g. `"insideTop"`, `"top"`, `"inside"`, `"bottom"`)

## Notes

When called without a `series` argument, labels are applied to all series.

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
labels!(b)
```
"""
function labels!(ec::EChart, series::Int; show::Bool = true, position::String = "insideTop")

	ec.series[series].label = Label(show = show, position = position)

    return ec

end

function labels!(ec::EChart; show::Bool = true, position::String = "insideTop")

	for n in 1:length(ec.series)
		labels!(ec, n, show = show, position = position)
	end

	return ec

end
