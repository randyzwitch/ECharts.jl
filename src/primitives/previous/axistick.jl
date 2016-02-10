axistick_spec =
[
	(:show, Bool, true),
	(:interval, Union{AbstractString, Number}, "auto"),
	(:onGap, Bool, nothing),
	(:inside, Bool, false),
	(:length, Number, 5),
	(:lineStyle, LineStyle, nothing),
	(:splitNumber, Number, nothing)
]

primitivefactory(:AxisTick, axistick_spec)