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

primitivefactory(:Axis, axis_spec)
