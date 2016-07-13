axistick_spec =

[
(:show, Bool, true),
(:interval, Union{Int, String}, "auto"),
(:inside, Bool, false),
(:length, Int, 5),
(:lineStyle, LineStyle, deepcopy(LineStyle()))
]

primitivefactory(:AxisTick, axistick_spec)
