toolbox_spec =
[
    (:show, Bool, false),
    (:orient, AbstractString, "vertical"),
    (:itemGap, Number, 10),
    (:itemSize, Number, 15),
    (:feature, Dict{Any, Any}, Dict{Any, Any}()),
    (:showTitle, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 2),
    (:iconStyle, IconStyle, nothing),
    (:left, Union{AbstractString, Number}, nothing),
    (:top, Union{AbstractString, Number}, "center"),
    (:right, Union{AbstractString, Number}, "auto"),
    (:bottom, Union{AbstractString, Number}, nothing),
    (:width, Union{AbstractString, Number}, "auto"),
    (:height, Union{AbstractString, Number}, "auto"),
]

primitivefactory(:Toolbox, toolbox_spec)
