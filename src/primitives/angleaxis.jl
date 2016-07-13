angleaxis_spec =

[
(:polarIndex, Int, 0),
(:startAngle, Int, 0),
(:clockwise, Bool, true),
(:_type, String, "category"),
(:boundaryGap, Union{Bool, AbstractVector}, nothing),
(:min, Union{Int, String}, "auto"),
(:max, Union{Int, String}, "auto"),
(:scale, Bool, false),
(:splitNumber, Int, 5),
(:minInterval, Int, 0),
(:interval, Int, nothing),
(:silent, Bool, true),
(:axisLine, AxisLine, nothing),
(:axisTick, AxisTick, nothing),
(:axisLabel, AxisLabel, nothing),
(:splitLine, SplitLine, nothing),
(:splitArea, SplitArea, nothing),
(:data, AbstractVector, nothing) #fill in
]

primitivefactory(:AngleAxis, angleaxis_spec)
