function radar(names::AbstractVector, values::AbstractVector, max::AbstractVector = [];
	 				fill::Bool = false,
					legend::Bool = false,
					kwargs...)

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = newplot(kwargs, ec_charttype = "radar")

	ec.radar = [Radar(indicator = dataformat(name = names, max = max))]

	ec.series = [Series(name = "Series 1", _type = "radar", data = [Dict{Any, Any}("value" => values)])]

	# Fill area if requested
	fill!(ec, 1, fill)

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end

function radar(names::AbstractVector, values::AbstractArray, max::AbstractVector = [];
	 				fill::Union{Bool, AbstractVector} = false,
					legend::Bool = true,
					kwargs...)

	# Call 1-D method to build base
	ec = radar(names, values[:,1], max; kwargs...)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	# Fill area if requested
	# This is smelly
	typeof(fill) == Bool? fill = [fill for i in 1:size(values)[2]]: fill = fill
	cols = length(fill)
	fill!(ec, cols, fill)

	seriesnames!(ec)

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end
