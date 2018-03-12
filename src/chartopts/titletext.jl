#By convention from definetypes.jl, make title! update the first Title object in array
title!(ec::EChart; kwargs...) = text!(ec, 1; kwargs...)

#Push on to end of ec.title array
function text!(ec::EChart; kwargs...)

	temp = Title()

	for (k, v) in kwargs
	   setfield!(temp, k, v)
	end

	push!(ec.title, temp)

	return ec

end

#Modify a piece of text in place
function text!(ec::EChart, series::Int; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.title[series], k, v)
	end

	return ec

end
