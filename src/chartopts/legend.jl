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

"""
function legend!(ec::EChart; kwargs...)
	# Works, but doesn't make sense for: sankey, gauge

	#Define data upfront for the most common cases
	#This currently clobbers, should this be a check for nothing instead of clobber?
	if ec.ec_charttype in ["circular", "funnel"]
		data = ec.series[1].data
		isempty(data) && error("Cannot build legend: $(ec.ec_charttype) series data is empty")
		all(d -> haskey(d, "name"), data) ||
			error("Cannot build legend: $(ec.ec_charttype) series data entries must each have a \"name\" key")
		ec.legend = Legend(data = [x["name"] for x in data])
	elseif ec.ec_charttype in ["streamgraph"]
		data = ec.series[1].data
		isempty(data) && error("Cannot build legend: streamgraph series data is empty")
		all(d -> length(d) >= 3, data) ||
			error("Cannot build legend: streamgraph series data entries must each have at least 3 elements (got an entry with $(minimum(length.(data))))")
		ec.legend = Legend(data = unique([x[3] for x in data]))
	else
		ec.legend = Legend(data = [x.name for x in ec.series])
	end

	#Set all of the kwargs values provided
	for (k, v) in kwargs
	   setfield!(ec.legend, k, v)
	end

    return ec

end
