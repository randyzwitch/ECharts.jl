function title!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   ec.title.(k) = v
	end

	return ec

end

#Default to showing legend in the type definition; consider changing to only show with multiple series
function legend!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   ec.legend.(k) = v
	end

	return ec

end

#Type definition of tooltip hides tooltip; if someone calling tooltip!, assumption is
function tooltip!(ec::EChart; show::Bool = true, kwargs...)

	ec.tooltip.show = show

	for (k, v) in kwargs
	   ec.tooltip.(k) = v
	end

	return ec

end

#Should theme! be made into a combined function with height and length?
function theme!(ec::EChart; theme::AbstractString = "default")

 	ec.theme = theme

 	return ec

end

function grid!(ec::EChart; showXaxis::Bool = false, showYaxis:: Bool = true)

	showXaxis ? ec.xAxis[1].splitLine.show = true : nothing
	showYaxis ? ec.yAxis[1].splitLine.show = true : nothing

	return ec
end