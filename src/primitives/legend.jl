legend_spec =
[
    (:show, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 4),
    (:orient, AbstractString, "horizontal"),
    (:x, Union{AbstractString, Number}, "center"),
    (:y, Union{AbstractString, Number}, "top"),
    (:backgroundColor, AbstractString, nothing),
    (:borderColor, AbstractString, "#ccc"),
    (:borderWidth, Number, 0),
    (:padding, Union{Number, AbstractVector}, 0),
    (:itemGap, Number, 10),
    (:itemWidth, Number, 20),
    (:itemHeight, Number, 14),
    (:textStyle, Dict{Any, Any}, nothing),
    (:formatter, AbstractString, nothing),
    (:selectedMode, Union{Bool, AbstractString}, nothing),
    (:selected, Dict{Any, Any}, nothing),
    (:data, AbstractVector, nothing),
]

primitivefactory(:Legend, legend_spec)