#All series by default
function smooth!(ec::EChart; smooth::Bool = true)

	[x.smooth = smooth for x in ec.series]

	return ec

end

#Single series
function smooth!(ec::EChart, series::Int; smooth::Bool = true)

	ec.series[series].smooth = smooth

	return ec

end

#Specified Series in Array
function smooth!(ec::EChart, series::Vector{Int}; smooth::Bool = true)

	[smooth!(ec, x, smooth = smooth) for x in series]

	return ec

end
