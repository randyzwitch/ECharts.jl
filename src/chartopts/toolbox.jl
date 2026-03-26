# Display titles for ECharts magicType chart-toggle buttons.
# Add an entry here whenever a new chart type that supports magicType is introduced.
const MAGICTYPE_TITLES = Dict(
    "line"    => "Line",
    "bar"     => "Bar",
    "stack"   => "Stack",
    "tiled"   => "Tiled",
    "force"   => "Force",
    "chord"   => "Chord",
    "pie"     => "Pie",
    "funnel"  => "Funnel",
)

"""
    toolbox!(ec)

Configures the toolbox widget for an `EChart`, which provides interactive tools such as
restore, data view, save as image, chart type switching, and data zoom.

## Methods
```julia
toolbox!(ec::EChart; show, restore, dataView, saveAsImage, dataZoom, chartTypes, orient, left, top, right, bottom)
```

## Arguments
* `show::Bool = true` : display the toolbox
* `restore::Bool = true` : include restore button
* `dataView::Bool = true` : include data view button
* `saveAsImage::Bool = true` : include save-as-PNG button
* `dataZoom::Bool = false` : include a data zoom (box-select) button
* `chartTypes::AbstractVector = []` : chart type toggle buttons (e.g. `["line", "bar", "stack"]`)
* `orient::String = "vertical"` : toolbox layout direction (`"vertical"` or `"horizontal"`)
* `left::Union{Number,String,Nothing} = nothing` : toolbox left position
* `top::Union{Number,String,Nothing} = nothing` : toolbox top position (`"center"` by default)
* `right::Union{Number,String,Nothing} = nothing` : toolbox right position
* `bottom::Union{Number,String,Nothing} = nothing` : toolbox bottom position

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
toolbox!(b, chartTypes = ["line", "bar"])

# Add data zoom button and reposition to top-right
toolbox!(b, dataZoom = true, right = "5%", top = "5%", orient = "horizontal")
```
"""
function toolbox!(ec::EChart; 	show::Bool = true,
								#mark::Bool = true,
								restore::Bool = true,
								dataView::Bool = true,
								saveAsImage::Bool = true,
								dataZoom::Bool = false,
								chartTypes::AbstractVector = [],
								orient::String = "vertical",
								left::Union{Number,String,Nothing} = nothing,
								top::Union{Number,String,Nothing} = nothing,
								right::Union{Number,String,Nothing} = nothing,
								bottom::Union{Number,String,Nothing} = nothing
								)
	# Assumes Toolbox already exists in EChart, which is true by composite type definition

	ec.toolbox.show = show
	ec.toolbox.orient = orient

	isnothing(left)   || (ec.toolbox.left   = left)
	isnothing(top)    || (ec.toolbox.top    = top)
	isnothing(right)  || (ec.toolbox.right  = right)
	isnothing(bottom) || (ec.toolbox.bottom = bottom)

	restore ? ec.toolbox.feature["restore"] = Dict("show" => true, "title" => "Restore") : ec.toolbox.feature["restore"] = Dict("show" => false)
	dataView ? ec.toolbox.feature["dataView"] = Dict("show" => true, "title" => "Data View", "lang" => ["Data View", "Cancel", "Refresh"]) : ec.toolbox.feature["dataView"] = Dict("show" => false)
	saveAsImage ? ec.toolbox.feature["saveAsImage"] = Dict("show" => true, "title" => "Save As PNG") : ec.toolbox.feature["saveAsImage"] = Dict("show" => false)
	dataZoom ? ec.toolbox.feature["dataZoom"] = Dict("show" => true, "title" => Dict("zoom" => "Zoom", "back" => "Zoom Reset")) : nothing
	chartTypes != [] ? ec.toolbox.feature["magicType"] = Dict("show" => true, "type" => chartTypes, "title" => MAGICTYPE_TITLES) : nothing

	return ec

end
