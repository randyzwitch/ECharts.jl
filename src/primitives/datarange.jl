datarange_spec =
[
	(:show, Bool, true),
	(:zlevel, Int, 0),
	(:z, Int, 4),
	(:orient, AbstractString, "vertical"),
	(:x, Union{AbstractString, Number}, "left"),
	(:y, AbstractString, "bottom"),
	(:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
	(:borderColor, AbstractString, "#ccc"),
	(:borderWidth, Int, 0),
	(:padding, Union{Number, AbstractVector}, 5),
	(:itemGap, Int, 10),
	(:itemWidth, Int, 20),
	(:itemHeight, Int, 14),
	(:min, Number, nothing),
	(:max, Number, nothing),
	(:precision, Int, 0),
	(:splitNumber, Int, 5),
	(:splitList, Dict{Any, Any}, nothing),
	(:range, Dict{Any, Any}, nothing),
	(:selectedMode, Union{Bool, AbstractString}, true),
	(:calculable, Bool, false),
	(:hoverLink, Bool, true),
	(:realtime, Bool, true),
	(:color, AbstractVector, ["#1e90ff","#f0ffff"]),
	(:formatter, AbstractString, nothing),
	(:text, AbstractVector, nothing),
	(:textStyle, Dict{Any, Any}, nothing)
]

primitivefactory(:DataRange, datarange_spec)