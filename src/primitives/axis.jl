axis_spec =

[
(:gridIndex, Int, 0),
(:position, String, nothing),
(:_type, String, nothing),
(:name, String, nothing),
(:nameLocation, String, "start"),
(:nameTextStyle, TextStyle, nothing),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, AbstractVector}, nothing),
(:min, Union{Int, String}, nothing),
(:max, Union{Int, String}, nothing),
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

primitivefactory(:Axis, axis_spec)
