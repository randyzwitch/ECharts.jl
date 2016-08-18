function radarchart(; names::AbstractVector = [], values::AbstractArray = [], max::AbstractVector = [])

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = deepcopy(EChart())

	ec.radar = Radar(indicator = dataformat(name = names, max = max))

	ec.series = Series[]

	#Add y columns into Series
	ndims(values) == 1?
		push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values)])):
		[push!(ec.series, Series(_type = "radar", data = [Dict{Any, Any}("value" => values[:,i])])) for i in 1:size(values)[2]]

	return ec

end
