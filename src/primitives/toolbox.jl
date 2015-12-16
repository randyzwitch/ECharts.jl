toolbox_spec =
[
    (:show, Bool, false),
    (:zlevel, Int, 0),
    (:z, Int, 6),
    (:orient, AbstractString, "horizontal"),
    (:x, Union{AbstractString, Number}, "right"),
    (:y, Union{AbstractString, Number}, "top"),
    (:backgroundColor, AbstractString, nothing),
    (:borderColor, AbstractString, "#ccc"),
    (:borderWidth, Number, 0),
    (:padding, Union{Number, AbstractVector}, 5),
    (:itemGap, Number, 10),
    (:itemSize, Number, 16),
    (:color, AbstractVector, nothing),
    (:disableColor, AbstractString, "#ddd"),
    (:effectiveColor, AbstractString, "red"),
    (:showTitle, Bool, true),
    (:textStyle, Dict{Any, Any}, nothing),
    (:feature, Dict{Any, Any}, nothing)
]

primitivefactory(:Toolbox, toolbox_spec)