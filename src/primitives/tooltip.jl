tooltip_spec =

[
(:show, Bool, true),
(:showContent, Bool, true),
(:trigger, String, "item"),
(:triggerOn, String, "mousemove"),
(:alwaysShowContent, Bool, false),
(:showDelay, Int, 0),
(:hideDelay, Int, 100),
(:enterable, Bool, true),
(:position, Union{Vector{Any}, String}, nothing),
(:transitionDuration, Number, 0.4),
(:formatter, String, nothing),
(:backgroundColor, String, "rgba(50,50,50,0.7)"),
(:borderColor, String, "#333"),
(:borderWidth, Int, 0),
(:padding, Int, 5),
(:textStyle, TextStyle, "#fff"),
(:extraCssText, String, nothing),
(:axisPointer, AxisPointer, nothing),
]

primitivefactory(:Tooltip, tooltip_spec)
