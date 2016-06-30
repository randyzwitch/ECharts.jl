geo_spec =

[
(:show, Bool, true),
(:map, AbstractString, nothing),
(:roam, Bool, false),
(:center, Vector{Number}, nothing),
(:zoom, Int, 1),
#(:scaleLimit, ScaleLimit, nothing), #fillin
(:nameMap, Dict, nothing),
(:selectedMode, Bool, false),
#(:label, Label, nothing), #fillin
#(:itemStyle, ItemStyle, u'adaptive'),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{AbstractString, Int}, "auto"),
(:top, Union{AbstractString, Int}, "auto"),
(:right, Union{AbstractString, Int}, "auto"),
(:bottom, Union{AbstractString, Int}, "auto"),
(:regions, Vector{Any}, nothing),
(:silent, Bool, false),
]

primitivefactory(:Geo, geo_spec)