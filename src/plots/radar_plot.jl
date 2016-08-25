function radarchart(names::AbstractVector, values::AbstractVector, max::AbstractVector = [])

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = deepcopy(EChart())
	ec.radar = Radar(indicator = dataformat(name = names, max = max))

	ec.series = [Series(_type = "radar", data = [Dict{Any, Any}("value" => values)])]

	return ec

end

function radarchart(names::AbstractVector, values::AbstractArray, max::AbstractVector = [])

	# Call 1-D method to build base
	ec = radarchart(names, values[:,1], max)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	return ec

end
