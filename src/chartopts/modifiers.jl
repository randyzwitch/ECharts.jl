function title!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.title, k, v)
	end

	return ec

end

function yAxis!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.yAxis[1], k, v)
	end

	return ec

end

function xAxis!(ec::EChart; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.xAxis[1], k, v)
	end

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
