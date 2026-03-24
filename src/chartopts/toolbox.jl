"""
    toolbox!(ec)

Configures the toolbox widget for an `EChart`, which provides interactive tools such as
restore, data view, save as image, and chart type switching.

## Methods
```julia
toolbox!(ec::EChart; show, restore, dataView, saveAsImage, chartTypes)
```

## Arguments
* `show::Bool = true` : display the toolbox
* `restore::Bool = true` : include restore button
* `dataView::Bool = true` : include data view button
* `saveAsImage::Bool = true` : include save-as-PNG button
* `chartTypes::AbstractVector = []` : chart type toggle buttons (e.g. `["line", "bar", "stack"]`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
toolbox!(b, chartTypes = ["line", "bar"])
```
"""
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

	restore ? ec.toolbox.feature["restore"] = Dict("show" => true, "title" => "Restore") : ec.toolbox.feature["restore"] = Dict("show" => false)
	dataView ? ec.toolbox.feature["dataView"] = Dict("show" => true, "title" => "Data View", "lang" => ["Data View", "Cancel", "Refresh"]) : ec.toolbox.feature["dataView"] = Dict("show" => false)
	saveAsImage ? ec.toolbox.feature["saveAsImage"] = Dict("show" => true, "title" => "Save As PNG") : ec.toolbox.feature["saveAsImage"] = Dict("show" => false)
	chartTypes != [] ? ec.toolbox.feature["magicType"] = Dict("show" => true, "type" => chartTypes, "title" => chartlookup) : nothing

	return ec

end
