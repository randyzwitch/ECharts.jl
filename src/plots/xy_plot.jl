#Generic plot interface for all plots needing X-Y axis with a single series
function xy_plot(x::AbstractVector, y::AbstractVector;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing, #No op, here since other functions dispatch here
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

function xy_plot(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			step::Union{String, Void} = nothing,
			horizontal::Bool = false,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	# Allow for convenience of using single string to represent same mark for all series values
	typeof(mark) <: AbstractVector? nothing : mark = [mark for i in 1:length(x)]

	# Call 1-D method to build base
	ec = xy_plot(x, y[:,1]; mark = mark[1], scale = scale, kwargs...)

	# Append remaining Y data
	for i in 2:size(y)[2]
		push!(ec.series, Series(_type = mark[i], data = y[:,i]))
	end

	#stack: this logic feels janky, but seems to work
	if stack != nothing
		if stack == true
			[x.stack = 1 for x in ec.series]
		elseif typeof(stack) <: AbstractVector
			[x.stack = stack[i] for (i,x) in enumerate(ec.series)]
		else
			nothing
		end

	end

	#step
	step != nothing ? [x.step = step for x in ec.series]: nothing

	#Make plot horizontal
	horizontal? flip!(ec): nothing

	# Add default names to series
	seriesnames!(ec)

	#Add legend if requested
	legend? legend!(ec) : nothing

	return ec

end
