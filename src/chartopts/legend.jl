# Works, but doesn't make sense for: sankey, gauge
function legend!(ec::EChart; kwargs...)

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
