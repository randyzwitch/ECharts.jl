"""
    legend!(ec)

Adds or modifies the legend for an `EChart`. Series names are populated automatically
based on the chart type. Additional legend properties can be set via `kwargs`.

## Methods
```julia
legend!(ec::EChart; kwargs...)
```

## Arguments
* `kwargs` : any field of the `Legend` struct (e.g. `orient`, `top`, `left`, `right`)

## Notes

Does not work as expected for sankey and gauge chart types.

## Examples
```julia
x = ["A","B","C"]
y = [1 2; 3 4; 5 6]
b = bar(x, y)
legend!(b, orient = "vertical", left = "right")
```
"""
function legend!(ec::EChart; kwargs...)
	# Works, but doesn't make sense for: sankey, gauge

	#Define data upfront for the most common cases
	#This currently clobbers, should this be a check for nothing instead of clobber?
	if ec.ec_charttype in ["circular", "funnel"]
		ec.legend = Legend(data = [x["name"] for x in ec.series[1].data])
	elseif ec.ec_charttype in ["streamgraph"]
		ec.legend = Legend(data = unique([x[3] for x in ec.series[1].data]))
	else
		ec.legend = Legend(data = [x.name for x in ec.series])
	end

	#Set all of the kwargs values provided
	for (k, v) in kwargs
	   setfield!(ec.legend, k, v)
	end

    return ec

end
