function title!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   ec.title.(k) = v
	end 

	return ec
 
end