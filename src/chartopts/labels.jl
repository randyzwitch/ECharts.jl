function labels!(ec::EChart, series::Int; show::Bool = true, position::String = "insideTop")

	ec.series[series].label = Label(show = show, position = position)

    return ec

end

function labels!(ec::EChart; show::Bool = true, position::String = "insideTop")

	for n in 1:length(ec.series)
		labels!(ec, n, show = show, position = position)
	end

	return ec

end
