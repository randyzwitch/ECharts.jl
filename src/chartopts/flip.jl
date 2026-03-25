"""
    flip!(ec)

Flips the x and y axes of an `EChart`. Currently only works for XY plots; scatter and boxplot support is limited.

## Methods
```julia
flip!(ec::EChart; rotatedims)
```

## Arguments
* `rotatedims::Bool = false` : also swap the chart width and height to preserve aspect ratio

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
flip!(b)
```
"""
function flip!(ec::EChart; rotatedims::Bool = false)
    #Flip x and y axis. Currently only works for XY plots
    #Doesn't work for scatter, boxplot brittle

    ec.xAxis, ec.yAxis = ec.yAxis, ec.xAxis

	#Rotate dimensions to keep same aspect ratio
	if rotatedims
		ec.ec_width, ec.ec_height = ec.ec_height, ec.ec_width
	end

	# If boxplot, invert outlier values
	# This could be more robust to not use numeric indices
	ec.ec_charttype == "box" &&  length(ec.series) > 1 ? ec.series[2].data = [[x[2], x[1]] for x in ec.series[2].data] : nothing

    return ec

end
