#Generic plot interface for all plots needing X-Y axis with a single series
function xy_plot(x::AbstractVector, y::AbstractVector;
			mark::String = "bar",
			step::Union{String, Void} = nothing,
			horizontal::Bool = false,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	#Validate arrays are same length
	if size(x) != size(y)
		error("Arrays x and y need to have the same length.")
	end

    ec = newplot(kwargs, ec_charttype = "xy plot")

	#General visualization defaults
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value", nameGap = 50, scale = scale)] #Add some padding for later if name added
	ec.series = [Series(name = "Series 1", _type = mark, data = y, step = step)]

	#Make plot horizontal
	horizontal? flip!(ec): nothing

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end
