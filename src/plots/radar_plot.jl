function radarchart(; names::AbstractVector = [], values::AbstractVector = [], max::AbstractVector = [])

	ec = deepcopy(EChart())

	ec.radar = Radar(indicator = dataformat(name = names, max = max))
	ec.series = [Series(_type = "radar", data = [Dict{Any, Any}("value" => values)])]
	ec
end