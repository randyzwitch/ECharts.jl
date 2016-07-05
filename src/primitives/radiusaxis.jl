radiusaxis_spec =

[
(:polarIndex, Int, 0),
(:_type, AbstractString, "value"),
(:name, AbstractString, nothing),
(:nameLocation, AbstractString, "start"),
(:nameTextStyle, TextStyle, nothing),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, Vector{AbstractString}}, nothing),
(:min, Union{Int, AbstractString}, "auto"),
(:max, Union{Int, AbstractString}, "auto"),
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

primitivefactory(:RadiusAxis, radiusaxis_spec)
