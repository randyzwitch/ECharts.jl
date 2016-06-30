label_spec =
[
	(:show, Bool, true),
	(:position, AbstractString, nothing),
	(:rotate, Bool, false),
	(:distance, Number, nothing),
	(:formatter, AbstractString, nothing),
	(:textStyle, TextStyle, nothing),
	(:x, Number, nothing),
	(:y, Number, nothing)

]

primitivefactory(:Label, label_spec)