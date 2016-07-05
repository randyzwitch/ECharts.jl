scalelimit_spec =

[
(:min, Int, nothing),
(:max, Int, nothing)
]

primitivefactory(:ScaleLimit, scalelimit_spec)

geo_spec =

[
(:show, Bool, true),
(:map, AbstractString, nothing),
(:roam, Bool, false),
(:center, Vector{Number}, nothing),
(:zoom, Int, 1),
(:scaleLimit, ScaleLimit, nothing),
(:nameMap, Dict, nothing),
(:selectedMode, Bool, false),
(:label, Label, nothing),
(:itemStyle, ItemStyle, nothing),
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
