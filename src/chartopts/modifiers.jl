#By convention from definetypes.jl, make title! update the first Title object in array
function title!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.title[1], k, v)
	end

	return ec

end

function yAxis!(ec::EChart; formatter::Union{String, JSFunction, Void} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.yAxis[1], k, v)
	end

	#Apply axis label format if present
	formatter != nothing? ec.yAxis[1].axisLabel.formatter = formatter : nothing

	return ec

end

function xAxis!(ec::EChart; formatter::Union{String, JSFunction, Void} = nothing, kwargs...)

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

#Use ColorBrewer.jl scales
function colorscheme!(ec::EChart; palette::Union{Tuple{AbstractString,Any}, AbstractString, Array, Void} = nothing, reversePalette::Bool = false)

    #colorscheme, single color or array of arbitrary string colors
    if isa(palette, Tuple)
        reversePalette == true? ec.color = reverse(colorpalettes[palette[1]]["$(palette[2])"]) : ec.color  = colorpalettes[palette[1]]["$(palette[2])"]
    elseif isa(palette, AbstractString)
        ec.color = [palette]
    elseif isa(palette, Array)
        reversePalette == true? ec.color  = reverse(collect(palette)) : ec.color  = collect(palette)
    end

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

function smooth!(ec::EChart)

	[x.smooth = true for x in ec.series]

	return ec

end
