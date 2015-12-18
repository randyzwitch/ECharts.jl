axislabel_spec =
[
	(:show, Bool, true),
	(:interval, Union{AbstractString, Number}, "auto"),
	(:rotate, Number, 0),
	(:margin, Number, 8),
	(:clickable, Bool, false),
	(:formatter, AbstractString, nothing),
	(:textStyle, TextStyle, nothing),
]

primitivefactory(:AxisLabel, axislabel_spec)