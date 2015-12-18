line_spec =
[
	(:color, AbstractString, nothing),
	(:_type, AbstractString, "solid"),
	(:width, Number, nothing),
	(:shadowColor, AbstractString, "rgba(0,0,0,0)"),
	(:shadowBlur, Number, 5),
	(:shadowOffsetX, Number, 3),
	(:shadowOffsetY, Number, 3),
]

primitivefactory(:LineStyle, line_spec)