function radar(names::AbstractVector, values::AbstractVector, max::AbstractVector = [];
	 				fill::Bool = false,
					kwargs...)

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = deepcopy(EChart())
	ec.radar = Radar(indicator = dataformat(name = names, max = max))

	ec.series = [Series(_type = "radar", data = [Dict{Any, Any}("value" => values)])]

	#Process keyword args after defined functionality
	kwargs!(ec, kwargs)

	# Fill area if requested
	fill!(ec, 1, fill)

	return ec

end

function radar(names::AbstractVector, values::AbstractArray, max::AbstractVector = [];
	 				fill::Union{Bool, AbstractVector} = false,
					kwargs...)

	# Call 1-D method to build base
	ec = radar(names, values[:,1], max; kwargs...)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	# Fill area if requested
	typeof(fill) == Bool? fill = [fill for i in 1:size(values)[2]]: fill = fill
	cols = length(fill)
	fill!(ec, cols, fill)

	return ec

end
