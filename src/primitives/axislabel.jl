axislabel_spec =

[
(:show, Bool, true),
(:interval, Union{String, Int}, "auto"),
(:inside, Bool, false),
(:rotate, Int, 0),
(:margin, Int, 8),
(:formatter, String, nothing),
(:textStyle, TextStyle, nothing),
]

primitivefactory(:AxisLabel, axislabel_spec)
