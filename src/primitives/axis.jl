axis_spec =

[
(:gridIndex, Int, 0),
(:position, AbstractString, nothing),
(:_type, AbstractString, nothing),
(:name, AbstractString, nothing),
(:nameLocation, AbstractString, "start"),
(:nameTextStyle, TextStyle, nothing),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, AbstractVector}, nothing),
(:min, Union{Int, AbstractString}, nothing),
(:max, Union{Int, AbstractString}, nothing),
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
