iconstyleopts_spec =

[
(:color, String, "adaptive"),
(:borderColor, String, "#666"),
(:borderWidth, Int, 1),
(:borderType, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Int, nothing),
]

primitivefactory(:IconStyleOpts, iconstyleopts_spec)

iconstyle_spec =

[
(:normal, IconStyleOpts, nothing),
(:emphasis, IconStyleOpts, nothing)
]

primitivefactory(:IconStyle, itemstyle_spec)
