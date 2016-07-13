linestyle_spec =

[
(:color, Union{String, AbstractVector}, "#333"),
(:width, Int, 1),
(:_type, String, "solid"),
(:shadowBlur, Int, 1),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Int, nothing),
]

primitivefactory(:LineStyle, linestyle_spec)
