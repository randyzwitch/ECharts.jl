crossstyle_spec =

[
(:color, AbstractString, "#555"),
(:width, Int, 1),
(:_type, AbstractString, "dashed"),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Number, 0),
(:textStyle, TextStyle, nothing),
]

primitivefactory(:CrossStyle, crossstyle_spec)

shadowstyle_spec =

[
(:color, AbstractString, "rgba(150,150,150,0.5)"),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Number, 0),
]

primitivefactory(:ShadowStyle, shadowstyle_spec)

axispointer_spec =

[
(:_type, AbstractString, "line"),
(:axis, AbstractString, "auto"),
(:animation, Bool, "auto"),
(:animationThreshold, Int, 2000),
(:animationDuration, Int, 1000),
(:animationDelay, Int, 1000),
(:animationDurationUpdate, Int, 300),
(:animationEasingUpdate, AbstractString, "cubicOut"),
(:animationDelayUpdate, Int, 0),
(:lineStyle, LineStyle, nothing),
(:crossStyle, CrossStyle, nothing),
(:shadowStyle, ShadowStyle, nothing),
]

primitivefactory(:AxisPointer, axispointer_spec)
