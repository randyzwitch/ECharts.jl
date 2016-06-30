rc_spec =
[
	(:show, Bool, true),
	(:zlevel, Int, 0),
	(:z, Int, 4),
	(:x, Union{AbstractString, Number}, "left"),
	(:y, Union{AbstractString, Number}, "top"),
	(:width, Int, 80),
	(:height, Int, 120),
	(:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
	(:borderColor, AbstractString, "#ccc"),
	(:borderWidth, Int, 0),
	(:padding, Union{AbstractVector, Number}, 5),
	(:fillerColor, AbstractString, "#fff"),
	(:handleColor, AbstractString, "#6495ed"),
	(:step, Int, 15),
	(:mapTypeControl, Dict{Any, Any}, nothing)

]

primitivefactory(:RoamController, rc_spec)