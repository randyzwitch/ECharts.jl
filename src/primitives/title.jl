title_spec =
[
	(:show, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 6),
    (:text, AbstractString, ""),
    (:link, AbstractString, ""),
    (:target, AbstractString, nothing),
    (:subtext, AbstractString, ""),
    (:sublink, AbstractString, nothing),
    (:subtarget, AbstractString, nothing),
    (:x, Union{AbstractString, Number}, "left"),
    (:y, Union{AbstractString, Number}, "top"),
    (:textAlign, AbstractString, nothing),
    (:backgroundColor, AbstractString, nothing),
    (:borderColor, AbstractString, "#ccc"),
    (:borderWidth, Number, 0),
    (:padding, Union{Number, AbstractVector}, 5),
    (:itemGap, Int, 5),
    (:textStyle, Dict{Any, Any}, nothing),
    (:subtextStyle, Dict{Any, Any}, nothing)

]

primitivefactory(:Title, title_spec)