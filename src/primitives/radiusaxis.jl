radiusaxis_spec =

[
(:polarIndex, Int, 0),
(:_type, String, "value"),
(:name, String, nothing),
(:nameLocation, String, "start"),
(:nameTextStyle, TextStyle, nothing),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, Vector{String}}, nothing),
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

primitivefactory(:RadiusAxis, radiusaxis_spec)
