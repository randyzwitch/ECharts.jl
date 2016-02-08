labelline_spec =
[
	(:show, Bool, true),
	(:length, Number, 40),
	(:lineStyle, LineStyle, deepcopy(LineStyle())),
]

primitivefactory(:LabelLine, labelline_spec)
