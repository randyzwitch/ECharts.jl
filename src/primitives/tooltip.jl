tooltip_spec =
[
    (:show, Bool, true),
    (:zlevel, Int, 1),
    (:z, Int, 8),
    (:showContent, Bool, true),
    (:trigger, AbstractString, "item"),
    (:position, AbstractString, nothing),
    (:formatter, AbstractString, nothing),
    (:islandFormatter, AbstractString, nothing),
    (:showDelay, Int, 20),
    (:hideDelay, Int, 100),
    (:transitionDuration, Number, 0.4),
    (:enterable, Bool, false),
    (:backgroundColor, AbstractString, nothing),
    (:borderColor, AbstractString, "#333"),
    (:borderRadius, Number, 4),
    (:borderWidth, Number, 0),
    (:padding, Union{Number, AbstractVector}, 5),
    (:axisPointer, Dict{Any, Any}, nothing),
    (:textStyle, Dict{Any, Any}, nothing)

]

primitivefactory(:Tooltip, tooltip_spec)