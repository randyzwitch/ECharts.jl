crossstyle_spec =

[
(:color, String, "#555"),
(:width, Int, 1),
(:_type, String, "dashed"),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Number, 0),
(:textStyle, TextStyle, nothing),
]

primitivefactory(:CrossStyle, crossstyle_spec)

shadowstyle_spec =

[
(:color, String, "rgba(150,150,150,0.5)"),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
(:opacity, Number, 0),
]

primitivefactory(:ShadowStyle, shadowstyle_spec)

axispointer_spec =

[
(:_type, String, "line"),
(:axis, String, "auto"),
(:animation, Bool, "auto"),
(:animationThreshold, Int, 2000),
(:animationDuration, Int, 1000),
(:animationDelay, Int, 1000),
(:animationDurationUpdate, Int, 300),
(:animationEasingUpdate, String, "cubicOut"),
(:animationDelayUpdate, Int, 0),
(:lineStyle, LineStyle, nothing),
(:crossStyle, CrossStyle, nothing),
(:shadowStyle, ShadowStyle, nothing),
]

primitivefactory(:AxisPointer, axispointer_spec)
