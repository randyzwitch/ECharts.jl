function radarchart(names::AbstractVector, values::AbstractVector, max::AbstractVector = []; kwargs...)

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = deepcopy(EChart())
	ec.radar = Radar(indicator = dataformat(name = names, max = max))

	ec.series = [Series(_type = "radar", data = [Dict{Any, Any}("value" => values)])]

	#Process keyword args after defined functionality
	if length(kwargs) > 0
		for (k, v) in kwargs
		   setfield!(ec, k, v)
	   end
	end

	return ec

end

function radarchart(names::AbstractVector, values::AbstractArray, max::AbstractVector = []; kwargs...)

	# Call 1-D method to build base
	ec = radarchart(names, values[:,1], max; kwargs...)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	return ec

end
