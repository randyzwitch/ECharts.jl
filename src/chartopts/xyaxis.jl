function yaxis!(ec::EChart; formatter::Union{String, JSFunction, Nothing} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.yAxis[1], k, v)
	end

	#Apply axis label format if present
	formatter != nothing ? ec.yAxis[1].axisLabel.formatter = formatter : nothing

	return ec

end

function xaxis!(ec::EChart; formatter::Union{String, JSFunction, Nothing} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.xAxis[1], k, v)
	end

	#Apply axis label format if present
	formatter != nothing ? ec.xAxis[1].axisLabel.formatter = formatter : nothing

	return ec

end
