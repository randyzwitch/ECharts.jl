linestyle_spec =

[
(:color, Union{AbstractString, AbstractVector}, "#333"),
(:width, Int, 1),
(:_type, AbstractString, "solid"),
(:shadowBlur, Int, 1),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Int, nothing),
]

primitivefactory(:LineStyle, linestyle_spec)
