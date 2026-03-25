"""
    flip!(ec)

Flips the x and y axes of an `EChart`. Works for XY plots and box plots.
Box plots with outliers are handled correctly regardless of series order.
Standalone scatter charts are not supported.

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
    #Doesn't work for scatter

    ec.xAxis, ec.yAxis = ec.yAxis, ec.xAxis

	#Rotate dimensions to keep same aspect ratio
	if rotatedims
		ec.ec_width, ec.ec_height = ec.ec_height, ec.ec_width
	end

	# If boxplot, invert outlier coordinates for all scatter series (outliers)
	# Find by _type rather than relying on a fixed series index
	if ec.ec_charttype == "box"
	    for s in ec.series
	        if hasproperty(s, :_type) && s._type == "scatter" && !isnothing(s.data) && length(s.data) > 0
	            s.data = [[x[2], x[1]] for x in s.data]
	        end
	    end
	end

    return ec

end
