legend_spec =
[
    (:show, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 4),
    (:orient, AbstractString, "horizontal"),
    (:x, Union{AbstractString, Number}, "center"),
    (:y, Union{AbstractString, Number}, "top"),
    (:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
    (:borderColor, AbstractString, "#ccc"),
    (:borderWidth, Number, 0),
    (:padding, Union{Number, AbstractVector}, 5),
    (:itemGap, Number, 10),
    (:itemWidth, Number, 20),
    (:itemHeight, Number, 14),
    (:textStyle, TextStyle, TextStyle(color = "#333")),
    (:formatter, AbstractString, nothing),
    (:selectedMode, Union{Bool, AbstractString}, true),
    (:selected, Dict{Any, Any}, nothing),
   	(:data, AbstractVector, ["y"])
]

primitivefactory(:Legend, legend_spec)