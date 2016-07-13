toolbox_spec =
[
    (:show, Bool, false),
    (:orient, String, "vertical"),
    (:itemGap, Number, 10),
    (:itemSize, Number, 15),
    (:feature, Dict{Any, Any}, Dict{Any, Any}()),
    (:showTitle, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 2),
    (:iconStyle, IconStyle, nothing),
    (:left, Union{String, Number}, nothing),
    (:top, Union{String, Number}, "center"),
    (:right, Union{String, Number}, "auto"),
    (:bottom, Union{String, Number}, nothing),
    (:width, Union{String, Number}, "auto"),
    (:height, Union{String, Number}, "auto"),
]

primitivefactory(:Toolbox, toolbox_spec)
