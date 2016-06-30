angleaxis_spec =

[
(:polarIndex, Int, 0),
(:startAngle, Int, 0),
(:clockwise, Bool, true),
(:_type, AbstractString, "category"),
(:boundaryGap, Union{Bool, Vector{AbstractString}}, nothing),
(:min, Union{Int, AbstractString}, "auto"),
(:max, Union{Int, AbstractString}, "auto"),
(:scale, Bool, false),
(:splitNumber, Int, 5),
(:minInterval, Int, 0),
(:interval, Int, nothing),
(:silent, Bool, true),
#(:axisLine, AxisLine, nothing), #fill in
#(:axisTick, AxisTick, nothing), #fill in
#(:axisLabel, AxisLabel, nothing), #fill in
#(:splitLine, SplitLine, nothing), #fill in
#(:splitArea, SplitArea, nothing), #fill in
(:data, Vector{Any}, nothing) #fill in
]

primitivefactory(:AngleAxis, angleaxis_spec)