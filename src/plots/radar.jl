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
