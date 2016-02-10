axisline_spec =
[
	(:show, Bool, true),
	(:onZero, Bool, true),
	(:lineStyle, LineStyle, deepcopy(LineStyle())),
]

primitivefactory(:AxisLine, axisline_spec)
