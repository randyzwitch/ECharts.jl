itemstyleopts_spec =

[
(:color, AbstractString, "adaptive"),
(:borderColor, AbstractString, "#000"),
(:borderWidth, Int, 0),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Int, nothing),
]

primitivefactory(:ItemStyleOpts, itemstyleopts_spec)

itemstyle_spec =

[
(:normal, ItemStyleOpts, nothing),
(:emphasis, ItemStyleOpts, nothing)
]

primitivefactory(:ItemStyle, itemstyle_spec)
