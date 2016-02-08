text_spec =
[
	(:color, AbstractString, nothing),
	(:decoration, AbstractString, nothing),
	(:align, AbstractString, nothing),
	(:baseline, AbstractString, nothing),
	(:fontFamily, AbstractString, "Arial, Verdana, sans-serif"),
	(:fontSize, Number, 12),
	(:fontStyle, AbstractString, "normal"),
	(:fontWeight, Union{AbstractString, Number}, "normal")
]

primitivefactory(:TextStyle, text_spec)