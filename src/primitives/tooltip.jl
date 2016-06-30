tooltip_spec =

[
(:show, Bool, true),
(:showContent, Bool, true),
(:trigger, AbstractString, "item"),
(:triggerOn, AbstractString, "mousemove"),
(:alwaysShowContent, Bool, false),
(:showDelay, Int, 0),
(:hideDelay, Int, 100),
(:enterable, Bool, true),
(:position, Union{Vector{Any}, AbstractString}, nothing),
(:transitionDuration, Number, 0.4),
(:formatter, AbstractString, nothing),
(:backgroundColor, AbstractString, "rgba(50,50,50,0.7)"),
(:borderColor, AbstractString, "#333"),
(:borderWidth, Int, 0),
(:padding, Int, 5),
(:textStyle, TextStyle, "#fff"),
(:extraCssText, AbstractString, nothing),
#(:axisPointer, AxisPointer, nothing),
]

primitivefactory(:Tooltip, tooltip_spec)

