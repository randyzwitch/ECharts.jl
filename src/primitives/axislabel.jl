axislabel_spec =

[
(:show, Bool, true),
(:interval, Union{AbstractString, Int}, "auto"),
(:inside, Bool, false),
(:rotate, Int, 0),
(:margin, Int, 8),
(:formatter, AbstractString, nothing),
(:textStyle, TextStyle, nothing),
]

primitivefactory(:AxisLabel, axislabel_spec)
