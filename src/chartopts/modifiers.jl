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

function yaxis!(ec::EChart; formatter::Union{String, JSFunction, Void} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.yAxis[1], k, v)
	end

	#Apply axis label format if present
	formatter != nothing? ec.yAxis[1].axisLabel.formatter = formatter : nothing

	return ec

end

function xaxis!(ec::EChart; formatter::Union{String, JSFunction, Void} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.xAxis[1], k, v)
	end

	#Apply axis label format if present
	formatter != nothing? ec.xAxis[1].axisLabel.formatter = formatter : nothing

	return ec

end

# Assumes Toolbox already exists in EChart, which is true by composite type definition
function toolbox!(ec::EChart; 	show::Bool = true,
								#mark::Bool = true,
								restore::Bool = true,
								dataView::Bool = true,
								saveAsImage::Bool = true,
								chartTypes::AbstractVector = []
								)

	chartlookup = Dict(	"line" => "Line",
						"bar" => "Bar",
						"stack" => "Stack",
						"tiled" => "Tiled",
						"force" => "Force",
						"chord" => "Chord",
						"pie" => "Pie",
						"funnel" => "Funnel"
						)

	ec.toolbox.show = show

	restore? ec.toolbox.feature["restore"] = Dict("show" => true, "title" => "Restore") : ec.toolbox.feature["restore"] = Dict("show" => false)
	dataView? ec.toolbox.feature["dataView"] = Dict("show" => true, "title" => "Data View", "lang" => ["Data View", "Cancel", "Refresh"]) : ec.toolbox.feature["dataView"] = Dict("show" => false)
	saveAsImage? ec.toolbox.feature["saveAsImage"] = Dict("show" => true, "title" => "Save As PNG") : ec.toolbox.feature["saveAsImage"] = Dict("show" => false)
	chartTypes != [] ? ec.toolbox.feature["magicType"] = Dict("show" => true, "type" => chartTypes, "title" => chartlookup) : nothing

	return ec

end

function colorscheme!(ec::EChart, palette::Tuple{AbstractString,Any}; reversePalette::Bool = false)

    reversePalette == true?
		ec.color = reverse(colorpalettes[palette[1]]["$(palette[2])"]) :
			ec.color  = colorpalettes[palette[1]]["$(palette[2])"]

    return ec

end

#This is for string literals and gradients, so reversePalette doesn't make sense as argument
function colorscheme!(ec::EChart, palette::Union{AbstractString, JSFunction})

    ec.color = [palette]

    return ec

end

function colorscheme!(ec::EChart, palette::AbstractVector; reversePalette::Bool = false)

    reversePalette == true? ec.color  = reverse(collect(palette)) : ec.color  = collect(palette)

    return ec

end

# Works, but doesn't make sense for: sankey, gauge
function legend!(ec::EChart)

	if ec.ec_charttype in ["circular", "funnel"]
		ec.legend = Legend(data = [x["name"] for x in ec.series[1].data])
	else
		ec.legend = Legend(data = [x.name for x in ec.series])
	end

    return ec

end

#Flip x and y axis. Currently only works for XY plots
#Doesn't work for scatter, boxplot brittle
function flip!(ec::EChart; rotatedims::Bool = false)

    ec.xAxis, ec.yAxis = ec.yAxis, ec.xAxis

	#Rotate dimensions to keep same aspect ratio
	if rotatedims
		ec.ec_width, ec.ec_height = ec.ec_height, ec.ec_width
	end

	# If boxplot, invert outlier values
	# This could be more robust to not use numeric indices
	ec.ec_charttype == "box" &&  length(ec.series) > 1 ? ec.series[2].data = [[x[2], x[1]] for x in ec.series[2].data] : nothing

    return ec

end

function slider!(ec::EChart)

    #Need to be more robust in checking the structure of dataZoom, specify axis, etc.
    ec.dataZoom == nothing? ec.dataZoom = [DataZoom(show = true)] : push!(ec.dataZoom, DataZoom(show = true))

    return ec

end

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

# echarts built-in for average, min, max
function yline!(ec::EChart, value::String; series::Int = 1)

    ec.series[series].markLine == nothing ?
        ec.series[series].markLine = MarkLine(data = [Dict{Any, Any}("type" => value)]) :
            push!(ec.series[series].markLine.data, Dict{Any, Any}("type" => value))

    return ec

end

#arbitrary number line
function yline!(ec::EChart, value::Real; series::Int = 1)

    ec.series[series].markLine == nothing ?
        ec.series[series].markLine = MarkLine(data = [Dict("yAxis" => value)]) :
            push!(ec.series[series].markLine.data, Dict("yAxis" => value))

    return ec

end

#arbitrary line: need to confirm that the xAxis line can only be xAxis => value, not min/max/average
function xline!(ec::EChart, value::Any; series::Int = 1)

    ec.series[series].markLine == nothing ?
        ec.series[series].markLine = MarkLine(data = [Dict("xAxis" => value)]) :
            push!(ec.series[series].markLine.data, Dict("xAxis" => value))

    return ec

end

#Merge methods together using metaprogramming?
function xarea!(ec::EChart, startval, endval; series::Int = 1)

    ec.series[series].markArea == nothing ?
        ec.series[series].markArea = MarkArea(data = [[Dict("xAxis" => startval), Dict("xAxis" => endval)]]) :
            push!(ec.series[series].markArea.data, [Dict("xAxis" => startval), Dict("xAxis" => endval)])

    return ec

end

function yarea!(ec::EChart, startval, endval; series::Int = 1)

    ec.series[series].markArea == nothing ?
        ec.series[series].markArea = MarkArea(data = [[Dict("yAxis" => startval), Dict("yAxis" => endval)]]) :
            push!(ec.series[series].markArea.data, [Dict("yAxis" => startval), Dict("yAxis" => endval)])

    return ec

end
