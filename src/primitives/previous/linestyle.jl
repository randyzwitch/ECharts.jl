line_spec =
[
	(:color, AbstractString, "black"),
	(:_type, AbstractString, "solid"),
	(:width, Number, 1),
	(:shadowColor, AbstractString, "rgba(0,0,0,0)"),
	(:shadowBlur, Number, 5),
	(:shadowOffsetX, Number, 3),
	(:shadowOffsetY, Number, 3),
]

primitivefactory(:LineStyle, line_spec)