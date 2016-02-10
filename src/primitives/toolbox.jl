toolbox_spec =
[
    (:show, Bool, false),
    # (:zlevel, Int, 0),
    # (:z, Int, 6),
    (:orient, AbstractString, "vertical"),
    (:x, Union{AbstractString, Number}, "right"),
    (:y, Union{AbstractString, Number}, "center"),
    # (:backgroundColor, AbstractString, nothing),
    # (:borderColor, AbstractString, "#ccc"),
    # (:borderWidth, Number, 0),
    # (:padding, Union{Number, AbstractVector}, 5),
    (:itemGap, Number, 15),
    # (:itemSize, Number, 16),
    # (:color, AbstractVector, nothing),
    # (:disableColor, AbstractString, "#ddd"),
    # (:effectiveColor, AbstractString, "red"),
    # (:showTitle, Bool, true),
    # (:textStyle, TextStyle, nothing),
    (:feature, Dict{Any, Any}, Dict{Any, Any}())
]

primitivefactory(:Toolbox, toolbox_spec)
