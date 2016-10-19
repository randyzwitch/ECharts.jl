function xy_plot(x::AbstractVector, y::AbstractVector;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing, #No op, here since other functions dispatch here
			step::Union{String, Void} = nothing,
			horizontal::Bool = false,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	#Validate arrays are same length
	if size(x)[1] != size(y)[1]
		error("Arrays X and Y need to have the same length.")
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
			legend::Bool = false,
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

	#stack
	if stack != nothing
		stack == true? [x.stack = 1 for x in ec.series]: [x.stack = stack[i] for (i,x) in enumerate(ec.series)]
	end

	#step
	step != nothing ? [x.step = step for x in ec.series]: nothing

	#Make plot horizontal
	horizontal? flip!(ec): nothing

	# Add default names to series
	seriesnames!(ec)

	return ec

end

function line(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

function bar(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	 return xy_plot(x, y; mark = mark, stack = stack, legend = legend, scale = scale, kwargs...)

end

function scatter(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(d[:,1], d[:,2:end]; mark = mark, legend = legend, scale = scale, kwargs...)

	return ec

end

function area(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "line",
			fill::Union{Bool, AbstractVector} = true,
			stack::Union{Bool, AbstractVector, Void} = nothing,
			step::Union{String, Void} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; stack = stack, mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1].boundaryGap = false

	# Fill area if requested
	ndims(y) == 1? cols = 1: cols = size(y)[2]
	fill!(ec, cols, fill)

	return ec

end

function waterfall(x::AbstractVector, y::AbstractVector;
					legend::Bool = false,
					scale::Bool = false,
					kwargs...)

    #Need to add a value for total, since user passes in data values only
    labels = [string(x) for x in x]
    push!(labels, "total")

    #Calculate transparent series as base for stacking
    bottom = cumsum(y)
    bottom[1] = 0
    push!(bottom, 0)

    #Calculate actual waterfall
    top = abs.(y)
    push!(top, sum(y))

    #Make bottom series transparent
    trans = ItemStyleOpts(barBorderColor = "transparent", color = "transparent")

    ec = bar(labels, hcat(bottom, top), stack = true, legend = legend, scale = scale, kwargs...)
    ec.series[1].itemStyle = ItemStyle(normal = trans, emphasis = trans )

    return ec
end
